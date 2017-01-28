<?php

namespace Bphtb\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PBBKecamatanBase implements InputFilterAwareInterface {

    public $KD_PROPINSI,$KD_DATI2,$KD_KECAMATAN,$NM_KECAMATAN;
   
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->KD_PROPINSI = (isset($data['KD_PROPINSI'])) ? $data['KD_PROPINSI'] : null;
        $this->KD_DATI2 = (isset($data['KD_DATI2'])) ? $data['KD_DATI2'] : null;
        $this->KD_KECAMATAN = (isset($data['KD_KECAMATAN'])) ? $data['KD_KECAMATAN'] : null;
        $this->NM_KECAMATAN = (isset($data['NM_KECAMATAN'])) ? $data['NM_KECAMATAN'] : null;
        
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
