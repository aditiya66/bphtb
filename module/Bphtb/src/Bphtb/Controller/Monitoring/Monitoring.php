<?php

namespace Bphtb\Controller\Monitoring;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Math\Rand;

class Monitoring extends AbstractActionController {

    protected $tbl_pemda, $tbl_pembayaran, $tbl_pendataan, $tbl_jenistransaksi, $tbl_haktanah, $tbl_doktanah, $tbl_sspd, $tbl_notaris, $tbl_persyaratan, $tbl_spt, $tbl_verifikasi;

    public function indexAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Pendataan\SSPDFrm();
        $view = new ViewModel(array(
            "form" => $form
        ));
        $data = array(
            'menu_monitoring' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function caritransaksimonitoringtglAction() {
        $req = $this->getRequest();
        $res = $this->getResponse();
        $datane = $req->getPost();
        $tglcari = date("Y-m-d", strtotime($datane->tglcari));
        $datacari = $this->getTblSSPDBphtb()->getcaritransaksimonitoringtgl($tglcari);
        $i = 1;
        $html = "";
        $html .= "<div class='box box-primary' style='position: relative; left: 0px; top: 0px;'>";
        $html .= "<ul class='todo-list ui-sortable'>";
        foreach ($datacari as $hasil) {
            $nop = explode('.', $hasil['t_nopbphtbsppt']);
            $s_kd_propinsi = $nop[0];
            $s_kd_dati2 = $nop[1];
            $s_kd_kecamatan = $nop[2];
            $s_kd_kelurahan = $nop[3];
            $s_kd_blok = $nop[4];
            $njop_tanah = ($hasil['t_nilaitransaksispt'] - $hasil['t_totalnjopbangunan']) / $hasil['t_luastanah'];
            // cari harga acuan pada tabel master s_acuan
            $datahargaacuan = $this->getTblVerifikasi()->getHargaAcuan($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok);
            if ($datahargaacuan == false) {
                $analisis_a = "Belum Ada Harga Referensi";
                $warna = "blue";
                $hasil_a['s_keterangan'] = "";
            } else {
                $analisis_a = 0;
                if ($datahargaacuan) {
                    $analisis_a = $njop_tanah / $datahargaacuan['s_permetertanah'] * 100;
                }
                if ((int) $analisis_a < 0) {
                    $harga_a = 0;
                    $hasil_a = $this->getTblVerifikasi()->getPresentase($harga_a);
                    $analisis_a = number_format($analisis_a, 2, ',', '.') . " %";
                } elseif ((int) $analisis_a >= 100) {
                    $harga_a = 100;
                    $hasil_a = $this->getTblVerifikasi()->getPresentase($harga_a);
                    $analisis_a = number_format($analisis_a, 2, ',', '.') . " %";
                } else {
                    $hasil_a = $this->getTblVerifikasi()->getPresentase($analisis_a);
                    $analisis_a = number_format($analisis_a, 2, ',', '.') . " %";
                }
                $warna = $hasil_a['warna'];
            }

            // dari history perblok
            $idpembayaran = (int) $hasil['t_idpembayaranspt'];
            $datahistorynjoptanah = $this->getTblVerifikasi()->getHargaHistoryNJOPTanah($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok, $idpembayaran);
            if ($datahistorynjoptanah['njoptanahtransaksi'] == null) {
                $analisis_b = "Belum Ada Transaksi dalam 1 blok";
                $warna_b = "blue";
                $hasil_b['s_keterangan'] = "";
            } else {
                $njoptanahtransaksi = (int) $datahistorynjoptanah['njoptanahtransaksi'];
                $njoptanah = (int) $datahistorynjoptanah['njoptanah'];
                if ($njoptanahtransaksi >= $njoptanah) {
                    $hasil['historynjoptanah'] = $njoptanahtransaksi;
                } else {
                    $hasil['historynjoptanah'] = $njoptanah;
                }

                $analisis_b = 0;
                if ($hasil['historynjoptanah']) {
                    $analisis_b = $njop_tanah / $hasil['historynjoptanah'] * 100;
                }
                if ((int) $analisis_b < 0) {
                    $harga_b = 0;
                    $hasil_b = $this->getTblVerifikasi()->getPresentase($harga_b);
                    $analisis_b = number_format($analisis_b, 2, ",", ".") . " %";
                } elseif ((int) $analisis_b >= 100) {
                    $harga_b = 100;
                    $hasil_b = $this->getTblVerifikasi()->getPresentase($harga_b);
                    $analisis_b = number_format($analisis_b, 2, ",", ".") . " %";
                } else {
                    $hasil_b = $this->getTblVerifikasi()->getPresentase($analisis_b);
                    $analisis_b = number_format($analisis_b, 2, ",", ".") . " %";
                }
                $warna_b = $hasil_b['warna'];
            }
            $html .= "<li><span class='badge'>" . $i . "</span> <u><a href='#' onclick='openDetailmonitoring(" . $hasil['t_idspt'] . ");' style='color:black'>" . $hasil['t_nikwppembeli'] . " - " . $hasil['t_namawppembeli'] . "<a></u>";
            $html .= " <span class='badge' style='background-color:$warna;'>Referensi : " . $analisis_a . " " . $hasil_a['s_keterangan'] . "</span>";
            $html .= " <span class='badge' style='background-color:$warna_b;'>History : " . $analisis_b . " " . $hasil_b['s_keterangan'] . "</span>";
            $html .= "</li>";
            $i++;
        }
        $html .= "</ul>";
        $html .= "</div>";
        $data['datatransaksitgl'] = $html;
        $res->setContent(\Zend\Json\Json::encode($data));
        return $res;
    }

    public function caritransaksimonitoringnopAction() {
        $req = $this->getRequest();
        $res = $this->getResponse();
        $datane = $req->getPost();
        $nopcari = $datane->nopcari;
        $datacari = $this->getTblSSPDBphtb()->getcaritransaksimonitoringnop($nopcari);
        $i = 1;
        $html = "";
        // cari harga acuan pada tabel master s_acuan
        $nop = explode('.', $nopcari);
        $s_kd_propinsi = $nop[0];
        $s_kd_dati2 = $nop[1];
        $s_kd_kecamatan = $nop[2];
        $s_kd_kelurahan = $nop[3];
        $s_kd_blok = $nop[4];
        $datahargaacuan = $this->getTblVerifikasi()->getHargaAcuan($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok);
        $html .= "<div class='box box-primary' style='position: relative; left: 0px; top: 0px;'>";
        $html .= "<ul class='todo-list ui-sortable'>";
        $nopnyacuan = $datahargaacuan['s_kd_propinsi'] . "." . $datahargaacuan['s_kd_dati2'] . "." . $datahargaacuan['s_kd_kecamatan'] . "." . $datahargaacuan['s_kd_kelurahan'] . "." . $datahargaacuan['s_kd_blok'];
        $html .= "<li><b>NOP : " . $nopnyacuan . "</b>";
        $html .= " <span class='badge' style='background-color:blue;'>Nilai Referensi :" . number_format($datahargaacuan['s_permetertanah'], 0, ",", ".") . "</span>";
        $html .= "</li>";
        $html .= "</ul>";
        $html .= "</div>";
        // dari history perblok
        $html .= "<div class='box box-primary' style='position: relative; left: 0px; top: 0px;'>";
        $html .= "<ul class='todo-list ui-sortable'>";
        foreach ($datacari as $hasil) {
            $hasilnilainjop = ($hasil['t_grandtotalnjop'] - $hasil['t_totalnjopbangunan']) / (int) $hasil['t_luastanah'];
            $hasilnilaitransaksi = ($hasil['t_nilaitransaksispt'] - $hasil['t_totalnjopbangunan']) / (int) $hasil['t_luastanah'];
            if ($hasilnilainjop >= $hasilnilaitransaksi) {
                $hasilnilaitanah = number_format($hasilnilainjop, 0, ',', '.');
            } else {
                $hasilnilaitanah = number_format($hasilnilaitransaksi, 0, ',', '.');
            }
            $html .= "<li><span class='badge'>" . $i . "</span> <u><a href='#' onclick='openDetailmonitoring(" . $hasil['t_idspt'] . ");' style='color:black'>" . $hasil['t_nopbphtbsppt'] . " - " . $hasil['t_namawppembeli'] . "<a></u>";
            $html .= " <span class='badge' style='background-color:blue;'>Nilai Tanah : " . $hasilnilaitanah . "</span>";
            $html .= "</li>";
            $i++;
        }
        $html .= "</ul>";
        $html .= "</div>";

        $data['datatransaksinop'] = $html;
        $res->setContent(\Zend\Json\Json::encode($data));
        return $res;
    }

    public function openDetailmonitoringAction() {
        $req = $this->getRequest();
        $res = $this->getResponse();
        $datanedetail = $req->getPost();
        $datacaridetail = $this->getTblSSPDBphtb()->getcaridetailmonitoring($datanedetail->idsptnya);
        $html = "";
        $html .= "<div class='row'>";
        $html .= "<div class='col-xs-12'>";
        $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>Nama Pembeli</b>
                    </div>
                    <div class='col-sm-9'>
                        " . $datacaridetail['t_namawppembeli'] . "
                    </div>
                  </div>";
        $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>NOP /Tahun SPPT</b>
                    </div>
                    <div class='col-sm-9'>
                        " . $datacaridetail['t_nopbphtbsppt'] . " / " . $datacaridetail['t_thnsppt'] . "
                    </div>
                  </div>";
        $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>Desa</b>
                    </div>
                    <div class='col-sm-9'>
                        " . $datacaridetail['t_kelurahanop'] . "
                    </div>
                  </div>";
        $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>Kecamatan</b>
                    </div>
                    <div class='col-sm-9'>
                        " . $datacaridetail['t_kecamatanop'] . "
                    </div>
                  </div>";
        $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>Nilai Transaksi</b>
                    </div>
                    <div class='col-sm-9'>
                        " . number_format($datacaridetail['t_nilaitransaksispt'], 0, ',', '.') . "
                    </div>
                  </div>";
        $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>Total NJOP Bangunan</b>
                    </div>
                    <div class='col-sm-9'>
                        " . number_format($datacaridetail['t_totalnjopbangunan'], 0, ',', '.') . "
                    </div>
                  </div>";
        $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>Luas Tanah</b>
                    </div>
                    <div class='col-sm-9'>
                        " . $datacaridetail['t_luastanah'] . " m<sup>2</sup>
                    </div>
                  </div>";
        $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>Perhitungan Harga Tanah</b>
                    </div>
                    <div class='col-sm-9'>
                        (Nilai Transaksi - Total NJOP Bangunan) / Luas Tanah m<sup>2</sup>
                    </div>
                  </div>";
        $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        
                    </div>
                    <div class='col-sm-9'>
                        (" . number_format($datacaridetail['t_nilaitransaksispt'], 0, ',', '.') . "-
                          " . number_format($datacaridetail['t_totalnjopbangunan'], 0, ',', '.') . ") /
                          " . $datacaridetail['t_luastanah'] . " m<sup>2</sup>
                    </div>
                  </div>";
        $njop_tanah = ($datacaridetail['t_nilaitransaksispt'] - $datacaridetail['t_totalnjopbangunan']) / $datacaridetail['t_luastanah'];
        $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        
                    </div>
                    <div class='col-sm-9'>
                        " . number_format($njop_tanah, 0, ',', '.') . " per m<sup>2</sup>
                    </div>
                  </div>";
        $nop = explode('.', $datacaridetail['t_nopbphtbsppt']);
        $s_kd_propinsi = $nop[0];
        $s_kd_dati2 = $nop[1];
        $s_kd_kecamatan = $nop[2];
        $s_kd_kelurahan = $nop[3];
        $s_kd_blok = $nop[4];

        // cari harga acuan pada tabel master s_acuan
        $datahargaacuan = $this->getTblVerifikasi()->getHargaAcuan($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok);
        if ($datahargaacuan == false) {
            $analisis_a = "Belum Ada Harga Referensi";
            $warna = "blue";
            $hasil_a['s_keterangan'] = "";
            $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>KESIMPULAN</b>
                    </div>
                    <div class='col-sm-9'>
                        <span class='badge' style='background-color:$warna;'>" . $analisis_a . "</span>
                    </div>
                  </div>";
        } else {
            $analisis_a = 0;
            if ($datahargaacuan) {
                $analisis_a = $njop_tanah / $datahargaacuan['s_permetertanah'] * 100;
            }
            if ((int) $analisis_a < 0) {
                $harga_a = 0;
                $hasil_a = $this->getTblVerifikasi()->getPresentase($harga_a);
                $analisis_a = number_format($analisis_a, 2, ',', '.') . " %";
            } elseif ((int) $analisis_a >= 100) {
                $harga_a = 100;
                $hasil_a = $this->getTblVerifikasi()->getPresentase($harga_a);
                $analisis_a = number_format($analisis_a, 2, ',', '.') . " %";
            } else {
                $hasil_a = $this->getTblVerifikasi()->getPresentase($analisis_a);
                $analisis_a = number_format($analisis_a, 2, ',', '.') . " %";
            }
            $warna = $hasil_a['warna'];
            $html .= "<div class='row'>
                    <hr style='background-color: blue; border: 0px; height: 1px'>
                    <div class='col-sm-3'>
                       <b style='color:blue'> Harga Di Blok yang sama</b>
                    </div>
                    <div class='col-sm-9'>
                        " . number_format($datahargaacuan['s_permetertanah'], 0, ',', '.') . " per m<sup>2</sup>
                    </div>
                  </div>";
            $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>Kewajaran Blok</b>
                    </div>
                    <div class='col-sm-9'>
                        <b style='color:red'>NJOP Tanah per m<sup>2</sup> / Harga Acuan x 100 % </b>
                    </div>
                  </div>";
            $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        
                    </div>
                    <div class='col-sm-9'>
                        " . number_format($njop_tanah, 0, ',', '.') . "/
                          " . number_format($datahargaacuan['s_permetertanah'], 0, ',', '.') . " x 100 %
                    </div>
                  </div>";
            $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        
                    </div>
                    <div class='col-sm-9'>
                        " . $analisis_a . "
                    </div>
                  </div>";
            $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>KESIMPULAN REFERENSI</b>
                    </div>
                    <div class='col-sm-9'>
                        <span class='badge' style='background-color:$warna;'>" . $hasil_a['s_keterangan'] . "</span>
                    </div>
                  </div>";
        }

        // dari history perblok
        $idpembayaran = (int) $datacaridetail['t_idpembayaranspt'];
        $datahistorynjoptanah = $this->getTblVerifikasi()->getHargaHistoryNJOPTanah($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok, $idpembayaran);
        if ($datahistorynjoptanah['njoptanahtransaksi'] == null) {
            $analisis_b = "Belum Ada Transaksi dalam 1 blok";
            $warna_b = "blue";
            $hasil_b['s_keterangan'] = "";
            $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>KESIMPULAN HISTORY</b>
                    </div>
                    <div class='col-sm-9'>
                        <span class='badge' style='background-color:$warna_b;'>" . $analisis_b . "</span>
                    </div>
                  </div>";
        } else {
            $njoptanahtransaksi = (int) $datahistorynjoptanah['njoptanahtransaksi'];
            $njoptanah = (int) $datahistorynjoptanah['njoptanah'];
            if ($njoptanahtransaksi >= $njoptanah) {
                $hasil['historynjoptanah'] = $njoptanahtransaksi;
            } else {
                $hasil['historynjoptanah'] = $njoptanah;
            }

            $analisis_b = 0;
            if ($hasil['historynjoptanah']) {
                $analisis_b = $njop_tanah / $hasil['historynjoptanah'] * 100;
            }
            if ((int) $analisis_b < 0) {
                $harga_b = 0;
                $hasil_b = $this->getTblVerifikasi()->getPresentase($harga_b);
                $analisis_b = number_format($analisis_b, 2, ",", ".") . " %";
            } elseif ((int) $analisis_b >= 100) {
                $harga_b = 100;
                $hasil_b = $this->getTblVerifikasi()->getPresentase($harga_b);
                $analisis_b = number_format($analisis_b, 2, ",", ".") . " %";
            } else {
                $hasil_b = $this->getTblVerifikasi()->getPresentase($analisis_b);
                $analisis_b = number_format($analisis_b, 2, ",", ".") . " %";
            }
            $warna_b = $hasil_b['warna'];
            $html .= "<div class='row'><hr style='background-color: blue; border: 0px; height: 1px'>
                    <div class='col-sm-3'>
                       <b style='color:blue'> Harga History Di Blok yang sama</b>
                    </div>
                    <div class='col-sm-9'>
                        " . number_format($hasil['historynjoptanah'], 0, ',', '.') . " per m<sup>2</sup>
                    </div>
                  </div>";
            $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>Kewajaran History</b>
                    </div>
                    <div class='col-sm-9'>
                        <b style='color:red'>NJOP Tanah per m<sup>2</sup> / Harga History x 100 % </b>
                    </div>
                  </div>";
            $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        
                    </div>
                    <div class='col-sm-9'>
                        " . number_format($njop_tanah, 0, ',', '.') . "/
                          " . number_format($hasil['historynjoptanah'], 0, ',', '.') . " x 100 %
                    </div>
                  </div>";
            $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        
                    </div>
                    <div class='col-sm-9'>
                        " . $analisis_b . "
                    </div>
                  </div>";
            $html .= "<div class='row'>
                    <div class='col-sm-3'>
                        <b>KESIMPULAN HISTORY</b>
                    </div>
                    <div class='col-sm-9'>
                        <span class='badge' style='background-color:$warna_b;'>" . $hasil_b['s_keterangan'] . "</span>
                    </div>
                  </div>";
        }
//        $html .= " <span class='badge' style='background-color:$warna_b;'>History : " . $analisis_b . " " . $hasil_b['s_keterangan'] . "</span>";
        $html .= "</div></div>";
        $data['datadetailmonitoring'] = $html;
        $res->setContent(\Zend\Json\Json::encode($data));
        return $res;
    }

    public function getTblJenTran() {
        if (!$this->tbl_jenistransaksi) {
            $sm = $this->getServiceLocator();
            $this->tbl_jenistransaksi = $sm->get('JenisTransaksiBphtbTable');
        }
        return $this->tbl_jenistransaksi;
    }

    public function getTblPembayaran() {
        if (!$this->tbl_pembayaran) {
            $sm = $this->getServiceLocator();
            $this->tbl_pembayaran = $sm->get('PembayaranSptTable');
        }
        return $this->tbl_pembayaran;
    }

    public function populateComboHakTanah() {
        $data = $this->getTblHakTan()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idhaktanah] = $row->s_namahaktanah;
        }
        return $selectData;
    }

    public function populateComboDokTanah() {
        $data = $this->getTblDokTan()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_iddoktanah] = $row->s_namadoktanah;
        }
        return $selectData;
    }

    private function populateComboNotaris() {
        $data = $this->getNotaris()->getdataCombo();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['s_iduser']] = $row['s_namanotaris'];
        }
        return $selectData;
    }

    function populatePersyaratanId($id) {
        $data = $this->getTblPersyaratan()->getDataIdTransaksis($id);
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idpersyaratan] = $row->s_namapersyaratan;
        }
        return $selectData;
    }

    public function getTblHakTan() {
        if (!$this->tbl_haktanah) {
            $sm = $this->getServiceLocator();
            $this->tbl_haktanah = $sm->get('HakTanahTable');
        }
        return $this->tbl_haktanah;
    }

    public function getNotaris() {
        if (!$this->tbl_notaris) {
            $sm = $this->getServiceLocator();
            $this->tbl_notaris = $sm->get('NotarisBphtbTable');
        }
        return $this->tbl_notaris;
    }

    public function getTblSSPDBphtb() {
        if (!$this->tbl_sspd) {
            $sm = $this->getServiceLocator();
            $this->tbl_sspd = $sm->get("SSPDBphtbTable");
        }
        return $this->tbl_sspd;
    }

    public function getTblVerifikasi() {
        if (!$this->tbl_verifikasi) {
            $sm = $this->getServiceLocator();
            $this->tbl_verifikasi = $sm->get("VerifikasiSptTable");
        }
        return $this->tbl_verifikasi;
    }

    public function getTblPersyaratan() {
        if (!$this->tbl_persyaratan) {
            $sm = $this->getServiceLocator();
            $this->tbl_persyaratan = $sm->get('PersyaratanTable');
        }
        return $this->tbl_persyaratan;
    }

    public function getTbl() {
        if (!$this->tbl_spt) {
            $sm = $this->getServiceLocator();
            $this->tbl_spt = $sm->get("SPTTable");
        }
        return $this->tbl_spt;
    }

    public function getTblDokTan() {
        if (!$this->tbl_doktanah) {
            $sm = $this->getServiceLocator();
            $this->tbl_doktanah = $sm->get('DokTanahTable');
        }
        return $this->tbl_doktanah;
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
