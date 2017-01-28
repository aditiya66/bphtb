<?php

namespace Bphtb\Controller\Pendataan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Bphtb\Form\Pendataan\datsubjekpajak;
use Bphtb\Form\Pendataan\datopbumi;
use Bphtb\Form\Pendataan\datopbangunan;
use Bphtb\Model\DataSismiop\DatsubjekpajakBase;
use Bphtb\Model\DataSismiop\DatobjekpajakBase;

class PendataanPbb extends AbstractActionController {

    protected $tbl_sspd, $tbl, $tbl_objek, $tbl_pemda;

    public function indexAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Pendataan\SSPDFrm();
        $view = new ViewModel(array('form' => $form));
        $data = array(
            'menu_sismiop' => 'active',
            'role_id' => $session ['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function tambahAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
//        $data = $this->getTblSSPDBphtb()->getDataId($this->params('id'));
        $data = $this->getTblSSPDBphtb()->getDataId($this->params('page'));
        $base_subjek_pajak = new DatsubjekpajakBase ();
        $base_objek_pajak = new DatobjekpajakBase ();
        $base_subjek_pajak->exchangeObjectFromBphtb($data);
        $frm_subjek_pajak = new datsubjekpajak ();
        $frm_subjek_pajak->bind($base_subjek_pajak);
        if ($this->getRequest()->isPost()) {
            $frm_subjek_pajak = new datsubjekpajak ();
            $base_subjek_pajak = new DatsubjekpajakBase ();
            $frm_subjek_pajak->setInputFilter($base_subjek_pajak->getInputFilter());
            $frm_subjek_pajak->setData($this->getRequest()->getPost());
            if ($frm_subjek_pajak->isValid()) {
                $base_subjek_pajak->exchangeArray($frm_subjek_pajak->getData());
                $nop = explode(".", $base_subjek_pajak->NOP);
                $base_objek_pajak->KD_PROPINSI = $nop [0];
                $base_objek_pajak->KD_DATI2 = $nop [1];
                $base_objek_pajak->KD_KECAMATAN = $nop [2];
                $base_objek_pajak->KD_KELURAHAN = $nop [3];
                $base_objek_pajak->KD_BLOK = $nop [4];
                $base_objek_pajak->NO_URUT = $nop [5];
                $base_objek_pajak->KD_JNS_OP = $nop [6];
                $base_objek_pajak->SUBJEK_PAJAK_ID = $base_subjek_pajak->SUBJEK_PAJAK_ID;
                $cek_ex = $this->getTbl()->ceksubjekid($base_subjek_pajak);
                if ($cek_ex == 0) {
                    $this->getTbl()->simpansubjek($base_subjek_pajak);
                }
// 				$data_objek = $this->getTblObjek ()->getnop ( $base_objek_pajak );
                $this->getTblObjek()->updateSubjekId($base_objek_pajak);
                return $this->redirect()->toRoute("pendataan_pbb");
            }
        }
        /*
         * disable sementara
         * $frm_op_bumi = new datopbumi();
         * $frm_op_bangunan = new datopbangunan();
         */
        $view = new ViewModel(array(
            'params' => $this->params('id'),
            'frm_subjek_wp' => $frm_subjek_pajak,
                /* 'frm_dat_op_bumi' => $frm_op_bumi,
                  'frm_dat_op_bangunan' => $frm_op_bangunan */
        ));
        $ar_pemda = $this->getPemda()->getdata();
        $datane = array(
            'menu_sismiop' => 'active',
            'role_id' => $session ['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($datane);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $base = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
        $base->exchangeArray($allParams);
        if ($base->direction == 2)
            $base->page = $base->page + 1;
        if ($base->direction == 1)
            $base->page = $base->page - 1;
        if ($base->page <= 0)
            $base->page = 1;
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTblSSPDBphtb()->getGridCountSismiop($base);
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
        $data = $this->getTblSSPDBphtb()->getGridDataSismiop($base, $start);
        $s = "";
        foreach ($data as $row) {
            $s .= "<tr>";
            if ($row ['t_inputbpn'] == true) {
                $s .= "<td> <span class='badge' style='background-color:#CC0000;'>" . str_pad($row ['t_kohirspt'], 4, '0', STR_PAD_LEFT) . " </span></td>";
            } else {
                $s .= "<td>" . str_pad($row ['t_kohirspt'], 4, '0', STR_PAD_LEFT) . "</td>";
            }
            $s .= "<td>" . $row ['t_periodespt'] . "</td>";
            $s .= "<td>" . date('d-m-Y', strtotime($row ['t_tglprosesspt'])) . "</td>";
            $s .= "<td>" . $row ['t_namawppembeli'] . "</td>";
            if (!empty($row ['p_idpemeriksaan'])) {
                $s .= "<td>" . number_format($row ['p_totalspt'], 0, ',', '.') . "</td>";
            } else {
                $s .= "<td>" . number_format($row ['t_totalspt'], 0, ',', '.') . "</td>";
            }

            $s .= "<td>" . $row ['s_namajenistransaksi'] . "</td>";
            if (!empty($row ['t_tglajbbaru']) && !empty($row ['t_noajbbaru'])) {
                $s .= "<td colspan='2'>" . $row ['t_noajbbaru'] . "/" . date('d-m-Y', strtotime($row ['t_tglajbbaru'])) . " </td>";
            } else {
                $s .= "<td colspan='2'></td>";
            }
            $base_url = $this->getEvent()->getRouteMatch()->getMatchedRouteName();
            $s .= "<td><a href='$base_url/tambah/$row[t_idspt]' class='btn btn-primary btn-sm btn-flat'>INPUT DATA KE SIMPBB</a></td>";
            $s .= "</tr>";
        }
        $data_render = array(
            "grid" => $s,
            "rows" => $base->rows,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    private function getTbl() {
        if (!$this->tbl) {
            $this->tbl = $this->getServiceLocator()->get("SpbbTable");
        }
        return $this->tbl;
    }

    private function getTblObjek() {
        if (!$this->tbl_objek) {
            $this->tbl_objek = $this->getServiceLocator()->get("OpbbTable");
        }
        return $this->tbl_objek;
    }

    private function getTblSSPDBphtb() {
        if (!$this->tbl_sspd) {
            $sm = $this->getServiceLocator();
            $this->tbl_sspd = $sm->get("SSPDBphtbTable");
        }
        return $this->tbl_sspd;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
