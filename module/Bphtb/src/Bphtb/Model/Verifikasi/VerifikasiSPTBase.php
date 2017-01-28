<?php

namespace Bphtb\Model\Verifikasi;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class VerifikasiSPTBase implements InputFilterAwareInterface {

    public $t_idspt, $t_kodebayarspt, $t_verifikasispt, $t_kohirpembayaran, $t_idpembayaranspt, $t_idnotarisspt, $t_kodebayarbanksppt,$t_persyaratanverifikasi;
    public $t_idnotaris, $t_pejabatverifikasispt, $t_totalspt, $t_persyaratan, $t_kohirketetapanspt;
    public $t_namawppembeli, $t_nikwppembeli;
    public $page, $direction;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {     
        $this->t_idspt = (isset($data['t_idspt'])) ? $data['t_idspt'] : null;
        $this->t_idnotarisspt = (isset($data['t_idnotarisspt'])) ? $data['t_idnotarisspt'] : null;
        $this->t_kodebayarspt = (isset($data['t_kodebayarspt'])) ? $data['t_kodebayarspt'] : null;
        $this->t_idpembayaranspt = (isset($data['t_idpembayaranspt'])) ? $data['t_idpembayaranspt'] : null;
        $this->t_tglverifikasispt = (isset($data['t_tglverifikasispt'])) ? $data['t_tglverifikasispt'] : null;
        $this->t_kohirpembayaran = (isset($data['t_kohirpembayaran'])) ? $data['t_kohirpembayaran'] : null;
        $this->t_kodebayarbanksppt = (isset($data['t_kodebayarbanksppt'])) ? $data['t_kodebayarbanksppt'] : null;
        $this->t_persyaratanverifikasi = (isset($data['t_persyaratanverifikasi'])) ? $data['t_persyaratanverifikasi'] : null ;
        $this->t_verifikasispt = (isset($data['t_verifikasispt'])) ? $data['t_verifikasispt'] : null ;
        $this->t_idnotaris = (isset($data['t_idnotaris'])) ? $data['t_idnotaris'] : null ;
        $this->t_pejabatverifikasispt = (isset($data['t_pejabatverifikasispt'])) ? $data['t_pejabatverifikasispt'] : null ;
        $this->t_totalspt = (isset($data['t_totalspt'])) ? $data['t_totalspt'] : null ;
        $this->p_idpemeriksaan = (isset($data['p_idpemeriksaan'])) ? $data['p_idpemeriksaan'] : null ;
        $this->t_persyaratan = (isset($data['t_persyaratan'])) ? $data['t_persyaratan'] : null ;
        $this->t_kohirketetapanspt = (isset($data['t_kohirketetapanspt'])) ? $data['t_kohirketetapanspt'] : null;
        $this->t_namawppembeli = (isset($data['t_namawppembeli'])) ? $data['t_namawppembeli'] : null;
        $this->t_nikwppembeli = (isset($data['t_nikwppembeli'])) ? $data['t_nikwppembeli'] : null;
        
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
        throw new \Exception("Not Used");
    }

    public function getInputFilter() {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            $factory = new InputFactory();

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_namawppembeli',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_nikwppembeli',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_alamatwppembeli',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_kecamatanwppembeli',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_kabkotawppembeli',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_telponwppembeli',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_kodeposwppembeli',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_npwpwppembeli',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_namawppenjual',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_nikwppenjual',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_alamatwppenjual',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_kecamatanwppenjual',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_kabkotawppenjual',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_telponwppenjual',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_kodeposwppenjual',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_npwpwppenjual',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_luastanah',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_njoptanah',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_luasbangunan',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_njopbangunan',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_totalluastanah',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_totalnjoptanah',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_totalluasbangunan',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_totalnjopbangunan',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_grandtotalnjop',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_persyaratan',
                        'required' => false
            )));
                        
            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
