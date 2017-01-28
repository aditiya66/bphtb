<?php

namespace Bphtb\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;

class SettingKecamatan extends AbstractActionController {

    protected $tbl_kecamatan, $tbl_pemda;
    protected $tbls;

    public function indexAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Setting\KecamatanFrm();
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_kecamatan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Setting\KecamatanBphtbBase();
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
            $s .= "<td>" . $row['s_kodekecamatan'] . "</td>";
            $s .= "<td>" . $row['s_namakecamatan'] . "</td>";
            $s .= "<td><center><a href='setting_kecamatan_bphtb/edit?s_idkecamatan=$row[s_idkecamatan]' class='btn btn-warning btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_idkecamatan'] . ");return false;' class='btn btn-danger btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $frm = new \Bphtb\Form\Setting\KecamatanFrm();
        $req = $this->getRequest();
        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Setting\KecamatanBphtbBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $this->getTbl()->savedata($kb, $session);
                return $this->redirect()->toRoute('setting_kecamatan_bphtb');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array("frm" => $frm));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_kecamatan' => 'active',
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
        $frm = new \Bphtb\Form\Setting\KecamatanFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idkecamatan');
            $data = $this->getTbl()->getDataId($id);
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_kecamatan' => 'active',
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

    public function cetakdaftarkecamatanAction() {
        $datakecamatan = $this->getTbl()->getdaftarkecamatan();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'daftarkecamatan');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'datakecamatan' => $datakecamatan
        ));
        return $pdf;
    }

    public function sinkrondataAction(){
        
        if($this->getTbl()->checkEmpty()<=0){
            $ar_kecamatan = $this->getTbls('PBBKecamatanTable')->getKecamatan();
            foreach ($ar_kecamatan as $key => $value) {
                $camat_ar['s_kodekecamatan'] = $value->KD_KECAMATAN;
                $camat_ar['s_namakecamatan'] = $value->NM_KECAMATAN;
                $this->getTbl()->save($camat_ar);
            }           
        }
        
        return $this->redirect()->toRoute('setting_kecamatan_bphtb');
    }

    public function getTbl() {
        if (!$this->tbl_kecamatan) {
            $sm = $this->getServiceLocator();
            $this->tbl_kecamatan = $sm->get('KecamatanBphtbTable');
        }
        return $this->tbl_kecamatan;
    }

    public function getTbls($tbAlias){
        if(!$this->tbls){
            $sm = $this->getServiceLocator();
            $this->tbls = $sm->get($tbAlias);
        }
        return $this->tbls;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
