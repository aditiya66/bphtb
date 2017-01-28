<?php

// Modul Pelaporan Notaris

namespace Bphtb\Controller\Pelaporan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Math\Rand;
use Bphtb\Form\Pendataan\SSPDFrm;
use Bphtb\Model\Pendataan\SSPDBphtbBase;

class PelaporanNotaris extends AbstractActionController {

    protected $tbl_pelaporan, $tbl_sspd, $tbl_notaris, $tbl_pemda, $tbl_pejabat;

    // Index Pelaporan Notaris
    public function indexAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $ar_notaris = $this->getNotaris()->getdataCombo();
        $show_hide_combo_notaris = "display:none;";
        $frm = new SSPDFrm(null, null, null, null, $this->populateComboNotaris(), null, $this->populateComboNotaris1());
        if ($session ['s_namauserrole'] == "Administrator" || $session ['s_namauserrole'] == "Pegawai") {
            $show_hide_combo_notaris = "";
            $show_hide_tglpelaporan = "";
        } else if ($session ['s_namauserrole'] == "Notaris") {
            $show_hide_combo_notaris = "display:none;";
            $show_hide_tglpelaporan = "display:none;";
        }
        $view = new ViewModel(array(
            'frm' => $frm,
            'show_hide_combo_notaris' => $show_hide_combo_notaris,
            'show_hide_tglpelaporan' => $show_hide_tglpelaporan,
            'data_notaris' => $ar_notaris,
            'role_id' => $session ['s_akses']
        ));
        $data = array(
            'menu_pelaporan' => 'active',
            'role_id' => $session ['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    // Daftar Pada Index Pelaporan Notaris
    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $base = new \Bphtb\Model\Pelaporan\PelaporanBase ();
        $base->exchangeArray($allParams);
        if ($base->direction == 2)
            $base->page = $base->page + 1;
        if ($base->direction == 1)
            $base->page = $base->page - 1;
        if ($base->page <= 0)
            $base->page = 1;
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTblPelaporan()->getGridCount($base, $session ['s_iduser'], $session ['s_namauserrole']);
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
        $data = $this->getTblPelaporan()->getGridData($base, $start, $session ['s_iduser'], $session ['s_namauserrole']);
        $s = "";
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td style='text-align:center'>" . str_pad($row ['t_kohirspt'], 4, '0', STR_PAD_LEFT) . "</td>";
            $s .= "<td style='text-align:center'>" . date('d-m-Y', strtotime($row ['t_tglprosesspt'])) . "</td>";
            $s .= "<td>" . $row ['t_namawppembeli'] . "</td>";
            $s .= "<td style='text-align:right'>" . number_format($row ['t_totalspt'], 0, ',', '.') . "</td>";
            $mons = array(
                1 => "Jan",
                2 => "Feb",
                3 => "Mar",
                4 => "Apr",
                5 => "Mei",
                6 => "Jun",
                7 => "Jul",
                8 => "Agus",
                9 => "Sept",
                10 => "Okt",
                11 => "Nov",
                12 => "Des"
            );
            $tglbayar = explode('-', $row ['t_tanggalpembayaran']);
            $month = intval($tglbayar [1]);
            $month_name = $mons [$month];
            $s .= "<td>" . $month_name . ', ' . $tglbayar [0] . "</td>";
            $s .= "<td>" . $row ['s_namanotaris'] . "</td>";
            if ($row ['t_tanggalpembayaran'] == null) {
                $tglbayare = "";
            } else {
                $tglbayare = date('d-m-Y', strtotime($row ['t_tanggalpembayaran']));
            }
            $s .= "<td style='text-align:center'>" . $tglbayare . "</td>";
            if ($row ['t_tglajbbaru'] == null) {
                $tglajbbaru = "";
            } else {
                $tglajbbaru = date('d-m-Y', strtotime($row ['t_tglajbbaru']));
            }
            $s .= "<td colspan='2'>" . $row ['t_noajbbaru'] . "/" . $tglajbbaru . " </td>";
//            $datasanksi = $this->getTblPelaporan()->CariDataPendataanSanksi($row ['t_idspt']);
//            if ($row ['t_tanggalpembayaran'] > $row ['t_tglajbbaru']) {
//                if ($session ['s_akses'] == 1 || $session ['s_akses'] == 2) {
//                    $s .= "<td><a href='pelaporan_notaris/inputsanksi?t_idspt=$row[t_idspt]' class='btn btn-danger btn-xs btn-flat' style='width:100px'>Input Sanksi</a></td>";
//                } else {
//                    $s .= "<td>-</td>";
//                }
//            } else if (empty($row['t_tanggalpembayaran']) && !empty($row['t_tglajbbaru'])) {
//                $s .= "<td><a href='pelaporan_notaris/inputsanksi?t_idspt=$row[t_idspt]' class='btn btn-success btn-xs btn-flat' style='width:100px'>Terdata (Lihat)</a></td>";
//            } else if (!empty($datasanksi)) {
//                $s .= "<td><a href='pelaporan_notaris/inputsanksi?t_idspt=$row[t_idspt]' class='btn btn-success btn-xs btn-flat' style='width:100px'>Terdata (Lihat)</a></td>";
//            } else {
//                $s .= "<td>-</td>";
//            }
            if (!empty($row ['t_tglajbbaru']) && !empty($row ['t_noajbbaru'])) {
                if ($row['t_statuspelaporannotaris'] == true && !empty($row ['t_tglpelaporannotaris'])) {
                    $s .= "<td>Dilaporkan / " . date('d-m-Y', strtotime($row ['t_tglpelaporannotaris'])) . "</td>";
                }else{
                    $s .= "<td>-</td>";
                }
            } else {
                if ($session ['s_akses'] == 1 || $session ['s_akses'] == 2 || $session ['s_akses'] == 3) {
                    $s .= "<td><a href='#' class='btn btn-danger btn-xs btn-flat' onclick=\"openLaporkan(" . $row['t_iddetailsptbphtb'] . ",'" . $row['t_namawppembeli'] . "','" . str_pad($row['t_kohirspt'], 4, '0', STR_PAD_LEFT) . "','" . $row['t_noajbbaru'] . "','" . $row['t_tglajbbaru'] . "');return false;\"  style='width:70px'>Laporkan</a></td>";
                } else {
                    $s .= "<td>-</td>";
                }
            }
            $bulan = explode('-', $row ['t_tglajbbaru']);
            $bulanini = date('m');
            $bulann = intval($bulan [1]);
            $bulannini = intval($bulanini);
            $hasil = $bulannini - $bulann;
            $tglini = date('d');
            $tgllini = intval($tglini);
            if (($hasil >= 1 && $tgllini > 10) || ($hasil >= 2)) {
                $bulanajb = intval(date('m', strtotime($row ['t_tglajbbaru'])));
                $datadenda = $this->getTblPelaporan()->CariDataPembayaranDenda($bulanajb);
                if (!empty($datadenda ['t_dendabulan'])) {
                    $s .= "<td>Telat Lapor / <span class='btn btn-xs'>Sudah Bayar Denda</span> </td>";
                } else {
                    $s .= "<td>Telat Lapor / Belum Bayar Denda</td>";
                }
            } else {
                $s .= "<td></td>";
            }
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

    public function dataGridDendaNotarisAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $base = new \Bphtb\Model\Pelaporan\PelaporanBase ();
        $base->exchangeArray($allParams);
        if ($base->direction == 2)
            $base->page = $base->page + 1;
        if ($base->direction == 1)
            $base->page = $base->page - 1;
        if ($base->page <= 0)
            $base->page = 1;
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTblPelaporan()->getGridCountDendaNotaris();
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
        $data = $this->getTblPelaporan()->getGridDataDendaNotaris($base, $start);
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td>" . date('d-m-Y', strtotime($row ['t_tglprosesds'])) . "</td>";
            if ($row ['t_dendabulan'] == 1) {
                $bulan = 'Januari';
            } elseif ($row ['t_dendabulan'] == 2) {
                $bulan = 'Februari';
            } elseif ($row ['t_dendabulan'] == 3) {
                $bulan = 'Maret';
            } elseif ($row ['t_dendabulan'] == 4) {
                $bulan = 'April';
            } elseif ($row ['t_dendabulan'] == 5) {
                $bulan = 'Mei';
            } elseif ($row ['t_dendabulan'] == 6) {
                $bulan = 'Juni';
            } elseif ($row ['t_dendabulan'] == 7) {
                $bulan = 'Juli';
            } elseif ($row ['t_dendabulan'] == 8) {
                $bulan = 'Agustus';
            } elseif ($row ['t_dendabulan'] == 9) {
                $bulan = 'September';
            } elseif ($row ['t_dendabulan'] == 10) {
                $bulan = 'Oktober';
            } elseif ($row ['t_dendabulan'] == 11) {
                $bulan = 'Nopember';
            } elseif ($row ['t_dendabulan'] == 12) {
                $bulan = 'Desember';
            }
            $s .= "<td>" . $bulan . "</td>";
            $s .= "<td>" . number_format($row ['t_jumlahds'], 0, ',', '.') . "</td>";
            $s .= "<td> <a href='#' onclick='openCetakSTS(" . $row ['t_kohirds'] . ");return false;' >Cetak STS</a> || <a href='#' onclick='openCetakBukti(" . $row ['t_kohirds'] . ");return false;' >Cetak SP</a></td>";
            $s .= "<td>" . $row ['s_namanotaris'] . "</td>";
            $s .= "<td> <a href='#' onclick='hapus(" . $row ['t_idds'] . ");return false;' >Hapus</a></td>";
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

    public function dataGridSanksiNotarisAction() {
        // $res = $this->getResponse();
        // $page = $this->getRequest()->getPost('page') ? $this->getRequest()->getPost('page') : 1;
        // $rp = $this->getRequest()->getPost('rp') ? $this->getRequest()->getPost('rp') : 10;
        // $sortname = $this->getRequest()->getPost('sortname') ? $this->getRequest()->getPost('sortname') : 't_kohirspt';
        // $sortorder = $this->getRequest()->getPost('sortorder') ? $this->getRequest()->getPost('sortorder') : 'desc';
        // $query = $this->getRequest()->getPost('query') ? $this->getRequest()->getPost('query') : false;
        // $qtype = $this->getRequest()->getPost('qtype') ? $this->getRequest()->getPost('qtype') : false;
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $base = new \Bphtb\Model\Pelaporan\PelaporanBase ();
        $base->exchangeArray($allParams);
        if ($base->direction == 2)
            $base->page = $base->page + 1;
        if ($base->direction == 1)
            $base->page = $base->page - 1;
        if ($base->page <= 0)
            $base->page = 1;
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTblPelaporan()->getGridCountSanksiNotaris();
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
        $data = $this->getTblPelaporan()->getGridDataSanksiNotaris($base, $start);
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><a href='#' onclick='openCetakSTS(" . $row ['t_kohirds'] . ");return false;' >Cetak STS</a> || <a href='#' onclick='openCetakBukti(" . $row ['t_kohirds'] . ");return false;' >Cetak SP</a></td>";
            $s .= "<td>" . date('d-m-Y', strtotime($row ['t_tglprosesds'])) . "</td>";
            $s .= "<td>" . $row ['t_periodeds'] . "</td>";
            $s .= "<td>" . $row ['t_noajbbaru'] . "</td>";
            $s .= "<td>" . $row ['t_tglajbbaru'] . "</td>";
            $s .= "<td>" . $row ['t_kohirds'] . "</td>";
            $s .= "<td>" . $row ['t_kodebayards'] . "</td>";
            $s .= "<td>" . number_format($row ['t_jumlahds'], 0, ',', '.') . "</td>";
            $s .= "<td>" . $row ['s_namanotaris'] . "</td>";
            $s .= "<td><a href='#' onclick='hapus(" . $row ['t_idds'] . ");return false;' >Hapus</a></td>";
            $s .= "</td>";
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

    // Laporkan Data Notaris atau Update Data Pelaporan
    // Lokasi : index Pelaporan Notaris
    public function laporkandataAction() {
        $frm = new \Bphtb\Form\Pelaporan\PelaporanFrm ();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Pelaporan\PelaporanBase ();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $this->getTblPelaporan()->UbahStatusLaporanNotaris($kb);
            }
        }
        return $res;
    }

    // Konfirmasi Data Notaris atau Update Data Pelaporan
    // Lokasi : index Pelaporan Notaris
    public function konfirmasidataAction() {
        $frm = new \Bphtb\Form\Pelaporan\PelaporanFrm ();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Pelaporan\PelaporanBase ();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $this->getTblPelaporan()->UbahStatusKonfirmasiNotaris($kb);
            }
        }
        return $res;
    }

    // Input Denda 250.000
    public function inputdendaAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $frm2 = new \Bphtb\Form\Pelaporan\PelaporanFrm($this->populateComboNotaris());
        $Mengetahuibphtb = $this->getTblPejabat()->getdata();
        $data_mengetahuists1 = $this->getTblPejabat()->getdata();
        $data_mengetahuists2 = $this->getTblPejabat()->getdata();
        $view = new ViewModel(array(
            'frm' => $frm2,
            'data_mengetahuibphtb' => $Mengetahuibphtb,
            'data_mengetahuists1' => $data_mengetahuists1,
            'data_mengetahuists2' => $data_mengetahuists2
        ));
        $data = array(
            'menu_pelaporan' => 'active',
            'role_id' => $session ['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function InputDendaNotarisAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $string = Rand::getString(6, '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ', true);
        $frm = new \Bphtb\Form\Pelaporan\PelaporanFrm ();
        if ($this->getRequest()->isPost()) {
            $base = new \Bphtb\Model\Pelaporan\PelaporanBase ();
            $frm->setInputFilter($base->getInputFilter());
            $frm->setData($this->getRequest()->getPost());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $base->t_kodebayards = $string;
                $this->getTblPelaporan()->saveDendaNotaris($base);
                return $this->redirect()->toRoute('pelaporan_notaris');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array(
            "frm" => $frm
        ));
        $data = array(
            'menu_pendataan' => 'active',
            'role_id' => $session ['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    // Input Sanksi 7.500.0000
    public function inputsanksiAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $frm = new \Bphtb\Form\Pelaporan\PelaporanFrm($this->populateComboNotaris());
        $req = $this->getRequest();
        $idspt = (int) $req->getQuery()->get('t_idspt');
        $datasanksi = $this->getTblPelaporan()->cariDataSanksi($idspt);
        $pendataansanksi = $this->getTblPelaporan()->cariPendatanSanksi($idspt);
        $Mengetahuibphtb = $this->getTblPejabat()->getdata();
        $data_mengetahuists1 = $this->getTblPejabat()->getdata();
        $data_mengetahuists2 = $this->getTblPejabat()->getdata();
        $s_iduser = $datasanksi ['t_idnotarisspt'];
        $no_ajb = $datasanksi ['t_noajbbaru'];
        $tgl_ajb = $datasanksi ['t_tglajbbaru'];
        $namanotaris = $datasanksi ['s_namanotaris'];
        $view = new ViewModel(array(
            'frm' => $frm,
            't_idspt' => $idspt,
            'no_ajb' => $no_ajb,
            'tgl_ajb' => $tgl_ajb,
            'idnotaris' => $s_iduser,
            'namanotaris' => $namanotaris,
            'pendataansanksi' => $pendataansanksi,
            'data_mengetahuibphtb' => $Mengetahuibphtb,
            'data_mengetahuists1' => $data_mengetahuists1,
            'data_mengetahuists2' => $data_mengetahuists2
        ));
        $data = array(
            'menu_pelaporan' => 'active',
            'role_id' => $session ['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function InputSanksiNotarisAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $string = Rand::getString(6, '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ', true);
        $frm = new \Bphtb\Form\Pelaporan\PelaporanFrm($this->populateComboNotaris());
        if ($this->getRequest()->isPost()) {
            $base = new \Bphtb\Model\Pelaporan\PelaporanBase ();
            $frm->setInputFilter($base->getInputFilter());
            $frm->setData($this->getRequest()->getPost());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $base->t_kodebayards = $string;
                $this->getTblPelaporan()->saveSanksiNotaris($base);
                return $this->redirect()->toRoute('pelaporan_notaris');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array(
            "frm" => $frm
        ));
        $data = array(
            'menu_pelaporan' => 'active',
            'role_id' => $session ['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    private function populateComboNotaris() {
        $data = $this->getNotaris()->getdataCombo();
        $selectData = array();
        foreach ($data as $row) {
            $selectData [$row ['s_iduser']] = $row ['s_namanotaris'];
        }
        return $selectData;
    }

    private function populateComboNotaris1() {
        $data = $this->getNotaris()->getdataCombo();
        $selectData = array();
        foreach ($data as $row) {
            $selectData [$row ['s_iduser']] = $row ['s_namanotaris'];
        }
        return $selectData;
    }

    public function HapusAction() {
        $frm = new \Bphtb\Form\Pembayaran\PembayaranSptFrm ();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Pelaporan\PelaporanBase ();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $data = $this->getTblPelaporan()->hapusData($kb);
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    public function cetakpemberitahuandendaAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $dataDenda = $this->getTblPelaporan()->getDataDenda($data_get->t_kohirds);
        $peraturan = $this->getTblPelaporan()->getDataPeraturan($dataDenda ['t_ketetapands']);
        $ar_Pejabat = $this->getTblPejabat()->getdataid($data_get->mengetahuibphtb);
        $ar_tglcetak = date('d-m-Y');
        $ar_pemda = $this->getPemda()->getdata();
        $pdf = new \DOMPDFModule\View\Model\PdfModel ();
        $pdf->setOption('filename', 'CetakPemberitahuanDenda');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        if ($dataDenda ['t_dendabulan'] == 1) {
            $dataDenda ['t_dendabulan'] = 'Januari';
        } elseif ($dataDenda ['t_dendabulan'] == 2) {
            $dataDenda ['t_dendabulan'] = 'Februari';
        } elseif ($dataDenda ['t_dendabulan'] == 3) {
            $dataDenda ['t_dendabulan'] = 'Maret';
        } elseif ($dataDenda ['t_dendabulan'] == 4) {
            $dataDenda ['t_dendabulan'] = 'April';
        } elseif ($dataDenda ['t_dendabulan'] == 5) {
            $dataDenda ['t_dendabulan'] = 'Mei';
        } elseif ($dataDenda ['t_dendabulan'] == 6) {
            $dataDenda ['t_dendabulan'] = 'Juni';
        } elseif ($dataDenda ['t_dendabulan'] == 7) {
            $dataDenda ['t_dendabulan'] = 'Juli';
        } elseif ($dataDenda ['t_dendabulan'] == 8) {
            $dataDenda ['t_dendabulan'] = 'Agustus';
        } elseif ($dataDenda ['t_dendabulan'] == 9) {
            $dataDenda ['t_dendabulan'] = 'September';
        } elseif ($dataDenda ['t_dendabulan'] == 10) {
            $dataDenda ['t_dendabulan'] = 'Oktober';
        } elseif ($dataDenda ['t_dendabulan'] == 11) {
            $dataDenda ['t_dendabulan'] = 'November';
        } elseif ($dataDenda ['t_dendabulan'] == 12) {
            $dataDenda ['t_dendabulan'] = 'Desember';
        }

        $pdf->setVariables(array(
            'dataDenda' => $dataDenda,
            'tgl_cetak' => $ar_tglcetak,
            'data_pemda' => $ar_pemda,
            'ar_Pejabat' => $ar_Pejabat,
            'peraturan' => $peraturan
        ));
        return $pdf;
    }

    public function cetakstsAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $dataSts = $this->getTblPelaporan()->getDataDenda($data_get->t_kohirds);

        $ar_tglcetak = date('d-m-Y');
        $ar_Pejabat1 = $this->getTblPejabat()->getdataid($data_get->mengetahuists1);
        $ar_Pejabat2 = $this->getTblPejabat()->getdataid($data_get->mengetahuists2);
        $ar_pemda = $this->getPemda()->getdata();
        $pdf = new \DOMPDFModule\View\Model\PdfModel ();
        $pdf->setOption('filename', 'CetakSts');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        if ($dataSts ['t_dendabulan'] == 1) {
            $dataSts ['t_dendabulan'] = 'Januari';
        } elseif ($dataSts ['t_dendabulan'] == 2) {
            $dataSts ['t_dendabulan'] = 'Februari';
        } elseif ($dataSts ['t_dendabulan'] == 3) {
            $dataSts ['t_dendabulan'] = 'Maret';
        } elseif ($dataSts ['t_dendabulan'] == 4) {
            $dataSts ['t_dendabulan'] = 'April';
        } elseif ($dataSts ['t_dendabulan'] == 5) {
            $dataSts ['t_dendabulan'] = 'Mei';
        } elseif ($dataSts ['t_dendabulan'] == 6) {
            $dataSts ['t_dendabulan'] = 'Juni';
        } elseif ($dataSts ['t_dendabulan'] == 7) {
            $dataSts ['t_dendabulan'] = 'Juli';
        } elseif ($dataSts ['t_dendabulan'] == 8) {
            $dataSts ['t_dendabulan'] = 'Agustus';
        } elseif ($dataSts ['t_dendabulan'] == 9) {
            $dataSts ['t_dendabulan'] = 'September';
        } elseif ($dataSts ['t_dendabulan'] == 10) {
            $dataSts ['t_dendabulan'] = 'Oktober';
        } elseif ($dataSts ['t_dendabulan'] == 11) {
            $dataSts ['t_dendabulan'] = 'November';
        } elseif ($dataSts ['t_dendabulan'] == 12) {
            $dataSts ['t_dendabulan'] = 'Desember';
        }

        $pdf->setVariables(array(
            'dataSts' => $dataSts,
            'tgl_cetak' => $ar_tglcetak,
            'data_pemda' => $ar_pemda,
            'ar_Pejabat1' => $ar_Pejabat1,
            'ar_Pejabat2' => $ar_Pejabat2
        ));
        return $pdf;
    }

    public function getTblPelaporan() {
        if (!$this->tbl_pelaporan) {
            $sm = $this->getServiceLocator();
            $this->tbl_pelaporan = $sm->get("PelaporanTable");
        }
        return $this->tbl_pelaporan;
    }

    public function getTblSSPD() {
        if (!$this->tbl_sspd) {
            $sm = $this->getServiceLocator();
            $this->tbl_sspd = $sm->get("SSPDBphtbTable");
        }
        return $this->tbl_sspd;
    }

    public function getNotaris() {
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

    public function getTblPejabat() {
        if (!$this->tbl_pejabat) {
            $sm = $this->getServiceLocator();
            $this->tbl_pejabat = $sm->get("PejabatBphtbTable");
        }
        return $this->tbl_pejabat;
    }

}
