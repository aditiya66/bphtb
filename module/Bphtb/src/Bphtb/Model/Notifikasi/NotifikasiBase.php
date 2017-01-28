<?php
namespace Bphtb\Model\Notifikasi;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class NotifikasiBase implements InputFilterAwareInterface {
    protected $inputFilter;
    public $t_idnotifikasi, $t_iduserreceive, $t_userreadstatus, $t_usermessages,
            $t_idusersend;
    
    public function exchangeArray($data) {
        $this->t_idnotifikasi = (isset($data['t_idnotifikasi'])) ? $data['t_idnotifikasi'] : null;
        $this->t_iduserreceive = (isset($data['t_iduserreceive'])) ? $data['t_iduserreceive'] : null;
        $this->t_userreadstatus = (isset($data['t_userreadstatus'])) ? $data['t_userreadstatus'] : null;
        $this->t_usermessages = (isset($data['t_usermessages'])) ? $data['t_usermessages'] : null;
        $this->t_idusersend = (isset($data['t_idusersend'])) ? $data['t_idusersend'] : null;
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

