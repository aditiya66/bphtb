<?php
namespace Bphtb\Model;

class dat_op_bumiBase implements \Zend\InputFilter\InputFilterAwareInterface {
                protected $inputFilter;
                public $KD_PROPINSI,$KD_DATI2,$KD_KECAMATAN,$KD_KELURAHAN,$KD_BLOK,$NO_URUT,$KD_JNS_OP,$NO_BUMI,$KD_ZNT,$LUAS_BUMI,$JNS_BUMI,$NILAI_SISTEM_BUMI;
                public function exchangeArray($data) {
                    $this->KD_PROPINSI = (isset($data["KD_PROPINSI"])) ? $data["KD_PROPINSI"] : null;
$this->KD_DATI2 = (isset($data["KD_DATI2"])) ? $data["KD_DATI2"] : null;
$this->KD_KECAMATAN = (isset($data["KD_KECAMATAN"])) ? $data["KD_KECAMATAN"] : null;
$this->KD_KELURAHAN = (isset($data["KD_KELURAHAN"])) ? $data["KD_KELURAHAN"] : null;
$this->KD_BLOK = (isset($data["KD_BLOK"])) ? $data["KD_BLOK"] : null;
$this->NO_URUT = (isset($data["NO_URUT"])) ? $data["NO_URUT"] : null;
$this->KD_JNS_OP = (isset($data["KD_JNS_OP"])) ? $data["KD_JNS_OP"] : null;
$this->NO_BUMI = (isset($data["NO_BUMI"])) ? $data["NO_BUMI"] : null;
$this->KD_ZNT = (isset($data["KD_ZNT"])) ? $data["KD_ZNT"] : null;
$this->LUAS_BUMI = (isset($data["LUAS_BUMI"])) ? $data["LUAS_BUMI"] : null;
$this->JNS_BUMI = (isset($data["JNS_BUMI"])) ? $data["JNS_BUMI"] : null;
$this->NILAI_SISTEM_BUMI = (isset($data["NILAI_SISTEM_BUMI"])) ? $data["NILAI_SISTEM_BUMI"] : null;

                }
                
                public function getArrayCopy() {
                    return get_object_vars($this);
                }
                
                public function setInputFilter(\Zend\InputFilter\InputFilterInterface $inputFilter) {
                    throw new \Exception("Not used");
                }
                
                public function getInputFilter() {
                    if (!$this->inputFilter) {
                        $inputFilter = new \Zend\InputFilter\InputFilter();
                
                        $inputFilter->add(array("name"=>"KD_PROPINSI","required"=>False));
$inputFilter->add(array("name"=>"KD_DATI2","required"=>False));
$inputFilter->add(array("name"=>"KD_KECAMATAN","required"=>False));
$inputFilter->add(array("name"=>"KD_KELURAHAN","required"=>False));
$inputFilter->add(array("name"=>"KD_BLOK","required"=>False));
$inputFilter->add(array("name"=>"NO_URUT","required"=>False));
$inputFilter->add(array("name"=>"KD_JNS_OP","required"=>False));
$inputFilter->add(array("name"=>"NO_BUMI","required"=>False));
$inputFilter->add(array("name"=>"KD_ZNT","required"=>False));
$inputFilter->add(array("name"=>"LUAS_BUMI","required"=>False));
$inputFilter->add(array("name"=>"JNS_BUMI","required"=>False));
$inputFilter->add(array("name"=>"NILAI_SISTEM_BUMI","required"=>False));

                
                        $this->inputFilter = $inputFilter;
                    }
                    return $this->inputFilter;
                }
}       