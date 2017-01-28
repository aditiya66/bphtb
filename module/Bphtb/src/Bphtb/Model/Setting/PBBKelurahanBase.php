<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PBBKelurahanBase implements InputFilterAwareInterface {

    public $KD_KECAMATAN,$KD_KELURAHAN,$NM_KELURAHAN;
   
    protected $inputFilter;

    public function exchangeArray($data) {

        $this->KD_KECAMATAN = (isset($data['KD_KECAMATAN'])) ? $data['KD_KECAMATAN'] : null;
        $this->KD_KELURAHAN = (isset($data['KD_KELURAHAN'])) ? $data['KD_KELURAHAN'] : null;
        $this->NM_KELURAHAN = (isset($data['NM_KELURAHAN'])) ? $data['NM_KELURAHAN'] : null;
        
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
