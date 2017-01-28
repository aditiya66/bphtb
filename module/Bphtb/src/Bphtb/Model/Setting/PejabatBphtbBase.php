<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PejabatBphtbBase implements InputFilterAwareInterface {

    public $s_idpejabat;
    public $s_namapejabat;
    public $s_jabatanpejabat;
    public $s_golonganpejabat;
    public $s_nippejabat;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idpejabat = (isset($data['s_idpejabat'])) ? $data['s_idpejabat'] : null;
        $this->s_namapejabat = (isset($data['s_namapejabat'])) ? $data['s_namapejabat'] : null;
        $this->s_jabatanpejabat = (isset($data['s_jabatanpejabat'])) ? $data['s_jabatanpejabat'] : null;
        $this->s_golonganpejabat = (isset($data['s_golonganpejabat'])) ? $data['s_golonganpejabat'] : NULL;
        $this->s_nippejabat = (isset($data['s_nippejabat'])) ? $data['s_nippejabat'] : null;

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
                        'name' => 's_namapejabat',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_nippejabat',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_jabatanpejabat',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_golonganpejabat',
                        'required' => false
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
