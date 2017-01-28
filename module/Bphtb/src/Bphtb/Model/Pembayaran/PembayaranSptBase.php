<?php

namespace Bphtb\Model\Pembayaran;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PembayaranSptBase implements InputFilterAwareInterface {

    public $t_idpembayaranspt, $t_idspt, $t_kohirpembayaran, $p_kohirskpdkb, $t_periodepembayaran, $t_tanggalpembayaran, $t_objekspt, $t_idnotaris;
    public $t_ketetapanspt, $t_nilaipembayaranspt, $t_idkorekspt, $t_kodebayarspt, $t_verifikasispt, $t_tglverifikasispt;
    public $t_pejabatverifikasispt, $t_statusbayarspt, $jenis_pembayaran, $kurangbayar, $t_periodespt, $t_namawppembeli, $t_tglprosesspt;
    public $p_idpemeriksaan;
    public $t_luastanah, $t_luasbangunan, $t_totalnjoptanah, $t_totalnjopbangunan, $t_njoptanah, $t_njopbangunan, $t_grandtotalnjop;
    public $t_nilaitransaksispt, $s_namajenistransaksi, $s_namahaktanah, $t_potonganspt;
    public $t_persyaratanverifikasi, $t_idjenistransaksi, $s_namanotaris, $t_kodebayarbanksppt, $t_nopbphtbsppt;
    public $t_kohirspt, $t_idds, $t_kodebayards, $t_jumlahds, $t_luastanahbpn, $t_luasbangunanbpn, $t_nosertifikatbaru, $t_kohirketetapanspt;
    public $t_nikwppembeli;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    public $t_dendaspt, $t_bulandendaspt, $operator;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_kohirketetapanspt = (isset($data['t_kohirketetapanspt'])) ? $data['t_kohirketetapanspt'] : null;
        $this->t_idjenistransaksi = (isset($data['t_idjenistransaksi'])) ? $data['t_idjenistransaksi'] : null;
        $this->t_persyaratanverifikasi = (isset($data['t_persyaratanverifikasi'])) ? $data['t_persyaratanverifikasi'] : null;
        $this->t_kohirspt = (isset($data['t_kohirspt'])) ? $data['t_kohirspt'] : null;
        
        $this->p_idpemeriksaan = (isset($data['p_idpemeriksaan'])) ? $data['p_idpemeriksaan'] : null;
        $this->kurangbayar = (isset($data['kurangbayar'])) ? $data['kurangbayar'] : null;
        $this->jenis_pembayaran = (isset($data['jenis_pembayaran'])) ? $data['jenis_pembayaran'] : null;
        $this->t_luastanah = (isset($data['t_luastanah'])) ? $data['t_luastanah'] : null;
        $this->t_luasbangunan = (isset($data['t_luasbangunan'])) ? $data['t_luasbangunan'] : null;
        $this->t_totalnjoptanah = (isset($data['t_totalnjoptanah'])) ? $data['t_totalnjoptanah'] : null;
        $this->t_totalnjopbangunan = (isset($data['t_totalnjopbangunan'])) ? $data['t_totalnjopbangunan'] : null;
        $this->t_njopbangunan = (isset($data['t_njopbangunan'])) ? $data['t_njopbangunan'] : null;
        $this->t_njoptanah = (isset($data['t_njoptanah'])) ? $data['t_njoptanah'] : null;
        $this->t_periodespt = (isset($data['t_periodespt'])) ? $data['t_periodespt'] : null;
        $this->t_namawppembeli = (isset($data['t_namawppembeli'])) ? $data['t_namawppembeli'] : null;
        $this->t_tglprosesspt = (isset($data['t_tglprosesspt'])) ? $data['t_tglprosesspt'] : null;
        
        $this->t_grandtotalnjop = (isset($data['t_grandtotalnjop'])) ? $data['t_grandtotalnjop'] : null;
        $this->t_nilaitransaksispt = (isset($data['t_nilaitransaksispt'])) ? $data['t_nilaitransaksispt'] : null;
        $this->s_namajenistransaksi = (isset($data['s_namajenistransaksi'])) ? $data['s_namajenistransaksi'] : null;
        $this->s_namahaktanah = (isset($data['s_namahaktanah'])) ? $data['s_namahaktanah'] : null;
        $this->t_potonganspt = (isset($data['t_potonganspt'])) ? $data['t_potonganspt'] : null;
        
        $this->t_idpembayaranspt = (isset($data['t_idpembayaranspt'])) ? $data['t_idpembayaranspt'] : null;
        $this->t_idspt = (isset($data['t_idspt'])) ? $data['t_idspt'] : null;
        $this->t_kohirpembayaran = (isset($data['t_kohirpembayaran'])) ? $data['t_kohirpembayaran'] : null;
        $this->p_kohirskpdkb = (isset($data['p_kohirskpdkb'])) ? $data['p_kohirskpdkb'] : null;
        $this->t_periodepembayaran = (isset($data['t_periodepembayaran'])) ? $data['t_periodepembayaran'] : null;
        $this->t_tanggalpembayaran = (isset($data['t_tanggalpembayaran'])) ? $data['t_tanggalpembayaran'] : null;
        $this->t_objekspt = (isset($data['t_objekspt'])) ? $data['t_objekspt'] : null;
        $this->t_idnotaris = (isset($data['t_idnotaris'])) ? $data['t_idnotaris'] : null;
        $this->t_ketetapanspt = (isset($data['t_ketetapanspt'])) ? $data['t_ketetapanspt'] : null;
        $this->t_nilaipembayaranspt = (isset($data['t_nilaipembayaranspt'])) ? $data['t_nilaipembayaranspt'] : null;
        $this->t_idkorekspt = (isset($data['t_idkorekspt'])) ? $data['t_idkorekspt'] : null;
        $this->t_kodebayarspt = (isset($data['t_kodebayarspt'])) ? $data['t_kodebayarspt'] : null;
        $this->t_verifikasispt = (isset($data['t_verifikasispt'])) ? $data['t_verifikasispt'] : null;
        $this->t_tglverifikasispt = (isset($data['t_tglverifikasispt'])) ? $data['t_tglverifikasispt'] : null;
        $this->t_pejabatverifikasispt = (isset($data['t_pejabatverifikasispt'])) ? $data['t_pejabatverifikasispt'] : null;
        $this->t_statusbayarspt = (isset($data['t_statusbayarspt'])) ? $data['t_statusbayarspt'] : null;      
        $this->s_namanotaris = (isset($data['s_namanotaris'])) ? $data['s_namanotaris'] : null;         
        $this->t_kodebayarbanksppt = (isset($data['t_kodebayarbanksppt'])) ? $data['t_kodebayarbanksppt'] : null;   
        $this->t_nopbphtbsppt = (isset($data['t_nopbphtbsppt'])) ? $data['t_nopbphtbsppt'] : null;  
        $this->t_idds = (isset($data['t_idds'])) ? $data['t_idds'] : null;  
        $this->t_kodebayards = (isset($data['t_kodebayards'])) ? $data['t_kodebayards'] : null;  
        $this->t_jumlahds = (isset($data['t_jumlahds'])) ? $data['t_jumlahds'] : null;
        
        $this->t_luastanahbpn = (isset($data['t_luastanahbpn'])) ? $data['t_luastanahbpn'] : null;
        $this->t_luasbangunanbpn = (isset($data['t_luasbangunanbpn'])) ? $data['t_luasbangunanbpn'] : null;
        $this->t_nosertifikatbaru = (isset($data['t_nosertifikatbaru'])) ? $data['t_nosertifikatbaru'] : null;
        $this->operator = (isset($data['operator'])) ? $data['operator'] : null;
        $this->t_nikwppembeli = (isset($data['t_nikwppembeli'])) ? $data['t_nikwppembeli'] : null;
        
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
        
        $this->t_dendaspt = (isset($data["t_dendaspt"])) ? $data["t_dendaspt"] : null;
        $this->t_bulandendaspt = (isset($data["t_bulandendaspt"])) ? $data["t_bulandendaspt"] : null;
    }
    public function getArrayCopy() {
        return get_object_vars($this);
    }

    public function setInputFilter(InputFilterInterface $inputFilter) {
        throw new \Exception("Not Used");
    }

    public function getInputFilter() {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            $factory = new InputFactory();

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_kohirpembayaran',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_idds',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_kohirketetapanspt',
                        'required' => false
            )));
            
            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
