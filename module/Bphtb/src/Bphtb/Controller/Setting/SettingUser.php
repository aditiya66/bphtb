<?php

namespace Bphtb\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Bphtb\Form\Setting\PenggunaFrm;
use Bphtb\Model\Setting\SettingUserBase;

class SettingUser extends AbstractActionController {

    protected $tbl_pemda, $tbl_user, $tbl_permission, $tbl_role_permission, $tbl_Settinguser;

    public function indexAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $form = new PenggunaFrm($this->gettbl()->getRole(), array());
        $view = new ViewModel(array(
            'form' => $form
        ));
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_pengguna' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Bphtb\Model\Setting\SettingUserBase();
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
            $s .= "<td>" . $row['s_username'] . "</td>";
            $s .= "<td>" . $row['s_jabatan'] . "</td>";
            $s .= "<td><center><a href='setting_user_bphtb/edit?s_iduser=$row[s_iduser]' class='btn btn-warning btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_iduser'] . ");return false;' class='btn btn-danger btn-xs btn-flat' style='width:65px'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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
        $frm = new PenggunaFrm($this->gettbl()->getRole(), array(), null, null, null, $this->getResource(1), $this->getResource(14), $this->getResource(17), $this->getResource(15), $this->getResource(20), $this->getResource(19), $this->getResource(18), $this->getResource(23), $this->getResource(22), $this->getResource(10), $this->getResource(8), $this->getResource(7), $this->getResource(6), $this->getResource(3), $this->getResource(21), $this->getResource(12), $this->getResource(9), $this->getResource(13), $this->getResource(24), $this->getResource(25), $this->getResource(26), $this->getResource(27), $this->getResource(28), $this->getResource(4), $this->getResource(5), $this->getResource(29));
        $req = $this->getRequest();
        if ($req->isPost()) {
            $bs = new SettingUserBase();
            $frm->setInputFilter($bs->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $bs->exchangeArray($frm->getData());
                $data = $this->gettbl()->saveData($bs);
                $this->gettbl()->deleteResourcePermision($data->s_iduser);
                $bs->s_akses = array_merge((array) $bs->s_pendataansspd, (array) $bs->s_verifikasisspd);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pembayaransspd);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_bpn);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_cetaklaporan);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_cetaksspd);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pelaporannotaris);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_doktanah);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_haktanah);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_jenistransaksi);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_notaris);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pejabat);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pemda);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_persyaratantransaksi);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_tarifbphtb);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_tarifnpoptkp);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_user);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_standart);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_hargaacuan);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pendataanpbb);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_koreksi);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_monitoring);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_historylog);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_kecamatan);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_kelurahan);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_target);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $this->gettbl()->getPermissionAcc());
                foreach ($bs->s_akses as $row => $rw) {
                    $this->gettbl()->saveresourcepermission($data->s_iduser, $rw);
                }
                $this->gettbl()->savesession($session);
                return $this->redirect()->toRoute('setting_user_bphtb');
            }
        }
        $view = new ViewModel(array(
            'frm' => $frm
        ));
        $ar_pemda = $this->getPemda()->getdata();
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_pengguna' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function editAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_iduser');
            // $id = (int) $req->getQuery()->get('s_id');
            $data = $this->gettbl()->getUserId($id);
            $data_role = $this->gettbl()->getResourcePermision($id);
            if ($data->s_tipe_pejabat == 1) {
                $datacombo = $this->comboPejabat();
            } else {
                $datacombo = $this->comboNotaris();
            }
            $frm = new PenggunaFrm($this->gettbl()->getRole(), $datacombo, null, null, null, $this->getResource(1), $this->getResource(14), $this->getResource(17), $this->getResource(15), $this->getResource(20), $this->getResource(19), $this->getResource(18), $this->getResource(23), $this->getResource(22), $this->getResource(10), $this->getResource(8), $this->getResource(7), $this->getResource(6), $this->getResource(3), $this->getResource(21), $this->getResource(12), $this->getResource(9), $this->getResource(13), $this->getResource(24), $this->getResource(25), $this->getResource(26), $this->getResource(27), $this->getResource(28), $this->getResource(4), $this->getResource(5), $this->getResource(29));
            $frm->bind($data);
            $jsonrole = \Zend\Json\Json::encode($data_role);
            $frm->get("s_pendataansspd")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_verifikasisspd")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pembayaransspd")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_bpn")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_cetaklaporan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_cetaksspd")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pelaporannotaris")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_doktanah")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_haktanah")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_jenistransaksi")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_notaris")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pejabat")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pemda")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_persyaratantransaksi")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_tarifbphtb")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_tarifnpoptkp")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_user")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_standart")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_hargaacuan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pendataanpbb")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_koreksi")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_monitoring")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_historylog")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_kecamatan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_kelurahan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_target")->setValue(\Zend\Json\Json::decode($jsonrole));
        }
        $view = new ViewModel(array(
            'frm' => $frm
        ));
        $ar_pemda = $this->getPemda()->getdata();
        $data = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_pengguna' => 'active',
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

    public function ubahpassAction() {
        $session = $this->getServiceLocator()
                ->get('EtaxService')
                ->getStorage()
                ->read();
        $data = $this->gettbl()->getUserId($session['s_iduser']);
        $frm = new PenggunaFrm();
        $frm->bind($data);
        if ($this->getRequest()->isPost()) {
            $bs = new SettingUserBase();
            $frm2 = new PenggunaFrm();
            $frm2->setInputFilter($bs->getInputFilter());
            $frm2->setData($this->getRequest()
                            ->getPost());
            if (!$frm2->isValid()) {
                $bs->exchangeArray($frm2->getData());
                $this->gettbl()->savepassword($bs);
            }
        }
        $view = new ViewModel(array(
            'frm' => $frm
        ));
        $ar_pemda = $this->getPemda()->getdata();
        $datane = array(
            'menu_setting' => 'active',
            'side_setting' => 'active',
            'side_password_pengguna' => 'active',
            'role_id' => $session['s_akses'],
            'data_pemda' => $ar_pemda,
            'aturgambar' => 2
        );
        $this->layout()->setVariables($datane);
        return $view;
    }

    public function gettbl() {
        if (!$this->tbl_user) {
            $sm = $this->getServiceLocator();
            $this->tbl_user = $sm->get('UserTable');
        }
        return $this->tbl_user;
    }

    public function gettblPermission() {
        if (!$this->tbl_permission) {
            $sm = $this->getServiceLocator();
            $this->tbl_permission = $sm->get('PermissionTable');
        }
        return $this->tbl_permission;
    }

    public function gettblRolePermission() {
        if (!$this->tbl_role_permission) {
            $sm = $this->getServiceLocator();
            $this->tbl_role_permission = $sm->get('RolePermissionTable');
        }
        return $this->tbl_role_permission;
    }

    public function getListPejabatAction() {
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $tipepjbt = $req->getPost('s_tipe_pejabat');
            if (!empty($tipepjbt)) {
                if ($tipepjbt == 1) {
                    $con = $this->getPejabat();
                } else {
                    $con = $this->getNotaris();
                }
            }
            $res->setContent($con);
        }
        return $res;
    }

    private function comboPejabat() {
        $data = $this->gettbl()->getPejabat();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['s_idpejabat']] = $row['s_namapejabat'] . " - " . $row['s_jabatanpejabat'];
        }
        return $selectData;
    }

    private function comboNotaris() {
        $data = $this->gettbl()->getNotaris();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['s_idnotaris']] = $row['s_kodenotaris'] . " - " . $row['s_namanotaris'];
        }
        return $selectData;
    }

    private function getPejabat() {
        $data = $this->gettbl()->getPejabat();
        $html = "<option value=''>Silahkan Pilih</option>";
        foreach ($data as $row) {
            $html .= "<option value='" . $row['s_idpejabat'] . "'>" . $row['s_namapejabat'] . " - " . $row['s_jabatanpejabat'] . "</option>";
        }
        return $html;
    }

    private function getNotaris() {
        $data = $this->gettbl()->getNotaris();
        $html = "<option value=''>Silahkan Pilih</option>";
        foreach ($data as $row) {
            $html .= "<option value='" . $row['s_idnotaris'] . "'>" . $row['s_kodenotaris'] . " - " . $row['s_namanotaris'] . "</option>";
        }
        return $html;
    }

    private function getResource($resourceid) {
        $data = $this->gettbl()->getPermission($resourceid);
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['id']] = ' ' . ucwords($row['alias']);
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
