<?php

namespace Bphtb\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class SettingPejabat extends AbstractActionController {

    protected $tbl_pemda, $tbl_pejabat;

    public function indexAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Setting\PejabatFrm($this->populateGolongan());
        $view = new ViewModel(array(
            'form' => $form
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_pejabat' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $base = new \Bphtb\Model\Setting\PejabatBphtbBase();
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
            $s .= "<td>" . $row['s_namapejabat'] . "</td>";
            $s .= "<td>" . $row['s_jabatanpejabat'] . "</td>";
            $s .= "<td>" . $row['s_nippejabat'] . "</td>";
            $s .= "<td><center><a href='setting_pejabat_bphtb/edit?s_idpejabat=$row[s_idpejabat]' class='btn btn-warning btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_idpejabat'] . ");return false;' class='btn btn-danger btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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
        $frm = new \Bphtb\Form\Setting\PejabatFrm($this->populateGolongan());
        $req = $this->getRequest();
        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Setting\PejabatBphtbBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $this->getTbl()->savedata($kb, $session);
                return $this->redirect()->toRoute('setting_pejabat_bphtb');
            }
        }
        $view = new ViewModel(array(
            'frm' => $frm
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_pejabat' => 'active',
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
        $frm = new \Bphtb\Form\Setting\PejabatFrm($this->populateGolongan());
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idpejabat');
            $datane = $this->getTbl()->checkId($id);
            $frm->bind($datane);
        }
        $view = new ViewModel(array(
            'frm' => $frm
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_pejabat' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function hapusAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $this->getTbl()->hapusData($this->params('page'), $session);
        return $this->getResponse();
    }

    public function populateGolongan() {
        $data = $this->getTbl()->comboBoxGolongan();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['ss_idgolongan']] = $row['ss_namagolongan'] . ' - ' . $row['ss_pangkatgolongan'];
        }
        return $selectData;
    }

    public function cetakdaftarpejabatAction() {
        $datapejabat = $this->getTbl()->getdaftarpejabat();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'daftarpejabat');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'datapejabat' => $datapejabat
        ));
        return $pdf;
    }

    public function getTbl() {
        if (!$this->tbl_pejabat) {
            $sm = $this->getServiceLocator();
            $this->tbl_pejabat = $sm->get('PejabatBphtbTable');
        }
        return $this->tbl_pejabat;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
