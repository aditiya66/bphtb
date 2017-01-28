<?php

namespace Bphtb\Controller\Koreksi;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Math\Rand;

class Koreksi extends AbstractActionController {

    protected $tbl_pemda, $tbl_koreksi, $tbl_pendataan, $tbl_jenistransaksi, $tbl_haktanah, $tbl_doktanah, $tbl_sspd, $tbl_notaris, $tbl_persyaratan, $tbl_spt, $tbl_verifikasi;

    public function indexAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Pendataan\SSPDFrm();
        $view = new ViewModel(array(
            "form" => $form
        ));
        $data = array(
            'menu_koreksi' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Koreksi\KoreksiBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTblKoreksi()->getGridCountKoreksi($base);
        if ($count > 0 && $limit > 0) {
            $total_pages = ceil($count / $limit);
        } else {
            $total_pages = 0;
        }

        if ($page > $total_pages)
            $page = $total_pages;
        $start = $limit * $page - $limit;
        if ($start < 0)
            $start = 0;
        $data = $this->getTblKoreksi()->getGridDataKoreksi($base, $start);
        $s = "";
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td>" . str_pad($row['t_kohirspt'], 4, '0', STR_PAD_LEFT) . "</td>";
            $s .= "<td>" . $row['t_periodepembayaran'] . "</td>";
            $s .= "<td>" . date('d-m-Y', strtotime($row['t_tglprosesspt'])) . "</td>";
            $s .= "<td>" . $row['t_namawppembeli'] . "</td>";
            if ($row['t_verifikasispt'] == true) {
                $status_verifikasi = "Tervalidasi / " . date('d-m-Y', strtotime($row['t_tglverifikasispt']));
            } else {
                $status_verifikasi = "Status : Belum Tervalidasi";
            }
            $s .= "<td>" . $status_verifikasi . "</td>";
            if ($row['t_statusbayarspt'] == true) {
                $status_bayar = "Dibayar / " . number_format($row['t_nilaipembayaranspt'], 0, ',', '.') . " / " . date('d-m-Y', strtotime($row['t_tanggalpembayaran'])) . "";
            } else {
                $status_bayar = "Belum Dibayar";
            }
            $s .= "<td>" . $status_bayar . "</td>";
            if (empty($row['t_hargatambahan'])) {
                $s .= "<td><form method='post' action='koreksi/koreksi' id='formtambah'><input type='hidden' name='t_idspt' value='" . $row['t_iddetailsptbphtb'] . "'/> <input type='hidden' name='status' value='1'/><input value='Koreksi' class='btn btn-primary btn-xs btn-flat' type='submit'>  </form></td>";
            } else {
                $s .= "<td style='text-align:center'>" . number_format($row['t_hargatambahan'], 0, ",", ".") . "</td>";
            }
            $s .= "</tr>";
        }
        $datapaginge = new \Bphtb\Controller\Setting\Paginator();
        $datapaging = $datapaginge->paginator($base->rows, $count, $page, $total_pages);
        $data_render = array(
            "grid" => $s,
            "rows" => $base->rows,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages,
            "paginatore" => $datapaging['paginatore'],
            "akhirdata" => $datapaging['akhirdata'],
            "awaldata" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function koreksiAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $id = (int) $this->getRequest()->getPost()->get('t_idspt');
        $status = (int) $this->getRequest()->getPost()->get('status');
        $req = $this->getRequest();
        if ($req->isPost()) {
            $idcari = $this->getTblKoreksi()->getSptid($id);
            $hasil_cariidspt = $idcari['t_idspt'];
            $data = $this->getTblKoreksi()->getDataIdKoreksi($hasil_cariidspt);
            if (!empty($data->p_idpemeriksaan)) {
                $data->t_luastanah = $data->p_luastanah;
                $data->t_njoptanah = $data->p_njoptanah;
                $data->t_luasbangunan = $data->p_luasbangunan;
                $data->t_njopbangunan = $data->p_njopbangunan;
            }
            $data->t_tglprosesspt = date('d-m-Y', strtotime($data->t_tglprosesspt));
            $data->t_tglajb = date('d-m-Y', strtotime($data->t_tglajb));
            $data->t_tanggalpembayaran = date('d-m-Y', strtotime($data->t_tanggalpembayaran));
            $data->t_tglverifikasispt = date('d-m-Y', strtotime($data->t_tglverifikasispt));
            if (empty($data->t_tglsertifikatbaru)) {
                $data->t_tglsertifikatbaru = '';
            } else {
                $data->t_tglsertifikatbaru = date('d-m-Y', strtotime($data->t_tglsertifikatbaru));
            }
            $frm2 = new \Bphtb\Form\Koreksi\KoreksiFrm();
            $frm2->bind($data);
        } else {
            return $this->redirect()->toRoute('koreksi');
        }
        $view = new ViewModel(array(
            'frm' => $frm2,
            'status' => $status,
            'id_spt' => $id
        ));
        $data = array(
            'menu_koreksi' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function updateAction() {
        $string = Rand::getString(6, '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ', true);
        $t_idspt = str_replace("'", "\'", $this->getRequest()->getPost('t_idspt'));
        $t_iddetailsptbphtb = str_replace("'", "\'", $this->getRequest()->getPost('t_iddetailsptbphtb'));
        $t_hargatambahan = str_replace("'", "\'", $this->getRequest()->getPost('t_hargatambahan'));
        $t_hargatambahannya = str_ireplace(".", "", $t_hargatambahan);
        $data = $this->getTbl()->getSptid($t_idspt);
        if ($data->t_nilaitransaksispt <= $t_hargatambahannya) {
            $t_hargatambahanfix = $t_hargatambahannya;
        } else {
            $t_hargatambahanfix = $data->t_nilaitransaksispt;
        }
        $datadetail = $this->getTblSSPDBphtb()->getSemuaData($t_iddetailsptbphtb);

        // selain hibah wasiat dan waris
        $t_totalspt = (($t_hargatambahanfix - $data->t_potonganspt) * 5 / 100) - $data->t_totalspt;

        if ($t_totalspt >= 0) {
            $data->t_totalspt = $t_totalspt;
        } else {
            $data->t_totalspt = 0;
        }

        // nilai pembayaran sebelumnya

        if ($data->t_nilaitransaksispt <= $t_hargatambahannya) {
            $data->t_nilaitransaksispt = $t_hargatambahanfix;
            $datadetail->t_hargatambahan = 0;
            $dataspt = $this->getTbl()->savedatakoreksi($data);
            $this->getTblSSPDBphtb()->savedatadetailkoreksi($datadetail, $dataspt->t_idspt);
        }
        // update t_detailsptbphtb untuk luas tanah dan bangunan bpn
        $this->getTblKoreksi()->savedata_koreksiharga($t_iddetailsptbphtb, $t_hargatambahannya);
        return $this->redirect()->toRoute('koreksi');
    }

    public function populateComboJenisTransaksi() {
        $data = $this->getTblJenTran()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idjenistransaksi] = $row->s_namajenistransaksi;
        }
        return $selectData;
    }

    public function getTblJenTran() {
        if (!$this->tbl_jenistransaksi) {
            $sm = $this->getServiceLocator();
            $this->tbl_jenistransaksi = $sm->get('JenisTransaksiBphtbTable');
        }
        return $this->tbl_jenistransaksi;
    }

    public function getTblKoreksi() {
        if (!$this->tbl_koreksi) {
            $sm = $this->getServiceLocator();
            $this->tbl_koreksi = $sm->get('KoreksiTable');
        }
        return $this->tbl_koreksi;
    }

    public function populateComboHakTanah() {
        $data = $this->getTblHakTan()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idhaktanah] = $row->s_namahaktanah;
        }
        return $selectData;
    }

    public function populateComboDokTanah() {
        $data = $this->getTblDokTan()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_iddoktanah] = $row->s_namadoktanah;
        }
        return $selectData;
    }

    private function populateComboNotaris() {
        $data = $this->getNotaris()->getdataCombo();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['s_iduser']] = $row['s_namanotaris'];
        }
        return $selectData;
    }

    function populatePersyaratanId($id) {
        $data = $this->getTblPersyaratan()->getDataIdTransaksis($id);
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idpersyaratan] = $row->s_namapersyaratan;
        }
        return $selectData;
    }

    public function getTblHakTan() {
        if (!$this->tbl_haktanah) {
            $sm = $this->getServiceLocator();
            $this->tbl_haktanah = $sm->get('HakTanahTable');
        }
        return $this->tbl_haktanah;
    }

    public function getNotaris() {
        if (!$this->tbl_notaris) {
            $sm = $this->getServiceLocator();
            $this->tbl_notaris = $sm->get('NotarisBphtbTable');
        }
        return $this->tbl_notaris;
    }

    public function getTblSSPDBphtb() {
        if (!$this->tbl_sspd) {
            $sm = $this->getServiceLocator();
            $this->tbl_sspd = $sm->get("SSPDBphtbTable");
        }
        return $this->tbl_sspd;
    }

    public function getTblVerifikasi() {
        if (!$this->tbl_verifikasi) {
            $sm = $this->getServiceLocator();
            $this->tbl_verifikasi = $sm->get("VerifikasiSptTable");
        }
        return $this->tbl_verifikasi;
    }

    public function getTblPersyaratan() {
        if (!$this->tbl_persyaratan) {
            $sm = $this->getServiceLocator();
            $this->tbl_persyaratan = $sm->get('PersyaratanTable');
        }
        return $this->tbl_persyaratan;
    }

    public function getTbl() {
        if (!$this->tbl_spt) {
            $sm = $this->getServiceLocator();
            $this->tbl_spt = $sm->get("SPTTable");
        }
        return $this->tbl_spt;
    }

    public function getTblDokTan() {
        if (!$this->tbl_doktanah) {
            $sm = $this->getServiceLocator();
            $this->tbl_doktanah = $sm->get('DokTanahTable');
        }
        return $this->tbl_doktanah;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
