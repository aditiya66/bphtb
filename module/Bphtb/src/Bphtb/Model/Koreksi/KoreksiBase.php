<?php

namespace Bphtb\Model\Koreksi;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class KoreksiBase implements InputFilterAwareInterface {

    public $t_kohirspt, $t_iddetailsptbphtb, $t_idspt, $t_tglprosesspt, $t_tglprosesspttime;
    public $t_namawppembeli, $t_nikwppembeli, $t_alamatwppembeli, $t_kecamatanwppembeli, $t_kelurahanwppembeli, $t_kabkotawppembeli;
    public $t_telponwppembeli, $t_kodeposwppembeli, $t_npwpwppembeli;
    public $t_namawppenjual, $t_nikwppenjual, $t_alamatwppenjual, $t_kecamatanwppenjual, $t_kelurahanwppenjual, $t_kabkotawppenjual;
    public $t_telponwppenjual, $t_kodeposwppenjual, $t_npwpwppenjual;
    public $t_luastanah, $t_njoptanah, $t_luasbangunan, $t_njopbangunan;
    public $t_totalluastanah, $t_totalluasbangunan, $t_totalnjopbangunan, $t_grandtotalnjop, $t_nosertifikathaktanah;
    public $t_nopbphtbsppt, $t_kodebayarbanksppt, $t_idjenistransaksi, $t_idjenishaktanah, $t_totalspt, $t_nilaitransaksispt;
    public $t_kelurahanop, $t_kecamatanop, $t_kabupatenop, $t_potonganspt, $t_ketwaris, $t_terbukti;
    public $t_rtwppembeli, $t_rwwppembeli, $t_alamatop, $t_rtop, $t_rwop, $t_thnsppt, $t_periodespt;
    public $t_persyaratan, $t_idnotarisspt, $t_idnotarisspt1, $t_tglajb, $t_namasppt, $t_idjenisdoktanah, $t_tglajbbaru, $t_noajbbaru, $t_rtwppenjual, $t_rwwppenjual, $s_namahaktanah, $s_namajenistransaksi;
    public $t_npopspt, $t_persenbphtb;
    public $t_tanggalpembayaran, $t_nilaipembayaranspt, $t_tglverifikasispt, $t_nosertifikatbaru, $t_tglsertifikatbaru, $t_idpembayaranspt;
    public $t_nopbphtbspptinfoop;
    public $p_idpemeriksaan, $p_luastanah, $p_njoptanah, $p_totalnjoptanah, $p_luasbangunan, $p_njopbangunan, $p_totalnjopbangunan, $p_grandtotalnjop;
    public $p_nilaitransaksispt, $p_potonganspt, $p_persenbphtb, $s_permetertanah;
    public $t_idds, $t_tglprosesds, $t_periodeds, $t_dendabulan, $t_idnotaris, $t_jumlahds, $t_ketetapands, $t_kohirds, $t_statusbayarspt;
    public $t_kohirpembayaran, $p_kohirskpdkb, $t_periodepembayaran, $t_objekspt;
    public $t_ketetapanspt, $t_idkorekspt, $t_kodebayarspt, $t_verifikasispt;
    public $t_pejabatverifikasispt, $jenis_pembayaran, $kurangbayar;
    public $t_totalnjoptanah;
    public $t_persyaratanverifikasi, $s_namanotaris;
    public $t_kodebayards, $t_luastanahbpn, $t_luasbangunanbpn, $t_hargatambahan, $operator;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    public $t_dendaspt, $t_bulandendaspt;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->operator = (isset($data['operator'])) ? $data['operator'] : null;
        $this->p_luastanah = (isset($data['p_luastanah'])) ? $data['p_luastanah'] : null;
        $this->p_njoptanah = (isset($data['p_njoptanah'])) ? $data['p_njoptanah'] : null;
        $this->p_totalnjoptanah = (isset($data['p_totalnjoptanah'])) ? $data['p_totalnjoptanah'] : null;
        $this->p_luasbangunan = (isset($data['p_luasbangunan'])) ? $data['p_luasbangunan'] : null;
        $this->p_njopbangunan = (isset($data['p_njopbangunan'])) ? $data['p_njopbangunan'] : null;
        $this->p_totalnjopbangunan = (isset($data['p_totalnjopbangunan'])) ? $data['p_totalnjopbangunan'] : null;
        $this->p_grandtotalnjop = (isset($data['p_grandtotalnjop'])) ? $data['p_grandtotalnjop'] : null;
        $this->p_nilaitransaksispt = (isset($data['p_nilaitransaksispt'])) ? $data['p_nilaitransaksispt'] : null;

        //Data Wajib Pajak
        $this->t_nikwppembeli = (isset($data['t_nikwppembeli'])) ? $data['t_nikwppembeli'] : null;
        $this->t_alamatwppembeli = (isset($data['t_alamatwppembeli'])) ? $data['t_alamatwppembeli'] : null;
        $this->t_kecamatanwppembeli = (isset($data['t_kecamatanwppembeli'])) ? $data['t_kecamatanwppembeli'] : null;
        $this->t_kelurahanwppembeli = (isset($data['t_kelurahanwppembeli'])) ? $data['t_kelurahanwppembeli'] : null;
        $this->t_kabkotawppembeli = (isset($data['t_kabkotawppembeli'])) ? $data['t_kabkotawppembeli'] : null;
        $this->t_telponwppembeli = (isset($data['t_telponwppembeli'])) ? $data['t_telponwppembeli'] : null;
        $this->t_kodeposwppembeli = (isset($data['t_kodeposwppembeli'])) ? $data['t_kodeposwppembeli'] : null;
        $this->t_npwpwppembeli = (isset($data['t_npwpwppembeli'])) ? $data['t_npwpwppembeli'] : null;
        $this->t_rtwppembeli = (isset($data['t_rtwppembeli'])) ? $data['t_rtwppembeli'] : null;
        $this->t_rwwppembeli = (isset($data['t_rwwppembeli'])) ? $data['t_rwwppembeli'] : null;

        //Data Objek Pajak
        $this->t_thnsppt = (isset($data['t_thnsppt'])) ? $data['t_thnsppt'] : null;
        $this->t_alamatop = (isset($data['t_alamatop'])) ? $data['t_alamatop'] : null;
        $this->t_rtop = (isset($data['t_rtop'])) ? $data['t_rtop'] : null;
        $this->t_rwop = (isset($data['t_rwop'])) ? $data['t_rwop'] : null;
        $this->t_kelurahanop = (isset($data['t_kelurahanop'])) ? $data['t_kelurahanop'] : null;
        $this->t_kecamatanop = (isset($data['t_kecamatanop'])) ? $data['t_kecamatanop'] : null;
        $this->t_kabupatenop = (isset($data['t_kabupatenop'])) ? $data['t_kabupatenop'] : null;

        $this->t_persyaratan = (isset($data['t_persyaratan'])) ? $data['t_persyaratan'] : null;
        $this->t_periodespt = (isset($data['t_periodespt'])) ? $data['t_periodespt'] : null;

        $this->t_kodebayarbanksppt = (isset($data['t_kodebayarbanksppt'])) ? $data['t_kodebayarbanksppt'] : null;
        $this->t_idjenistransaksi = (isset($data['t_idjenistransaksi'])) ? $data['t_idjenistransaksi'] : null;
        $this->t_idjenishaktanah = (isset($data['t_idjenishaktanah'])) ? $data['t_idjenishaktanah'] : null;
        $this->t_totalspt = (isset($data['t_totalspt'])) ? $data['t_totalspt'] : null;
        $this->t_nilaitransaksispt = (isset($data['t_nilaitransaksispt'])) ? $data['t_nilaitransaksispt'] : null;
        $this->t_idspt = (isset($data['t_idspt'])) ? $data['t_idspt'] : null;
        $this->t_iddetailsptbphtb = (isset($data['t_iddetailsptbphtb'])) ? $data['t_iddetailsptbphtb'] : null;
        $this->t_namawppenjual = (isset($data['t_namawppenjual'])) ? $data['t_namawppenjual'] : null;
        $this->t_nikwppenjual = (isset($data['t_nikwppenjual'])) ? $data['t_nikwppenjual'] : null;
        $this->t_alamatwppenjual = (isset($data['t_alamatwppenjual'])) ? $data['t_alamatwppenjual'] : null;
        $this->t_kecamatanwppenjual = (isset($data['t_kecamatanwppenjual'])) ? $data['t_kecamatanwppenjual'] : null;
        $this->t_kelurahanwppenjual = (isset($data['t_kelurahanwppenjual'])) ? $data['t_kelurahanwppenjual'] : null;
        $this->t_kabkotawppenjual = (isset($data['t_kabkotawppenjual'])) ? $data['t_kabkotawppenjual'] : null;
        $this->t_telponwppenjual = (isset($data['t_telponwppenjual'])) ? $data['t_telponwppenjual'] : null;
        $this->t_kodeposwppenjual = (isset($data['t_kodeposwppenjual'])) ? $data['t_kodeposwppenjual'] : null;
        $this->t_npwpwppenjual = (isset($data['t_npwpwppenjual'])) ? $data['t_npwpwppenjual'] : null;
        $this->t_luastanah = (isset($data['t_luastanah'])) ? $data['t_luastanah'] : null;
        $this->t_njoptanah = (isset($data['t_njoptanah'])) ? $data['t_njoptanah'] : null;
        $this->t_luasbangunan = (isset($data['t_luasbangunan'])) ? $data['t_luasbangunan'] : null;
        $this->t_totalluastanah = (isset($data['t_totalluastanah'])) ? $data['t_totalluastanah'] : null;
        $this->t_totalluasbangunan = (isset($data['t_totalluasbangunan'])) ? $data['t_totalluasbangunan'] : null;
        $this->t_nosertifikathaktanah = (isset($data['t_nosertifikathaktanah'])) ? $data['t_nosertifikathaktanah'] : null;
        $this->t_ketwaris = (isset($data['t_ketwaris'])) ? $data['t_ketwaris'] : null;
        $this->t_terbukti = (isset($data['t_terbukti'])) ? $data['t_terbukti'] : null;
        $this->t_idnotarisspt = (isset($data['t_idnotarisspt'])) ? $data['t_idnotarisspt'] : null;
        $this->t_idnotarisspt1 = (isset($data['t_idnotarisspt1'])) ? $data['t_idnotarisspt1'] : null;
        $this->t_tglajb = (isset($data['t_tglajb'])) ? $data['t_tglajb'] : null;
        $this->t_namasppt = (isset($data['t_namasppt'])) ? $data['t_namasppt'] : null;
        $this->t_idjenisdoktanah = (isset($data['t_idjenisdoktanah'])) ? $data['t_idjenisdoktanah'] : null;
        $this->t_tglajbbaru = (isset($data['t_tglajbbaru'])) ? $data['t_tglajbbaru'] : null;
        $this->t_noajbbaru = (isset($data['t_noajbbaru'])) ? $data['t_noajbbaru'] : null;
        $this->t_rtwppenjual = (isset($data['t_rtwppenjual'])) ? $data['t_rtwppenjual'] : null;
        $this->t_rwwppenjual = (isset($data['t_rwwppenjual'])) ? $data['t_rwwppenjual'] : null;
        $this->s_namahaktanah = (isset($data['s_namahaktanah'])) ? $data['s_namahaktanah'] : null;
        $this->t_npopspt = (isset($data['t_npopspt'])) ? $data['t_npopspt'] : null;
        $this->t_persenbphtb = (isset($data['t_persenbphtb'])) ? $data['t_persenbphtb'] : null;


        $this->t_tanggalpembayaran = (isset($data['t_tanggalpembayaran'])) ? $data['t_tanggalpembayaran'] : null;
        $this->t_nilaipembayaranspt = (isset($data['t_nilaipembayaranspt'])) ? $data['t_nilaipembayaranspt'] : null;
        $this->t_nosertifikatbaru = (isset($data['t_nosertifikatbaru'])) ? $data['t_nosertifikatbaru'] : null;
        $this->t_tglsertifikatbaru = (isset($data['t_tglsertifikatbaru'])) ? $data['t_tglsertifikatbaru'] : null;
        $this->t_nopbphtbspptinfoop = (isset($data['t_nopbphtbspptinfoop'])) ? $data['t_nopbphtbspptinfoop'] : null;
        $this->p_potonganspt = (isset($data['p_potonganspt'])) ? $data['p_potonganspt'] : null;
        $this->p_persenbphtb = (isset($data['p_persenbphtb'])) ? $data['p_persenbphtb'] : null;
        $this->s_permetertanah = (isset($data['s_permetertanah'])) ? $data['s_permetertanah'] : null;

        $this->t_kohirspt = (isset($data['t_kohirspt'])) ? $data['t_kohirspt'] : null;
        $this->t_idds = (isset($data['t_idds'])) ? $data['t_idds'] : null;
        $this->t_tglprosesds = (isset($data['t_tglprosesds'])) ? $data['t_tglprosesds'] : null;
        $this->t_periodeds = (isset($data['t_periodeds'])) ? $data['t_periodeds'] : null;
        $this->t_dendabulan = (isset($data['t_dendabulan'])) ? $data['t_dendabulan'] : null;
        $this->t_jumlahds = (isset($data['t_jumlahds'])) ? $data['t_jumlahds'] : null;
        $this->t_ketetapands = (isset($data['t_ketetapands'])) ? $data['t_ketetapands'] : null;
        $this->t_kohirds = (isset($data['t_kohirds'])) ? $data['t_kohirds'] : null;
        $this->t_kodebayards = (isset($data['t_kodebayards'])) ? $data['t_kodebayards'] : null;
        $this->t_persyaratanverifikasi = (isset($data['t_persyaratanverifikasi'])) ? $data['t_persyaratanverifikasi'] : null;

        $this->p_idpemeriksaan = (isset($data['p_idpemeriksaan'])) ? $data['p_idpemeriksaan'] : null;
        $this->kurangbayar = (isset($data['kurangbayar'])) ? $data['kurangbayar'] : null;
        $this->jenis_pembayaran = (isset($data['jenis_pembayaran'])) ? $data['jenis_pembayaran'] : null;
        $this->t_totalnjoptanah = (isset($data['t_totalnjoptanah'])) ? $data['t_totalnjoptanah'] : null;
        $this->t_totalnjopbangunan = (isset($data['t_totalnjopbangunan'])) ? $data['t_totalnjopbangunan'] : null;
        $this->t_njopbangunan = (isset($data['t_njopbangunan'])) ? $data['t_njopbangunan'] : null;
        $this->t_namawppembeli = (isset($data['t_namawppembeli'])) ? $data['t_namawppembeli'] : null;
        $this->t_tglprosesspt = (isset($data['t_tglprosesspt'])) ? $data['t_tglprosesspt'] : null;

        $this->t_grandtotalnjop = (isset($data['t_grandtotalnjop'])) ? $data['t_grandtotalnjop'] : null;
        $this->s_namajenistransaksi = (isset($data['s_namajenistransaksi'])) ? $data['s_namajenistransaksi'] : null;
        $this->t_potonganspt = (isset($data['t_potonganspt'])) ? $data['t_potonganspt'] : null;

        $this->t_idpembayaranspt = (isset($data['t_idpembayaranspt'])) ? $data['t_idpembayaranspt'] : null;
        $this->t_kohirpembayaran = (isset($data['t_kohirpembayaran'])) ? $data['t_kohirpembayaran'] : null;
        $this->p_kohirskpdkb = (isset($data['p_kohirskpdkb'])) ? $data['p_kohirskpdkb'] : null;
        $this->t_periodepembayaran = (isset($data['t_periodepembayaran'])) ? $data['t_periodepembayaran'] : null;
        $this->t_objekspt = (isset($data['t_objekspt'])) ? $data['t_objekspt'] : null;
        $this->t_idnotaris = (isset($data['t_idnotaris'])) ? $data['t_idnotaris'] : null;
        $this->t_ketetapanspt = (isset($data['t_ketetapanspt'])) ? $data['t_ketetapanspt'] : null;
        $this->t_idkorekspt = (isset($data['t_idkorekspt'])) ? $data['t_idkorekspt'] : null;
        $this->t_kodebayarspt = (isset($data['t_kodebayarspt'])) ? $data['t_kodebayarspt'] : null;
        $this->t_verifikasispt = (isset($data['t_verifikasispt'])) ? $data['t_verifikasispt'] : null;
        $this->t_tglverifikasispt = (isset($data['t_tglverifikasispt'])) ? $data['t_tglverifikasispt'] : null;
        $this->t_pejabatverifikasispt = (isset($data['t_pejabatverifikasispt'])) ? $data['t_pejabatverifikasispt'] : null;
        $this->t_statusbayarspt = (isset($data['t_statusbayarspt'])) ? $data['t_statusbayarspt'] : null;
        $this->s_namanotaris = (isset($data['s_namanotaris'])) ? $data['s_namanotaris'] : null;
        $this->t_nopbphtbsppt = (isset($data['t_nopbphtbsppt'])) ? $data['t_nopbphtbsppt'] : null;

        $this->t_luastanahbpn = (isset($data['t_luastanahbpn'])) ? $data['t_luastanahbpn'] : null;
        $this->t_luasbangunanbpn = (isset($data['t_luasbangunanbpn'])) ? $data['t_luasbangunanbpn'] : null;
        $this->t_hargatambahan = (isset($data['t_hargatambahan'])) ? $data['t_hargatambahan'] : null;

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

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
