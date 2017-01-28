<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class TarifBphtbBase implements InputFilterAwareInterface {

    public $s_idtarifbphtb,$s_tarifbphtb, $s_dasarhukumtarifbphtb, $s_tanggaltarifbphtb, $s_statustarifbphtb;
    public $page, $direction;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idtarifbphtb = (isset($data["s_idtarifbphtb"])) ? $data["s_idtarifbphtb"] : null;
        $this->s_tarifbphtb = (isset($data["s_tarifbphtb"])) ? $data["s_tarifbphtb"] : null;
        $this->s_dasarhukumtarifbphtb = (isset($data["s_dasarhukumtarifbphtb"])) ? $data["s_dasarhukumtarifbphtb"] : null;
        $this->s_tanggaltarifbphtb = (isset($data["s_tanggaltarifbphtb"])) ? $data["s_tanggaltarifbphtb"] : null;       
        $this->s_statustarifbphtb = (isset($data["s_statustarifbphtb"])) ? $data["s_statustarifbphtb"] : null;

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
                        'name' => 's_tarifbphtb',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_dasarhukumtarifbphtb',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_tanggaltarifbphtb',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_statustarifbphtb',
                        'required' => true
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
