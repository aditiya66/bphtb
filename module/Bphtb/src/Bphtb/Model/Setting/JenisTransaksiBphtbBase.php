<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class JenisTransaksiBphtbBase implements InputFilterAwareInterface {

    public $s_idjenistransaksi;
    public $s_kodejenistransaksi;
    public $s_namajenistransaksi;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idjenistransaksi = (isset($data['s_idjenistransaksi'])) ? $data['s_idjenistransaksi'] : null;
        $this->s_kodejenistransaksi = (isset($data['s_kodejenistransaksi'])) ? $data['s_kodejenistransaksi'] : null;
        $this->s_namajenistransaksi = (isset($data['s_namajenistransaksi'])) ? $data['s_namajenistransaksi'] : null;

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

            $inputFilter->add(array(
                'name' => 's_kodejenistransaksi',
                'required' => true,
                'filters' => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(
                    new \Zend\Validator\StringLength(
                            array(
                        'encoding' => 'UTF-8',
                        'min' => 2,
                            )
                    ),
                ),
            ));

            $inputFilter->add(array(
                'name' => 's_namajenistransaksi',
                'required' => true
            ));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
