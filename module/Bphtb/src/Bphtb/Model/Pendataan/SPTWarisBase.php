<?php

namespace Bphtb\Model\Pendataan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SPTWarisBase implements InputFilterAwareInterface {

    public $t_idspt;
    public $page;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idspt = (isset($data['t_idspt'])) ? $data['t_idspt'] : null;
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
            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
