<?php

// Modul Verifikasi

namespace Bphtb\Controller\Verifikasi;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Math\Rand;
use Bphtb\Form\Pendataan\SSPDFrm;
use Bphtb\Model\Pendataan\SSPDBphtbBase;

class VerifikasiSPT extends AbstractActionController {

    protected $tbl_pemda, $tbl_pembayaran, $tbl_verifikasi, $tbl_jenistransaksi, $tbl_haktanah, $tbl_pendataan, $tbl_persyaratan, $tbl_notifikasi, $tbl_pejabat, $tbl_sspd, $tbl_nop;

    public function indexAction() {
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Verifikasi\VerifikasiSPTFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah());
        $Mengetahuibphtb = $this->getTblPejabat()->getdata();
        $Mengetahuilengkap = $this->getTblPejabat()->getdata();
        $Mengetahuipenelitian1 = $this->getTblPejabat()->getdata();
        $Mengetahuipenelitian2 = $this->getTblPejabat()->getdata();
        $Mengetahuipenelitian3 = $this->getTblPejabat()->getdata();
        $Mengetahuipenelitian4 = $this->getTblPejabat()->getdata();
        $Mengetahuipenelitian5 = $this->getTblPejabat()->getdata();
        $Mengetahuipenelitian6 = $this->getTblPejabat()->getdata();
        $view = new ViewModel(array(
            "form" => $form,
            'data_mengetahuibphtb' => $Mengetahuibphtb,
            'data_mengetahuilengkap' => $Mengetahuilengkap,
            'data_mengetahuipenelitian1' => $Mengetahuipenelitian1,
            'data_mengetahuipenelitian2' => $Mengetahuipenelitian2,
            'data_mengetahuipenelitian3' => $Mengetahuipenelitian3,
            'data_mengetahuipenelitian4' => $Mengetahuipenelitian4,
            'data_mengetahuipenelitian5' => $Mengetahuipenelitian5,
            'data_mengetahuipenelitian6' => $Mengetahuipenelitian6
        ));
        $data = array(
            'menu_verifikasi' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTblPembayaran()->getGridCountVerifikasi($base);
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
        $data = $this->getTblPembayaran()->getGridDataVerifikasi($base, $start);
        $s = "";
        foreach ($data as $row) {
            $s .= "<tr>";
            if ($row['t_inputbpn'] == true) {
                $s .= "<td><a href='verifikasi_spt/viewdata?t_idspt=$row[t_idspt]'><span class='badge' style='background-color:#CC0000;'>" . str_pad($row['t_kohirspt'], 4, '0', STR_PAD_LEFT) . " </span></a></td>";
            } else {
                $s .= "<td><a href='verifikasi_spt/viewdata?t_idspt=$row[t_idspt]'>" . str_pad($row['t_kohirspt'], 4, '0', STR_PAD_LEFT) . "</a></td>";
            }
            $s .= "<td style='text-align:center;'>" . $row['t_periodespt'] . "</td>";
            $s .= "<td style='text-align:center;'>" . date('d-m-Y', strtotime($row['t_tglverifikasispt'])) . "</td>";
            $s .= "<td>" . $row['t_namawppembeli'] . "</td>";
            $s .= "<td>" . $row['s_namajenistransaksi'] . "</td>";
            if ($row['t_statusbayarspt'] == true) {
                $status_bayar = "Sudah Dibayar";
            } else {
                $status_bayar = "Belum Dibayar";
            }

            if (!empty($row['p_idpemeriksaan'])) {
                $cetaksuratpenelitian = "<a href='#' onclick='openCetakPenelitian(" . $row['t_kohirspt'] . ");return false;' class='btn btn-success btn-xs btn-flat' style='width:100px'>Surat Penelitian</a>";
            } else {
                $cetaksuratpenelitian = "";
            }

            $result_array_syarat = \Zend\Json\Json::decode($row['t_persyaratan']);
            $jml_syarat = count($result_array_syarat);
            $result_array_syarat_verifikasi = \Zend\Json\Json::decode($row['t_verifikasispt']);
            $jml_syarat_verifikasi = count($result_array_syarat_verifikasi);
            $cektabelpersyaratan = $this->getTblJenTran()->jumlahsyarat($row['t_idjenistransaksi']);
            $edit = "";
            if (($cektabelpersyaratan == $jml_syarat) && ($cektabelpersyaratan == $jml_syarat_verifikasi)) {
                $status_verifikasi = "Tervalidasi";
                $cetaksurat = "<a href='#' onclick='openCetak(" . $row['t_kohirspt'] . ");return false;' class='btn btn-success btn-xs btn-flat' style='width:80px'>Surat Bukti</a>";
                // $cetaksurat = "<a href='cetak_sspd/cetakbuktipenerimaanvalidasi?&action=cetakpenerimaanvalidasi&t_idspt=$row[t_idspt]' target='_blank'>Surat Bukti</a>";
                $cetaksspd_kodebayar = "" . $cetaksurat . " <a href='cetak_sspd/cetaksspdbphtb?&action=cetaksspd&t_idspt=$row[t_idspt]' target='_blank' class='btn btn-success btn-xs btn-flat' style='width:80px'>SSPD</a> " . $cetaksuratpenelitian . " ";
                if ($row['t_statusbayarspt'] == true) {
                    $edit .= "";
                } else {
                    $edit .= "<a href='verifikasi_spt/edit?t_idpembayaranspt=" . $row['t_idpembayaranspt'] . "' class='btn btn-warning btn-xs btn-flat'>Edit</a>";
                }
            } else {
                $status_verifikasi = "Belum Lengkap";
                $cetaksurat = "<a href='#' onclick='openCetakBukti(" . $row['t_kohirspt'] . ");return false;' class='btn btn-success btn-xs btn-flat' style='width:130px'>Surat Pemberitahuan</a> <a href='cetak_sspd/cetaksspdbphtb?&action=cetaksspd&t_idspt=$row[t_idspt]' target='_blank' class='btn btn-success btn-xs btn-flat' style='width:130px'>SSPD</a>";
                // $cetaksurat = "<a href='cetak_sspd/cetakbuktipenerimaanvalidasi?&action=cetakpenerimaanvalidasi&t_idspt=$row[t_idspt]' target='_blank'>Surat Pemberitahuan</a> || <a href='cetak_sspd/cetaksspdbphtb?&action=cetaksspd&t_idspt=$row[t_idspt]' target='_blank'>SSPD</a>";
                $cetaksspd_kodebayar = "" . $cetaksurat . " " . $cetaksuratpenelitian . "";
                if ($row['t_inputbpn'] == true) {
                    $edit .= "<a href='verifikasi_spt/edit?t_idpembayaranspt=" . $row['t_idpembayaranspt'] . "' class='btn btn-warning btn-xs btn-flat'>Edit</a>";
                } else {
                    $edit .= "<a href='verifikasi_spt/edit?t_idpembayaranspt=" . $row['t_idpembayaranspt'] . "' class='btn btn-warning btn-xs btn-flat'>Edit</a> <a href='#' onclick='hapus(" . $row['t_idpembayaranspt'] . ");return false;' class='btn btn-danger btn-xs btn-flat'>Batal</a>";
                }
            }
//            if($row['t_statusbayarspt'] == false && !empty($row['t_tglajbbaru'])){
//            	$edit .= " <a href='pelaporan_notaris/inputsanksi?t_idspt=$row[t_idspt]' class='btn btn-danger btn-xs btn-flat'>Sanksi Notaris</a>";
//            }
//            $edit .= "</td>";
            $s .= "<td>" . $status_verifikasi . "</td>";
            $s .= "<td>" . $row['t_kodebayarbanksppt'] . "</td>";
            $s .= "<td>" . $status_bayar . "</td>";
            $s .= "<td>" . $cetaksspd_kodebayar . "</td>";
            $s .= "<td>" . $edit . "</td>";
            $s .= "<tr>";
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
        $frm = new \Bphtb\Form\Verifikasi\VerifikasiSPTFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah());
        $req = $this->getRequest();
        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Verifikasi\VerifikasiSPTBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $t_pejabatverifikasi = $session['s_iduser'];
                // mengecek jumlah persyaratan di pendaftaran dan verifikasi
                $dataPendaftaran = $this->getTblVerifikasi()->getViewPendaftaran($kb->t_idspt);
                $result_array_syarat = \Zend\Json\Json::decode($dataPendaftaran['t_persyaratan']);
                $jml_syarat = count($result_array_syarat);
                $jml_syarat_verifikasi = count($kb->t_persyaratanverifikasi);
                $cektabelpersyaratan = $this->getTblJenTran()->jumlahsyarat($dataPendaftaran['t_idjenistransaksi']);
                sleep(3);
                if (($cektabelpersyaratan == $jml_syarat) && ($cektabelpersyaratan == $jml_syarat_verifikasi)) {
                    if (!empty($kb->t_idpembayaranspt) && $dataPendaftaran['t_kohirketetapanspt'] > 0) {
                        $kb->t_kodebayarbanksppt = date('Y') . "" . str_pad($dataPendaftaran['t_kohirketetapanspt'], 5, '0', STR_PAD_LEFT);
                    } else {
                        $datamax = $this->getTblVerifikasi()->getmaxkohir();
                        if (!empty($kb->t_kohirketetapanspt)) {
                            $datamax['t_kohirketetapanspt'] = $kb->t_kohirketetapanspt - 1;
                            $kb->t_kodebayarbanksppt = date('Y') . "" . str_pad($datamax['t_kohirketetapanspt'] + 1, 5, '0', STR_PAD_LEFT);
                            $this->getTblVerifikasi()->updatenosspd($kb, $datamax['t_kohirketetapanspt']);
                        } else {
                            $kb->t_kodebayarbanksppt = date('Y') . "" . str_pad($datamax['t_kohirketetapanspt'] + 1, 5, '0', STR_PAD_LEFT);
                            $this->getTblVerifikasi()->updatenosspd($kb, $datamax['t_kohirketetapanspt']);
                        }
                    }
                } else {
                    $kb->t_kodebayarbanksppt = null;
                }

                // simpan validasi
//                $this->getTblVerifikasi()->savedata($kb, $t_pejabatverifikasi, $session);
                if ($kb->t_totalspt > 0) {
                    $this->getTblVerifikasi()->savedata($kb, $t_pejabatverifikasi, $session);
                } else {
                    // jika pembayaran nihil maka otomatis terbayar
                    $this->getTblVerifikasi()->savedataverifikasipembayaran($kb, $t_pejabatverifikasi, $session);
                }
                // simpan pemeriksaan jika ada pemeriksaan
                $data_get = $req->getPost();
                if ($data_get->t_pemeriksaanop == 1) {
                    $this->getTblVerifikasi()->savedatapemeriksaan($req->getPost());
                }
                return $this->redirect()->toRoute('verifikasi_spt');
            }
        }
        $view = new ViewModel(array(
            'frm' => $frm
        ));
        $data = array(
            'menu_verifikasi' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function editAction() {
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $ar_pemda = $this->getPemda()->getdata();
        $string = Rand::getString(6, '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ', true);
        $req = $this->getRequest();
        if ($req->isGet()) {
            $data = $this->getTblPembayaran()->getDataId($req->getQuery()
                            ->get('t_idpembayaranspt'));
            $data->t_kohirpembayaran = $data->t_kohirspt;
            $data->t_persyaratanverifikasi = $data->t_verifikasispt;
            $frm = new \Bphtb\Form\Verifikasi\VerifikasiSPTFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $string, null, $this->populateCheckBoxverifikasi($data->t_idjenistransaksi));
            // cek apakah pernah diperiksa lapangan atau belum
            $data1 = $this->getTblPembayaran()->getDataPemeriksaanId($req->getQuery()
                            ->get('t_idpembayaranspt'));
            $data->p_idpemeriksaan = $data1['p_idpemeriksaan'];
            $data->p_luastanah = number_format($data1['p_luastanah'], 0, ',', '.');
            $data->p_luasbangunan = number_format($data1['p_luasbangunan'], 0, ',', '.');
            $data->p_njoptanah = number_format($data1['p_njoptanah'], 0, ',', '.');
            $data->p_njopbangunan = number_format($data1['p_njopbangunan'], 0, ',', '.');
            $data->p_totalnjoptanah = number_format($data1['p_totalnjoptanah'], 0, ',', '.');
            $data->p_totalnjopbangunan = number_format($data1['p_totalnjopbangunan'], 0, ',', '.');
            $data->p_grandtotalnjop = number_format($data1['p_grandtotalnjop'], 0, ',', '.');
            $data->p_nilaitransaksispt = number_format($data1['p_nilaitransaksispt'], 0, ',', '.');
            $data->p_potonganspt = number_format($data1['p_potonganspt'], 0, ',', '.');
            $data->p_totalspt = number_format($data1['p_totalspt'], 0, ',', '.');
            if ($data1['p_grandtotalnjop'] > $data1['p_nilaitransaksispt']) {
                $p_npop = $data1['p_grandtotalnjop'];
            } else {
                $p_npop = $data1['p_nilaitransaksispt'];
            }
            $data->p_npop = number_format($p_npop, 0, ',', '.');
            $p_npopkp = $p_npop - $data1['p_potonganspt'];
            if ($p_npopkp < 0) {
                $data->p_npopkp = 0;
            } else {
                $data->p_npopkp = number_format($p_npopkp, 0, ',', '.');
            }
            $data->p_persenbphtb = 5;
            if (!empty($data1)) {
                $data->t_pemeriksaanop = 1;
                $t_pemeriksaanop = 1;
            } else {
                $data->t_pemeriksaanop = 0;
                $t_pemeriksaanop = 0;
            }
            $data->p_namajenistransaksi = $data->s_namajenistransaksi;
            $data->p_namahaktanah = $data->s_namahaktanah;

            // cari harga acuan pada tabel master s_acuan
            $nop = explode('.', $data->t_nopbphtbsppt);
            $s_kd_propinsi = $nop[0];
            $s_kd_dati2 = $nop[1];
            $s_kd_kecamatan = $nop[2];
            $s_kd_kelurahan = $nop[3];
            $s_kd_blok = $nop[4];
            $datahargaacuan = $this->getTblVerifikasi()->getHargaAcuan($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok);
            $data->s_permetertanah = number_format($datahargaacuan['s_permetertanah'], 0, ',', '.');
            $njop_tanah = ($data->t_nilaitransaksispt - $data->t_totalnjopbangunan) / $data->t_luastanah;
            $analisis_a = 0;
            if ($datahargaacuan) {
                $analisis_a = $njop_tanah / $datahargaacuan['s_permetertanah'] * 100;
            }

            if ((int) $analisis_a < 0) {
                $harga_a = 0;
                $hasil_a = $this->getTblVerifikasi()->getPresentase($harga_a);
            } elseif ((int) $analisis_a > 100) {
                $harga_a = 100;
                $hasil_a = $this->getTblVerifikasi()->getPresentase($harga_a);
            } else {
                $hasil_a = $this->getTblVerifikasi()->getPresentase($analisis_a);
            }
            $warna = $hasil_a['warna'];

            $html = "<div class='col-md-7'>";
            $html .= "<left>NJOP Tanah (Transaksi) / Harga Acuan x 100 % = <span class='badge' style='background-color:$warna;'>" . number_format($analisis_a, 2, ',', '.') . " % </span> <strong>" . $hasil_a['s_keterangan'] . "</strong> </left>";
            $html .= "</div>";
            $data->analisishargaacuan = $html;

            $idpembayaran = (int) $req->getQuery()->get('t_idpembayaranspt');
            $datahistorynjoptanah = $this->getTblVerifikasi()->getHargaHistoryNJOPTanah($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok, $idpembayaran);

            $njoptanahtransaksi = (int) $datahistorynjoptanah['njoptanahtransaksi'];
            $njoptanah = (int) $datahistorynjoptanah['njoptanah'];
            if ($njoptanahtransaksi >= $njoptanah) {
                $data->historynjoptanah = $njoptanahtransaksi;
            } else {
                $data->historynjoptanah = $njoptanah;
            }

            $analisis_b = 0;
            if ($data->historynjoptanah) {
                $analisis_b = $njop_tanah / $data->historynjoptanah * 100;
            }

            if ((int) $analisis_b < 0) {
                $harga_b = 0;
                $hasil_b = $this->getTblVerifikasi()->getPresentase($harga_b);
            } elseif ((int) $analisis_b > 100) {
                $harga_b = 100;
                $hasil_b = $this->getTblVerifikasi()->getPresentase($harga_b);
            } else {
                $hasil_b = $this->getTblVerifikasi()->getPresentase($analisis_b);
            }

            $warna_b = $hasil_b['warna'];
            $html1 = "<div class='col-md-7'>";
            $html1 .= "<left>NJOP Tanah (Transaksi) / Harga History x 100 % = <span class='badge' style='background-color:$warna_b;'>" . number_format($analisis_b, 2, ',', '.') . " % </span> <strong>" . $hasil_b['s_keterangan'] . "</strong> </left>";
            $html1 .= "</div>";
            $data->analisisharganjoptanah = $html1;
            $data->historynjoptanah = number_format($data->historynjoptanah, 0, ',', '.');

            $frm->bind($data);
            $frm->get("t_persyaratanverifikasi")->setValue(\Zend\Json\Json::decode($data->t_persyaratanverifikasi));
        }
        $view = new ViewModel(array(
            'frm' => $frm,
            't_pemeriksaanop' => $t_pemeriksaanop
        ));
        $data = array(
            'menu_verifikasi' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function viewdataAction() {
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idspt');
            $data = $this->getTblSSPDBphtb()->getDataId($id);
            $data->t_tglprosesspt = date('d-m-Y', strtotime($data->t_tglprosesspt));
            $data->t_tglajb = date('d-m-Y', strtotime($data->t_tglajb));
            $t_luastanah = str_ireplace('.', '', $data->t_luastanah);
            $t_luasbangunan = str_ireplace('.', '', $data->t_luasbangunan);
            $data->t_luastanah = number_format(($t_luastanah / 100), 0, ',', '.');
            $data->t_luasbangunan = number_format(($t_luasbangunan / 100), 0, ',', '.');
        }
        $view = new ViewModel(array(
            'datasspd' => $data
        ));

        $data = array(
            'menu_verifikasi' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function hapusAction() {
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ret = $this->getTblVerifikasi()->batalVerifikasi($req->getPost());
            $this->getTblVerifikasi()->hapusDataPemeriksaan($req->getPost());
            $res->setContent(\Zend\Json\Json::encode($ret));
        }
        return $res;
    }

    public function dataGridPendataanBphtbAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $req->isGet();
        $parametercari = $req->getQuery();
        $base = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
        $base->exchangeArray($allParams);
        if ($base->direction == 2)
            $base->page = $base->page + 1;
        if ($base->direction == 1)
            $base->page = $base->page - 1;
        if ($base->page <= 0)
            $base->page = 1;
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTblSSPDBphtb()->getGridCountBlmVerifikasi($base, $parametercari);
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
        $s = "";
        $data = $this->getTblSSPDBphtb()->getGridDataBlmVerifikasi($base, $start, $parametercari);
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td class='text-center'>" . str_pad($row['t_kohirspt'], 4, '0', STR_PAD_LEFT) . "</td>";
            $s .= "<td class='text-center'>" . date('d-m-Y', strtotime($row['t_tglprosesspt'])) . "</td>";
            $s .= "<td class='text-center'>" . $row['t_nopbphtbsppt'] . "</td>";
            $s .= "<td>" . $row['t_namawppembeli'] . "</td>";
            $s .= "<td>" . $row['t_namawppenjual'] . "</td>";
            $s .= "<td class='text-center'><a href='#' onclick='pilihPendataanSspdBphtb(" . $row['t_idspt'] . ");return false;' >Pilih</a></td>";
            $s .= "</tr>";
        }
        $data_render = array(
            "grid" => $s,
            "rows" => 10,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function pilihPendataanSspdBphtbAction() {
        $frm = new SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new SSPDBphtbBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data = $this->getTblSSPDBphtb()->getPendataanSspdBphtb($ex);
                if ($data['t_nilaitransaksispt'] >= $data['t_grandtotalnjop']) {
                    $data['npop'] = $data['t_nilaitransaksispt'];
                } else {
                    $data['npop'] = $data['t_grandtotalnjop'];
                }

                if ($data['t_idjenistransaksi'] == '8') {
                    $data['npop'] = $data['t_nilaitransaksispt'];
                }
                $data['t_luastanah'] = str_ireplace('.', '', $data['t_luastanah']) / 100;
                $data['t_luasbangunan'] = str_ireplace('.', '', $data['t_luasbangunan']) / 100;

                // cari harga acuan pada tabel master s_acuan
                $nop = explode('.', $data['t_nopbphtbsppt']);
                $s_kd_propinsi = $nop[0];
                $s_kd_dati2 = $nop[1];
                $s_kd_kecamatan = $nop[2];
                $s_kd_kelurahan = $nop[3];
                $s_kd_blok = $nop[4];
                $datahargaacuan = $this->getTblVerifikasi()->getHargaAcuan($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok);
                $data['s_permetertanah'] = number_format($datahargaacuan['s_permetertanah'], 0, ',', '.');
                $njop_tanah = ($data['t_nilaitransaksispt'] - $data['t_totalnjopbangunan']) / $data['t_luastanah'];
                $analisis_a = 0;
                if ($datahargaacuan) {
                    $analisis_a = $njop_tanah / $datahargaacuan['s_permetertanah'] * 100;
                }

                if ((int) $analisis_a < 0) {
                    $harga_a = 0;
                    $hasil_a = $this->getTblVerifikasi()->getPresentase($harga_a);
                } elseif ((int) $analisis_a > 100) {
                    $harga_a = 100;
                    $hasil_a = $this->getTblVerifikasi()->getPresentase($harga_a);
                } else {
                    $hasil_a = $this->getTblVerifikasi()->getPresentase($analisis_a);
                }
                $warna = $hasil_a['warna'];

                $html = "<div class='col-md-7'>";
                $html .= "<left>NJOP Tanah (Transaksi) / Harga Acuan x 100 % = <span class='badge' style='background-color:$warna;'>" . number_format($analisis_a, 2, ',', '.') . " % </span> <strong>" . $hasil_a['s_keterangan'] . "</strong> </left>";
                $html .= "</div>";
                $data['analisishargaacuan'] = $html;

                $idspt = (int) $data['t_idspt'];
                $datahistorynjoptanah = $this->getTblVerifikasi()->getHargaHistoryNJOPTanahpilih($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok, $idspt);

                $njoptanahtransaksi = (int) $datahistorynjoptanah['njoptanahtransaksi'];
                $njoptanah = (int) $datahistorynjoptanah['njoptanah'];
                if ($njoptanahtransaksi >= $njoptanah) {
                    $data['historynjoptanah'] = $njoptanahtransaksi;
                } else {
                    $data['historynjoptanah'] = $njoptanah;
                }

                $analisis_b = 0;
                if ($data['historynjoptanah']) {
                    $analisis_b = $njop_tanah / $data['historynjoptanah'] * 100;
                }
                if ((int) $analisis_b < 0) {
                    $harga_b = 0;
                    $hasil_b = $this->getTblVerifikasi()->getPresentase($harga_b);
                } elseif ((int) $analisis_b > 100) {
                    $harga_b = 100;
                    $hasil_b = $this->getTblVerifikasi()->getPresentase($harga_b);
                } else {
                    $hasil_b = $this->getTblVerifikasi()->getPresentase($analisis_b);
                }

                $warna_b = $hasil_b['warna'];
                $html1 = "<div class='col-md-7'>";
                $html1 .= "<left>NJOP Tanah (Transaksi) / Harga History x 100 % = <span class='badge' style='background-color:$warna_b;'>" . number_format($analisis_b, 2, ',', '.') . " % </span> <strong>" . $hasil_b['s_keterangan'] . "</strong> </left>";
                $html1 .= "</div>";
                $data['analisisharganjoptanah'] = $html1;
                $data['historynjoptanah'] = number_format($data['historynjoptanah'], 0, ',', '.');
                $data['t_luastanah'] = number_format($data['t_luastanah'], 0, ',', '.');
                $data['t_njoptanah'] = number_format($data['t_njoptanah'], 0, ',', '.');
                $data['t_luasbangunan'] = number_format($data['t_luasbangunan'], 0, ',', '.');
                $data['t_njopbangunan'] = number_format($data['t_njopbangunan'], 0, ',', '.');
                $data['t_totalnjoptanah'] = number_format($data['t_totalnjoptanah'], 0, ',', '.');
                $data['t_totalnjopbangunan'] = number_format($data['t_totalnjopbangunan'], 0, ',', '.');
                $data['t_grandtotalnjop'] = number_format($data['t_grandtotalnjop'], 0, ',', '.');
                $data['t_nilaitransaksispt'] = number_format($data['t_nilaitransaksispt'], 0, ',', '.');
                $data['npop'] = number_format($data['npop'], 0, ',', '.');
                $data['t_potonganspt'] = number_format($data['t_potonganspt'], 0, ',', '.');
                $npopkp = $data['t_totalspt'] / 5 * 100;
                $data['npopkp'] = number_format($npopkp, 0, ',', '.');
                $pajak = $data['t_totalspt'];
                $denda = $data['t_dendaspt'];
                $grand_total = (int) $pajak + (int) $denda;
                $data['t_totalspt'] = number_format($data['t_totalspt'], 0, ',', '.');
                // Persyaratan Pendaftaran dan Validasi
                $data['t_persyaratan'] = $this->populatePersyaratanId($data['t_idjenistransaksi'], $data['t_idspt']);
                $data['t_persyaratanverifikasi'] = $this->populatePersyaratanVerifikasi($data['t_idjenistransaksi']);

                $data['t_tglajb'] = date("d-m-Y", strtotime($data['t_tglajb']));
                if (!empty($data['t_tglajbbaru'])) {
                    $data['t_tglajbbaru'] = date("d-m-Y", strtotime($data['t_tglajbbaru']));
                    $data['t_noajbbaru'] = $data['t_noajbbaru'];
                }
                $data['t_dendaspt'] = number_format($data['t_dendaspt'], 0, ',', '.');
                $data['t_bulandendaspt'] = number_format($data['t_bulandendaspt'], 0, ',', '.');

                $data['grand_total_pajak'] = number_format($grand_total, 0, ',', '.');

                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    public function datapembayaranAction() {
        $frm = new \Bphtb\Form\Verifikasi\VerifikasiSPTFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Verifikasi\VerifikasiSPTBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data = $this->getTblVerifikasi()->temukanDataPembayaran($ex);
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    // Menghitung nilai njop pbb
    public function hitungnjopAction() {
        $frm = new \Bphtb\Form\Verifikasi\VerifikasiSPTFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $p_luastanah = str_ireplace(".", "", $ex->p_luastanah);
                $p_njoptanah = str_ireplace(".", "", $ex->p_njoptanah);
                $p_totalnjoptanah = $p_luastanah * $p_njoptanah;

                $p_luasbangunan = str_ireplace(".", "", $ex->p_luasbangunan);
                $p_njopbangunan = str_ireplace(".", "", $ex->p_njopbangunan);
                $p_totalnjopbangunan = $p_luasbangunan * $p_njopbangunan;

                $p_grandtotalnjop = $p_totalnjoptanah + $p_totalnjopbangunan;

                $p_nilaitransaksispt = str_ireplace(".", "", $ex->p_nilaitransaksispt);
                if ($p_nilaitransaksispt >= $p_grandtotalnjop * 1) {
                    $p_npop = $p_nilaitransaksispt;
                } else {
                    $p_npop = $p_grandtotalnjop;
                }
                $p_potonganspt = str_ireplace(".", "", $ex->p_potonganspt);
                $p_npopkp = $p_npop - $p_potonganspt;
                if ($p_npopkp <= 0) {
                    $p_npopkp = 0;
                    $p_totalspt = 0;
                } else {
                    $p_persenbphtb = str_ireplace(".", "", $ex->p_persenbphtb);
                    $p_totalspt = $p_npopkp * $p_persenbphtb / 100;
                }
                $data = array(
                    "p_totalnjoptanah" => $p_totalnjoptanah,
                    "p_totalnjopbangunan" => $p_totalnjopbangunan,
                    "p_grandtotalnjop" => $p_grandtotalnjop,
                    "p_npop" => $p_npop,
                    "p_potonganspt" => $p_potonganspt,
                    "p_npopkp" => $p_npopkp,
                    "p_totalspt" => $p_totalspt
                );
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    function populatePersyaratanId($idtransaksi, $idspt) {
        $data = $this->getTblPersyaratan()->getDataIdTransaksis($idtransaksi);
        $html = "<div>";
        $html .= "<label>Persyaratan Pendaftaran : </label>";
        foreach ($data as $row) {
            $html .= "<div class='col-sm-12'>
                      <div class='form-group'>";
            $html .= "<div class='col-sm-12'>";
            $dataa = $this->getTblPersyaratan()->getDataSyaratSPT($row->s_idpersyaratan, $idspt);
            if ($dataa == false) {
                $html .= "<input id='t_persyaratan' name='t_persyaratan[]' type='checkbox' value='" . $row->s_idpersyaratan . "'>";
            } else {
                $html .= "<input id='t_persyaratan' name='t_persyaratan[]' type='checkbox' value='" . $row->s_idpersyaratan . "' checked='checked' disabled > ";
            }
            $html .= $row->s_namapersyaratan;
            $html .= "</div>";
            $html .= "</div>";
            $html .= "</div>";
        }
        $html .= "</div>";
        return $html;
    }

    function populatePersyaratanVerifikasi($id) {
        $data = $this->getTblPersyaratan()->getDataIdTransaksis($id);
        $countpersyaratan = $this->getTblSSPDBphtb()->temukanJmlPersyaratanver($id);
        $html = "<div>";
        $html .= "<label>Persyaratan Validasi : </label>";
        $html .= "<div class='col-sm-12'>
                    <div class='form-group'>
                        <div class='col-sm-12'>
                            <input type='checkbox' id='CheckAll' name='CheckAll' onClick='modify_boxes($countpersyaratan)'> <span style='color:green'>Centang Semua</span>
                        </div>
                    </div>
                  </div>";
        foreach ($data as $row) {
            $html .= "<div class='col-sm-12'>
                      <div class='form-group'>";
            $html .= "<div class='col-sm-12'>";
            $html .= "<input id='t_persyaratanverifikasi' name='t_persyaratanverifikasi[]' type='checkbox' value='" . $row->s_idpersyaratan . "'> ";
            $html .= $row->s_namapersyaratan;
            $html .= "</div>";
            $html .= "</div>";
            $html .= "</div>";
        }
        $html .= "</div>";
        return $html;
    }

    public function populateComboJenisTransaksi() {
        $data = $this->getTblJenTran()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idjenistransaksi] = $row->s_namajenistransaksi;
        }
        return $selectData;
    }

    // Pengecekan Tunggakan PBB
    // Lokasi : Tambah Pembayaran
    public function cektunggakanpbbc() {
        $frm = new \Bphtb\Form\Pembayaran\PembayaranSptFrm();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $datahari = $this->getTblPembayaran()->cekJumlahhari();
                $data = $this->getTblPembayaran()->cekValiditasSSPD($ex, $datahari['s_jumlahhari']);
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    public function cektunggakanpbbAction() {
        $frm = new \Bphtb\Form\Pencetakan\SSPDFrm();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $base = new \Bphtb\Model\Pendataan\SPPTBase();
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $data_get = $req->getPost();
                $base->t_nopbphtbspptinfoop = $data_get['t_nopbphtbsppt'];
                $data_tunggakan = $this->getTblSPPT()->temukanDataTunggakanop($base);
                $html = "<div class='row'>
                          <div class='col-md-12'>
                          <div class='panel panel-primary'>
                          <div class='panel-heading'><strong>Tunggakan SPPT-PBB</strong></div>
                          <table class='table table-striped table-bordered' style='border-color: black'>";
                $html .= "<tr style='border-color: black'>";
                $html .= "<th style='width:5%; border-color:black; text-align:center'>No.</th>";
                $html .= "<th style='width:10%; border-color:black; text-align:center'>Tahun</th>";
                $html .= "<th style='text-align:center;width:20%; border-color:black'>Tunggakan (Rp.)</th>";
                $html .= "<th style='width:20%; border-color:black; text-align:center'>Jatuh Tempo</th>";
                $html .= "<th style='text-align:center;width:20%; border-color:black'>Denda (Rp.)</th>";
                $html .= "<th style='text-align:center; border-color:black'>Total PBB (Rp.)</th>";
                $html .= "</tr>";
                $i = 1;
                $jumlahdenda = 0;
                $PBB_YG_HARUS_DIBAYAR_SPPT = 0;
                $totalsemua = 0;
                foreach ($data_tunggakan as $row) {
                    $html .= "<tr>";
                    $html .= "<td style='border-color:black; text-align:center'> " . $i . " </td>";
                    $html .= "<td style='border-color:black; text-align:center'> " . $row['THN_PAJAK_SPPT'] . " </td>";
                    $html .= "<td style='text-align:right; border-color:black'> " . number_format($row['PBB_YG_HARUS_DIBAYAR_SPPT'], 0, ',', '.') . "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>";
                    $html .= "<td style='border-color:black; text-align:center'> " . $row['JATUH_TEMPO'] . " </td>";
//                    $html .= "<td> " . date('d-m-Y', strtotime($row['JATUH_TEMPO'])) . " </td>";
                    $dat1 = date('Y-m-d', strtotime($row['JATUH_TEMPO']));
                    $dat2 = date('Y-m-d');
                    $date1 = new \DateTime($dat1);
                    $date2 = new \DateTime($dat2);
                    $interval = $date1->diff($date2);
                    $bedanya = $interval->m + ($interval->y * 12);
                    if ($bedanya > 24) {
                        $beda = 24;
                    } else {
                        $beda = $bedanya;
                    }
                    $denda = 0;
                    if ($dat2 < $dat1) {
                        $denda = 0;
                        $html .= "<td style='text-align:right; border-color:black'> </td>";
                    } else {
                        $denda = $beda * $row['PBB_YG_HARUS_DIBAYAR_SPPT'] * 2 / 100;
                        $html .= "<td style='text-align:right; border-color:black'> " . number_format($denda, 0, ',', '.') . "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>";
                    }
                    $totalpertahun = $row['PBB_YG_HARUS_DIBAYAR_SPPT'] + $denda;
                    $html .= "<td style='text-align:right; border-color:black'> " . number_format($totalpertahun, 0, ',', '.') . "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>";
                    $html .= "</tr>";
                    $i ++;
                    $PBB_YG_HARUS_DIBAYAR_SPPT = $PBB_YG_HARUS_DIBAYAR_SPPT + $row['PBB_YG_HARUS_DIBAYAR_SPPT'];
                    $jumlahdenda = $jumlahdenda + $denda;
                    $totalsemua += $totalpertahun;
                }
                $html .= "<tr style='font-size:16px; font-weight:bold;'>";
                $html .= "<td colspan='2' style='border-color:black'><center>Jumlah</center></td>";
                $html .= "<td style='text-align:right; border-color:black'> " . number_format($PBB_YG_HARUS_DIBAYAR_SPPT, 0, ',', '.') . "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>";
                $html .= "<td colspan=2 style='text-align:right; border-color:black'> " . number_format($jumlahdenda, 0, ',', '.') . "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>";
                $html .= "<td style='text-align:right; border-color:black'> " . number_format($totalsemua, 0, ',', '.') . "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>";
                $html .= "</tr>";
                $html .= "<tr style='font-size:16px; font-weight:bold;'>";
                $html .= "<td colspan='3' style='border-color:black'><center>Jumlah Seluruh Tunggakan</center></td>";
                $html .= "<td colspan='3' style='border-color:black'><div style='text-align:center; color:red' > Rp. " . number_format($PBB_YG_HARUS_DIBAYAR_SPPT + $jumlahdenda, 0, ',', '.') . " </div></td>";
                $html .= "</tr>";
                $html .= "</table>
                        </div></div></div>";
                $data['datatunggakan'] = $html;
                $data['PBB_YG_HARUS_DIBAYAR_SPPT'] = $PBB_YG_HARUS_DIBAYAR_SPPT;
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    public function cetaksuratpenelitianAction() {
        $frm = new \Bphtb\Form\Pencetakan\SSPDFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $base = new \Bphtb\Model\Pencetakan\SSPDBase();
            $frm->setData($req->getQuery());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $data_get = $req->getQuery();
                $ar_sspd = $this->getSSPD()->getdatasurathasilpenelitian($data_get);
                $ar_Mengetahui1 = $this->getTblPejabat()->getdataid($data_get->mengetahuipenelitian1);
                $ar_Mengetahui2 = $this->getTblPejabat()->getdataid($data_get->mengetahuipenelitian2);
                $ar_Mengetahui3 = $this->getTblPejabat()->getdataid($data_get->mengetahuipenelitian3);
                $ar_Mengetahui4 = $this->getTblPejabat()->getdataid($data_get->mengetahuipenelitian4);
                $ar_Mengetahui5 = $this->getTblPejabat()->getdataid($data_get->mengetahuipenelitian5);
                $ar_Mengetahui6 = $this->getTblPejabat()->getdataid($data_get->mengetahuipenelitian6);
                $ar_pemda = $this->getPemda()->getdata();
            }
        }
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'SuratHasilPenelitian');
        $pdf->setOption('paperSize', 'A4');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'data_sspd' => $ar_sspd,
            'data_pemda' => $ar_pemda,
            'tgl_cetak' => $data_get->tgl_cetak_penelitian,
            'data_mengetahui1' => $ar_Mengetahui1,
            'data_mengetahui2' => $ar_Mengetahui2,
            'data_mengetahui3' => $ar_Mengetahui3,
            'data_mengetahui4' => $ar_Mengetahui4,
            'data_mengetahui5' => $ar_Mengetahui5,
            'data_mengetahui6' => $ar_Mengetahui6
        ));
        return $pdf;
    }

    public function populateComboHakTanah() {
        $data = $this->getTblHakTan()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idhaktanah] = $row->s_namahaktanah;
        }
        return $selectData;
    }

    private function populateCheckBoxverifikasi($idtransaksi) {
        $data = $this->getTblPersyaratan()->getDataIdTransaksis($idtransaksi);
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idpersyaratan] = ' ' . $row->s_namapersyaratan;
        }
        return $selectData;
    }

    public function getTblVerifikasi() {
        if (!$this->tbl_verifikasi) {
            $sm = $this->getServiceLocator();
            $this->tbl_verifikasi = $sm->get('VerifikasiSPTTable');
        }
        return $this->tbl_verifikasi;
    }

    public function getTblPembayaran() {
        if (!$this->tbl_pembayaran) {
            $sm = $this->getServiceLocator();
            $this->tbl_pembayaran = $sm->get('PembayaranSptTable');
        }
        return $this->tbl_pembayaran;
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

    public function getTblSSPDBphtb() {
        if (!$this->tbl_pendataan) {
            $sm = $this->getServiceLocator();
            $this->tbl_pendataan = $sm->get('SSPDBphtbTable');
        }
        return $this->tbl_pendataan;
    }

    public function getTblPersyaratan() {
        if (!$this->tbl_persyaratan) {
            $sm = $this->getServiceLocator();
            $this->tbl_persyaratan = $sm->get('PersyaratanTable');
        }
        return $this->tbl_persyaratan;
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

    public function getSSPD() {
        if (!$this->tbl_sspd) {
            $sm = $this->getServiceLocator();
            $this->tbl_sspd = $sm->get("SSPDTable");
        }
        return $this->tbl_sspd;
    }

    public function cetakdaftarverifikasiAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_DataVerifikasi = $this->getSSPD()->getDataVerifikasi($data_get->periode_spt, $data_get->tgl_verifikasi1, $data_get->tgl_verifikasi2);
        $ar_tglcetak = $data_get->tgl_cetak;
        $ar_periodespt = $data_get->periode_spt;
        $sm = $this->getServiceLocator();
        $this->tbl_pemda = $sm->get("PemdaTable");
        $ar_pemda = $this->tbl_pemda->getdata();
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();

        $pdf = new ViewModel();
        $pdf->setVariables(array(
            'data_Verifikasi' => $ar_DataVerifikasi,
            'tgl_cetak' => $ar_tglcetak,
            'periode_spt' => $ar_periodespt,
            'tgl_verifikasi1' => $data_get->tgl_verifikasi1,
            'tgl_verifikasi2' => $data_get->tgl_verifikasi2,
//            'nama_login' => $session['s_namauserrole'],
            'ar_pemda' => $ar_pemda
        ));
        $data = array('nilai' => '1');
        $this->layout()->setVariables($data);
        return $pdf;
    }

    public function getTblSPPT() {
        if (!$this->tbl_nop) {
            $sm = $this->getServiceLocator();
            $this->tbl_nop = $sm->get('SPPTTable');
        }
        return $this->tbl_nop;
    }

    // private function getTblNotifikasi(){
    // if (!$this->tbl_notifikasi) {
    // $sm = $this->getServiceLocator();
    // $this->tbl_notifikasi = $sm->get('NotifikasiTable');
    // }
    // return $this->tbl_notifikasi;
    // }
}
