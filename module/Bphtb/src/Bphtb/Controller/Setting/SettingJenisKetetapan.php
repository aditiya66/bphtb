<?php

namespace Bphtb\Controller\Setting;

class SettingJenisKetetapan extends \Zend\Mvc\Controller\AbstractActionController {

    protected $tbl_jenisketetapan;

    public function indexAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $view = new \Zend\View\Model\ViewModel();
        $menu = new \Zend\View\Model\ViewModel(array('menu_setting' => 'active', 'role_id' => $session['s_akses']));
        $sidemenu = new \Zend\View\Model\ViewModel(array('side_setting' => 'active',
            'side_jenisketetapan' => 'active', 'role_id' => $session['s_akses']));
        $menu->setTemplate('bphtb/menu.phtml');
        $sidemenu->setTemplate('bphtb/side_menu.phtml');
        $view->addChild($menu, 'menu');
        $view->addChild($sidemenu, 'sidemenu');
        return $view;
    }

    public function dataGridAction() {
        $frm = new \Bphtb\Form\Setting\JenisKetetapanFrm();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isGet()) {
            $ex = new \Bphtb\Model\Setting\JenisKetetapanBase();
            $frm->setData($req->getQuery());
            if ($frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $page = $ex->page;
                $limit = $ex->rows;
                $sidx = $ex->sidx;
                $sord = $ex->sord;
                if (!$sidx)
                    $sidx = 1;
                $count = $this->getTbl()->getGridCount($ex);
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
                $res->getHeaders()->addheaders(array('Content-type' => 'text/xml'));
                $s = "<?xml version='1.0' encoding='utf-8'?>";
                $s .= "<rows>";
                $s .= "<page>" . $page . "</page>";
                $s .= "<total>" . $total_pages . "</total>";
                $s .= "<records>" . $count . "</records>";
                $data = $this->getTbl()->getGridData($ex, $start);
                foreach ($data as $row) {
                    $s .= "<row id='" . $row['s_idjenisketetapan'] . "'>";
                    $s .= "<cell>" . $row['s_namajenisketetapan'] . "</cell>";
                    $s .= "<cell>" . $row['s_namasingkatjenisketetapan'] . "</cell>";                    
                    $s .= "<cell><![CDATA[<a href='setting_jenis_ketetapan/edit/$row[s_idjenisketetapan]'>Edit</a>]]> || <![CDATA[<a href='#' onclick='hapus(" . $row['s_idjenisketetapan'] . ");return false;' >Hapus</a>]]></cell>";
                    $s .= "</row>";
                }
                $s .= "</rows>";
                $res->setContent($s);
            }
        }
        return $res;
    }

    public function tambahAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $form = new \Bphtb\Form\Setting\JenisKetetapanFrm();
        if ($this->getRequest()->isPost()) {
            $base = new \Bphtb\Model\Setting\JenisKetetapanBase();
            $form->setInputFilter($base->getInputFilter());
            $form->setData($this->getRequest()->getPost());
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->getTbl()->savedata($base, $session);
                return $this->redirect()->toRoute('setting_jenis_ketetapan');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array("frm" => $form));
        $menu = new \Zend\View\Model\ViewModel(array('menu_setting' => 'active', 'role_id' => $session['s_akses']));
        $sidemenu = new \Zend\View\Model\ViewModel(array('side_setting' => 'active',
            'side_jenisketetapan' => 'active', 'role_id' => $session['s_akses']));
        $menu->setTemplate('bphtb/menu.phtml');
        $sidemenu->setTemplate('bphtb/side_menu.phtml');
        $view->addChild($menu, 'menu');
        $view->addChild($sidemenu, 'sidemenu');
        return $view;
    }

    public function editAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $frm = new \Bphtb\Form\Setting\JenisKetetapanFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {            
            $id = $this->params('id');
            $data = $this->getTbl()->getDataId($id);            
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm
        ));
        $menu = new \Zend\View\Model\ViewModel(array('menu_setting' => 'active', 'role_id' => $session['s_akses']));
        $sidemenu = new \Zend\View\Model\ViewModel(array('side_setting' => 'active',
            'side_jenisketetapan' => 'active', 'role_id' => $session['s_akses']));
        $menu->setTemplate('bphtb/menu.phtml');
        $sidemenu->setTemplate('bphtb/side_menu.phtml');
        $view->addChild($menu, 'menu');
        $view->addChild($sidemenu, 'sidemenu');
        return $view;
    }
    
    public function hapusAction() {
        $this->gettbl()->hapusData($this->params('id'));        
        return $this->getResponse();
    }
        
    public function getTbl() {
        if (!$this->tbl_jenisketetapan) {
            $this->tbl_jenisketetapan = $this->getServiceLocator()->get("JenisKetetapanTable");
        }
        return $this->tbl_jenisketetapan;
    }

}
