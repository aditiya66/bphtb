<?php
namespace Bphtb\Model;

class dat_op_bangunanBase implements \Zend\InputFilter\InputFilterAwareInterface
{

    protected $inputFilter;

    public $KD_PROPINSI, $KD_DATI2, $KD_KECAMATAN, $KD_KELURAHAN, $KD_BLOK, $NO_URUT, $KD_JNS_OP, $NO_BNG, $KD_JPB, $NO_FORMULIR_LSPOP, $THN_DIBANGUN_BNG, $THN_RENOVASI_BNG, $LUAS_BNG, $JML_LANTAI_BNG, $KONDISI_BNG, $JNS_KONSTRUKSI_BNG, $JNS_ATAP_BNG, $KD_DINDING, $KD_LANTAI, $KD_LANGIT_LANGIT, $NILAI_SISTEM_BNG, $JNS_TRANSAKSI_BNG, $TGL_PENDATAAN_BNG, $NIP_PENDATA_BNG, $TGL_PEMERIKSAAN_BNG, $NIP_PEMERIKSA_BNG, $TGL_PEREKAM_BNG, $NIP_PEREKAM_BNG;

    public function exchangeArray($data)
    {
        $this->KD_PROPINSI = (isset($data["KD_PROPINSI"])) ? $data["KD_PROPINSI"] : null;
        $this->KD_DATI2 = (isset($data["KD_DATI2"])) ? $data["KD_DATI2"] : null;
        $this->KD_KECAMATAN = (isset($data["KD_KECAMATAN"])) ? $data["KD_KECAMATAN"] : null;
        $this->KD_KELURAHAN = (isset($data["KD_KELURAHAN"])) ? $data["KD_KELURAHAN"] : null;
        $this->KD_BLOK = (isset($data["KD_BLOK"])) ? $data["KD_BLOK"] : null;
        $this->NO_URUT = (isset($data["NO_URUT"])) ? $data["NO_URUT"] : null;
        $this->KD_JNS_OP = (isset($data["KD_JNS_OP"])) ? $data["KD_JNS_OP"] : null;
        $this->NO_BNG = (isset($data["NO_BNG"])) ? $data["NO_BNG"] : null;
        $this->KD_JPB = (isset($data["KD_JPB"])) ? $data["KD_JPB"] : null;
        $this->NO_FORMULIR_LSPOP = (isset($data["NO_FORMULIR_LSPOP"])) ? $data["NO_FORMULIR_LSPOP"] : null;
        $this->THN_DIBANGUN_BNG = (isset($data["THN_DIBANGUN_BNG"])) ? $data["THN_DIBANGUN_BNG"] : null;
        $this->THN_RENOVASI_BNG = (isset($data["THN_RENOVASI_BNG"])) ? $data["THN_RENOVASI_BNG"] : null;
        $this->LUAS_BNG = (isset($data["LUAS_BNG"])) ? $data["LUAS_BNG"] : null;
        $this->JML_LANTAI_BNG = (isset($data["JML_LANTAI_BNG"])) ? $data["JML_LANTAI_BNG"] : null;
        $this->KONDISI_BNG = (isset($data["KONDISI_BNG"])) ? $data["KONDISI_BNG"] : null;
        $this->JNS_KONSTRUKSI_BNG = (isset($data["JNS_KONSTRUKSI_BNG"])) ? $data["JNS_KONSTRUKSI_BNG"] : null;
        $this->JNS_ATAP_BNG = (isset($data["JNS_ATAP_BNG"])) ? $data["JNS_ATAP_BNG"] : null;
        $this->KD_DINDING = (isset($data["KD_DINDING"])) ? $data["KD_DINDING"] : null;
        $this->KD_LANTAI = (isset($data["KD_LANTAI"])) ? $data["KD_LANTAI"] : null;
        $this->KD_LANGIT_LANGIT = (isset($data["KD_LANGIT_LANGIT"])) ? $data["KD_LANGIT_LANGIT"] : null;
        $this->NILAI_SISTEM_BNG = (isset($data["NILAI_SISTEM_BNG"])) ? $data["NILAI_SISTEM_BNG"] : null;
        $this->JNS_TRANSAKSI_BNG = (isset($data["JNS_TRANSAKSI_BNG"])) ? $data["JNS_TRANSAKSI_BNG"] : null;
        $this->TGL_PENDATAAN_BNG = (isset($data["TGL_PENDATAAN_BNG"])) ? $data["TGL_PENDATAAN_BNG"] : null;
        $this->NIP_PENDATA_BNG = (isset($data["NIP_PENDATA_BNG"])) ? $data["NIP_PENDATA_BNG"] : null;
        $this->TGL_PEMERIKSAAN_BNG = (isset($data["TGL_PEMERIKSAAN_BNG"])) ? $data["TGL_PEMERIKSAAN_BNG"] : null;
        $this->NIP_PEMERIKSA_BNG = (isset($data["NIP_PEMERIKSA_BNG"])) ? $data["NIP_PEMERIKSA_BNG"] : null;
        $this->TGL_PEREKAM_BNG = (isset($data["TGL_PEREKAM_BNG"])) ? $data["TGL_PEREKAM_BNG"] : null;
        $this->NIP_PEREKAM_BNG = (isset($data["NIP_PEREKAM_BNG"])) ? $data["NIP_PEREKAM_BNG"] : null;
    }

    public function getArrayCopy()
    {
        return get_object_vars($this);
    }

    public function setInputFilter(\Zend\InputFilter\InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }

    public function getInputFilter()
    {
        if (! $this->inputFilter) {
            $inputFilter = new \Zend\InputFilter\InputFilter();
            
            $inputFilter->add(array(
                "name" => "KD_PROPINSI",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "KD_DATI2",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "KD_KECAMATAN",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "KD_KELURAHAN",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "KD_BLOK",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "NO_URUT",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "KD_JNS_OP",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "NO_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "KD_JPB",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "NO_FORMULIR_LSPOP",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "THN_DIBANGUN_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "THN_RENOVASI_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "LUAS_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "JML_LANTAI_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "KONDISI_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "JNS_KONSTRUKSI_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "JNS_ATAP_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "KD_DINDING",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "KD_LANTAI",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "KD_LANGIT_LANGIT",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "NILAI_SISTEM_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "JNS_TRANSAKSI_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "TGL_PENDATAAN_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "NIP_PENDATA_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "TGL_PEMERIKSAAN_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "NIP_PEMERIKSA_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "TGL_PEREKAM_BNG",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "NIP_PEREKAM_BNG",
                "required" => False
            ));
            
            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }
}       