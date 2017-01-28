<?php
namespace Bphtb\Form\Pendataan;
use Zend\Form\Form;

class dat_op_bumi_proc_penilaian_bumi extends Form {
                
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
$this->add(array("name" => "VLN_NO_BUMI","type" => "text",
            "options" => array(
                "label" => "VLN_NO_BUMI",
            )));
$this->add(array("name" => "VLC_KD_ZNT","type" => "text",
            "options" => array(
                "label" => "VLC_KD_ZNT",
            )));
$this->add(array("name" => "VLN_LUAS_BUMI","type" => "text",
            "options" => array(
                "label" => "VLN_LUAS_BUMI",
            )));
$this->add(array("name" => "VLC_TAHUN","type" => "text",
            "options" => array(
                "label" => "VLC_TAHUN",
            )));
$this->add(array("name" => "VLN_FLAG_UPDATE","type" => "text",
            "options" => array(
                "label" => "VLN_FLAG_UPDATE",
            )));
$this->add(array("name" => "VLN_NILAI_BUMI","type" => "text",
            "options" => array(
                "label" => "VLN_NILAI_BUMI",
            )));

    }
}
   