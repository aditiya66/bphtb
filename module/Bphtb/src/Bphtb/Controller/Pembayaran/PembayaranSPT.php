<?php

// Modul Pembayaran

namespace Bphtb\Controller\Pembayaran;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Bphtb\Form\Pendataan\SSPDFrm;
use Bphtb\Model\Pendataan\SSPDBphtbBase;

class PembayaranSPT extends AbstractActionController {

    protected $tbl_pembayaran, $tbl_pendataan, $tbl_jenistransaksi, $tbl_haktanah, $tbl_pemda;

    // Index Pembayaran
    public function indexAction() {
        // $session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new \Bphtb\Form\Pembayaran\PembayaranSptFrm();
        $view = new ViewModel(array(
            "form" => $form
        ));
        $data = array(
            'menu_pembayaran' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    // Daftar Pada Index Pembayaran (SSPD/SKPDKB)
    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTblPembayaran()->getGridCount($base);
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
        $data = $this->getTblPembayaran()->getGridData($base, $start);
        $s = "";
        foreach ($data as $row) {
            $s .= "<tr>";
            if ($row['t_ketetapanspt'] == 1) {
                if ($row['t_inputbpn'] == true) {
                    $s .= "<td><a href='pembayaran_sptbphtb/viewdata?t_idspt=$row[t_idspt]'><span class='badge' style='background-color:#CC0000;'>" . str_pad($row['t_kohirspt'], 4, '0', STR_PAD_LEFT) . " </span></a></td>";
                } else {
                    $s .= "<td><a href='pembayaran_sptbphtb/viewdata?t_idspt=$row[t_idspt]'>" . str_pad($row['t_kohirspt'], 4, '0', STR_PAD_LEFT) . "</a></td>";
                }
            } else {
                if ($row['t_ketetapands'] == 3) {
                    $s .= "<td> <span class='badge' style='background-color:green;'>" . $row['t_kohirds'] . " </span></td>";
                    $notarisds = $row['notarisds'];
                } elseif ($row['t_ketetapands'] == 4) {
                    $s .= "<td> <span class='badge' style='background-color:green;'>" . $row['t_kohirds'] . " </span></td>";
                    $notarisds = $row['notarisds'];
                }
            }
            $s .= "<td style='text-align:center'>" . $row['t_nopbphtbsppt'] . "</td>";
            $s .= "<td style='text-align:center'>" . $row['t_periodepembayaran'] . "</td>";
            $s .= "<td>" . date('d-m-Y', strtotime($row['t_tanggalpembayaran'])) . "</td>";
            if ($row['t_ketetapanspt'] == 1) {
                $s .= "<td>" . $row['t_namawppembeli'] . "</td>";
            } else {
                $s .= "<td>" . $notarisds . "</td>";
            }
            $s .= "<td>" . $row['t_kodebayarbanksppt'] . "</td>";
            $s .= "<td style='text-align:right'>" . number_format($row['t_nilaipembayaranspt'], 0, ',', '.') . "</td>";
            if ($row['t_ketetapanspt'] == 1) {
                $s .= "<td style='text-align:center'><a href='cetak_laporan/cetakbuktivalidasipembayaran?&action=cetakbuktivalidasipembayaran&t_idspt=$row[t_idspt]' target='_blank' class='btn btn-success btn-xs btn-flat' style='width:130px'>Validasi Pembayaran</a> <a href='cetak_laporan/cetakbuktipembayaran?&action=cetakbuktipembayaran&t_idspt=$row[t_idspt]' target='_blank' class='btn btn-success btn-xs btn-flat' style='width:130px'>Bukti Pembayaran</a></td>";
                $s .= "<td style='text-align:center'><a href='#' onclick='hapus(" . $row['t_idpembayaranspt'] . ");return false;' class='btn btn-danger btn-xs btn-flat' style='width:70px'>Hapus</a></td>";
            } else {
                $s .= "<td>-</td>";
                $s .= "<td style='text-align:center'><a href='#' onclick='hapus(" . $row['t_idpembayaranspt'] . ");updatepemeriksaan(" . $row['p_idpemeriksaan'] . ");return false;' class='btn btn-danger btn-xs btn-flat' style='width:70px'>Hapus</a></td>";
            }
            $s .= "</tr>";
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

    public function viewdataAction() {
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idspt');
            $data = $this->getPendataanBphtb()->getDataId($id);
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
            'menu_pembayaran' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    // Daftar SSPD
    // Lokasi : Button Cari SSPD Tambah Pembayaran
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
        $count = $this->getPendataanBphtb()->getGridCountPembayaran($base, $parametercari);
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
        $data = $this->getPendataanBphtb()->getGridDataPembayaran($base, $start, $parametercari);
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td>" . $row['t_kodebayarbanksppt'] . "</td>";
            $s .= "<td>" . str_pad($row['t_kohirketetapanspt'], 4, '0', STR_PAD_LEFT) . "</td>";
            $s .= "<td>" . date('d-m-Y', strtotime($row['t_tglprosesspt'])) . "</td>";
            $s .= "<td>" . $row['t_nopbphtbsppt'] . "</td>";
            $s .= "<td>" . $row['t_namawppembeli'] . "</td>";
            $s .= "<td>" . $row['t_namawppenjual'] . "</td>";
            $s .= "<td align='center'>" . $row['t_luastanah'] . "</td>";
            $s .= "<td align='center'>" . $row['t_luasbangunan'] . "</td>";
            if ($row['t_nilaitransaksispt'] >= $row['t_grandtotalnjop']) {
                $transaksine = $row['t_nilaitransaksispt'];
            } else {
                $transaksine = $row['t_grandtotalnjop'];
            }
            $s .= "<td align='right'>" . number_format($transaksine, 0, ',', '.') . "</td>";
            $s .= "<td align='right'>" . number_format($row['t_totalspt'], 0, ',', '.') . "</td>";
            $s .= "<td align='right'>" . number_format($row['t_dendaspt'], 0, ',', '.') . "</td>";
            $s .= "<td><a href='#' onclick='pilihPendataanSspdBphtb(" . $row['t_idspt'] . ");return false;' >Pilih</a></td>";
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

    // Pilih Salah Satu Daftar Pembayaran SSPD
    // Lokasi : Button Cari SSPD Tambah Pembayaran
    public function pilihPendataanSspdBphtbAction() {
        $frm = new SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new SSPDBphtbBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data = $this->getPendataanBphtb()->getPendataanSspdBphtb($ex);
                if (!empty($data['p_idpemeriksaan'])) {
                    $data['t_luastanah'] = str_ireplace('.', '', $data['p_luastanah']) / 100;
                    $data['t_luasbangunan'] = str_ireplace('.', '', $data['p_luasbangunan']) / 100;
                    $data['t_njoptanah'] = $data['p_njoptanah'];
                    $data['t_njopbangunan'] = $data['p_njopbangunan'];
                    $data['t_totalnjoptanah'] = $data['p_totalnjoptanah'];
                    $data['t_totalnjopbangunan'] = $data['p_totalnjopbangunan'];
                    $data['t_grandtotalnjop'] = $data['p_grandtotalnjop'];
                    $data['t_nilaitransaksispt'] = $data['p_nilaitransaksispt'];
                    $data['t_potonganspt'] = $data['p_potonganspt'];
                } else {
                    $data['t_luastanah'] = str_ireplace('.', '', $data['t_luastanah']) / 100;
                    $data['t_luasbangunan'] = str_ireplace('.', '', $data['t_luasbangunan']) / 100;
                }

                if ($data['t_grandtotalnjop'] >= $data['t_nilaitransaksispt']) {
                    $data['npop'] = $data['t_grandtotalnjop'];
                } else {
                    $data['npop'] = $data['t_nilaitransaksispt'];
                }

                if ($data['t_idjenistransaksi'] == '8') {
                    $data['npop'] = $data['t_nilaitransaksispt'];
                }

                $data['t_npopkpspt'] = $data['npop'] - $data['t_potonganspt'];
                $data['t_persenbphtb'] = 5;
                if (!empty($data['t_idsptsebelumnya'])) {
                    $idsebelumnya = $this->getTblPembayaran()->getDataPembayaran($data['t_idsptsebelumnya']);
                    $data['pembayaransebelumnya'] = $idsebelumnya['t_nilaipembayaranspt'];
                } else {
                    $data['pembayaransebelumnya'] = 0;
                }
                $data['t_luastanah'] = number_format($data['t_luastanah'], 0, ',', '.');
                $data['t_luasbangunan'] = number_format($data['t_luasbangunan'], 0, ',', '.');
                $data['t_totalnjoptanah'] = number_format($data['t_totalnjoptanah'], 0, ',', '.');
                $data['t_totalnjopbangunan'] = number_format($data['t_totalnjopbangunan'], 0, ',', '.');
                $data['t_njoptanah'] = number_format($data['t_njoptanah'], 0, ',', '.');
                $data['t_njopbangunan'] = number_format($data['t_njopbangunan'], 0, ',', '.');
                $data['t_grandtotalnjop'] = number_format($data['t_grandtotalnjop'], 0, ',', '.');
                $data['t_nilaitransaksispt'] = number_format($data['t_nilaitransaksispt'], 0, ',', '.');
                $data['npop'] = number_format($data['npop'], 0, ',', '.');
                $data['t_npopkpspt'] = number_format($data['t_npopkpspt'], 0, ',', '.');
                $data['t_potonganspt'] = number_format($data['t_potonganspt'], 0, ',', '.');
                $pajak = $data['t_totalspt'] + $data['pembayaransebelumnya'];
                $denda = $data['t_dendaspt'];
                $data['t_totalspt'] = number_format($data['t_totalspt'] + $data['pembayaransebelumnya'], 0, ',', '.');
//                $data['t_nilaipembayaranspt'] = number_format($data['t_nilaipembayaranspt'], 0, ',', '.');
                $data['t_nilaipembayaranspt'] = number_format($pajak + $denda - $data['pembayaransebelumnya'], 0, ',', '.');
                $data['pembayaransebelumnya'] = number_format($data['pembayaransebelumnya'], 0, ',', '.');
                $data['t_dendaspt'] = number_format($data['t_dendaspt'], 0, ',', '.');
                $data['t_bulandendaspt'] = number_format($data['t_bulandendaspt'], 0, ',', '.');
                $data['t_grand_total_spt'] = number_format($pajak + $denda - $data['pembayaransebelumnya'], 0, ',', '.');
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    public function dataGridDSAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
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
        $count = $this->getPendataanBphtb()->getGridCountDS($base);
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
        $data = $this->getPendataanBphtb()->getGridDataDS($base, $start);
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td>" . $row['t_kodebayards'] . "</td>";
            $s .= "<td>" . str_pad($row['t_kohirds'], 4, '0', STR_PAD_LEFT) . "</td>";
            $s .= "<td>" . date('d-m-Y', strtotime($row['t_tglprosesds'])) . "</td>";
            $s .= "<td>" . date('d-m-Y', strtotime($row['t_periodeds'])) . "</td>";
            $s .= "<td>" . $row['s_namanotaris'] . "</td>";
            $s .= "<td>" . $row['s_alamatnotaris'] . "</td>";
            $s .= "<td>" . number_format($row['t_jumlahds'], 0, ',', '.') . "</td>";
            $s .= "<td><a href='#' onclick='pilihPendataanDS(" . $row['t_idds'] . ");return false;' >Pilih</a></td>";
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

    public function dataGridDSBAKAction() {
        $res = $this->getResponse();
        $page = $this->getRequest()->getPost('page') ? $this->getRequest()->getPost('page') : 1;
        $rp = $this->getRequest()->getPost('rp') ? $this->getRequest()->getPost('rp') : 10;
        $sortname = $this->getRequest()->getPost('sortname') ? $this->getRequest()->getPost('sortname') : 't_idspt';
        $sortorder = $this->getRequest()->getPost('sortorder') ? $this->getRequest()->getPost('sortorder') : 'desc';
        $query = $this->getRequest()->getPost('query') ? $this->getRequest()->getPost('query') : false;
        $qtype = $this->getRequest()->getPost('qtype') ? $this->getRequest()->getPost('qtype') : false;
        $count = $this->getPendataanBphtb()->getGridCountDS($query, $qtype);
        $start = (($page - 1) * $rp);
        $res->getHeaders()->addheaders(array(
            'Content-type' => 'text/xml'
        ));
        $s = "<?xml version='1.0' encoding='utf-8'?>";
        $s .= "<rows>";
        $s .= "<page>" . $page . "</page>";
        $s .= "<total>" . $count . "</total>";
        $s .= "<records>" . $count . "</records>";
        $data = $this->getPendataanBphtb()->getGridDataDS($sortname, $sortorder, $query, $qtype, $start, $rp);
        foreach ($data as $row) {
            $s .= "<row id='" . $row['t_idds'] . "'>";
            $s .= "<cell>" . $row['t_kodebayards'] . "</cell>";
            $s .= "<cell>" . str_pad($row['t_kohirds'], 4, '0', STR_PAD_LEFT) . "</cell>";
            $s .= "<cell>" . date('d-m-Y', strtotime($row['t_tglprosesds'])) . "</cell>";
            $s .= "<cell>" . date('d-m-Y', strtotime($row['t_periodeds'])) . "</cell>";
            $s .= "<cell>" . $row['s_namanotaris'] . "</cell>";
            $s .= "<cell>" . $row['s_alamatnotaris'] . "</cell>";
            $s .= "<cell>" . number_format($row['t_jumlahds'], 0, ',', '.') . "</cell>";
            $s .= "<cell><![CDATA[<a href='#' onclick='pilihPendataanDS(" . $row['t_idds'] . ");return false;' >Pilih</a>]]></cell>";
            $s .= "</row>";
        }
        $s .= "</rows>";
        $res->setContent($s);
        return $res;
    }

    public function pilihPendataanDSAction() {
        $frm = new \Bphtb\Form\Pembayaran\PembayaranSptFrm();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data = $this->getPendataanBphtb()->getPendataanDS($ex->t_idds);
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    // Simpan Pembayaran SSPD / SKPDKB
    // Lokasi : Tambah Pembayaran
    public function tambahAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $frm = new \Bphtb\Form\Pembayaran\PembayaranSptFrm();
        $ar_pemda = $this->getPemda()->getdata();
        $req = $this->getRequest();
        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                if ($kb->jenis_pembayaran == 1) {
                    $data = $this->getTblPembayaran()->getDataPembayaran($kb->t_idspt);
                    if (!empty($data['t_idspt'])) {
                        $this->getTblPembayaran()->updatedatapembayaranTrue($kb, $session);
                    } else {
//                        $this->getTblPembayaran()->savedataPembayaran($kb);
                    }
                } elseif ($kb->jenis_pembayaran == 2 || $kb->jenis_pembayaran == 3) {
                    $this->getTblPembayaran()->savedataPembayaranDenda($kb);
                }
                return $this->redirect()->toRoute('pembayaran_sptbphtb');
            }
        }
        $view = new ViewModel(array(
            'frm' => $frm
        ));
        $data = array(
            'menu_pembayaran' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    // Hapus Pembayaran SSPD / SKPDKB
    // Lokasi : Index Pembayaran
    public function HapusAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $frm = new \Bphtb\Form\Pembayaran\PembayaranSptFrm();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $data = $this->getTblPembayaran()->hapusData($kb, $session);
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    // Hapus Pembayaran SSPD / SKPDKB
    // Lokasi : Index Pembayaran
    public function updatepemeriksaanAction() {
        $frm = new \Bphtb\Form\Pembayaran\PembayaranSptFrm();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $data = $this->getTblPembayaran()->updatedatapemeriksaanFalse($kb);
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    // Onchange No SSPD
    // Lokasi Tambah Pembayaran
    public function datasspdAction() {
        $frm = new \Bphtb\Form\Pembayaran\PembayaranSptFrm();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $this->getTblPembayaran()->updatedatapemeriksaanFalse($ex);
                $data = $this->getTblPembayaran()->temukanDataSspd($ex);
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    // Onchange No SKPDKKB
    // Lokasi Tambah Pembayaran
    public function dataskpdkbAction() {
        $frm = new \Bphtb\Form\Pembayaran\PembayaranSptFrm();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data = $this->getTblPembayaran()->temukanDataSkpdkb($ex);
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    // Kontrol Batas Waktu Pembayaran SSPD (Maksimal 3 Hari) dari tabel s_tempo
    // Lokasi : Tambah Pembayaran
    public function validitassspdAction() {
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

    public function getTblPembayaran() {
        if (!$this->tbl_pembayaran) {
            $sm = $this->getServiceLocator();
            $this->tbl_pembayaran = $sm->get('PembayaranSptTable');
        }
        return $this->tbl_pembayaran;
    }

    public function getPendataanBphtb() {
        if (!$this->tbl_pendataan) {
            $sm = $this->getServiceLocator();
            $this->tbl_pendataan = $sm->get('SSPDBphtbTable');
        }
        return $this->tbl_pendataan;
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

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
