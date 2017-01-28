<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class JenisKetetapanBase implements InputFilterAwareInterface {

    public $s_idjenisketetapan, $s_namajenisketetapan, $s_namasingkatjenisketetapan;
    public $page;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idjenisketetapan = (isset($data["s_idjenisketetapan"])) ? $data["s_idjenisketetapan"] : null;
        $this->s_namajenisketetapan = (isset($data["s_namajenisketetapan"])) ? $data["s_namajenisketetapan"] : null;
        $this->s_namasingkatjenisketetapan = (isset($data["s_namasingkatjenisketetapan"])) ? $data["s_namasingkatjenisketetapan"] : null;       

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
                        'name' => 's_namajenisketetapan',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_namasingkatjenisketetapan',
                        'required' => true
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
