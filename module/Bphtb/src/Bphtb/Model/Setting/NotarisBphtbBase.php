<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterInterface;

class NotarisBphtbBase implements \Zend\InputFilter\InputFilterAwareInterface {

    public $s_idnotaris;
    public $s_namanotaris, $s_alamatnotaris, $s_kodenotaris, $s_sknotaris, $s_tgl1notaris, $s_tgl2notaris, $s_statusnotaris;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idnotaris = (isset($data['s_idnotaris'])) ? $data['s_idnotaris'] : null;
        $this->s_namanotaris = (isset($data['s_namanotaris'])) ? $data['s_namanotaris'] : null;
        $this->s_alamatnotaris = (isset($data["s_alamatnotaris"])) ? $data["s_alamatnotaris"] : null;
        $this->s_kodenotaris = (isset($data['s_kodenotaris'])) ? $data['s_kodenotaris'] : null;
        $this->s_sknotaris = (isset($data['s_sknotaris'])) ? $data['s_sknotaris'] : null;
        $this->s_tgl1notaris = (isset($data['s_tgl1notaris'])) ? $data['s_tgl1notaris'] : null;
        $this->s_tgl2notaris = (isset($data['s_tgl2notaris'])) ? $data['s_tgl2notaris'] : null;
        $this->s_statusnotaris = (isset($data['s_statusnotaris'])) ? $data['s_statusnotaris'] : null;

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
                        'name' => 's_namanotaris',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_alamatnotaris',
                        'required' => true
            )));            

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_kodenotaris',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_sknotaris',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_tgl1notaris',
                        'required' => false
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_tgl2notaris',
                        'required' => false
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_statusnotaris',
                        'required' => true
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
