<?php

namespace Bphtb\Controller\Setting;

class SettingHargaAcuan extends \Zend\Mvc\Controller\AbstractActionController {

    protected $tbl_pemda, $tbl_harga_acuan;

    public function indexAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Setting\HargaAcuanFrm();
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_harga_acuan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Setting\HargaAcuanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTblAcuan()->getGridCountAcuan($base);
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
        $data = $this->getTblAcuan()->getGridDataAcuan($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td align='center'>" . $counter . "</td>";
            $s .= "<td align='center'>" . $row['s_kd_propinsi'] . "</td>";
            $s .= "<td align='center'>" . $row['s_kd_dati2'] . "</td>";
            $s .= "<td align='center'>" . $row['s_kd_kecamatan'] . "</td>";
            $s .= "<td align='center'>" . $row['s_kd_kelurahan'] . "</td>";
            $s .= "<td align='center'>" . $row['s_kd_blok'] . "</td>";
            $s .= "<td align='right'>" . number_format($row['s_permetertanah'], 0, ',', '.') . "</td>";
            $s .= "<td><center><a href='setting_harga_acuan_bphtb/edit?s_idacuan=$row[s_idacuan]' class='btn btn-warning btn-xs btn-flat' style='width:55px'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_idacuan'] . ");return false;' class='btn btn-danger btn-xs btn-flat' style='width:55px'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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
        $form = new \Bphtb\Form\Setting\HargaAcuanFrm();
        if ($this->getRequest()->isPost()) {
            $base = new \Bphtb\Model\Setting\HargaAcuanBase();
            $form->setInputFilter($base->getInputFilter());
            $form->setData($this->getRequest()->getPost());
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->getTblAcuan()->savedata($base, $session);
                return $this->redirect()->toRoute('setting_harga_acuan_bphtb');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array("frm" => $form));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_harga_acuan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function editAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $frm = new \Bphtb\Form\Setting\HargaAcuanFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idacuan');
            $data = $this->getTblAcuan()->getDataId($id);
            $data->t_nopacuan = $data->s_kd_propinsi . '.' . $data->s_kd_dati2 . '.' . $data->s_kd_kecamatan . '.' . $data->s_kd_kelurahan . '.' . $data->s_kd_blok;
            $data->s_permetertanah = number_format($data->s_permetertanah, 0, ',', '.');
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_harga_acuan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function hapusAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $this->getTblAcuan()->hapusData($this->params('page'), $session);
        return $this->getResponse();
    }

    public function importdataacuanAction() {
//        $inputFileName = './test.xls';
        $inputFileName = './acuan.xls';
        try {
            $inputFileType = \PHPExcel_IOFactory::identify($inputFileName);
            $objReader = \PHPExcel_IOFactory::createReader($inputFileType);
            $objPHPExcel = $objReader->load($inputFileName);
        } catch (Exception $e) {
            die('Error loading file "' . pathinfo($inputFileName, PATHINFO_BASENAME) . '": ' . $e->getMessage());
        }
        $sheet = $objPHPExcel->getSheet(0);
        $highestRow = $sheet->getHighestRow();
        $highestColumn = $sheet->getHighestColumn();
        for ($row = 1; $row <= $highestRow; $row++) {
            $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
            $this->getTblAcuan()->savedataimport($rowData);
        }
        return $this->redirect()->toRoute('setting_harga_acuan_bphtb');
    }

    public function cetakdaftaracuanAction() {
        $dataacuan = $this->getTblAcuan()->getdaftaracuan();        
        $pdf = new \Zend\View\Model\ViewModel();
        $pdf->setVariables(array(
            'dataacuan' => $dataacuan
        ));
        $data = array('nilai' => '1');
        $this->layout()->setVariables($data);
        return $pdf;
    }

    public function getTblAcuan() {
        if (!$this->tbl_harga_acuan) {
            $this->tbl_harga_acuan = $this->getServiceLocator()->get("HargaAcuanTable");
        }
        return $this->tbl_harga_acuan;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
