<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class HakTanahBase implements InputFilterAwareInterface {

    public $s_idhaktanah, $s_kodehaktanah, $s_namahaktanah;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idhaktanah = (isset($data["s_idhaktanah"])) ? $data["s_idhaktanah"] : null;
        $this->s_kodehaktanah = (isset($data["s_kodehaktanah"])) ? $data["s_kodehaktanah"] : null;
        $this->s_namahaktanah = (isset($data["s_namahaktanah"])) ? $data["s_namahaktanah"] : null;       

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
                        'name' => 's_kodehaktanah',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_namahaktanah',
                        'required' => true
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
