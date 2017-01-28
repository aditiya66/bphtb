<?php
namespace Bphtb\Form\Pendataan;

use Zend\Form\Form;

class datopbangunan extends Form
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
            "name" => "NO_BNG",
            "type" => "text",
            "options" => array(
                "label" => "No. Bangunan"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "NO_BNG",
            )
        ));
        $this->add(array(
            "name" => "KD_JPB",
            "type" => "text",
            "options" => array(
                "label" => "Kode JPB"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "KD_JPB",
            )
        ));
        $this->add(array(
            "name" => "NO_FORMULIR_LSPOP",
            "type" => "text",
            "options" => array(
                "label" => "No Formulir LSPOP"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "NO_FORMULIR_LSPOP",
            )
        ));
        $this->add(array(
            "name" => "THN_DIBANGUN_BNG",
            "type" => "text",
            "options" => array(
                "label" => "Tahun Dibangun"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "THN_DIBANGUN_BNG",
            )
        ));
        $this->add(array(
            "name" => "THN_RENOVASI_BNG",
            "type" => "text",
            "options" => array(
                "label" => "Tahun Renovasi Bangunan"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "THN_RENOVASI_BNG",
            )
        ));
        $this->add(array(
            "name" => "LUAS_BNG",
            "type" => "text",
            "options" => array(
                "label" => "Luas Bangunan"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "LUAS_BNG",
            )
        ));
        $this->add(array(
            "name" => "JML_LANTAI_BNG",
            "type" => "text",
            "options" => array(
                "label" => "Jumlah Lantai Bangunan"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "JML_LANTAI_BNG",
            )
        ));
        $this->add(array(
            "name" => "KONDISI_BNG",
            "type" => "text",
            "options" => array(
                "label" => "Kondisi Bangunan"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "KONDISI_BNG",
            )
        ));
        
        $this->add(array(
            "name" => "JNS_KONSTRUKSI_BNG",
            "type" => "text",
            "options" => array(
                "label" => "Jenis Konstruksi Bangunan"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "JNS_KONSTRUKSI_BNG",
            )
        ));
        $this->add(array(
            "name" => "JNS_ATAP_BNG",
            "type" => "text",
            "options" => array(
                "label" => "Jenis Atap Bangunan"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "JNS_ATAP_BNG",
            )
        ));
        $this->add(array(
            "name" => "KD_DINDING",
            "type" => "text",
            "options" => array(
                "label" => "Jenis Dinding"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "KD_DINDING",
            )
        ));
        $this->add(array(
            "name" => "KD_LANTAI",
            "type" => "text",
            "options" => array(
                "label" => "Jenis Lantai"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "KD_LANTAI",
            )
        ));
        $this->add(array(
            "name" => "KD_LANGIT_LANGIT",
            "type" => "text",
            "options" => array(
                "label" => "Jenis Langit-langit"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "KD_LANGIT_LANGIT",
            )
        ));
        $this->add(array(
            "name" => "NILAI_SISTEM_BNG",
            "type" => "text",
            "options" => array(
                "label" => "Nilai Sistem Bangunan"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "NILAI_SISTEM_BNG",
            )
        ));
        $this->add(array(
            "name" => "JNS_TRANSAKSI_BNG",
            "type" => "text",
            "options" => array(
                "label" => "Jenis Transaksi Bangunan"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "JNS_TRANSAKSI_BNG",
            )
        ));
        $this->add(array(
            "name" => "TGL_PENDATAAN_BNG",
            "type" => "text",
            "options" => array(
                "label" => "Tanggal Pendataan Bangunan"
            ),
            "attributes" => array (
                "class" => "form-control",
                "id" => "TGL_PENDATAAN_BNG",
            )
        ));
        $this->add(array(
            "name" => "NIP_PENDATA_BNG",
            "type" => "text",
            "options" => array(
                "label" => "NIP_PENDATA_BNG"
            )
        ));
        $this->add(array(
            "name" => "TGL_PEMERIKSAAN_BNG",
            "type" => "text",
            "options" => array(
                "label" => "TGL_PEMERIKSAAN_BNG"
            )
        ));
        $this->add(array(
            "name" => "NIP_PEMERIKSA_BNG",
            "type" => "text",
            "options" => array(
                "label" => "NIP_PEMERIKSA_BNG"
            )
        ));
        $this->add(array(
            "name" => "TGL_PEREKAM_BNG",
            "type" => "text",
            "options" => array(
                "label" => "TGL_PEREKAM_BNG"
            )
        ));
        $this->add(array(
            "name" => "NIP_PEREKAM_BNG",
            "type" => "text",
            "options" => array(
                "label" => "NIP_PEREKAM_BNG"
            )
        ));
    }
}
   