<?php

namespace Bphtb\Model\Historylog;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class HistorylogBase implements InputFilterAwareInterface {

    public $hislog_id, $hislog_opr_id, $hislog_opr_user, $hislog_opr_nama, $hislog_action, $hislog_time, $hislog_idspt;
    public $page, $direction;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->hislog_id = (isset($data["hislog_id"])) ? $data["hislog_id"] : null;
        $this->hislog_opr_id = (isset($data["hislog_opr_id"])) ? $data["hislog_opr_id"] : null;     
        $this->hislog_opr_user = (isset($data["hislog_opr_user"])) ? $data["hislog_opr_user"] : null;     
        $this->hislog_opr_nama = (isset($data["hislog_opr_nama"])) ? $data["hislog_opr_nama"] : null;     
        $this->hislog_action = (isset($data["hislog_action"])) ? $data["hislog_action"] : null;   
        $this->hislog_time = (isset($data["hislog_time"])) ? $data["hislog_time"] : null;         
        $this->hislog_idspt = (isset($data["hislog_idspt"])) ? $data["hislog_idspt"] : null;       

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
                        'name' => 'hislog_opr_id',
                        'required' => true
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
