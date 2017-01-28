<?php

namespace Bphtb\Controller\Setting;

class SettingPersyaratanTransaksi extends \Zend\Mvc\Controller\AbstractActionController {

    protected $tbl_pemda, $tbl_persyaratan_transaksi, $tbl_jenis_transaksi;

    public function indexAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Setting\PersyaratanFrm($this->comboBox());
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_persyaratan_transaksi' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Setting\PersyaratanBase();
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
            $s .= "<td>" . $row['s_namajenistransaksi'] . "</td>";
            $s .= "<td>" . $row['s_namapersyaratan'] . "</td>";
            $s .= "<td><center><a href='setting_persyaratan_transaksi_bphtb/edit?s_idpersyaratan=$row[s_idpersyaratan]' class='btn btn-warning btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus($row[s_idpersyaratan]);return false;' class='btn btn-danger btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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
        $form = new \Bphtb\Form\Setting\PersyaratanFrm($this->comboBox());
        if ($this->getRequest()->isPost()) {
            $base = new \Bphtb\Model\Setting\PersyaratanBase();
            $form->setInputFilter($base->getInputFilter());
            $form->setData($this->getRequest()->getPost());
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->getTbl()->savedata($base, $session);
                return $this->redirect()->toRoute('setting_persyaratan_transaksi_bphtb');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array("frm" => $form));
        $ar_pemda = $this->getPemda()->getdata();
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_persyaratan_transaksi' => 'active',
            'role_id' => $session['s_akses'],
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function editAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $frm = new \Bphtb\Form\Setting\PersyaratanFrm($this->comboBox());
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idpersyaratan');
            $data = $this->gettbl()->getDataId($id);
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array('frm' => $frm));
        $ar_pemda = $this->getPemda()->getdata();
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_persyaratan_transaksi' => 'active',
            'role_id' => $session['s_akses'],
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

    public function cetakdaftarpersyaratanAction() {
        $datapersyaratan = $this->getTbl()->getdaftarpersyaratan();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'daftarpersyaratan');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'datapersyaratan' => $datapersyaratan
        ));
        return $pdf;
    }

    private function comboBox() {
        $data = $this->getTblJenisTransaksi()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idjenistransaksi] = $row->s_namajenistransaksi;
        }
        return $selectData;
    }

    public function getTblJenisTransaksi() {
        if (!$this->tbl_jenis_transaksi) {
            $this->tbl_jenis_transaksi = $this->getServiceLocator()->get("JenisTransaksiBphtbTable");
        }
        return $this->tbl_jenis_transaksi;
    }

    private function getTbl() {
        if (!$this->tbl_persyaratan_transaksi) {
            $this->tbl_persyaratan_transaksi = $this->getServiceLocator()->get("PersyaratanTable");
        }
        return $this->tbl_persyaratan_transaksi;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
