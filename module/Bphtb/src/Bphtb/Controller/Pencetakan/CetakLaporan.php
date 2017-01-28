<?php

namespace Bphtb\Controller\Pencetakan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use LosPdf\View\Model\PdfModel;

class CetakLaporan extends AbstractActionController {

    protected $tbl_pemda, $tbl_sspd, $tbl_pejabat, $tbl_pendataan, $tbl_jenistransaksi, $tbl_haktanah, $tbl_pembayaran, $tbl_pelaporan, $tbl_kecamatan, $tbl_kelurahan;

    public function indexAction() {
        $ar_pemda = $this->getPemda()->getdata();
        $Pejabat = $this->getTblPejabat()->getdata();
        $Mengetahui = $this->getTblPejabat()->getdata();
        $PejabatRealisasi = $this->getTblPejabat()->getdata();
        $MengetahuiRealisasi = $this->getTblPejabat()->getdata();
        $Mengetahuibphtb = $this->getTblPejabat()->getdata();
        $PejabatSkpdkb = $this->getTblPejabat()->getdata();
        $data_mengetahuibphtbkec = $this->getTblPejabat()->getdata();
        $data_kecamatan = $this->getTblKecamatan()->getdata();
        $data_mengetahuibphtbkel = $this->getTblPejabat()->getdata();
        $data_kelurahan = $this->getTblKelurahan()->getdata();
        $Pejabatpertahun = $this->getTblPejabat()->getdata();
        $Mengetahuipertahun = $this->getTblPejabat()->getdata();
        $view = new ViewModel(array(
            'data_pejabat' => $Pejabat,
            'data_mengetahui' => $Mengetahui,
            'data_pejabatrealisasi' => $PejabatRealisasi,
            'data_mengetahuirealisasi' => $MengetahuiRealisasi,
            'data_mengetahuibphtb' => $Mengetahuibphtb,
            'data_pejabatskpdkb' => $PejabatSkpdkb,
            'data_mengetahuibphtbkec' => $data_mengetahuibphtbkec,
            'data_kecamatan' => $data_kecamatan,
            'data_mengetahuibphtbkel' => $data_mengetahuibphtbkel,
            'data_kelurahan' => $data_kelurahan,
            'data_pejabatpertahun' => $Pejabatpertahun,
            'data_mengetahuipertahun' => $Mengetahuipertahun
        ));
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $data = array(
            'menu_cetaklaporan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function cetakdaftarverifikasiAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_DataVerifikasi = $this->getTableSSPD()->getDataVerifikasi($data_get->periode_spt, $data_get->tgl_verifikasi1, $data_get->tgl_verifikasi2);
        $ar_tglcetak = $data_get->tgl_cetak;
        $ar_periodespt = $data_get->periode_spt;
        $sm = $this->getServiceLocator();
        $this->tbl_pemda = $sm->get("PemdaTable");
        $ar_pemda = $this->tbl_pemda->getdata();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $view = new ViewModel(array(
            'data_Verifikasi' => $ar_DataVerifikasi,
            'tgl_cetak' => $ar_tglcetak,
            'periode_spt' => $ar_periodespt,
            'tgl_verifikasi1' => $data_get->tgl_verifikasi1,
            'tgl_verifikasi2' => $data_get->tgl_verifikasi2,
            'nama_login' => $session['s_namauserrole'],
            'ar_pemda' => $ar_pemda
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
    }

    public function cetaklapbphtbAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_LapBphtb = $this->getTableSSPD()->getDataLapBphtb($data_get->tgl_cetakbphtb1, $data_get->tgl_cetakbphtb2, $data_get->daftar_cetakan);
        $ar_Mengetahui = $this->getTblPejabat()->getdataid($data_get->mengetahuibphtb);
        $ar_pemda = $this->getPemda()->getdata();
        $pdf = new PdfModel();
        $pdf->setVariables(array(
            'data_lapBphtb' => $ar_LapBphtb,
            'data_mengetahui' => $ar_Mengetahui,
            'tgl_cetak1' => $data_get->tgl_cetakbphtb1,
            'tgl_cetak2' => $data_get->tgl_cetakbphtb2,
            'ar_pemda' => $ar_pemda,
            'jeniscetakan' => $data_get->daftar_cetakan
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetaklapbphtbexcelAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_LapBphtb = $this->getTableSSPD()->getDataLapBphtb($data_get->tgl_cetakbphtb1, $data_get->tgl_cetakbphtb2, $data_get->daftar_cetakan);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:AB7')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A4')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('C4')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(18);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('J')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('K')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('L')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('M')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('N')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('O')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('P')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('Q')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('R')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('S')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('T')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('U')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('V')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('W')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('X')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('Y')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('Z')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('AA')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('AB')->setWidth(20);
        $object->getActiveSheet()->mergeCells('A1:AB2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->mergeCells('A6:A7');
        $object->getActiveSheet()->mergeCells('B6:B7');
        $object->getActiveSheet()->mergeCells('C6:F6');
        $object->getActiveSheet()->mergeCells('G6:J6');
        $object->getActiveSheet()->mergeCells('K6:T6');
        $object->getActiveSheet()->mergeCells('U6:U7');
        $object->getActiveSheet()->mergeCells('V6:V7');
        $object->getActiveSheet()->mergeCells('W6:W7');
        $object->getActiveSheet()->mergeCells('X6:X7');
        $object->getActiveSheet()->mergeCells('Y6:Y7');
        $object->getActiveSheet()->mergeCells('Z6:Z7');
        $object->getActiveSheet()->mergeCells('AA6:AA7');
        $object->getActiveSheet()->mergeCells('AB6:AB7');
        $object->getActiveSheet()->getStyle('A6:AB6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('A7:AB7')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('A6:A7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B6:B7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C6:C7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C7:T7')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G6:G7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('J7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('K6:K7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('L7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('M7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('N7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('O7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('P7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('Q7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('R7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('S7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('T7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('U6:U7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('V6:V7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('W6:W7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('X6:X7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('Y6:Y7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('Z6:Z7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('AA6:AA7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('AB6:AB7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('AB6:AB7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->setActiveSheetIndex(0)
                ->setCellValue('A1', 'DAFTAR LAPORAN BPHTB (' . ucwords($data_get->daftar_cetakan) . ")")
                ->setCellValue('A4', 'Tanggal ' . ucwords($data_get->daftar_cetakan) . ' : ' . $data_get->tgl_cetakbphtb1 . ' S/D ' . $data_get->tgl_cetakbphtb2)
                ->setCellValue('A6', 'No.')
                ->setCellValue('B6', 'Tanggal Pendaftaran')
                ->setCellValue('C6', 'Informasi Pihak Kedua(Penerima Hak)')
                ->setCellValue('C7', 'NIK')
                ->setCellValue('D7', 'Nama')
                ->setCellValue('E7', 'Alamat')
                ->setCellValue('F7', 'No Telp')
                ->setCellValue('G6', 'Informasi Pihak Pertama(Peleepas Hak)')
                ->setCellValue('G7', 'NIK')
                ->setCellValue('H7', 'Nama')
                ->setCellValue('I7', 'Alamat')
                ->setCellValue('J7', 'No Telp')
                ->setCellValue('K6', 'Informasi Objek Pajak')
                ->setCellValue('K7', 'NOP/Thn SPPT')
                ->setCellValue('L7', 'Nama SPPT')
                ->setCellValue('M7', 'Letak Tanah/Bangunan')
                ->setCellValue('N7', 'Jenis Transaksi')
                ->setCellValue('O7', 'Nama Notaris/PPATS')
                ->setCellValue('P7', 'Luas Tanah')
                ->setCellValue('Q7', 'NJOP Tanah/m2')
                ->setCellValue('R7', 'Luas Bangunan')
                ->setCellValue('S7', 'NJOP Bangunan/m2')
                ->setCellValue('T7', 'NJOP PBB Total')
                ->setCellValue('U6', 'Harga Transaksi')
                ->setCellValue('V6', 'Tanggal Validasi')
                ->setCellValue('W6', 'NPOPTKP')
                ->setCellValue('X6', 'NPOPKP')
                ->setCellValue('Y6', 'Pajak Terhutang')
                ->setCellValue('Z6', 'Tanggal Pembayaran')
                ->setCellValue('AA6', 'Jumlah Pembayaran')
                ->setCellValue('AB6', 'Piutang');
        $counter = 8;
        $no = 1;
        $totalterhutang = 0;
        $totalpembayaran = 0;
        $totalsisa = 0;

        $ex = $object->setActiveSheetIndex(0);
        foreach ($ar_LapBphtb as $v) {
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, date('d/m/Y', strtotime($v['t_tglprosesspt'])));
            $ex->setCellValue("C" . $counter, $v['t_nikwppembeli']);
            $ex->setCellValue("D" . $counter, $v['t_namawppembeli']);
            $ex->setCellValue("E" . $counter, $v['t_kelurahanwppembeli']);
            $ex->setCellValue("F" . $counter, $v['t_telponwppembeli']);
            $ex->setCellValue("G" . $counter, $v['t_nikwppenjual']);
            $ex->setCellValue("H" . $counter, $v['t_namawppenjual']);
            $ex->setCellValue("I" . $counter, $v['t_kelurahanwppenjual']);
            $ex->setCellValue("J" . $counter, $v['t_telponwppenjual']);
            $ex->setCellValue("K" . $counter, $v['t_nopbphtbsppt']);
            $ex->setCellValue("L" . $counter, $v['t_namasppt']);
            $ex->setCellValue("M" . $counter, $v['t_alamatop']);
            $ex->setCellValue("N" . $counter, $v['s_namajenistransaksi']);
            $ex->setCellValue("O" . $counter, $v['s_namanotaris']);
            $ex->setCellValue("P" . $counter, $v['t_luastanah']);
            $ex->setCellValue("Q" . $counter, $v['t_njoptanah']);
            $ex->setCellValue("R" . $counter, $v['t_luasbangunan']);
            $ex->setCellValue("S" . $counter, $v['t_njopbangunan']);
            $ex->setCellValue("T" . $counter, $v['t_grandtotalnjop']);
            $ex->setCellValue("U" . $counter, $v['t_nilaitransaksispt']);
            if (!empty($v['t_tglverifikasispt'])) {
                $tglverifikasi = date('d/m/Y', strtotime($v['t_tglverifikasispt']));
            } else {
                $tglverifikasi = "";
            }
            $ex->setCellValue("V" . $counter, $tglverifikasi);
            $ex->setCellValue("W" . $counter, $v['t_potonganspt']);
            if ($v['t_grandtotalnjop'] > $v['t_nilaitransaksispt']) {
                $npop = $v['t_grandtotalnjop'] - $v['t_potonganspt'];
            } else {
                $npop = $v['t_nilaitransaksispt'] - $v['t_potonganspt'];
            }
            if ($npop > 0) {
                $npopkp = $npop;
            } else {
                $npopkp = 0;
            }
            $ex->setCellValue("X" . $counter, $npopkp);
            $ex->setCellValue("Y" . $counter, $v['t_totalspt']);
            if (!empty($v['t_tanggalpembayaran'])) {
                $tglbayar = date('d/m/Y', strtotime($v['t_tanggalpembayaran']));
            } else {
                $tglbayar = "";
            }
            $ex->setCellValue("Z" . $counter, $tglbayar);
            $ex->setCellValue("AA" . $counter, $v['t_nilaipembayaranspt']);
            $sisa = $v['t_totalspt'] - $v['t_nilaipembayaranspt'];
            $ex->setCellValue("AB" . $counter, $sisa);
            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('L' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('M' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('N' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('O' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('P' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('Q' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('R' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('S' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('T' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('U' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('V' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('W' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('X' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('Y' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('Z' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('AA' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('AB' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('AB' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $counter = $counter + 1;
            $no++;
            $totalterhutang += $v['t_totalspt'];
            $totalpembayaran += $v['t_nilaipembayaranspt'];
            $totalsisa += $sisa;
        }
        $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('L' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('M' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('N' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('O' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('P' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('Q' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('R' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('S' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('T' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('U' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('V' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('W' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('X' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('Y' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('Z' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('AA' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('AB' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->mergeCells('A' . $counter . ':X' . $counter);
        $object->setActiveSheetIndex(0)
                ->setCellValue('A' . $counter, 'Jumlah')
                ->setCellValue('Y' . $counter, $totalterhutang)
                ->setCellValue('AA' . $counter, $totalpembayaran)
                ->setCellValue('AB' . $counter, $totalsisa);
        $object->getActiveSheet()->getStyle('A' . $counter . ':AB' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('Y' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('Z' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('AA' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('AB' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('AB' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="lapBphtbExcel.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetaklapharianAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_LapHarian = $this->getTableSSPD()->getDataLapHarian($data_get->tgl_cetak);
        $ar_Mengetahui = $this->getTblPejabat()->getdataid($data_get->mengetahui);
        $ar_Pejabat = $this->getTblPejabat()->getdataid($data_get->pejabat);
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'LaporanPenerimaanHarianBPHTB');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'landscape');

        $pdf->setVariables(array(
            'data_lapharian' => $ar_LapHarian,
            'data_mengetahui' => $ar_Mengetahui,
            'data_pejabat' => $ar_Pejabat,
            'tgl_cetak' => $data_get->tgl_cetak,
            'data_pemda' => $ar_pemda,
            'nama_login' => $session['s_iduser']
        ));
        return $pdf;
    }

    public function cetaklapbulananbphtbAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        if ($session['s_namauserrole'] == "Administrator" || $session['s_namauserrole'] == "Pegawai") {
            $idnotaris = $data_get->t_idnotarisspt;
        } else if ($session['s_namauserrole'] == "Notaris") {
            $idnotaris = $session['s_iduser'];
        }
        $ar_LapbulananBphtb = $this->getTableSSPD()->getDataLapBulananBphtb($data_get->bulanpelaporan, $idnotaris, $data_get->periode_spt);
        if (!empty($idnotaris)) {
            $data_notaris = $this->getTableSSPD()->getNotaris($idnotaris);
        }
        $ar_pemda = $this->getPemda()->getdata();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'DaftarLaporanBulananBPHTB');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'landscape');

        $pdf->setVariables(array(
            'data_lapBulananBphtb' => $ar_LapbulananBphtb,
            'tgl_cetak' => $data_get->tgl_cetaklapbulanan,
            'bulanpelaporan' => $data_get->bulanpelaporan,
            'data_pemda' => $ar_pemda,
            'data_notaris' => $data_notaris
        ));
        return $pdf;
    }

    public function cetakkonfnotarisAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        if ($session['s_namauserrole'] == "Administrator" || $session['s_namauserrole'] == "Pegawai") {
            $idnotaris = $data_get->t_idnotarisspt1;
        } else if ($session['s_namauserrole'] == "Notaris") {
            $idnotaris = $session['s_iduser'];
        }
        $DataKonfBulananBphtb = $this->getTableSSPD()->getDataKonfBulananBphtb($data_get->bulanpelaporankonf, $idnotaris);
        if (!empty($idnotaris)) {
            $data_notaris = $this->getTableSSPD()->getNotaris($idnotaris);
        }
        $ar_pemda = $this->getPemda()->getdata();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'DaftarLapNotaris');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'landscape');

        $pdf->setVariables(array(
            'DataKonfBulananBphtb' => $DataKonfBulananBphtb,
            'tgl_cetak' => $data_get->tgl_cetaklapbulanankonf,
            'bulanpelaporan' => $data_get->bulanpelaporankonf,
            'data_pemda' => $ar_pemda,
            'data_notaris' => $data_notaris
        ));
        return $pdf;
    }

    public function cetakrealisasibphtbAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_DataRealisasi = $this->getTableSSPD()->getDataRealisasi($data_get->periode_sptrealisasi, $data_get->tgl_cetakrealisasi);
        $ar_DataTargetAnggaran = $this->getTableSSPD()->getDataTargetAnggaran($data_get->periode_sptrealisasi);
        $ar_Mengetahui = $this->getTblPejabat()->getdataid($data_get->mengetahui);
        $ar_Pejabat = $this->getTblPejabat()->getdataid($data_get->pejabat);
        $ar_pemda = $this->getPemda()->getdata();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'DaftarRealisasi');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'data_Realisasi' => $ar_DataRealisasi,
            'data_TargetAnggaran' => $ar_DataTargetAnggaran,
            'data_mengetahui' => $ar_Mengetahui,
            'data_pejabat' => $ar_Pejabat,
            'tgl_cetak' => $data_get->tgl_cetakrealisasi,
            'periode_spt' => $data_get->periode_sptrealisasi,
            'data_pemda' => $ar_pemda
        ));
        return $pdf;
    }

    public function cetakrealisasipertahunAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_DataRealisasi = $this->getTableSSPD()->getDataRealisasipertahun($data_get->periode_pertahun, $data_get->tgl_pertahun);
        $ar_DataTargetAnggaran = $this->getTableSSPD()->getDataTargetAnggaran($data_get->periode_pertahun);
        $ar_Mengetahui = $this->getTblPejabat()->getdataid($data_get->mengetahuipertahun);
        $ar_Pejabat = $this->getTblPejabat()->getdataid($data_get->pejabatpertahun);
        $ar_pemda = $this->getPemda()->getdata();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'DaftarRealisasi');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'landscape');
        $pdf->setVariables(array(
            'data_Realisasi' => $ar_DataRealisasi,
            'data_TargetAnggaran' => $ar_DataTargetAnggaran,
            'data_mengetahui' => $ar_Mengetahui,
            'data_pejabat' => $ar_Pejabat,
            'tgl_cetak' => $data_get->tgl_pertahun,
            'periode_spt' => $data_get->periode_pertahun,
            'data_pemda' => $ar_pemda
        ));
        return $pdf;
    }

    public function cetakskpdkbAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_DataSkpdkb = $this->getTableSSPD()->getDataValidasiSkpdkb($data_get->no_sspdbphtb1, $data_get->no_sspdbphtb2);
        $ar_Pejabat = $this->getTblPejabat()->getdataid($data_get->pejabatskpdkb);
        $ar_pemda = $this->getPemda()->getdata();
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'DataSKPDKB');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'data_Skpdkb' => $ar_DataSkpdkb,
            'data_pejabat' => $ar_Pejabat,
            'tgl_cetak' => $data_get->tgl_cetakskpdkb,
            'periode_skpdkb' => $data_get->periode_skpdkb,
            'data_pemda' => $ar_pemda
        ));
        return $pdf;
    }

    public function cetakhasilbpnAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data_hasilbpn = $this->getTableSSPD()->getDataHasilBpn($data_get->tgl_hasilbpn1, $data_get->tgl_hasilbpn2);
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $sm = $this->getServiceLocator();
        $this->tbl_pemda = $sm->get("PemdaTable");
        $ar_pemda = $this->tbl_pemda->getdata();
        $pdf->setOption('filename', 'DaftarHasilBPN');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'landscape');
        $pdf->setVariables(array(
            'data_hasilbpn' => $data_hasilbpn,
            'tgl_hasilbpn1' => $data_get->tgl_hasilbpn1,
            'tgl_hasilbpn2' => $data_get->tgl_hasilbpn2,
            'ar_pemda' => $ar_pemda
        ));
        return $pdf;
    }

    public function cetakbuktivalidasipembayaranAction() {
        $frm = new \Bphtb\Form\Pencetakan\SSPDFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $base = new \Bphtb\Model\Pencetakan\SSPDBase();
            $frm->setData($req->getQuery());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $data_get = $req->getQuery();
                $datavalidasipembayaran = $this->getTableSSPD()->ambildatainsptvalidasi($data_get->t_idspt);
            }
        }
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'ValidasiPembayaran');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'datavalidasipembayaran' => $datavalidasipembayaran
        ));
        return $pdf;
    }

    public function cetakbuktipembayaranAction() {
        $frm = new \Bphtb\Form\Pencetakan\SSPDFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $base = new \Bphtb\Model\Pencetakan\SSPDBase();
            $frm->setData($req->getQuery());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $data_get = $req->getQuery();
                $datapembayaran = $this->getTableSSPD()->ambildatainsptvalidasi($data_get->t_idspt);
                $ar_pemda = $this->getPemda()->getdata();
            }
        }
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'ValidasiPembayaran');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'datapembayaran' => $datapembayaran,
            'ar_pemda' => $ar_pemda
        ));
        return $pdf;
    }

    public function dataGridSkpdkbAction() {
        $res = $this->getResponse();
        $page = $this->getRequest()->getPost('page') ? $this->getRequest()->getPost('page') : 1;
        $rp = $this->getRequest()->getPost('rp') ? $this->getRequest()->getPost('rp') : 10;
        $sortname = $this->getRequest()->getPost('sortname') ? $this->getRequest()->getPost('sortname') : 't_kohirspt';
        $sortorder = $this->getRequest()->getPost('sortorder') ? $this->getRequest()->getPost('sortorder') : 'desc';
        $query = $this->getRequest()->getPost('query') ? $this->getRequest()->getPost('query') : false;
        $qtype = $this->getRequest()->getPost('qtype') ? $this->getRequest()->getPost('qtype') : false;
        $count = $this->getTblPembayaran()->getGridCountValidasi($query, $qtype);
        $start = (($page - 1) * $rp);
        $res->getHeaders()->addheaders(array('Content-type' => 'text/xml'));
        $s = "<?xml version='1.0' encoding='utf-8'?>";
        $s .= "<rows>";
        $s .= "<page>" . $page . "</page>";
        $s .= "<total>" . $count . "</total>";
        $s .= "<records>" . $count . "</records>";
        $data = $this->getTblPembayaran()->getGridDataValidasi($sortname, $sortorder, $query, $qtype, $start, $rp);
        foreach ($data as $row) {
            $s .= "<row id='" . $row['t_idspt'] . "'>";
            $s .= "<cell>" . $row['t_kohirspt'] . "</cell>";
            $s .= "<cell>" . $row['t_periodespt'] . "</cell>";
            $s .= "<cell>" . $row['t_tglprosesspt'] . "</cell>";
            $s .= "<cell>" . $row['t_namawppembeli'] . "</cell>";
            $s .= "<cell><![CDATA[<a href='#' onclick='pilihSkpdkbBphtb(" . $row['t_idspt'] . ");return false;' >Pilih</a>]]></cell>";
            $s .= "</row>";
        }
        $s .= "</rows>";
        $res->setContent($s);
        return $res;
    }

    public function pilihSkpdkbBphtbAction() {
        $frm = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data = $this->getPendataanBphtb()->getPendataanSspdBphtb($ex);
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    public function dataGridSkpdkb2Action() {
        $res = $this->getResponse();
        $page = $this->getRequest()->getPost('page') ? $this->getRequest()->getPost('page') : 1;
        $rp = $this->getRequest()->getPost('rp') ? $this->getRequest()->getPost('rp') : 10;
        $sortname = $this->getRequest()->getPost('sortname') ? $this->getRequest()->getPost('sortname') : 't_kohirspt';
        $sortorder = $this->getRequest()->getPost('sortorder') ? $this->getRequest()->getPost('sortorder') : 'desc';
        $query = $this->getRequest()->getPost('query') ? $this->getRequest()->getPost('query') : false;
        $qtype = $this->getRequest()->getPost('qtype') ? $this->getRequest()->getPost('qtype') : false;
        $count = $this->getTblPembayaran()->getGridCountValidasi($query, $qtype);
        $start = (($page - 1) * $rp);
        $res->getHeaders()->addheaders(array('Content-type' => 'text/xml'));
        $s = "<?xml version='1.0' encoding='utf-8'?>";
        $s .= "<rows>";
        $s .= "<page>" . $page . "</page>";
        $s .= "<total>" . $count . "</total>";
        $s .= "<records>" . $count . "</records>";
        $data = $this->getTblPembayaran()->getGridDataValidasi($sortname, $sortorder, $query, $qtype, $start, $rp);
        foreach ($data as $row) {
            $s .= "<row id='" . $row['t_idspt'] . "'>";
            $s .= "<cell>" . $row['t_kohirspt'] . "</cell>";
            $s .= "<cell>" . $row['t_periodespt'] . "</cell>";
            $s .= "<cell>" . $row['t_tglprosesspt'] . "</cell>";
            $s .= "<cell>" . $row['t_namawppembeli'] . "</cell>";
            $s .= "<cell><![CDATA[<a href='#' onclick='pilihSkpdkbBphtb2(" . $row['t_idspt'] . ");return false;' >Pilih</a>]]></cell>";
            $s .= "</row>";
        }
        $s .= "</rows>";
        $res->setContent($s);
        return $res;
    }

    public function pilihSkpdkbBphtb2Action() {
        $frm = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data = $this->getPendataanBphtb()->getPendataanSspdBphtb($ex);
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    public function cetaklapperkecAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_LapBphtb = $this->getTableSSPD()->getDataLapBphtbkec($data_get->tgl_pendaftaranperkec1, $data_get->tgl_pendaftaranperkec2, $data_get->namakecamatan);
        $ar_Mengetahui = $this->getTblPejabat()->getdataid($data_get->mengetahuibphtbperkec);
        $ar_pemda = $this->getPemda()->getdata();
        $ar_kec = $this->getTblKecamatan()->getDataKode($data_get->namakecamatan);
        $pdf = new PdfModel();
        $pdf->setVariables(array(
            'data_lapBphtb' => $ar_LapBphtb,
            'data_mengetahui' => $ar_Mengetahui,
            'tgl_cetak1' => $data_get->tgl_pendaftaranperkec1,
            'tgl_cetak2' => $data_get->tgl_pendaftaranperkec2,
            'ar_pemda' => $ar_pemda,
            'jeniscetakan' => $ar_kec
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetaklapperkelAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_LapBphtb = $this->getTableSSPD()->getDataLapBphtbkel($data_get->tgl_pendaftaranperkel1, $data_get->tgl_pendaftaranperkel2, $data_get->namakelurahan);
        $ar_Mengetahui = $this->getTblPejabat()->getdataid($data_get->mengetahuibphtbperkel);
        $ar_pemda = $this->getPemda()->getdata();
        $ar_kel = $this->getTblKecamatan()->getDataKode($data_get->namakelurahan);
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $pdf = new ViewModel();
        $pdf->setVariables(array(
            'data_lapBphtb' => $ar_LapBphtb,
            'data_mengetahui' => $ar_Mengetahui,
            'tgl_cetak1' => $data_get->tgl_pendaftaranperkel1,
            'tgl_cetak2' => $data_get->tgl_pendaftaranperkel2,
            'ar_pemda' => $ar_pemda,
            'nama_login' => $session['s_namauserrole'],
            'jeniscetakan' => $ar_kel
        ));
        $data = array('nilai' => '1');
        $this->layout()->setVariables($data);
        return $pdf;
    }

    public function getTableSSPD() {
        if (!$this->tbl_sspd) {
            $sm = $this->getServiceLocator();
            $this->tbl_sspd = $sm->get("SSPDTable");
        }
        return $this->tbl_sspd;
    }

    public function getTblPejabat() {
        if (!$this->tbl_pejabat) {
            $sm = $this->getServiceLocator();
            $this->tbl_pejabat = $sm->get("PejabatBphtbTable");
        }
        return $this->tbl_pejabat;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

    public function getPendataanBphtb() {
        if (!$this->tbl_pendataan) {
            $sm = $this->getServiceLocator();
            $this->tbl_pendataan = $sm->get('SSPDBphtbTable');
        }
        return $this->tbl_pendataan;
    }

    public function populateComboJenisTransaksi() {
        $data = $this->getTblJenTran()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idjenistransaksi] = $row->s_namajenistransaksi;
        }
        return $selectData;
    }

    public function populateComboHakTanah() {
        $data = $this->getTblHakTan()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idhaktanah] = $row->s_namahaktanah;
        }
        return $selectData;
    }

    public function getTblJenTran() {
        if (!$this->tbl_jenistransaksi) {
            $sm = $this->getServiceLocator();
            $this->tbl_jenistransaksi = $sm->get('JenisTransaksiBphtbTable');
        }
        return $this->tbl_jenistransaksi;
    }

    public function getTblHakTan() {
        if (!$this->tbl_haktanah) {
            $sm = $this->getServiceLocator();
            $this->tbl_haktanah = $sm->get('HakTanahTable');
        }
        return $this->tbl_haktanah;
    }

    public function getTblPembayaran() {
        if (!$this->tbl_pembayaran) {
            $sm = $this->getServiceLocator();
            $this->tbl_pembayaran = $sm->get('PembayaranSptTable');
        }
        return $this->tbl_pembayaran;
    }

    public function getTblPelaporan() {
        if (!$this->tbl_pelaporan) {
            $sm = $this->getServiceLocator();
            $this->tbl_pelaporan = $sm->get('PelaporanTable');
        }
        return $this->tbl_pelaporan;
    }

    public function getTblKecamatan() {
        if (!$this->tbl_kecamatan) {
            $sm = $this->getServiceLocator();
            $this->tbl_kecamatan = $sm->get('KecamatanBphtbTable');
        }
        return $this->tbl_kecamatan;
    }

    public function getTblKelurahan() {
        if (!$this->tbl_kelurahan) {
            $sm = $this->getServiceLocator();
            $this->tbl_kelurahan = $sm->get('KelurahanBphtbTable');
        }
        return $this->tbl_kelurahan;
    }

}
