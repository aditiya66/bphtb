<?php
namespace Bphtb\Form\Pendataan;
use Zend\Form\Form;

class dat_subjek_pajak_proc_penentuan_njop_bumi extends Form {
                
    public function __construct() {
            parent::__construct();
                
            $this->add(array("name" => "VLC_KD_PROPINSI","type" => "text",
            "options" => array(
                "label" => "VLC_KD_PROPINSI",
            )));
$this->add(array("name" => "VLC_KD_DATI2","type" => "text",
            "options" => array(
                "label" => "VLC_KD_DATI2",
            )));
$this->add(array("name" => "VLC_KD_KECAMATAN","type" => "text",
            "options" => array(
                "label" => "VLC_KD_KECAMATAN",
            )));
$this->add(array("name" => "VLC_KD_KELURAHAN","type" => "text",
            "options" => array(
                "label" => "VLC_KD_KELURAHAN",
            )));
$this->add(array("name" => "VLC_KD_BLOK","type" => "text",
            "options" => array(
                "label" => "VLC_KD_BLOK",
            )));
$this->add(array("name" => "VLC_NO_URUT","type" => "text",
            "options" => array(
                "label" => "VLC_NO_URUT",
            )));
$this->add(array("name" => "VLC_KD_JNS_OP","type" => "text",
            "options" => array(
                "label" => "VLC_KD_JNS_OP",
            )));
$this->add(array("name" => "VLC_TAHUN_PAJAK","type" => "text",
            "options" => array(
                "label" => "VLC_TAHUN_PAJAK",
            )));
$this->add(array("name" => "VLN_FLAG_UPDATE","type" => "text",
            "options" => array(
                "label" => "VLN_FLAG_UPDATE",
            )));
$this->add(array("name" => "VLN_NJOP_BUMI","type" => "text",
            "options" => array(
                "label" => "VLN_NJOP_BUMI",
            )));

    }
}
   