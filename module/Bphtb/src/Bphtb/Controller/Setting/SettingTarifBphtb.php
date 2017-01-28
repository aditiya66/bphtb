<?php

namespace Bphtb\Controller\Setting;

class SettingTarifBphtb extends \Zend\Mvc\Controller\AbstractActionController {

    protected $tbl_pemda, $tbl_tarifbphtb;

    public function indexAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Setting\TarifBphtbFrm();
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_tarifbphtb' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Setting\TarifBphtbBase();
        $base->exchangeArray($allParams);
        if ($base->direction == 2)
            $base->page = $base->page + 1;
        if ($base->direction == 1)
            $base->page = $base->page - 1;
        if ($base->page <= 0)
            $base->page = 1;
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
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td>" . $row['s_tarifbphtb'] . " % </td>";
            $s .= "<td>" . date('Y', strtotime($row['s_tanggaltarifbphtb'])) . "</td>";
            $s .= "<td>" . $row['s_dasarhukumtarifbphtb'] . "</td>";
            if ($row["s_statustarifbphtb"] == 0) {
                $s .= "<td>Tidak Aktif</td>";
            } else if ($row['s_statustarifbphtb'] == 1) {
                $s .= "<td>Aktif</td>";
            }
            $s .= "<td><center><a href='setting_tarif_bphtb/edit?s_idtarifbphtb=$row[s_idtarifbphtb]' class='btn btn-warning btn-sm btn-flat' style='width:55px'>Edit</a> <a href='#' onclick='hapus(" . $row['s_idtarifbphtb'] . ");return false;' class='btn btn-danger btn-sm btn-flat' style='width:55px'>Hapus</a></center></td>";
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

    public function tambahAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $frm = new \Bphtb\Form\Setting\TarifBphtbFrm();
        if ($this->getRequest()->isPost()) {
            $base = new \Bphtb\Model\Setting\TarifBphtbBase();
            $frm->setInputFilter($base->getInputFilter());
            $frm->setData($this->getRequest()->getPost());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $this->getTbl()->savedata($base, $session);
                return $this->redirect()->toRoute('setting_tarif_bphtb');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array("frm" => $frm));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_tarifbphtb' => 'active',
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
        $frm = new \Bphtb\Form\Setting\TarifBphtbFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idtarifbphtb');
            $data = $this->getTbl()->getDataId($id);
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_tarifbphtb' => 'active',
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

    public function getTbl() {
        if (!$this->tbl_tarifbphtb) {
            $this->tbl_tarifbphtb = $this->getServiceLocator()->get("TarifBphtbTable");
        }
        return $this->tbl_tarifbphtb;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
