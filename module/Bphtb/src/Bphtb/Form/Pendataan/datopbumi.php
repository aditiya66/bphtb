<?php
namespace Bphtb\Form\Pendataan;

use Zend\Form\Form;

class datopbumi extends Form
{

    public function __construct()
    {
        parent::__construct();
        
        $this->add(array(
            "name" => "KD_NOP",
            "type" => "text",
            "options" => array(
                "label" => "NOP"
            ),
            "attributes" => array (
                "id" => "KD_NOP",
                "class" => "form-control"
            ),
        ));
        
        $this->add(array(
            "name" => "KD_PROPINSI",
            "type" => "text",
            "options" => array(
                "label" => "Kode Propinsi"
            ),
            "attributes" => array (
                "id" => "KD_PROPINSI",
                "class" => "form-control"  
            ),
        ));
        $this->add(array(
            "name" => "KD_DATI2",
            "type" => "text",
            "options" => array(
                "label" => "Kode Kabupaten/Kota"
            ),
            "attributes" => array (
                "id" => "KD_DATI2",
                "class" => "form-control"
            )
        ));
        
        $this->add(array(
            "name" => "KD_KECAMATAN",
            "type" => "text",
            "options" => array(
                "label" => "Kode Kecamatan"
            ),
            "attributes" => array (
                "id" => "KD_KECAMATAN",
                "class" => "form-control"   
            ),
        ));
        $this->add(array(
            "name" => "KD_KELURAHAN",
            "type" => "text",
            "options" => array(
                "label" => "Kode Kelurahan"
            ),
            "attributes" => array (
                "id" => "KD_KELURAHAN",
                "class" => "form-control"
            )
        ));
        $this->add(array(
            "name" => "KD_BLOK",
            "type" => "text",
            "options" => array(
                "label" => "Kode Blok"
            ),
            "attributes" => array (
                "id" => "KD_BLOK",
                "class" => "form-control"  
            ),
        ));
        $this->add(array(
            "name" => "NO_URUT",
            "type" => "text",
            "options" => array(
                "label" => "Nomor Urut"
            ),
            "attributes" => array (
                "id" => "NO_URUT",
                "class" => "form-control"
            )
        ));
        $this->add(array(
            "name" => "KD_JNS_OP",
            "type" => "text",
            "options" => array(
                "label" => "Kode Jenis OP"
            ),
            "attributes" => array (
                "id" => "KD_JNS_OP",
                "class" => "form-control"
            )
        ));
        $this->add(array(
            "name" => "NO_BUMI",
            "type" => "text",
            "options" => array(
                "label" => "NO_BUMI ???"
            ),
            "attributes" => array (
                "id" => "NO_BUMI",
                "class" => "form-control"
            )
        ));
        $this->add(array(
            "name" => "KD_ZNT",
            "type" => "text",
            "options" => array(
                "label" => "Kode ZNT",
            ),
            "attributes" => array (
                "id" => "KD_ZNT",
                "class" => "form-control"
            )
        ));
        $this->add(array(
            "name" => "LUAS_BUMI",
            "type" => "text",
            "options" => array(
                "label" => "Luas Tanah"
            ),
            "attributes" => array (
                "id" => "LUAS_BUMI",
                "class" => "form-control"
            )
        ));
        $this->add(array(
            "name" => "JNS_BUMI",
            "type" => "text",
            "options" => array(
                "label" => "Jenis Tanah",                
            ),
            "attributes" => array (
                "id" => "JNS_BUMI",
                "class" => "form-control"  
            ),
        ));
        $this->add(array(
            "name" => "NILAI_SISTEM_BUMI",
            "type" => "text",
            "options" => array(
                "label" => "NILAI_SISTEM_BUMI"
            ),
            "attributes" => array (
                "id" => "NILAI_SISTEM_BUMI",
                "class" => "form-control"
            )
        ));
    }
}
   