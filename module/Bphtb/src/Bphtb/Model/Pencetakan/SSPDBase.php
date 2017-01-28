<?php

namespace Bphtb\Model\Pencetakan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SSPDBase implements InputFilterAwareInterface {

    public $no_spt1;
    public $no_spt2;
    public $periode_spt;
    public $tgl_cetak;
    public $tgl_cetak_bukti;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->no_spt1 = (isset($data['no_spt1'])) ? $data['no_spt1'] : null;
        $this->no_spt2 = (isset($data['no_spt2'])) ? $data['no_spt2'] : null;
        $this->periode_spt = (isset($data['periode_spt'])) ? $data['periode_spt'] : null;
        $this->tgl_cetak = (isset($data['tgl_cetak'])) ? $data['tgl_cetak'] : null;
        $this->tgl_cetak_bukti = (isset($data['tgl_cetak_bukti'])) ? $data['tgl_cetak_bukti'] : null;
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
