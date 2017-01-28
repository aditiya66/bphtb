<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class TargetBase implements InputFilterAwareInterface {

    public $id_anggaran, $thn_anggaran, $target_anggaran, $jenis_anggaran;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->id_anggaran = (isset($data["id_anggaran"])) ? $data["id_anggaran"] : null;
        $this->thn_anggaran = (isset($data["thn_anggaran"])) ? $data["thn_anggaran"] : null;
        $this->target_anggaran = (isset($data["target_anggaran"])) ? $data["target_anggaran"] : null;
        $this->jenis_anggaran = (isset($data["jenis_anggaran"])) ? $data["jenis_anggaran"] : null;

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
                        'name' => 'thn_anggaran',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 'target_anggaran',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 'jenis_anggaran',
                        'required' => true
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
