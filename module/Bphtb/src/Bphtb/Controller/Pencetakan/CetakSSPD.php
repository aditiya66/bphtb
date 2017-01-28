<?php

namespace Bphtb\Controller\Pencetakan;

use Zend\Mvc\Controller\AbstractActionController;
use Bphtb\Form\Pencetakan\SSPDFrm;
use Bphtb\Model\Pencetakan\SSPDBase;
use Bphtb\Model\Pendataan\SSPDBphtbBase;
use Zend\Math\Rand;

class CetakSSPD extends AbstractActionController {

    protected $tbl_pemda, $tbl_sspd, $tbl_pembayaran, $tbl_pejabat;

    public function cetaksspdbphtbAction() {
        $frm = new SSPDFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $base = new SSPDBase();
            $frm->setData($req->getQuery());
            $ar_sebelum = "";
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $app_path = $this->getServiceLocator()->get('app_path') . "/";
                $data_get = $req->getQuery();
                if ($data_get->action == 'cetaksspd') { // nyetak sspd dari tombol cetak dalam tabel grid
                    $ar_sspd = $this->getSSPD()->getviewcetakssp($data_get->t_idspt);
                    $dataidsptsebelum = $this->getSSPD()->getdataidsptsebelumnya($data_get->t_idspt);
                    if (!empty($dataidsptsebelum['t_idsptsebelumnya'])) { // jika ada spt sebelumnya yang dikoreksi bpn
                        $ar_sebelum = $this->getSSPD()->getdatassspdsebelumnya($dataidsptsebelum['t_idsptsebelumnya']);
                    }
                    $ar_tglcetak = date('d-m-Y');
                } else { // nyetak sspd yang dari pop up modal
                    $ar_sspd = $this->getSSPD()->getdatasspd($base);
                    $ar_tglcetak = $base->tgl_cetak;
                }
                $ar_pemda = $this->getPemda()->getdata();
            }
        }
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'SSPD');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'app_path' => $app_path,
            'data_sspd' => $ar_sspd,
            'data_pemda' => $ar_pemda,
            'tgl_cetak' => $ar_tglcetak,
            'ar_sebelum' => $ar_sebelum,
            'dataidsptsebelum' => $dataidsptsebelum
        ));
        return $pdf;
    }

    public function cetakbuktipenerimaanAction() {
        $frm = new SSPDFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $base = new SSPDBase();
            $frm->setData($req->getQuery());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                // $app_path = $this->getServiceLocator()->get('app_path') . "/";
                $data_get = $req->getQuery();
                // if ($data_get->action == 'cetakbuktipenerimaan') {
                // $ar_sspd = $this->getSSPD()->getdatassspd($data_get->t_idspt);
                // $ar_tglcetak = date('d-m-Y');
                // } else {
                $ar_sspd = $this->getSSPD()->getdatasspd($base);
                $ar_tglcetak = $base->tgl_cetak_bukti;
                // $hasildata = $this->getSSPD()->getdatasspd($base);
                // }
                $ar_pemda = $this->getPemda()->getdata();
            }
        }
        /*
         * $testarray = array();
         * foreach ($hasildata as $row) {
         * $combosyarat = $this->getTblPersyaratan()->comboBox($row['t_idjenistransaksi']);
         * array_push($testarray, $combosyarat);
         * }
         */
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'BuktiPenerimaan');
        $pdf->setOption('paperSize', 'A4');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            // 'app_path' => $app_path,
            'data_sspd' => $ar_sspd,
            'data_pemda' => $ar_pemda
        ));
        // 'testarray' => $testarray,
        // 'combosyarat' => $combosyarat,

        return $pdf;
    }

    public function cetakkodebayarAction() {
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $frm = new SSPDFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $base = new SSPDBase();
            $frm->setData($req->getQuery());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $data_get = $req->getQuery();
                if ($data_get->action == 'cetakkodebyr') {
                    // $ar_sspd = $this->getSSPD()->getdatassspd($data_get->t_idspt);
                    $ar_sspd = $this->getSSPD()->ambildatainsptvalidasi($data_get->t_idspt);
                    $ar_tglcetak = date('d-m-Y');
                } else {
                    if($session['s_akses'] == 3){
                        $dataawal = $this->getSSPD()->ambilsemuadatasptvalidasi($session['s_iduser'], $data_get->no_spt1, $data_get->no_spt2, $data_get->periode_spt);
                    }else{
                        $dataawal = $this->getSSPD()->ambilsemuadatasptvalidasi(null, $data_get->no_spt1, $data_get->no_spt2, $data_get->periode_spt);                        
                    }
                    
                    if (count($dataawal) > 0) {
                        foreach ($dataawal as $row) {
                            $result_array_syarat = \Zend\Json\Json::decode($row['t_persyaratan']);
                            $jml_syarat = count($result_array_syarat);
                            $result_array_syarat_verifikasi = \Zend\Json\Json::decode($row['t_verifikasispt']);
                            $jml_syarat_verifikasi = count($result_array_syarat_verifikasi);
                            if ($jml_syarat == $jml_syarat_verifikasi) {
                                $data_tidspt[] = $row['t_idspt'];
                            }
                        }
                    } else {
                        $data_tidspt = '';
                    }
                    $ar_sspd = $this->getSSPD()->ambildatainsptvalidasi(@$data_tidspt);
                    $ar_tglcetak = $base->tgl_cetak;
                }

                $ar_pemda = $this->getPemda()->getdata();
            }
        }
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'KodeBayar');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'data_sspd' => $ar_sspd,
            'tgl_cetak' => $ar_tglcetak,
            'data_pemda' => $ar_pemda
        ));
        return $pdf;
    }

    public function cetakbuktipenerimaanvalidasiAction() {
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $frm = new SSPDFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $base = new SSPDBase();
            $frm->setData($req->getQuery());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $data_get = $req->getQuery();
                $datahari = $this->getTblPembayaran()->cekJumlahhari();
                if ($data_get->action == 'cetakpenerimaanvalidasi') {
                    $ar_sspd = $this->getSSPD()->getdatassspd($data_get->t_idspt);
                    // $ar_sspd = $this->getSSPD()->ambildatainsptvalidasi($data_get->t_idspt);
                    $ar_tglcetak = date('d-m-Y');
                    $hasildata = $this->getSSPD()->getdatassspd($data_get->t_idspt);
                } else {
                    $ar_sspd = $this->getSSPD()->getdatasspd($base);
                    // $ar_sspd = $this->getSSPD()->ambildatainsptvalidasi(@$data_tidspt);
                    $ar_tglcetak = $base->tgl_cetak;
                    $hasildata = $this->getSSPD()->getdatasspd($base);
                }
                $ar_pemda = $this->getPemda()->getdata();
                $testarray = array();
                foreach ($hasildata as $row) {
                    $result_array_syarat = \Zend\Json\Json::decode($row['t_persyaratan']);
                    $jml_syarat = count($result_array_syarat);
                    $result_array_syarat_verifikasi = \Zend\Json\Json::decode($row['t_verifikasispt']);
                    $jml_syarat_verifikasi = count($result_array_syarat_verifikasi);
                    if ($jml_syarat == $jml_syarat_verifikasi) {
                        
                    } else {
                        $combosyarat = $this->getTblPersyaratan()->comboBox($row['t_idjenistransaksi']);
                        array_push($testarray, $combosyarat);
                    }
                }
            }
        }

        $ar_Pejabat = $this->getTblPejabat()->getdataid($data_get->mengetahuibphtb);
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'BuktiPenerimaan');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'data_sspd' => $ar_sspd,
            'tgl_cetak' => $ar_tglcetak,
            'data_pemda' => $ar_pemda,
            'testarray' => $testarray,
            'datahari' => $datahari,
            'ar_Pejabat' => $ar_Pejabat
        ));
        return $pdf;
    }

    public function cetakpencatatansetoranbphtbAction() {
        $frm = new SSPDFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $base = new SSPDBase();
            $frm->setData($req->getQuery());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $data_get = $req->getQuery();
                $ar_PencatatanSetoran = $this->getSSPD()->getDataPencatatanSetoran($data_get->tgl_pembayaran1, $data_get->tgl_pembayaran2);
                $ar_tglcetak = $base->tgl_cetak;
                $ar_periodespt = $base->periode_spt;
                $ar_pemda = $this->getPemda()->getdata();
            }
        }
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'PencatatanSetoran');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');

        $pdf->setVariables(array(
            'data_pencatatanSetoran' => $ar_PencatatanSetoran,
            'tgl_cetak' => $ar_tglcetak,
            'periode_spt' => $ar_periodespt,
            'data_pemda' => $ar_pemda
        ));
        return $pdf;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

    public function getSSPD() {
        if (!$this->tbl_sspd) {
            $sm = $this->getServiceLocator();
            $this->tbl_sspd = $sm->get("SSPDTable");
        }
        return $this->tbl_sspd;
    }

    function populatePersyaratanId($id) {
        $data = $this->getTblPersyaratan()->getDataId($id);

        $hasil = $data->s_namapersyaratan;

        return $hasil;
    }

    public function getTblPersyaratan() {
        // if (!$this->tbl_persyaratan) {
        $sm = $this->getServiceLocator();
        $this->tbl_persyaratan = $sm->get('PersyaratanTable');
        // }
        return $this->tbl_persyaratan;
    }

    // =============edit
    public function populateComboJenisTransaksi() {
        $data = $this->getTblJenTran()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idjenistransaksi] = $row->s_namajenistransaksi;
        }
        return $selectData;
    }

    public function getTblJenTran() {
        // if (!$this->tbl_jenistransaksi) {
        $sm = $this->getServiceLocator();
        $this->tbl_jenistransaksi = $sm->get('JenisTransaksiBphtbTable');
        // }
        return $this->tbl_jenistransaksi;
    }

    public function populateComboHakTanah() {
        $data = $this->getTblHakTan()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idhaktanah] = $row->s_namahaktanah;
        }
        return $selectData;
    }

    public function getTblHakTan() {
        // if (!$this->tbl_haktanah) {
        $sm = $this->getServiceLocator();
        $this->tbl_haktanah = $sm->get('HakTanahTable');
        // }
        return $this->tbl_haktanah;
    }

    public function populateComboDokTanah() {
        $data = $this->getTblDokTan()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_iddoktanah] = $row->s_namadoktanah;
        }
        return $selectData;
    }

    public function getTblDokTan() {
        // if (!$this->tbl_doktanah) {
        $sm = $this->getServiceLocator();
        $this->tbl_doktanah = $sm->get('DokTanahTable');
        // }
        return $this->tbl_doktanah;
    }

    private function populateComboNotaris() {
        $data = $this->getNotaris()->getdataCombo();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['s_iduser']] = $row['s_namanotaris'];
        }
        return $selectData;
    }

    public function getNotaris() {
        // if (!$this->tbl_notaris) {
        $sm = $this->getServiceLocator();
        $this->tbl_notaris = $sm->get('NotarisBphtbTable');
        // }
        return $this->tbl_notaris;
    }

    public function getTbl() {
        if (!$this->tbl_sspd) {
            $sm = $this->getServiceLocator();
            $this->tbl_sspd = $sm->get("SSPDBphtbTable");
        }
        return $this->tbl_sspd;
    }

    public function getTblPembayaran() {
        if (!$this->tbl_pembayaran) {
            $sm = $this->getServiceLocator();
            $this->tbl_pembayaran = $sm->get('PembayaranSptTable');
        }
        return $this->tbl_pembayaran;
    }

    public function getTblPejabat() {
        if (!$this->tbl_pejabat) {
            $sm = $this->getServiceLocator();
            $this->tbl_pejabat = $sm->get("PejabatBphtbTable");
        }
        return $this->tbl_pejabat;
    }

    // =============end edit
}
