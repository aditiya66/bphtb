<?php

namespace Bphtb\Controller\Setting;

class SettingNotaris extends \Zend\Mvc\Controller\AbstractActionController {

    protected $tbl_pemda, $tbl_notaris;

    public function indexAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Setting\NotarisFrm();
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_notaris' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function tambahAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $frm = new \Bphtb\Form\Setting\NotarisFrm();
        $req = $this->getRequest();
        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Setting\NotarisBphtbBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $this->getTbl()->savedata($kb, $session);
                return $this->redirect()->toRoute('setting_notaris_bphtb');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_notaris' => 'active',
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
        $frm = new \Bphtb\Form\Setting\NotarisFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idnotaris');
            $data = $this->getTbl()->checkId($id);
            $data->s_tgl1notaris = date("d-m-Y", strtotime($data->s_tgl1notaris));
            $data->s_tgl2notaris = date("d-m-Y", strtotime($data->s_tgl2notaris));
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_notaris' => 'active',
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

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Setting\NotarisBphtbBase();
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
            $s .= "<td>" . $row['s_namanotaris'] . "</td>";
            $s .= "<td>" . $row['s_kodenotaris'] . "</td>";
            $s .= "<td>" . $row['s_alamatnotaris'] . "</td>";
//            if ($row['s_statusnotaris'] == 0) {
//                $s .= "<td>Tidak Aktif</td>";
//            } elseif ($row['s_statusnotaris'] == 1) {
//                $s .= "<td>Aktif</td>";
//            }
            $s .= "<td><center><a href='setting_notaris_bphtb/edit?s_idnotaris=$row[s_idnotaris]' class='btn btn-warning btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_idnotaris'] . ");return false;'  class='btn btn-danger btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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

    public function cetakdaftarnotarisAction() {
        $datanotaris = $this->getTbl()->getdaftarnotaris();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'daftarnotaris');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'datanotaris' => $datanotaris
        ));
        return $pdf;
    }

    public function getTbl() {
        if (!$this->tbl_notaris) {
            $sm = $this->getServiceLocator();
            $this->tbl_notaris = $sm->get('NotarisBphtbTable');
        }
        return $this->tbl_notaris;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
