<?php
namespace Bphtb\Form\Pendataan;

use Zend\Form\Form;

class dat_objek_pajak extends Form
{

    public function __construct()
    {
        parent::__construct();
        
        $this->add(array(
            "name" => "KD_PROPINSI",
            "type" => "text",
            "options" => array(
                "label" => "KD_PROPINSI"
            )
        ));
        $this->add(array(
            "name" => "KD_DATI2",
            "type" => "text",
            "options" => array(
                "label" => "KD_DATI2"
            )
        ));
        $this->add(array(
            "name" => "KD_KECAMATAN",
            "type" => "text",
            "options" => array(
                "label" => "KD_KECAMATAN"
            )
        ));
        $this->add(array(
            "name" => "KD_KELURAHAN",
            "type" => "text",
            "options" => array(
                "label" => "KD_KELURAHAN"
            )
        ));
        $this->add(array(
            "name" => "KD_BLOK",
            "type" => "text",
            "options" => array(
                "label" => "KD_BLOK"
            )
        ));
        $this->add(array(
            "name" => "NO_URUT",
            "type" => "text",
            "options" => array(
                "label" => "NO_URUT"
            )
        ));
        $this->add(array(
            "name" => "KD_JNS_OP",
            "type" => "text",
            "options" => array(
                "label" => "KD_JNS_OP"
            )
        ));
        $this->add(array(
            "name" => "SUBJEK_PAJAK_ID",
            "type" => "text",
            "options" => array(
                "label" => "SUBJEK_PAJAK_ID"
            )
        ));
        $this->add(array(
            "name" => "NO_FORMULIR_SPOP",
            "type" => "text",
            "options" => array(
                "label" => "NO_FORMULIR_SPOP"
            )
        ));
        $this->add(array(
            "name" => "NO_PERSIL",
            "type" => "text",
            "options" => array(
                "label" => "NO_PERSIL"
            )
        ));
        $this->add(array(
            "name" => "JALAN_OP",
            "type" => "text",
            "options" => array(
                "label" => "JALAN_OP"
            )
        ));
        $this->add(array(
            "name" => "BLOK_KAV_NO_OP",
            "type" => "text",
            "options" => array(
                "label" => "BLOK_KAV_NO_OP"
            )
        ));
        $this->add(array(
            "name" => "RW_OP",
            "type" => "text",
            "options" => array(
                "label" => "RW_OP"
            )
        ));
        $this->add(array(
            "name" => "RT_OP",
            "type" => "text",
            "options" => array(
                "label" => "RT_OP"
            )
        ));
        $this->add(array(
            "name" => "KD_STATUS_CABANG",
            "type" => "text",
            "options" => array(
                "label" => "KD_STATUS_CABANG"
            )
        ));
        $this->add(array(
            "name" => "KD_STATUS_WP",
            "type" => "text",
            "options" => array(
                "label" => "KD_STATUS_WP"
            )
        ));
        $this->add(array(
            "name" => "TOTAL_LUAS_BUMI",
            "type" => "text",
            "options" => array(
                "label" => "TOTAL_LUAS_BUMI"
            )
        ));
        $this->add(array(
            "name" => "TOTAL_LUAS_BNG",
            "type" => "text",
            "options" => array(
                "label" => "TOTAL_LUAS_BNG"
            )
        ));
        $this->add(array(
            "name" => "NJOP_BUMI",
            "type" => "text",
            "options" => array(
                "label" => "NJOP_BUMI"
            )
        ));
        $this->add(array(
            "name" => "NJOP_BNG",
            "type" => "text",
            "options" => array(
                "label" => "NJOP_BNG"
            )
        ));
        $this->add(array(
            "name" => "STATUS_PETA_OP",
            "type" => "text",
            "options" => array(
                "label" => "STATUS_PETA_OP"
            )
        ));
        $this->add(array(
            "name" => "JNS_TRANSAKSI_OP",
            "type" => "text",
            "options" => array(
                "label" => "JNS_TRANSAKSI_OP"
            )
        ));
        $this->add(array(
            "name" => "TGL_PENDATAAN_OP",
            "type" => "text",
            "options" => array(
                "label" => "TGL_PENDATAAN_OP"
            )
        ));
        $this->add(array(
            "name" => "NIP_PENDATA",
            "type" => "text",
            "options" => array(
                "label" => "NIP_PENDATA"
            )
        ));
        $this->add(array(
            "name" => "TGL_PEMERIKSAAN_OP",
            "type" => "text",
            "options" => array(
                "label" => "TGL_PEMERIKSAAN_OP"
            )
        ));
        $this->add(array(
            "name" => "NIP_PEMERIKSA_OP",
            "type" => "text",
            "options" => array(
                "label" => "NIP_PEMERIKSA_OP"
            )
        ));
        $this->add(array(
            "name" => "TGL_PEREKAM_OP",
            "type" => "text",
            "options" => array(
                "label" => "TGL_PEREKAM_OP"
            )
        ));
        $this->add(array(
            "name" => "NIP_PEREKAM_OP",
            "type" => "text",
            "options" => array(
                "label" => "NIP_PEREKAM_OP"
            )
        ));        
    }
}
   