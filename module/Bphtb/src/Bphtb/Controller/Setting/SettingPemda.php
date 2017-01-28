<?php

namespace Bphtb\Controller\Setting;

class SettingPemda extends \Zend\Mvc\Controller\AbstractActionController {

    protected $table_pemda;

    public function indexAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getTbl()->getdata();
        $data = $this->getTbl()->getdata();
        $frm = new \Bphtb\Form\Setting\PemdaFrm($data->s_logo);
        if (!empty($data)) {
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array("frm" => $frm));
//        $menu = new \Zend\View\Model\ViewModel(array('menu_setting' => 'active', 'role_id' => $session['s_akses']));
        $datane = array(
            "menu_setting" => "menu_setting",
            'side_pemda' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($datane);
        return $view;
    }

    public function tambahAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $frm = new \Bphtb\Form\Setting\PemdaFrm();
        $req = $this->getRequest();
        $newFile = "";
        if ($req->isPost()) {
            $base = new \Bphtb\Model\Setting\PemdaBase();
            $post = array_merge_recursive($req->getPost()->toArray(), $req->getFiles()->toArray());
            $frm->setData($post);
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $httpadapter = new \Zend\File\Transfer\Adapter\Http();
                $httpadapter->setDestination('public/upload/');
                if ($httpadapter->receive($post["s_logofile"]["name"])) {
                    $newFile = $httpadapter->getFileName();
                }
                $this->getTbl()->savedata($base, $newFile, $session);
                return $this->redirect()->toRoute('setting_pemda');
            }
        }
    }

    public function getTbl() {
        if (!$this->table_pemda) {
            $sm = $this->getServiceLocator();
            $this->table_pemda = $sm->get('PemdaTable');
        }
        return $this->table_pemda;
    }

}
