<?php

namespace Bphtb\Model\DataSimpatda;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class AnggaranSimpatdaBase implements InputFilterAwareInterface {

    public $s_nilaitargetanggaran1, $s_nilaitargetanggaran2, $s_nilaitargetanggaran3, $s_nilaitargetanggaran4;
    protected $inputFilter;

    public function exchangeArray($data) {

        $this->s_nilaitargetanggaran1 = (isset($data['s_nilaitargetanggaran1'])) ? $data['s_nilaitargetanggaran1'] : null;
        $this->s_nilaitargetanggaran2 = (isset($data['s_nilaitargetanggaran2'])) ? $data['s_nilaitargetanggaran2'] : null;
        $this->s_nilaitargetanggaran3 = (isset($data['s_nilaitargetanggaran3'])) ? $data['s_nilaitargetanggaran3'] : null;
        $this->s_nilaitargetanggaran4 = (isset($data['s_nilaitargetanggaran4'])) ? $data['s_nilaitargetanggaran4'] : null;
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

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
