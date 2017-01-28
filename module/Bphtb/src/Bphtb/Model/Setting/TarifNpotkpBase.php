<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class TarifNpotkpBase implements InputFilterAwareInterface {

    public $s_idtarifnpotkp, $s_idjenistransaksinpotkp, $s_tarifnpotkp, $s_tarifnpotkptambahan, $s_dasarhukumnpotkp, $s_statusnpotkp,
            $s_tarifnpotkptahunajb1, $s_tarifnpotkptahunajb2, $s_kodejenistransaksi, $s_namajenistransaksi;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idtarifnpotkp = (isset($data["s_idtarifnpotkp"])) ? $data["s_idtarifnpotkp"] : null;
        $this->s_idjenistransaksinpotkp = (isset($data["s_idjenistransaksinpotkp"])) ? $data["s_idjenistransaksinpotkp"] : null;
        $this->s_tarifnpotkp = (isset($data["s_tarifnpotkp"])) ? $data["s_tarifnpotkp"] : null;
        $this->s_tarifnpotkptambahan = (isset($data["s_tarifnpotkptambahan"])) ? $data["s_tarifnpotkptambahan"] : null;
        $this->s_dasarhukumnpotkp = (isset($data["s_dasarhukumnpotkp"])) ? $data["s_dasarhukumnpotkp"] : null;
        $this->s_statusnpotkp = (isset($data["s_statusnpotkp"])) ? $data["s_statusnpotkp"] : null;
        $this->s_tarifnpotkptahunajb1 = (isset($data['s_tarifnpotkptahunajb1'])) ? $data['s_tarifnpotkptahunajb1'] : null;
        $this->s_tarifnpotkptahunajb2 = (isset($data['s_tarifnpotkptahunajb2'])) ? $data['s_tarifnpotkptahunajb2'] : null;
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

            $factory = new InputFactory();

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_idjenistransaksinpotkp',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_tarifnpotkptahunajb1',
                        'required' => true,
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_tarifnpotkptahunajb2',
                        'required' => true,
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_tarifnpotkp',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_dasarhukumnpotkp',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_statusnpotkp',
                        'required' => true
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
