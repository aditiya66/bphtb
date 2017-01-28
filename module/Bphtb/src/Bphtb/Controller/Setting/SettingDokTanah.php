<?php

namespace Bphtb\Controller\Setting;

class SettingDokTanah extends \Zend\Mvc\Controller\AbstractActionController {

    protected $tbl_pemda, $tbl_dok_tanah;

    public function indexAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Setting\DokTanahFrm();
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_dokumen_tanah' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Setting\DokTanahBase();
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
            $s .= "<td>" . $row['s_namadoktanah'] . "</td>";
            $s .= "<td><center><a href='setting_dokumen_tanah_bphtb/edit?s_iddoktanah=$row[s_iddoktanah]' class='btn btn-warning btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_iddoktanah'] . ");return false;' class='btn btn-danger btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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
        $form = new \Bphtb\Form\Setting\DokTanahFrm();
        if ($this->getRequest()->isPost()) {
            $base = new \Bphtb\Model\Setting\DokTanahBase();
            $form->setInputFilter($base->getInputFilter());
            $form->setData($this->getRequest()->getPost());
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->getTbl()->savedata($base, $session);
                return $this->redirect()->toRoute('setting_dokumen_tanah_bphtb');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array("frm" => $form));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_dokumen_tanah' => 'active',
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
        $frm = new \Bphtb\Form\Setting\DokTanahFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_iddoktanah');
            $data = $this->getTbl()->getDataId($id);
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_dokumen_tanah' => 'active',
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

    public function cetakdaftardoktanahAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Setting\DokTanahFrm();
        $datadoktanah = $this->getTbl()->getdaftardoktanah();
        $view = new \Zend\View\Model\ViewModel(array(
            'datadoktanah' => $datadoktanah
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_dokumen_tanah' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
//        $pdf = new \DOMPDFModule\View\Model\PdfModel();
//        $pdf->setOption('filename', 'daftardoktanah');
//        $pdf->setOption('paperSize', 'legal');
//        $pdf->setOption('paperOrientation', 'potrait');
//        $pdf->setVariables(array(
//            'datadoktanah' => $datadoktanah
//        ));
//        return $pdf;
    }

    public function getTbl() {
        if (!$this->tbl_dok_tanah) {
            $this->tbl_dok_tanah = $this->getServiceLocator()->get("DokTanahTable");
        }
        return $this->tbl_dok_tanah;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
