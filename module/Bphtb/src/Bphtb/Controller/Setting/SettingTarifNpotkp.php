<?php

namespace Bphtb\Controller\Setting;

class SettingTarifNpotkp extends \Zend\Mvc\Controller\AbstractActionController {

    protected $tbl_pemda, $tbl_tarif_npotkp, $tbl_jenis_transaksi;

    public function indexAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Setting\TarifNpotkpFrm($this->ComboJenisTransaksi());
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_npotkp' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Setting\TarifNpotkpBase();
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
            $s .= "<td>" . $row['s_kodejenistransaksi'] . "</td>";
            $s .= "<td>" . $row['s_namajenistransaksi'] . "</td>";
            $s .= "<td><div style='text-align:right'>" . number_format($row['s_tarifnpotkp'], 0, ',', '.') . "</div></td>";
            $s .= "<td>" . number_format($row['s_tarifnpotkptambahan'], 0, ',', '.') . "</td>";
            $s .= "<td>" . $row['s_tarifnpotkptahunajb1'] . "</td>";
            $s .= "<td>" . $row['s_tarifnpotkptahunajb2'] . "</td>";
            $s .= "<td><center><a href='setting_tarif_npotkp/edit?s_idtarifnpotkp=$row[s_idtarifnpotkp]' class='btn btn-warning btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_idtarifnpotkp'] . ");return false;' class='btn btn-danger btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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
        $form = new \Bphtb\Form\Setting\TarifNpotkpFrm($this->ComboJenisTransaksi());
        if ($this->getRequest()->isPost()) {
            $base = new \Bphtb\Model\Setting\TarifNpotkpBase();
            $form->setInputFilter($base->getInputFilter());
            $form->setData($this->getRequest()->getPost());
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->getTbl()->savedata($base, $session);
                return $this->redirect()->toRoute('setting_tarif_npotkp');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array("frm" => $form));
        $ar_pemda = $this->getPemda()->getdata();
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_npotkp' => 'active',
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
        $frm = new \Bphtb\Form\Setting\TarifNpotkpFrm($this->ComboJenisTransaksi());
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idtarifnpotkp');
            $data = $this->getTbl()->getDataId($id);
            $data->s_tarifnpotkp = $data->s_tarifnpotkp * 1;
            $data->s_tarifnpotkptambahan = $data->s_tarifnpotkptambahan * 1;
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm
        ));
        $ar_pemda = $this->getPemda()->getdata();
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_npotkp' => 'active',
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

    public function cetakdaftartarifnpoptkpAction() {
        $datatarifnpoptkp = $this->getTbl()->getdaftartarifnpoptkp();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'daftarnpoptkp');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'datatarifnpoptkp' => $datatarifnpoptkp
        ));
        return $pdf;
    }

    public function ComboJenisTransaksi() {
        $data = $this->getTblJenisTransaksi()->combobox();
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

    public function getTbl() {
        if (!$this->tbl_tarif_npotkp) {
            $this->tbl_tarif_npotkp = $this->getServiceLocator()->get("TarifNpotkpTable");
        }
        return $this->tbl_tarif_npotkp;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
