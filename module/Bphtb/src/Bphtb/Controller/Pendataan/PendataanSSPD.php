<?php

namespace Bphtb\Controller\Pendataan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Math\Rand;
use Bphtb\Form\Pendataan\SSPDFrm;
use Bphtb\Model\Pendataan\SSPDBphtbBase;

class PendataanSSPD extends AbstractActionController {

    protected $tbl_sspd, $tbl_jenistransaksi, $tbl_haktanah, $tbl_nop;
    protected $tbl_spt, $tbl_pendataan, $tbl_notaris, $tbl_persyaratan, $tbl_doktanah, $tbl_sspdwaris;
    protected $routeMatch, $tbl_pemda, $tbl_pejabat;

    public function indexAction() {
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $form = new \Bphtb\Form\Pendataan\SSPDFrm();
        $view = new ViewModel(array("form" => $form));
        $data = array(
            'menu_pendataan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $base = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->getTblSSPDBphtb()->getGridCount($base, $session['s_iduser'], $session['s_namauserrole']);
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
        $data = $this->getTblSSPDBphtb()->getGridData($base, $start, $session['s_iduser'], $session['s_namauserrole']);
        $s = "";
        foreach ($data as $row) {
            $s .= "<tr>";
            if ($row['t_inputbpn'] == true) {
                $s .= "<td><form method='post' action='pendataan_sspd/viewdata' id='formtambah'><input type='hidden' name='t_idspt' value='" . $row['t_idspt'] . "'/> <input value='" . str_pad($row['t_kohirspt'], 4, '0', STR_PAD_LEFT) . "' class='btn btn-xs btn-flat' style='border:none; outline:none; color:red' type='submit'> </form></td>";
                $s .= "<td>" . str_pad($row['t_kohirketetapanspt'], 4, '0', STR_PAD_LEFT) . "</td>";
            } else {
                $s .= "<td><form method='post' action='pendataan_sspd/viewdata' id='formtambah'><input type='hidden' name='t_idspt' value='" . $row['t_idspt'] . "'/> <input value='" . str_pad($row['t_kohirspt'], 4, '0', STR_PAD_LEFT) . "' class='btn btn-xs btn-flat' style='border:none; outline:none; color:blue' type='submit'> </form></td>";
                $s .= "<td>" . str_pad($row['t_kohirketetapanspt'], 4, '0', STR_PAD_LEFT) . "</td>";
            }
            $s .= "<td style='text-align:center;'>" . $row['t_periodespt'] . "</td>";
            $s .= "<td style='text-align:center;'>" . date('d-m-Y', strtotime($row['t_tglprosesspt'])) . "</td>";
            $s .= "<td>" . $row['t_nopbphtbsppt'] . "</td>";
            $s .= "<td>" . $row['t_namawppembeli'] . "</td>";
            $s .= "<td style='text-align:right;'>" . number_format($row['t_totalspt'], 0, ',', '.') . "</td>";
            $s .= "<td style='text-align:right;'>" . number_format($row['t_dendaspt'], 0, ',', '.') . "</td>";
            $s .= "<td>" . $row['s_namajenistransaksi'] . "</td>";
            $result_array_syarat = \Zend\Json\Json::decode($row['t_persyaratan']);
            $jml_syarat = count($result_array_syarat);
            $result_array_syarat_verifikasi = \Zend\Json\Json::decode($row['t_verifikasispt']);

            $jml_syarat_verifikasi = count($result_array_syarat_verifikasi);
            $cektabelpersyaratan = $this->getTblJenTran()->jumlahsyarat($row['t_idjenistransaksi']);

            if ($cektabelpersyaratan == $jml_syarat) {
                $statuspendaftaran = "Lengkap";
            } else {
                $statuspendaftaran = "Belum Lengkap";
            }
            if (($cektabelpersyaratan == $jml_syarat) && ($cektabelpersyaratan == $jml_syarat_verifikasi)) {
                $status_verifikasi = "Tervalidasi";
                if ($row['t_statusbayarspt'] == true) {
                    $edit = "<td style=''></td>";
                } else {
                    $edit = "<td style=''><form method='post' action='pendataan_sspd/edit' id='formtambah'><input type='hidden' name='t_idspt' value='" . $row['t_idspt'] . "'/> <input value='Edit' class='btn btn-warning btn-xs btn-flat' style='float:center' type='submit'> </form></td>";
                }
            } else {
                if (empty($row['t_verifikasispt']) && $row['t_inputbpn'] == false) {
                    $status_verifikasi = "";
                    $edit = "<td style=''><form method='post' action='pendataan_sspd/edit' id='formtambah'><input type='hidden' name='t_idspt' value='" . $row['t_idspt'] . "'/> <input value='Edit' class='btn btn-warning btn-xs btn-flat' style='float:center' type='submit'> </form> <a href='#' onclick='hapus(" . $row['t_idspt'] . ");return false; 'class='btn btn-danger btn-xs btn-flat' style='width:50px'>Hapus</a></td>";
                } else {
                    $status_verifikasi = "Belum Lengkap";
                    if ($row['t_inputbpn'] == true) {
                        $edit = "<td style=''></td>";
                    } else {
                        $edit = "<td style=''><form method='post' action='pendataan_sspd/edit' id='formtambah'><input type='hidden' name='t_idspt' value='" . $row['t_idspt'] . "'/> <input value='Edit' class='btn btn-warning btn-xs btn-flat' style='float:center' type='submit'> </form> <a href='#' onclick='hapus(" . $row['t_idspt'] . ");return false; 'class='btn btn-danger btn-xs btn-flat' style='width:50px'>Hapus</a></td>";
                    }
                }
            }
            if ($row['t_statusbayarspt'] == true) {
                $status_bayar = "Sudah Dibayar";
            } else {
                $status_bayar = "Belum Dibayar";
            }
            $s .= "<td>                                                                              
                        <div class='btn-group'>
                            <button data-toggle='dropdown' class='btn btn-primary btn-flat btn-xs dropdown-toggle' type='button'>
                                <span class='glyphicon'></span>&nbsp;&nbsp;Status&nbsp;&nbsp;
                                <span class='caret'></span>
                                <span class='sr-only'>Toggle Dropdown</span>
                            </button>
                            <ul role='menu' class='dropdown-menu pull-right bg-blue' style='width:200px'>
                                <li>&nbsp;&nbsp;Pendaftaran  || " . $statuspendaftaran . "</li>
                                <li>&nbsp;&nbsp;Verifikasi || " . $status_verifikasi . "</li>
                                <li>&nbsp;&nbsp;Pembayaran || " . $status_bayar . "</li>
                            </ul>
                        </div>
                     </td>";
            $s .= "<td><a href='cetak_sspd/cetaksspdbphtb?&action=cetaksspd&t_idspt=$row[t_idspt]' target='_blank' class='btn btn-success btn-xs btn-flat'>SSPD</a></td>";
            $s .= "" . $edit . "";
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
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $string = Rand::getString(6, '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ', true);
        $frm = new SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah(), $string, $this->populateComboNotaris());
        $show_hide_combo_notaris = "display:none;";
        if ($session['s_namauserrole'] == "Administrator" || $session['s_namauserrole'] == "Pegawai" || $session['s_namauserrole'] == "Pendaftaran") {
            $show_hide_combo_notaris = "display:inherit;";
        } else
        if ($session['s_namauserrole'] == "Notaris") {
            $show_hide_combo_notaris = "display:none;";
        }
        $req = $this->getRequest();
        $data_tarif = $this->getTblSSPDBphtb()->temukanDataTarifBPHTB();
        if ($req->isPost()) {
            $kb1 = new \Bphtb\Model\Pendataan\SPTBase();
            $kb = new SSPDBphtbBase();
            $frm->setInputFilter($kb1->getInputFilter());
            $frm->setInputFilter($kb->getInputFilter($session['s_namauserrole']));
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb1->exchangeArray($frm->getData());
                $kb->exchangeArray($frm->getData());
                $this->getTblSPT()->persyaratan($req->getPost());
                asort($kb->t_persyaratan);
                $kb->t_persyaratan = implode(",", $kb->t_persyaratan);
                $kb->t_persyaratan = explode(",", $kb->t_persyaratan);
                if ($session['s_namauserrole'] == "Administrator" || $session['s_namauserrole'] == "Pegawai" || $session['s_namauserrole'] == "Pendaftaran") {
                    $idnotaris = $kb->t_idnotarisspt;
                } else
                if ($session['s_namauserrole'] == "Notaris") {
                    $idnotaris = $session['s_iduser'];
                }
                sleep(3);
                $data = $this->getTblSPT()->savedata($kb1, $kb->t_nopbphtbsppt, $kb->t_kodebayarbanksppt, $kb->t_idjenistransaksi, $kb->t_idjenishaktanah, $kb->t_totalspt, $kb->t_nilaitransaksispt, $kb->t_potonganspt, $idnotaris, $req->getPost());
                if (gettype($data) == 'object') {
                    $this->getTblSSPDBphtb()->savedatadetail($kb, $data->t_idspt, $session);
                    $idsptnya = $data->t_idspt;
                } else {
                    $this->getTblSSPDBphtb()->savedatadetail($kb, $data['t_idspt'], $session);
                    $idsptnya = $data['t_idspt'];
                }
                for ($ii = 0; $ii < count($req->getPost('t_namapenerimawaris')); $ii ++) {
                    $nama = $req->getPost('t_namapenerimawaris');
                    $alamat = $req->getPost('t_alamatpenerimawaris');
                    $nik = $req->getPost('t_nikpenerimawaris');
                    $this->getTblWaris()->savedatawaris($nama[$ii], $alamat[$ii], $nik[$ii]);
                }
                if ($session['s_namauserrole'] == "Pendaftaran") {
                    return $this->redirect()->toRoute('pendataan_sspd', array(
                                'controller' => 'PendataanSSPD',
                                'action' => 'viewdata'
                    ));
                } else {
                    return $this->redirect()->toRoute('pendataan_sspd');
                }
            }
        }
        $idsptnya = $this->getTblSPT()->getIDSPTmax();
        $view = new ViewModel(array(
            'frm' => $frm,
            'tarifbphtb' => $data_tarif['s_tarifbphtb'],
            'show_hide_combo_notaris' => $show_hide_combo_notaris,
            'idsptnyan' => $idsptnya['t_idsptne'],
            'role_id' => $session['s_akses']
        ));
        if ($session['s_akses'] == 6) {
            $nilainya = 6;
        }
        $data = array(
            'menu_pendataan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2,
            'nilai' => $nilainya
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    // Edit Permohonan BPHTB
    // Lokasi : Permohonan BPHTB
    public function editAction() {
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        if ($session['s_namauserrole'] == "Administrator" || $session['s_namauserrole'] == "Pegawai") {
            $show_hide_combo_notaris = "display:inherit;";
        } elseif ($session['s_namauserrole'] == "Notaris") {
            $show_hide_combo_notaris = "display:none;";
        }
        $string = Rand::getString(6, 'abcdefghijklmnopqrstuvwxyz-1234567890_ABCDEFGHIJKLMNOPQRSTUVWXYZ', true);
        $frm = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah(), $string, $this->populateComboNotaris());
        $req = $this->getRequest();
        if ($req->isPost()) {
            $id = (int) $this->getRequest()->getPost()->get('t_idspt');
            $data = $this->getTblSSPDBphtb()->getDataId($id);
            $datahistory = $this->getTblSSPDBphtb()->gethistorybphtb($data->t_nikwppembeli, $data->t_idspt, $data->t_periodespt);
            if ($data->t_idjenistransaksi == 5) {
                $show_hide_penerima_waris = "display:inherit;";
            } else {
                $show_hide_penerima_waris = "display:none;";
            }

            $data_penerimawaris = $this->getTblWaris()->CariPenerimaWaris($data->t_idspt);
            $data->t_tglprosesspt = date('d-m-Y', strtotime($data->t_tglprosesspt));
            $data->t_tglajb = date('d-m-Y', strtotime($data->t_tglajb));
            $t_luastanah = str_ireplace('.', '', $data->t_luastanah);
            $t_luasbangunan = str_ireplace('.', '', $data->t_luasbangunan);
            $data->t_luastanah = number_format(($t_luastanah / 100), 0, ',', '.');
            $data->t_luasbangunan = number_format(($t_luasbangunan / 100), 0, ',', '.');
            $frm2 = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah(), $string, $this->populateComboNotaris(), $this->populatePersyaratanId($data->t_idjenistransaksi));
            $frm2->bind($data);
            if (!empty($data->t_tglajbbaru)) {
                $data->t_tglajbbaru = date('d-m-Y', strtotime($data->t_tglajbbaru));
                $frm2->get('t_tglajbbaru')->setValue(date('d-m-Y', strtotime($data->t_tglajbbaru)));
                $frm2->get("t_dendaspt")->setValue($data->t_dendaspt);
                $frm2->get('t_bulandendaspt')->setValue($data->t_bulandendaspt);
                $grandtotalspt = $data->t_totalspt + $data->t_dendaspt;
                $frm2->get("t_grandtotalspt")->setValue(str_ireplace(",", "", number_format($grandtotalspt)));
            } else {
                $frm2->get("t_dendaspt")->setValue(0);
                $grandtotalspt = (int) $data->t_totalspt + (int) $data->t_dendaspt;
                $frm2->get("t_grandtotalspt")->setValue(str_ireplace(",", ".", number_format($grandtotalspt)));
            }
            $frm2->get("t_terbukti")->setValue(\Zend\Json\Json::decode($data->t_terbukti));
            $frm2->get("t_persyaratan")->setValue(\Zend\Json\Json::decode($data->t_persyaratan));
        }
        $view = new ViewModel(array(
            'frm' => $frm2,
            'data' => $data->t_terbukti,
            'show_hide_combo_notaris' => $show_hide_combo_notaris,
            'datahistory' => $datahistory,
            'show_hide_penerima_waris' => $show_hide_penerima_waris,
            'data_penerimawaris' => $data_penerimawaris
        ));

        $data = array(
            'menu_pendataan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function viewdataAction() {
        $inilho = $this->tambahAction();
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $req = $this->getRequest();
        if ($req->isPost() || !empty($inilho->idsptnyan)) {
            $idne = (int) $this->getRequest()->getPost()->get('t_idspt');
            if (!empty($idne)) {
                $id = $idne;
            } else {
                $id = $inilho->idsptnyan;
            }
            $data = $this->getTblSSPDBphtb()->getDataId($id);
            $data->t_tglprosesspt = date('d-m-Y', strtotime($data->t_tglprosesspt));
            $data->t_tglajb = date('d-m-Y', strtotime($data->t_tglajb));
            $t_luastanah = str_ireplace('.', '', $data->t_luastanah);
            $t_luasbangunan = str_ireplace('.', '', $data->t_luasbangunan);
            $data->t_luastanah = number_format(($t_luastanah / 100), 0, ',', '.');
            $data->t_luasbangunan = number_format(($t_luasbangunan / 100), 0, ',', '.');
        }
        $view = new ViewModel(array(
            'datasspd' => $data,
            'role_id' => $session['s_akses']
        ));
        if ($session['s_akses'] == 6) {
            $nilainya = '6';
        }
        $data = array(
            'menu_pendataan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2,
            'nilai' => $nilainya
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function tglajbAction() {
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $req = $this->getRequest();
        $frm2 = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah());
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idspt');
            $data = $this->getTblSSPDBphtb()->getDataId($id);
            $frm2->bind($data);
        }
        $view = new ViewModel(array(
            'frm' => $frm2
        ));
        $data = array(
            'menu_pendataan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function tambahAjbBaruAction() {
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $frm = new SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah());
        if ($this->getRequest()->isPost()) {
            $base = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
            $frm->setInputFilter($base->getInputFilter());
            $frm->setData($this->getRequest()->getPost());
            if (!$frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $this->getTblSSPDBphtb()->savedatatglajbbaru($base);
                return $this->redirect()->toRoute('pendataan_sspd');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array(
            "frm" => $frm
        ));
        $menu = new \Zend\View\Model\ViewModel(array(
            'menu_pendataan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        ));
        $menu->setTemplate('bphtb/menu.phtml');
        $view->addChild($menu, 'menu');
        return $view;
    }

    // Hapus Permohonan
    // Lokasi : index Pendataan
    public function HapusAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $frm = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $kb = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
            $kb1 = new \Bphtb\Model\Pendataan\SPTBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setInputFilter($kb1->getInputFilter());
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $idspt = $req->getPost();
                $kb->exchangeArray($frm->getData());
                $kb1->exchangeArray($frm->getData());
                $this->getTblSSPDBphtb()->hapusData($kb, $session);
                $this->getTblSpt()->hapusDataSpt($kb1);
                $this->getTblSSPDBphtb()->hapusDataWaris($idspt->t_idspt);
            }
        }
        return $res;
    }

    // Mencari History Transaksi BPHTB
    // Lokasi : Tambah dan Edit Permohonan BPHTB
    public function historybphtbAction() {
        $frm = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $posnya = $req->getPost();
                $data = $this->getTblSSPDBphtb()->temukanDataHistory22($ex);
//                 if ($posnya->t_nikwppembeli == $data['t_nikpenerima']) {
//                     $data['t_namawppembeli'] = $data['t_namapenerima'];
//                     $data['t_alamatpembeli'] = $data['t_alamatpenerima'];
//                     $data['t_npwpwppembeli'] = '';
//                     $data['t_rtwppembeli'] = '';
//                     $data['t_rwwppembeli'] = '';
//                     $data['t_kelurahanwppembeli'] = '';
//                     $data['t_kecamatanwppembeli'] = '';
//                     $data['t_kabkotawppembeli'] = '';
//                     $data['t_kodeposwppembeli'] = '';
//                     $data['t_telponwppembeli'] = '';
//                 }
                $data_table = $this->getTblSSPDBphtb()->temukanDataHistory2($ex);
                $html = "<table class='table table-striped'>";
                $html .= "<tr>";
                $html .= "<th>NOP</th>";
                $html .= "<th>NPOP</th>";
                $html .= "<th>NPOPTKP</th>";
                $html .= "<th>NPOPKP</th>";
                $html .= "<th>Tanggal Bayar</th>";
                $html .= "<th>Jumlah Pembayaran</th>";
                $html .= "</tr>";
                foreach ($data_table as $row) {
                    $npopkp = $row['t_totalspt'] * 100 / 5;
                    if ($row['t_nilaitransaksispt'] > $row['t_grandtotalnjop']) {
                        $npop = $row['t_nilaitransaksispt'];
                    } else {
                        $npop = $row['t_grandtotalnjop'];
                    }
                    $html .= "<tr>";
                    $html .= "<td> " . $row['t_nopbphtbsppt'] . "-" . $row['t_thnsppt'] . " </td>";
                    $html .= "<td> " . number_format($npop, 0, ',', '.') . " </td>";
                    $html .= "<td> " . number_format($row['t_potonganspt'], 0, ',', '.') . " </td>";
                    $html .= "<td> " . number_format($npopkp, 0, ',', '.') . " </td>";
                    if (empty($row['t_tanggalpembayaran'])) {
                        $html .= "<td></td>";
                    } else {
                        $html .= "<td> " . date('d-m-Y', strtotime($row['t_tanggalpembayaran'])) . " </td>";
                    }
                    $html .= "<td> " . number_format($row['t_nilaipembayaranspt'], 0, ',', '.') . " </td>";
                    $html .= "</tr>";
                }
                $html .= "</table>";

                $data['raw_return'] = $html;

                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    // Mencari Nilai NOP dari database PBB
    // Lokasi : Permohonan SSPD
    public function datanopAction() {
        $frm = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pendataan\SPPTBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data = $this->getTblSPPT()->temukanData($ex);
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    public function TampilPersyaratanAction() {
        $frm = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data_table = $this->getTblSSPDBphtb()->temukanPersyaratan($req->getPost());
                $countpersyaratan = $this->getTblSSPDBphtb()->temukanJmlPersyaratan($req->getPost());
                $i = 1;
                $html = "<div>";
                $html .= "<div class='col-sm-12'>
                              <div class='form-group'>
                                 <span  class='col-sm-2'></span>
                                    <div class='col-sm-3'>
                                        <input type='checkbox' id='CheckAll' name='CheckAll' onClick='modify_boxes($countpersyaratan)'> <span style='color:green'>Centang Semua</span>
                                    </div>
                              </div>
                          </div>";
                foreach ($data_table as $row) {
                    $html .= "<div class='col-sm-12'>
                              <div class='form-group'><label class='col-sm-2 control-label'></label>";
                    $html .= "<div class='col-sm-10'>";
                    $html .= "<input id='t_persyaratan' name='t_persyaratan[]' type='checkbox' value='" . $row['s_idpersyaratan'] . "'>  ";
                    $html .= $row['s_namapersyaratan'];
                    $html .= "</div>";
                    $html .= "</div>";
                    $html .= "</div>";
                    $i ++;
                }
                $html .= "</div>";

                $data['raw_return'] = $html;

                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    public function populateComboJenisTransaksi() {
        $data = $this->getTblJenTran()->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idjenistransaksi] = $row->s_kodejenistransaksi . " || " . $row->s_namajenistransaksi;
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

    public function getTblSSPDBphtb() {
        if (!$this->tbl_sspd) {
            $sm = $this->getServiceLocator();
            $this->tbl_sspd = $sm->get("SSPDBphtbTable");
        }
        return $this->tbl_sspd;
    }

    public function getTblWaris() {
        if (!$this->tbl_sspdwaris) {
            $sm = $this->getServiceLocator();
            $this->tbl_sspdwaris = $sm->get("SPTWarisTable");
        }
        return $this->tbl_sspdwaris;
    }

    public function getTblSpt() {
        if (!$this->tbl_spt) {
            $sm = $this->getServiceLocator();
            $this->tbl_spt = $sm->get("SPTTable");
        }
        return $this->tbl_spt;
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

    public function getTblDokTan() {
        if (!$this->tbl_doktanah) {
            $sm = $this->getServiceLocator();
            $this->tbl_doktanah = $sm->get('DokTanahTable');
        }
        return $this->tbl_doktanah;
    }

    public function getTblSPPT() {
        if (!$this->tbl_nop) {
            $sm = $this->getServiceLocator();
            $this->tbl_nop = $sm->get('SPPTTable');
        }
        return $this->tbl_nop;
    }

    public function getNotaris() {
        if (!$this->tbl_notaris) {
            $sm = $this->getServiceLocator();
            $this->tbl_notaris = $sm->get('NotarisBphtbTable');
        }
        return $this->tbl_notaris;
    }

    public function getTblPersyaratan() {
        if (!$this->tbl_persyaratan) {
            $sm = $this->getServiceLocator();
            $this->tbl_persyaratan = $sm->get('PersyaratanTable');
        }
        return $this->tbl_persyaratan;
    }

    // ============================ cetak data pendaftaran
    public function cetakdatapendaftaranAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $sm = $this->getServiceLocator();
        $this->tbl_sspd = $sm->get("SSPDTable");
        $req = $this->getRequest();
        if ($req->isGet()) {
            $data_get = $req->getQuery();
            $ar_DataVerifikasi = $this->tbl_sspd->getDataPendaftaran($data_get->periode_spt, $data_get->tgl_verifikasi1, $data_get->tgl_verifikasi2, $session['s_akses'], $data_get->t_idnotarisspt);
            $ar_tglcetak = $data_get->tgl_cetak;
            $ar_periodespt = $data_get->periode_spt;
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
            $ar_pemda = $this->tbl_pemda->getdata();
            $pdf = new \Zend\View\Model\ViewModel();
            $pdf->setVariables(array(
                'data_Verifikasi' => $ar_DataVerifikasi,
                'tgl_cetak' => $ar_tglcetak,
                'periode_spt' => $ar_periodespt,
                'tgl_pendaftaran1' => $data_get->tgl_verifikasi1,
                'tgl_pendaftaran2' => $data_get->tgl_verifikasi2,
                'nama_login' => $session['s_namauserrole'],
                'ar_pemda' => $ar_pemda,
                'nilai' => '1'
            ));
            $data = array('nilai' => '1');
            $this->layout()->setVariables($data);
            return $pdf;
        }
    }

    public function formcetakdatapendaftaranAction() {
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $show_hide_combo_notaris = "display:none;";
        $frm = new SSPDFrm(null, null, null, null, $this->populateComboNotaris());
        if ($session['s_namauserrole'] == "Administrator" || $session['s_namauserrole'] == "Pegawai") {
            $show_hide_combo_notaris = "";
        } else
        if ($session['s_namauserrole'] == "Notaris") {
            $show_hide_combo_notaris = "display:none;";
        }
        $view = new ViewModel(array(
            'frm' => $frm,
            'show_hide_combo_notaris' => $show_hide_combo_notaris
        ));
        $data = array(
            'menu_pendataan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    // ============================ end cetak data pendaftaran
    // ============================ cetak data status berkas
    public function formcetakdatastatusberkasAction() {
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $show_hide_combo_notaris = "display:none;";
        $frm = new SSPDFrm(null, null, null, null, $this->populateComboNotaris());
        if ($session['s_namauserrole'] == "Administrator" || $session['s_namauserrole'] == "Pegawai") {
            $show_hide_combo_notaris = "";
        } else
        if ($session['s_namauserrole'] == "Notaris") {
            $show_hide_combo_notaris = "display:none;";
        }
        $view = new ViewModel(array(
            'frm' => $frm,
            'show_hide_combo_notaris' => $show_hide_combo_notaris
        ));
        $data = array(
            'menu_pendataan' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function cetakdatastatusberkasAction() {
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $sm = $this->getServiceLocator();
        $this->tbl_sspd = $sm->get("SSPDTable");
        $this->tbl_sspdsyarat = $sm->get("SSPDBphtbTable");
        $req = $this->getRequest();
        if ($req->isGet()) {
            $data_get = $req->getQuery();
            $ar_DataVerifikasi = $this->tbl_sspd->getDataStatusBerkas($data_get->periode_spt, $data_get->tgl_verifikasi1, $data_get->tgl_verifikasi2, $session['s_akses'], $data_get->t_idnotarisspt);
            $ar_tglcetak = $data_get->tgl_cetak;
            $ar_periodespt = $data_get->periode_spt;
            $this->tbl_pemda = $sm->get("PemdaTable");
            $ar_pemda = $this->tbl_pemda->getdata();
            $datahasil = array();
            foreach ($ar_DataVerifikasi as $key => $v) {
                // array_push($datahasil, $v);
                $result_array_syarat = \Zend\Json\Json::decode($v['t_persyaratan']);
                $jml_syarat = count($result_array_syarat);
                $result_array_verifikasi = \Zend\Json\Json::decode($v['t_verifikasispt']);
                $jml_verifikasi = count($result_array_verifikasi);
                $cektabelpersyaratan = $this->tbl_sspdsyarat->jumlahsyarat($v['t_idjenistransaksi']);
                if ($jml_syarat == $cektabelpersyaratan) {
                    $v['ceksyarat'] = 1;
                } else {
                    $v['ceksyarat'] = 2;
                }

                if ($jml_syarat == $jml_verifikasi) {
                    $v['cekverifikasi'] = 1;
                } else {
                    if (empty($v['t_verifikasispt'])) {
                        $v['cekverifikasi'] = 3;
                    } else {
                        $v['cekverifikasi'] = 2;
                    }
                }
                array_push($datahasil, $v);
            }
            $pdf = new ViewModel();
            $pdf->setVariables(array(
                'data_Verifikasi' => $datahasil,
                'tgl_cetak' => $ar_tglcetak,
                'periode_spt' => $ar_periodespt,
                'tgl_pendaftaran1' => $data_get->tgl_verifikasi1,
                'tgl_pendaftaran2' => $data_get->tgl_verifikasi2,
                'nama_login' => $session['s_namauserrole'],
                'ar_pemda' => $ar_pemda
            ));
            $data = array('nilai' => '1');
            $this->layout()->setVariables($data);
            return $pdf;
        }
    }

    // Semua Penghitungan BPHTB dari 13 Transaksi
    public function hitungBphtbAction() {
        $frm = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data = $this->getTblSSPDBphtb()->temukanDataNPOPTKP($ex);
                $data_wp_exist = $this->getTblSSPDBphtb()->temukanDataHistory($ex);
                if ($data_wp_exist > 0) {
                    $t_potonganspt = 0;
                }
                $t_npopspt = str_ireplace(".", "", $ex->t_npopspt);
                $t_persenbphtb = str_ireplace(".", "", $ex->t_persenbphtb);
                if ($t_potonganspt == '0') {
                    $data['t_potonganspt'] = 0;
                    $data['t_npopkpspt'] = $t_npopspt;
                    if ($ex->t_idjenistransaksi == 4 || $ex->t_idjenistransaksi == 5) {
                        $data_waris = $this->getTblSSPDBphtb()->temukanhistorywaris($ex);
                        if ($data_waris) {
                            $data['t_potonganspt'] = 300000000;
                            $data['t_npopkpspt'] = $t_npopspt - $data['t_potonganspt'];
                            $data['t_totalspt'] = $data['t_npopkpspt'] * $t_persenbphtb / 100; // Waris dikurangi 50%
                        } else {
                            $data['t_totalspt'] = $data['t_npopkpspt'] * $t_persenbphtb / 100; // hibah wasiat dikurangi 50%
                        }
                    } else {
                        $data['t_totalspt'] = $data['t_npopkpspt'] * $t_persenbphtb / 100;
                    }

                    if ($data['t_npopkpspt'] <= 0) {
                        $data['t_npopkpspt'] = 0;
                        $data['t_totalspt'] = 0;
                    }
                } else {
                    $data['t_potonganspt'] = $data['s_tarifnpotkp'];
                    $npop = $t_npopspt;
                    $npopkp = $npop - $data['t_potonganspt'];
                    if ($npopkp <= 0) {
                        $data['t_npopkpspt'] = 0;
                        $data['t_totalspt'] = 0;
                    } else {
                        $data['t_npopkpspt'] = $npopkp;
                        if ($ex->t_idjenistransaksi == 4 || $ex->t_idjenistransaksi == 5) {
                            $data['t_potonganspt'] = 300000000;
                            $npopkp = $npop - $data['t_potonganspt'];
                            $data['t_npopkpspt'] = $npopkp;
                            $data['t_totalspt'] = $data['t_npopkpspt'] * $t_persenbphtb / 100; // untuk waris dan hibah wasiat dikurangi 50%
                        } else {
                            $data['t_totalspt'] = $data['t_npopkpspt'] * $t_persenbphtb / 100;
                        }
                    }
                    if ($data['t_npopkpspt'] <= 0) {
                        $data['t_npopkpspt'] = 0;
                        $data['t_totalspt'] = 0;
                    }
                }
                if (!empty($ex->t_tglajbbaru)) {
                    if (date("Y-m-d", strtotime($ex->t_tglprosesspt)) > date("Y-m-d", strtotime($ex->t_tglajbbaru))) {
                        $begin = new \DateTime(date("Y-m-d", strtotime($ex->t_tglprosesspt)));
                        $end = new \DateTime(date("Y-m-d", strtotime($ex->t_tglajbbaru)));

                        $bulan_denda1 = $end->diff($begin)->days;
                        $bulan_denda = ceil($bulan_denda1 / 30);


                        $begin_case1 = date("Y-m-d", strtotime($ex->t_tglprosesspt));
                        $end_case2 = date("Y-m-d", strtotime("+$bulan_denda month ", strtotime($ex->t_tglajbbaru)));

                        if ($end_case2 <= $begin_case1) {
                            $bulan_denda = $bulan_denda + 1;
                        }

                        if ($bulan_denda >= 24) {
                            $bulan_denda = 24;
                        }

                        $denda = $data['t_totalspt'] / 100 * $bulan_denda * 2;
                        $data['t_dendaspt'] = $denda;
                        $data['t_bulandendaspt'] = $bulan_denda;
                    } else {
                        $data['t_dendaspt'] = 0;
                        $data['t_bulandendaspt'] = 0;
                    }
                } else {
                    $data['t_dendaspt'] = 0;
                    $data['t_bulandendaspt'] = 0;
                }


                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    // Menghitung nilai njop pbb
    public function hitungnjopAction() {
        $frm = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $t_luastanah = str_ireplace(".", "", $ex->t_luastanah);
                $t_njoptanah = str_ireplace(".", "", $ex->t_njoptanah);
                $t_luasbangunan = str_ireplace(".", "", $ex->t_luasbangunan);
                $t_njopbangunan = str_ireplace(".", "", $ex->t_njopbangunan);

                $t_totalnjoptanah = $t_luastanah * $t_njoptanah;
                $t_totalnjopbangunan = $t_luasbangunan * $t_njopbangunan;
                $t_grandtotalnjop = $t_totalnjoptanah + $t_totalnjopbangunan;
                $data = array(
                    "t_totalnjoptanah" => $t_totalnjoptanah,
                    "t_totalnjopbangunan" => $t_totalnjopbangunan,
                    "t_grandtotalnjop" => $t_grandtotalnjop
                );
                if ($ex->t_idjenistransaksi != 1 || $ex->t_idjenistransaksi != 8) {
                    $data["t_nilaitransaksispt"] = $t_grandtotalnjop;
                }
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    public function informasiopAction() {
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $Pencetak = $this->getTblPejabat()->getdata();
        $frm = new SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah(), null, $this->populateComboNotaris());
        $view = new ViewModel(array(
            'frm' => $frm,
            'Pencetak' => $Pencetak
        ));
        $data = array(
            'menu_informasiop' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function cariinformasiopAction() {
        $frm = new \Bphtb\Form\Pendataan\SSPDFrm($this->populateComboJenisTransaksi(), $this->populateComboHakTanah(), $this->populateComboDokTanah());
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Bphtb\Model\Pendataan\SPPTBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data_table = $this->getTblSPPT()->temukanDataInfoop($ex);
                $html = "<div class='row'>
                         <div class='col-md-12'>
                         <div id='callout-navbar-overflow' class='bs-callout bs-callout-warning'>
                         <div class='form-group col-md-12'>
                            <label class='col-md-2' style='text-align: left;'>Nama SPPT</label>
                            <div class='col-md-3'> " . $data_table['NM_WP_SPPT'] . "</div>
                         </div>";
                $html .= "<div class='form-group col-md-12'>
                            <label class='col-md-2' style='text-align: left;'>Letak</label>
                            <div class='col-md-3'> " . $data_table['JALAN_OP'] . "</div>
                            <label class='col-md-2' style='text-align: left;'>RT/RW</label>
                            <div class='col-md-3'> " . $data_table['RT_OP'] . " / " . $data_table['RW_OP'] . "</div>
                         </div>";
                $html .= "<div class='form-group col-md-12'>
                            <label class='col-md-2' style='text-align: left;'>Kelurahan</label>
                            <div class='col-md-3'> " . $data_table['NM_KELURAHAN'] . "</div>
                            <label class='col-md-2' style='text-align: left;'>Kecamatan</label>
                            <div class='col-md-3'> " . $data_table['NM_KECAMATAN'] . "</div>
                         </div>";
                $html . "<hr>";
                $html .= "<div class='form-group col-md-12'>
                            <label class='col-md-2' style='text-align: left;'>Luas Tanah</label>
                            <div class='col-md-3'> " . $data_table['LUAS_BUMI_SPPT'] . "</div>  
                            <label class='col-md-2' style='text-align: left;'>NJOP Tanah</label>
                            <div class='col-md-3'> " . number_format($data_table['NILAI_PER_M2_TANAH'] * 1000, 0, ',', '.') . "</div>
                         </div>";
                $html .= "<div class='form-group col-md-12'>
                            <label class='col-md-2' style='text-align: left;'>Luas Bangunan</label>
                            <div class='col-md-3'> " . $data_table['LUAS_BNG_SPPT'] . "</div>
                            <label class='col-md-2' style='text-align: left;'>NJOP Bangunan</label>
                            <div class='col-md-3'> " . number_format($data_table['NILAI_PER_M2_BNG'] * 1000, 0, ',', '.') . "</div>
                         </div></div></div> </div>";

                $data_tunggakan = $this->getTblSPPT()->temukanDataTunggakanop($ex);
                $html .= "<div class='row'>
                          <div class='col-md-12'>
                          <div class='panel panel-primary table-responsive no-padding'>
                          <div class='panel-heading'><strong>Tunggakan SPPT-PBB</strong></div>
                          <table class='table table-striped table-bordered table-responsive' style='border-color: black'>";
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
                    $html .= "<td style='border-color:black; text-align:center'> " . number_format($row['PBB_YG_HARUS_DIBAYAR_SPPT'], 0, ',', '.') . " </td>";
                    $html .= "<td style='border-color:black; text-align:center'> " . $row['JATUH_TEMPO'] . " </td>";
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
                $data['infoop'] = $html;
                $res->setContent(\Zend\Json\Json::encode($data));
            }
        }
        return $res;
    }

    public function cetaktunggakanpbbAction() {
        $frm = new \Bphtb\Form\Pencetakan\SSPDFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $base = new \Bphtb\Model\Pencetakan\SSPDBase();
            $frm->setData($req->getQuery());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $data_get = $req->getQuery();
                $datapbb = $this->getTblSPPT()->temukanDataInfoopcetak($data_get);
                $data_tunggakan = $this->getTblSPPT()->temukanDataTunggakanopcetak($data_get);
                $Pencetak = $this->getTblPejabat()->getdataid($data_get->Pencetak);
            }
        }
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'ValidasiPembayaran');
        $pdf->setOption('paperSize', 'legal');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'nop' => $data_get->t_nopbphtbspptinfoop,
            'datapbb' => $datapbb,
            'data_tunggakan' => $data_tunggakan,
            'Pencetak' => $Pencetak
        ));
        return $pdf;
    }

    public function sismiopAction() {
        $ar_pemda = $this->getPemda()->getdata();
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $view = new ViewModel();
        $menu = new ViewModel(array(
            'menu_sismiop' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda
        ));
        $menu->setTemplate('bphtb/menu.phtml');
        $view->addChild($menu, 'menu');
        return $view;
    }

    public function dataGridSismiopAction() {
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $res = $this->getResponse();
        $page = $this->getRequest()->getPost('page') ? $this->getRequest()->getPost('page') : 1;
        $rp = $this->getRequest()->getPost('rp') ? $this->getRequest()->getPost('rp') : 10;
        $sortname = $this->getRequest()->getPost('sortname') ? $this->getRequest()->getPost('sortname') : 't_kohirspt';
        $sortorder = $this->getRequest()->getPost('sortorder') ? $this->getRequest()->getPost('sortorder') : 'desc';
        $query = $this->getRequest()->getPost('query') ? $this->getRequest()->getPost('query') : false;
        $qtype = $this->getRequest()->getPost('qtype') ? $this->getRequest()->getPost('qtype') : false;
        $count = $this->getTblSSPDBphtb()->getGridCountSismiop($query, $qtype);
        $start = (($page - 1) * $rp);
        $res->getHeaders()->addheaders(array(
            'Content-type' => 'text/xml'
        ));
        $s = "<?xml version='1.0' encoding='utf-8'?>";
        $s .= "<rows>";
        $s .= "<page>" . $page . "</page>";
        $s .= "<total>" . $count . "</total>";
        $s .= "<records>" . $count . "</records>";
        $data = $this->getTblSSPDBphtb()->getGridDataSismiop($sortname, $sortorder, $query, $qtype, $start, $rp);
        foreach ($data as $row) {
            $s .= "<row id='" . $row['t_idspt'] . "'>";
            if ($row['t_inputbpn'] == true) {
                $s .= "<cell> <![CDATA[<span class='badge' style='background-color:#CC0000;'>" . str_pad($row['t_kohirspt'], 4, '0', STR_PAD_LEFT) . " </span>]]></cell>";
            } else {
                $s .= "<cell>" . str_pad($row['t_kohirspt'], 4, '0', STR_PAD_LEFT) . "</cell>";
            }
            $s .= "<cell>" . $row['t_periodespt'] . "</cell>";
            $s .= "<cell>" . date('d-m-Y', strtotime($row['t_tglprosesspt'])) . "</cell>";
            $s .= "<cell>" . $row['t_namawppembeli'] . "</cell>";
            if (!empty($row['p_idpemeriksaan'])) {
                $s .= "<cell>" . number_format($row['p_totalspt'], 0, ',', '.') . "</cell>";
            } else {
                $s .= "<cell>" . number_format($row['t_totalspt'], 0, ',', '.') . "</cell>";
            }

            $s .= "<cell>" . $row['s_namajenistransaksi'] . "</cell>";
            if (!empty($row['t_tglajbbaru']) && !empty($row['t_noajbbaru'])) {
                $s .= "<cell>" . $row['t_noajbbaru'] . "/" . date('d-m-Y', strtotime($row['t_tglajbbaru'])) . " </cell>";
            } else {
                $s .= "<cell></cell>";
            }
            $s .= "<cell><![CDATA[<a href='cetak_sspd/cetaksspdbphtb?&action=cetaksspd&t_idspt=$row[t_idspt]' target='_blank'>SSPD</a>]]></cell>";
            $s .= "</row>";
        }
        $s .= "</rows>";
        $res->setContent($s);
        return $res;
    }

    public function cetakpermohonanpenelitianAction() {
        $frm = new \Bphtb\Form\Pencetakan\SSPDFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $base = new \Bphtb\Model\Pencetakan\SSPDBase();
            $frm->setData($req->getQuery());
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $data_get = $req->getQuery();
                $ar_sspd = $this->getSSPD()->getdatapenelitian($data_get);
                $ar_pemda = $this->getPemda()->getdata();
            }
        }
        $pdf = new \DOMPDFModule\View\Model\PdfModel();
        $pdf->setOption('filename', 'PermohonanPenelitian');
        $pdf->setOption('paperSize', 'A4');
        $pdf->setOption('paperOrientation', 'potrait');
        $pdf->setVariables(array(
            'data_sspd' => $ar_sspd,
            'data_pemda' => $ar_pemda,
            'tgl_cetak' => $data_get->tgl_cetak_penelitian
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

    public function getTblPejabat() {
        if (!$this->tbl_pejabat) {
            $sm = $this->getServiceLocator();
            $this->tbl_pejabat = $sm->get("PejabatBphtbTable");
        }
        return $this->tbl_pejabat;
    }

}
