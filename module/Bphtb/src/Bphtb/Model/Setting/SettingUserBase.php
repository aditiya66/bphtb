<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SettingUserBase implements InputFilterAwareInterface {

    public $s_iduser;
    public $s_username;
    public $s_password;
    public $s_akses;
    public $s_jabatan;
    public $s_tipe_pejabat;
    public $s_idpejabat_idnotaris;
    //Controller selain dalam menu setting
    public $s_standart, $s_pendataansspd, $s_verifikasisspd, $s_pembayaransspd, $s_bpn, $s_cetaklaporan, $s_cetaksspd, $s_pelaporannotaris;
    //Controller menu Setting
    public $s_doktanah, $s_haktanah, $s_jenistransaksi, $s_notaris, $s_pejabat, $s_pemda, $s_persyaratantransaksi,
            $s_tarifbphtb, $s_tarifnpoptkp, $s_user, $s_hargaacuan, $s_pendataanpbb, $s_koreksi, $s_monitoring, $s_historylog;
    public $s_kecamatan, $s_kelurahan, $s_target;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_iduser = (isset($data['s_iduser'])) ? $data['s_iduser'] : null;
        $this->s_username = (isset($data['s_username'])) ? $data['s_username'] : null;
        $this->s_password = (isset($data['s_password'])) ? $data['s_password'] : null;
        $this->s_jabatan = (isset($data['s_jabatan'])) ? $data['s_jabatan'] : null;
        $this->s_akses = (isset($data['s_akses'])) ? $data['s_akses'] : null;
        $this->s_tipe_pejabat = (isset($data['s_tipe_pejabat'])) ? $data['s_tipe_pejabat'] : null;
        $this->s_idpejabat_idnotaris = (isset($data['s_idpejabat_idnotaris'])) ? $data['s_idpejabat_idnotaris'] : null;

        $this->s_standart = (isset($data['s_standart'])) ? $data['s_standart'] : null;
        $this->s_pendataansspd = (isset($data['s_pendataansspd'])) ? $data['s_pendataansspd'] : null;
        $this->s_verifikasisspd = (isset($data['s_verifikasisspd'])) ? $data['s_verifikasisspd'] : null;
        $this->s_pembayaransspd = (isset($data['s_pembayaransspd'])) ? $data['s_pembayaransspd'] : null;
        $this->s_bpn = (isset($data['s_bpn'])) ? $data['s_bpn'] : null;
        $this->s_cetaklaporan = (isset($data['s_cetaklaporan'])) ? $data['s_cetaklaporan'] : null;
        $this->s_cetaksspd = (isset($data['s_cetaksspd'])) ? $data['s_cetaksspd'] : null;
        $this->s_pelaporannotaris = (isset($data['s_pelaporannotaris'])) ? $data['s_pelaporannotaris'] : null;
        $this->s_doktanah = (isset($data['s_doktanah'])) ? $data['s_doktanah'] : null;
        $this->s_haktanah = (isset($data['s_haktanah'])) ? $data['s_haktanah'] : null;
        $this->s_jenistransaksi = (isset($data['s_jenistransaksi'])) ? $data['s_jenistransaksi'] : null;
        $this->s_notaris = (isset($data['s_notaris'])) ? $data['s_notaris'] : null;
        $this->s_pejabat = (isset($data['s_pejabat'])) ? $data['s_pejabat'] : null;
        $this->s_pemda = (isset($data['s_pemda'])) ? $data['s_pemda'] : null;
        $this->s_persyaratantransaksi = (isset($data['s_persyaratantransaksi'])) ? $data['s_persyaratantransaksi'] : null;
        $this->s_tarifbphtb = (isset($data['s_tarifbphtb'])) ? $data['s_tarifbphtb'] : null;
        $this->s_tarifnpoptkp = (isset($data['s_tarifnpoptkp'])) ? $data['s_tarifnpoptkp'] : null;
        $this->s_user = (isset($data['s_user'])) ? $data['s_user'] : null;
        $this->s_hargaacuan = (isset($data['s_hargaacuan'])) ? $data['s_hargaacuan'] : null;
        $this->s_pendataanpbb = (isset($data['s_pendataanpbb'])) ? $data['s_pendataanpbb'] : null;
        $this->s_koreksi = (isset($data['s_koreksi'])) ? $data['s_koreksi'] : null;
        $this->s_monitoring = (isset($data['s_monitoring'])) ? $data['s_monitoring'] : null;
        $this->s_historylog = (isset($data['s_historylog'])) ? $data['s_historylog'] : null;
        $this->s_kecamatan = (isset($data['s_kecamatan'])) ? $data['s_kecamatan'] : null;
        $this->s_kelurahan = (isset($data['s_kelurahan'])) ? $data['s_kelurahan'] : null;
        $this->s_target = (isset($data['s_target'])) ? $data['s_target'] : null;

        $this->combocari = (isset($data['combocari'])) ? $data['combocari'] : null;
        $this->kolomcari = (isset($data['kolomcari'])) ? $data['kolomcari'] : null;
        $this->combosorting = (isset($data['combosorting'])) ? $data['combosorting'] : null;
        $this->sortasc = (isset($data['sortasc'])) ? $data['sortasc'] : null;
        $this->sortdesc = (isset($data['sortdesc'])) ? $data['sortdesc'] : null;
        $this->combooperator = (isset($data['combooperator'])) ? $data['combooperator'] : null;
        $this->direction = (isset($data['direction'])) ? $data['direction'] : null;
        $this->page = (isset($data['page'])) ? $data['page'] : null;
        $this->rows = (isset($data['rows'])) ? $data['rows'] : null;
        $this->sidx = (isset($data['sidx'])) ? $data['sidx'] : null;
        $this->sord = (isset($data['sord'])) ? $data['sord'] : null;
    }

    public function getArrayCopy() {
        return get_object_vars($this);
    }

    public function setInputFilter(InputFilterInterface $inputFilter) {
        throw new \Exception("Not used");
    }

    public function getInputFilter() {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            $factory = new InputFactory();
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 'combocari',
                        'required' => false
            )));
            $inputFilter->add($factory->createInput(array(
                        'name' => 'kolomcari',
                        'required' => false
            )));
            $inputFilter->add($factory->createInput(array(
                        'name' => 'combosorting',
                        'required' => false
            )));
            $inputFilter->add($factory->createInput(array(
                        'name' => 'sortasc',
                        'required' => false
            )));
            $inputFilter->add($factory->createInput(array(
                        'name' => 'sortdesc',
                        'required' => false
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_akses',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_tipe_pejabat',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_idpejabat_idnotaris',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_username',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_password',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_jabatan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_pass2',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pendataansspd',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_verifikasisspd',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pembayaransspd',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_bpn',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_cetaklaporan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_cetaksspd',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pelaporannotaris',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_doktanah',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_haktanah',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_jenistransaksi',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_notaris',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pejabat',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pemda',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_persyaratantransaksi',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_tarifbphtb',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_tarifnpoptkp',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_user',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_hargaacuan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pendataanpbb',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_koreksi',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_kecamatan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_kelurahan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_target',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_monitoring',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_historylog',
                        'required' => false
            )));
            $this->inputFilter = $inputFilter;
        }

        return $this->inputFilter;
    }

}
