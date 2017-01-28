<?php

namespace Bphtb\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class SettingKelurahan extends AbstractActionController {

    protected $tbl_kelurahan, $tbl_pemda;
    protected $tbl_kecamatan;
    protected $tbls, $tbl_pbb;

    public function indexAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
//        $kelurahan = $this->getPBB()->getKelurahanpbb();
//        foreach ($kelurahan as $dataKelurahan){
//            var_dump($dataKelurahan);
//        }
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Setting\KelurahanFrm();
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_kelurahan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Setting\KelurahanBphtbBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTbl()->getGridCount($base);
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
        $data = $this->getTbl()->getGridData($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td>" . $counter . "</td>";
            $s .= "<td>" . $row['s_kodekelurahan'] . "</td>";
            $s .= "<td>" . $row['s_namakelurahan'] . "</td>";
            $s .= "<td>" . $row['s_namakecamatan'] . "</td>";
            $s .= "<td><center><a href='setting_kelurahan_bphtb/edit?s_idkelurahan=$row[s_idkelurahan]' class='btn btn-warning btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_idkelurahan'] . ");return false;' class='btn btn-danger btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
            $s .= "</tr>";
            $counter++;
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

    public function tambahAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $frm = new \Bphtb\Form\Setting\KelurahanFrm($this->populateComboKecamatan());
        $req = $this->getRequest();

        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Setting\KelurahanBphtbBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $this->getTbl()->savedata($kb, $session);
                return $this->redirect()->toRoute('setting_kelurahan_bphtb');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array("frm" => $frm));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_kelurahan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function editAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $frm = new \Bphtb\Form\Setting\KelurahanFrm($this->populateComboKecamatan());
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idkelurahan');
            $data = $this->getTbl()->getDataId($id);
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_kelurahan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function hapusAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $this->gettbl()->hapusData($this->params('page'), $session);
        return $this->getResponse();
    }

    public function cetakdaftarkelurahanAction() {
        $datakelurahan = $this->getTbl()->getdaftarkelurahan();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'daftarkelurahan');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'datakelurahan' => $datakelurahan
        ));
        return $pdf;
    }
    
    public function importDatakelurahan (){
        
    }

    public function populateComboKecamatan() {
        $data = $this->getTblKec()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idkecamatan] = $row->s_namakecamatan;
        }
        return $selectData;
    }

    private function getIdKecamatan($kd) {
        return $this->getTblKec()->getIdKecamatan($kd);
    }

    public function getTbl() {
        if (!$this->tbl_kelurahan) {
            $sm = $this->getServiceLocator();
            $this->tbl_kelurahan = $sm->get('KelurahanBphtbTable');
        }
        return $this->tbl_kelurahan;
    }

    public function getTbls($tbAlias) {
        if (!$this->tbls) {
            $sm = $this->getServiceLocator();
            $this->tbls = $sm->get($tbAlias);
        }
        return $this->tbls;
    }

    public function getTblKec() {
        if (!$this->tbl_kecamatan) {
            $sm = $this->getServiceLocator();
            $this->tbl_kecamatan = $sm->get('KecamatanBphtbTable');
        }
        return $this->tbl_kecamatan;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

    public function getPBB() {
        if (!$this->tbl_pbb) {
            $sm = $this->getServiceLocator();
            $this->tbl_pbb = $sm->get("SPPTTable");
        }
        return $this->tbl_pbb;
    }

}
