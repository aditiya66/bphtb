<?php

namespace Bphtb\Controller;

# Memanggil Modul Zend

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

# Implementasi Class

class MainController extends AbstractActionController {

    public $tbl_sspd, $tbl_pembayaran, $tbl_anggaran, $s_nilaitargetanggaran1, $tbl_pelaporan, $tbl_pemda;

    public function indexAction() {
        $session = $this->getServiceLocator()->get('EtaxService')->getStorage()->read();
        $base = new \Bphtb\Model\Pendataan\SSPDBphtbBase();
        $basepem = new \Bphtb\Model\Pembayaran\PembayaranSptBase();
        $countpendataan = $this->getTblPendataan()->getJumlahPendataan($base, $session['s_iduser'], $session['s_namauserrole']);
        $countpembayaran = $this->getTblPembayaranSspd()->getJumlahPembayaran($basepem, $session['s_iduser'], $session['s_namauserrole']);
        $countverifikasi = $this->getTblPembayaranSspd()->getJumlahVerifikasi($basepem, $session['s_iduser'], $session['s_namauserrole']);
//        $countpelaporan = $this->getTblPelaporan()->getGridCount($query, $qtype, null, null);

        $ar_pemda = $this->getPemda()->getdata();
//        $jumlahtarget = $this->getTblAnggaran()->getTargetAnggaran();
        $jumlahrealisasi = $this->getTblPembayaranSspd()->getRealisasiAnggaran();
        $role_id = $session['s_akses'];
        $view = new ViewModel(array(
            'datapendataan' => $countpendataan,
            'datapembayaran' => $countpembayaran,
            'dataverifikasi' => $countverifikasi,
//            'datapelaporan' => $countpelaporan,
//            'jumlahtarget' => $jumlahtarget['s_nilaitargetanggaran1'],
            'jumlahrealisasi' => $jumlahrealisasi['sum'],
            'role_id' => $role_id,
            'data_pemda' => $ar_pemda
        ));
        $data = array(
            'menu_home' => 'active',
            'role_id' => $role_id,
            'data_pemda' => $ar_pemda,
            'aturgambar' => 1,
            'username' => $session['s_username']
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function getTblPendataan() {
        if (!$this->tbl_sspd) {
            $sm = $this->getServiceLocator();
            $this->tbl_sspd = $sm->get("SSPDBphtbTable");
        }
        return $this->tbl_sspd;
    }

    public function getTblPembayaranSspd() {
        if (!$this->tbl_pembayaran) {
            $sm = $this->getServiceLocator();
            $this->tbl_pembayaran = $sm->get('PembayaranSptTable');
        }
        return $this->tbl_pembayaran;
    }

    public function getTblPelaporan() {
        if (!$this->tbl_pelaporan) {
            $sm = $this->getServiceLocator();
            $this->tbl_pelaporan = $sm->get("PelaporanTable");
        }
        return $this->tbl_pelaporan;
    }

//    public function getTblAnggaran() {
//        if (!$this->tbl_anggaran) {
//            $sm = $this->getServiceLocator();
//            $this->tbl_anggaran = $sm->get('AnggaranSimpatdaTable');
//        }
//        return $this->tbl_anggaran;
//    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
