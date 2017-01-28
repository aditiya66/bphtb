<?php

namespace Bphtb\Controller;

use Zend\Authentication\Adapter\DbTable as DbTableAuthAdapter;

class LoginAccess extends \Zend\Mvc\Controller\AbstractActionController {

    protected $tbl_user, $tbl_pemda;

    public function indexAction() {
        $frm = new \Bphtb\Form\LoginAccessFrm();
        $ar_pemda = $this->getPemda()->getdata();
        $view = new \Zend\View\Model\ViewModel(array(
            "form" => $frm,
            'data_pemda' => $ar_pemda
        ));
        if ($this->getRequest()->isPost()) {
            $frm->setData($this->getRequest()->getPost());
            if ($frm->isValid()) {
                $this->getServiceLocator()->get('EtaxService')
                        ->getAdapter()
                        ->setIdentity($this->getRequest()->getPost('s_username'))
                        ->setCredential($this->getRequest()->getPost('s_password'));
                if (empty($this->getRequest()->getPost('s_username'))) {
                    return $this->redirect()->toRoute('sign_in');
                }
                $hasil = $this->getServiceLocator()->get('EtaxService')->authenticate();
                if ($hasil->isValid()) {
                    $data_user = $this->getTbl()->getuserdata($this->getRequest()->getPost('s_username'));
                    $resultRowObject = $this->getServiceLocator()->get('EtaxService')->getAdapter()->getResultRowObject();
                    $this->getServiceLocator()->get('EtaxService')->getStorage()->write(
                            array(
                                's_iduser' => $resultRowObject->s_iduser,
                                's_username' => $resultRowObject->s_username,
                                's_jabatan' => $resultRowObject->s_jabatan,
                                's_akses' => $resultRowObject->s_akses,
                                's_namauserrole' => $data_user['role_name']));
                    if ($resultRowObject->s_akses == 6) {
                        return $this->redirect()->toRoute('pendataan_sspd', array(
                            'controller' => 'PendataanSSPD',
                            'action' => 'tambah'
                        ));
                    } else {
                        return $this->redirect()->toRoute('main_bphtb');
                    }
                }
            }
        }
        $data = array('nilai' => '2');
        $this->layout()->setVariables($data);
        return $view;
    }

    public function logoutAction() {
        $this->getServiceLocator()->get('EtaxService')->clearIdentity();
        return $this->redirect()->toRoute('sign_in');
    }

    public function getTbl() {
        if (!$this->tbl_user) {
            $this->tbl_user = $this->getServiceLocator()->get('UserTable');
        }
        return $this->tbl_user;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
