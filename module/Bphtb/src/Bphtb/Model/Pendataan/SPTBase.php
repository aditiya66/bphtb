<?php

namespace Bphtb\Model\Pendataan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SPTBase implements InputFilterAwareInterface {

    public $t_idspt, $t_kohirspt, $t_tglprosesspt, $t_periodespt, $t_idnotarisspt, $t_tgljatuhtempospt, $t_nopbphtbspt;
    public $t_kodebayarbanksppt, $t_idjenistransaksi, $t_idjenishaktanah, $t_pejabatverifikasispt; 
    public $t_dasarspt, $t_totalspt, $t_nilaitransaksispt, $t_thnsppt, $t_persyaratan, $persyaratann, $t_idjenisdoktanah;
    public $t_nopbphtbsppt, $t_potonganspt;
    public $page;
    public $rows;
    public $sidx;
    public $sord;
    public $t_dendaspt, $t_bulandendaspt;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idspt = (isset($data['t_idspt'])) ? $data['t_idspt'] : null;
        $this->t_kohirspt = (isset($data['t_kohirspt'])) ? $data['t_kohirspt'] : null;
        $this->t_tglprosesspt = (isset($data['t_tglprosesspt'])) ? $data['t_tglprosesspt'] : null;
        $this->t_periodespt = (isset($data['t_periodespt'])) ? $data['t_periodespt'] : null;
        $this->t_idnotarisspt = (isset($data['t_idnotarisspt'])) ? $data['t_idnotarisspt'] : null;
        $this->t_tgljatuhtempospt = (isset($data['t_tgljatuhtempospt'])) ? $data['t_tgljatuhtempospt'] : null;
        $this->t_nopbphtbspt = (isset($data['t_nopbphtbspt'])) ? $data['t_nopbphtbspt'] : null;
        $this->t_kodebayarbanksppt = (isset($data['t_kodebayarbanksppt'])) ? $data['t_kodebayarbanksppt'] : null;
        $this->t_idjenistransaksi = (isset($data['t_idjenistransaksi'])) ? $data['t_idjenistransaksi'] : null;
        $this->t_idjenishaktanah = (isset($data['t_idjenishaktanah'])) ? $data['t_idjenishaktanah'] : null;
        $this->t_pejabatverifikasispt = (isset($data['t_pejabatverifikasispt'])) ? $data['t_pejabatverifikasispt'] : null;
        $this->t_dasarspt = (isset($data['t_dasarspt'])) ? $data['t_dasarspt'] : null;
        $this->t_totalspt = (isset($data['t_totalspt'])) ? $data['t_totalspt'] : null;
        $this->t_nilaitransaksispt = (isset($data['t_nilaitransaksispt'])) ? $data['t_nilaitransaksispt'] : null;
        $this->t_thnsppt = (isset($data['t_thnsppt'])) ? $data['t_thnsppt'] : null;
        $this->t_persyaratan = (isset($data['t_persyaratan'])) ? $data['t_persyaratan'] : null;
        $this->persyaratann = (isset($data['persyaratann'])) ? $data['persyaratann'] : null;
        $this->t_idjenisdoktanah = (isset($data['t_idjenisdoktanah'])) ? $data['t_idjenisdoktanah'] : null;
        $this->t_nopbphtbsppt = (isset($data['t_nopbphtbsppt'])) ? $data['t_nopbphtbsppt'] : null;
        $this->t_potonganspt = (isset($data['t_potonganspt'])) ? $data['t_potonganspt'] : null;

        $this->page = (isset($data['page'])) ? $data['page'] : null;
        $this->rows = (isset($data['rows'])) ? $data['rows'] : null;
        $this->sidx = (isset($data['sidx'])) ? $data['sidx'] : null;
        $this->sord = (isset($data['sord'])) ? $data['sord'] : null;
        
        $this->t_dendaspt = (isset($data["t_dendaspt"])) ? $data["t_dendaspt"] : null;
        $this->t_bulandendaspt = (isset($data["t_bulandendaspt"])) ? $data["t_bulandendaspt"] : null;
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
            
//    public $t_kodebayarbanksppt, $t_idjenistransaksi, $t_idjenishaktanah, $t_pejabatverifikasispt, $t_dasarspt, $t_totalspt, $t_nilaitransaksispt;

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_kohirspt',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_tglprosesspt',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_periodespt',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_idnotarisspt',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_nopbphtbspt',
                        'required' => true
            )));
            
            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
