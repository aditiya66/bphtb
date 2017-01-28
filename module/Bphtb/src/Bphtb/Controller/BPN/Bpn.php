<?php

namespace Bphtb\Controller\BPN;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Math\Rand;

class Bpn extends AbstractActionController {

    protected $tbl_pemda, $tbl_pembayaran, $tbl_pendataan, $tbl_jenistransaksi, $tbl_haktanah, $tbl_doktanah, $tbl_sspd, $tbl_notaris, $tbl_persyaratan, $tbl_spt, $tbl_verifikasi;

    public function indexAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Pendataan\SSPDFrm();
        $view = new ViewModel(array(
            "form" => $form
        ));
        $data = array(
            'menu_bpn' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTblPembayaran()->getGridCountBpn($base);
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
        $data = $this->getTblPembayaran()->getGridDataBpn($base, $start);
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
            if (!empty($row['p_idpemeriksaan'])) {
                $s .= "<td colspan='2'>" . number_format($row['p_luastanah'], 0, ',', '.') . " / " . number_format($row['p_luasbangunan'], 0, ',', '.') . "</td>";
            } else {
                $s .= "<td colspan='2'>" . number_format($row['t_luastanah'], 0, ',', '.') . " / " . number_format($row['t_luasbangunan'], 0, ',', '.') . "</td>";
            }
            $s .= "<td colspan='2'>" . number_format($row['t_luastanahbpn'], 0, ',', '.') . " / " . number_format($row['t_luasbangunanbpn'], 0, ',', '.') . "</td>";
            if (empty($row['t_tglsertifikatbaru'])) {
                $s .= "<td>-</td>";
            } else {
                $s .= "<td>" . $row['t_nosertifikatbaru'] . " / " . date('d-m-Y', strtotime($row['t_tglsertifikatbaru'])) . "</td>";
            }
            $s .= "<td><form method='post' action='bpn_lihatdata/edit' id='formtambah'><input type='hidden' name='t_idspt' value='" . $row['t_iddetailsptbphtb'] . "'/> <input type='hidden' name='status' value='1'/><input value='Cek Detail' class='btn btn-primary btn-xs btn-flat' type='submit'>  </form></td>";
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

    public function editAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $id = (int) $this->getRequest()->getPost()->get('t_idspt');
        $status = (int) $this->getRequest()->getPost()->get('status');
        $req = $this->getRequest();
        if ($req->isPost()) {
            $idcari = $this->getTblSSPDBphtb()->getSptid($id);
            $hasil_cariidspt = $idcari->t_idspt;
            $data = $this->getTblSSPDBphtb()->getDataIdBpn($hasil_cariidspt);
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
            $frm2 = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah(), null, $this->populateComboNotaris(), $this->populatePersyaratanId($data->t_idjenistransaksi));
            $frm2->bind($data);
        } else {
            return $this->redirect()->toRoute('bpn_lihatdata');
        }
        $view = new ViewModel(array(
            'frm' => $frm2,
            'status' => $status,
            'id_spt' => $id
        ));
        $data = array(
            'menu_bpn' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function updateAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $string = Rand::getString(6, '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ', true);
        $t_idspt = str_replace("'", "\'", $this->getRequest()->getPost('t_idspt'));
        $t_iddetailsptbphtb = str_replace("'", "\'", $this->getRequest()->getPost('t_iddetailsptbphtb'));
        $t_idpembayaranspt = str_replace("'", "\'", $this->getRequest()->getPost('t_idpembayaranspt'));
        $t_luastanahbpn1 = str_replace("'", "\'", $this->getRequest()->getPost('t_luastanahbpn'));
        $t_luasbangunanbpn1 = str_replace("'", "\'", $this->getRequest()->getPost('t_luasbangunanbpn'));

        $t_luastanahbpn = str_ireplace('.', '', $t_luastanahbpn1);
        $t_luasbangunanbpn = str_ireplace('.', '', $t_luasbangunanbpn1);

        $data = $this->getTbl()->getSptid($t_idspt);
        $datadetail = $this->getTblSSPDBphtb()->getSemuaData($t_iddetailsptbphtb);
        $dataverifikasi = $this->getTblVerifikasi()->getSptid($t_idpembayaranspt);

        // cek apakah ada pemeriksaan atau tidak
        if (!empty($datadetail->p_idpemeriksaan)) {
            $datadetail->t_totalnjoptanah = $datadetail->p_njoptanah * $t_luastanahbpn;
            $datadetail->t_totalnjopbangunan = $datadetail->p_njopbangunan * $t_luasbangunanbpn;
            $datadetail->t_grandtotalnjop = $datadetail->t_totalnjoptanah + $datadetail->t_totalnjopbangunan;
            if ($datadetail->p_nilaitransaksispt > $datadetail->t_grandtotalnjop) {
                $npopyangdiambil = $datadetail->p_nilaitransaksispt;
            } else {
                $npopyangdiambil = $datadetail->t_grandtotalnjop;
            }

            if ($data->t_idjenistransaksi == 4 || $data->t_idjenistransaksi == 5) {
                // hibah wasiat dan waris dibagi 50%
                $t_totalspt = (($npopyangdiambil - $datadetail->p_potonganspt) * 5 / 100) - $data->t_totalspt;
            } else {
                // selain hibah wasiat dan waris
                $t_totalspt = (($npopyangdiambil - $datadetail->p_potonganspt) * 5 / 100) - $data->t_totalspt;
            }

            if ($t_totalspt >= 0) {
                $data->t_totalspt = $t_totalspt;
            } else {
                $data->t_totalspt = 0;
            }
            $t_luastanah = $datadetail->p_luastanah;
            $t_luasbangunan = $datadetail->p_luasbangunan;
        } else {
            $datadetail->t_totalnjoptanah = $datadetail->t_njoptanah * $t_luastanahbpn;
            $datadetail->t_totalnjopbangunan = $datadetail->t_njopbangunan * $t_luasbangunanbpn;
            $datadetail->t_grandtotalnjop = $datadetail->t_totalnjoptanah + $datadetail->t_totalnjopbangunan;
            if ($data->t_nilaitransaksispt > $datadetail->t_grandtotalnjop) {
                $npopyangdiambil = $data->t_nilaitransaksispt;
            } else {
                $npopyangdiambil = $datadetail->t_grandtotalnjop;
            }

            if ($data->t_idjenistransaksi == 4 || $data->t_idjenistransaksi == 5) {
                // hibah wasiat dan waris dibagi 50%
                $t_totalspt = (($npopyangdiambil - $data->t_potonganspt) * 5 / 100) - $data->t_totalspt;
            } else {
                // selain hibah wasiat dan waris
                $t_totalspt = (($npopyangdiambil - $data->t_potonganspt) * 5 / 100) - $data->t_totalspt;
            }

            if ($t_totalspt >= 0) {
                $data->t_totalspt = $t_totalspt;
            } else {
                $data->t_totalspt = 0;
            }
            $t_luastanah = $datadetail->t_luastanah;
            $t_luasbangunan = $datadetail->t_luasbangunan;
        }

        // nilai pembayaran sebelumnya
        $nilaibayarsebelumnya = $datadetail->t_nilaipembayaranspt;

        if ($t_luastanah < $t_luastanahbpn || $t_luasbangunan < $t_luasbangunanbpn) {
            // simpan di pendaftaran
            $dataspt = $this->getTbl()->savedatabpn($data);
            // simpan luas tanah dan bangunan versi bpn
            $this->getTblSSPDBphtb()->savedatadetailbpn($datadetail, $dataspt->t_idspt, $t_luastanahbpn, $t_luasbangunanbpn);
            if ($data->t_totalspt > 0 && $data->t_totalspt >= $nilaibayarsebelumnya) {
                // jika ada nominal pembayaran prosesnya : daftar dan validasi
                // $this->getTblVerifikasi()->savedataverifikasibpn($dataverifikasi, $dataspt->t_idspt, date('Y')."".str_pad($dataspt->t_kohirketetapan, 5,'0',STR_PAD_LEFT));
            } else {
                // jika nihil maka prosesnya : daftar, validasi dan verifikasi otomatis
//                $this->getTblVerifikasi()->savedataverbayarbpn($dataverifikasi, $dataspt->t_idspt, $string);
            }
        }
        // update t_detailsptbphtb untuk luas tanah dan bangunan bpn
        $this->getTblSSPDBphtb()->savedata_koreksiluas($t_iddetailsptbphtb, $t_luastanahbpn, $t_luasbangunanbpn, $datadetail->t_idspt, $datadetail->t_namawppembeli, $datadetail->t_nikwppembeli, $session);
        return $this->redirect()->toRoute('bpn_lihatdata');
    }

    public function inputsertifikatAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $id = (int) $this->getRequest()->getQuery()->get('t_idspt');
        $idcari = $this->getTblSSPDBphtb()->getSptid($id);
        $hasil_cariidspt = $idcari->t_idspt;
        $req = $this->getRequest();
        if ($req->isGet()) {
            $data = $this->getTblSSPDBphtb()->getDataIdBpn($hasil_cariidspt);
            $data->t_tglprosesspt = date('d-m-Y', strtotime($data->t_tglprosesspt));
            $data->t_tglajb = date('d-m-Y', strtotime($data->t_tglajb));
            $frm2 = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah(), null, $this->populateComboNotaris(), $this->populatePersyaratanId($data->t_idjenistransaksi));
            $frm2->bind($data);
        }
        $view = new ViewModel(array(
            'frm' => $frm2
        ));
        $menu = new ViewModel(array('menu_bpn' => 'active', 'role_id' => $session['s_akses']));
        $menu->setTemplate('bphtb/menu.phtml');
        $view->addChild($menu, 'menu');
        return $view;
    }

    public function updatesertifikatAction() {
        $t_iddetailsptbphtb = str_replace("'", "\'", $this->getRequest()->getPost('t_iddetailsptbphtb'));
        $t_nosertifikatbaru = str_replace("'", "\'", $this->getRequest()->getPost('t_nosertifikatbaru'));
        $t_tglsertifikatbaru = str_replace("'", "\'", $this->getRequest()->getPost('t_tglsertifikatbaru'));
        $this->getTblSSPDBphtb()->savedata_sertifikatbaru($t_iddetailsptbphtb, $t_nosertifikatbaru, $t_tglsertifikatbaru);
        return $this->redirect()->toRoute('bpn_lihatdata');
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

    public function getTblPembayaran() {
        if (!$this->tbl_pembayaran) {
            $sm = $this->getServiceLocator();
            $this->tbl_pembayaran = $sm->get('PembayaranSptTable');
        }
        return $this->tbl_pembayaran;
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
