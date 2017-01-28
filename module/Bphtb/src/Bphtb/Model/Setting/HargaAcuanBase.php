<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class HargaAcuanBase implements InputFilterAwareInterface {

    public $s_idacuan, $t_nopacuan, $s_permetertanah;
    public $s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok, $s_nop;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idacuan = (isset($data["s_idacuan"])) ? $data["s_idacuan"] : null;
        $this->t_nopacuan = (isset($data["t_nopacuan"])) ? $data["t_nopacuan"] : null;
        $this->s_permetertanah = (isset($data["s_permetertanah"])) ? $data["s_permetertanah"] : null; 
        
        $this->s_kd_propinsi = (isset($data["s_kd_propinsi"])) ? $data["s_kd_propinsi"] : null;    
        $this->s_kd_dati2 = (isset($data["s_kd_dati2"])) ? $data["s_kd_dati2"] : null;    
        $this->s_kd_kecamatan = (isset($data["s_kd_kecamatan"])) ? $data["s_kd_kecamatan"] : null;    
        $this->s_kd_kelurahan = (isset($data["s_kd_kelurahan"])) ? $data["s_kd_kelurahan"] : null;    
        $this->s_kd_blok = (isset($data["s_kd_blok"])) ? $data["s_kd_blok"] : null;   
        $this->s_nop = (isset($data["s_nop"])) ? $data["s_nop"] : null;
        
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
                        'name' => 't_nopacuan',
                        'required' => true
            )));            

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_permetertanah',
                        'required' => true
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
