<?php
namespace Bphtb\Model;
// dieksekusi sebelum insert data ke tabel dat_objek_bumi
class dat_op_bumi_proc_penilaian_bumiBase implements \Zend\InputFilter\InputFilterAwareInterface
{

    protected $inputFilter;

    public $VLC_KD_PROPINSI, $VLC_KD_DATI2, $VLC_KD_KECAMATAN, $VLC_KD_KELURAHAN, $VLC_KD_BLOK, $VLC_NO_URUT, $VLC_KD_JNS_OP, $VLN_NO_BUMI, $VLC_KD_ZNT, $VLN_LUAS_BUMI, $VLC_TAHUN, $VLN_FLAG_UPDATE, $VLN_NILAI_BUMI;

    public function exchangeArray($data)
    {
        $this->VLC_KD_PROPINSI = (isset($data["VLC_KD_PROPINSI"])) ? $data["VLC_KD_PROPINSI"] : null;
        $this->VLC_KD_DATI2 = (isset($data["VLC_KD_DATI2"])) ? $data["VLC_KD_DATI2"] : null;
        $this->VLC_KD_KECAMATAN = (isset($data["VLC_KD_KECAMATAN"])) ? $data["VLC_KD_KECAMATAN"] : null;
        $this->VLC_KD_KELURAHAN = (isset($data["VLC_KD_KELURAHAN"])) ? $data["VLC_KD_KELURAHAN"] : null;
        $this->VLC_KD_BLOK = (isset($data["VLC_KD_BLOK"])) ? $data["VLC_KD_BLOK"] : null;
        $this->VLC_NO_URUT = (isset($data["VLC_NO_URUT"])) ? $data["VLC_NO_URUT"] : null;
        $this->VLC_KD_JNS_OP = (isset($data["VLC_KD_JNS_OP"])) ? $data["VLC_KD_JNS_OP"] : null;
        $this->VLN_NO_BUMI = (isset($data["VLN_NO_BUMI"])) ? $data["VLN_NO_BUMI"] : null;
        $this->VLC_KD_ZNT = (isset($data["VLC_KD_ZNT"])) ? $data["VLC_KD_ZNT"] : null;
        $this->VLN_LUAS_BUMI = (isset($data["VLN_LUAS_BUMI"])) ? $data["VLN_LUAS_BUMI"] : null;
        $this->VLC_TAHUN = (isset($data["VLC_TAHUN"])) ? $data["VLC_TAHUN"] : null;
        $this->VLN_FLAG_UPDATE = (isset($data["VLN_FLAG_UPDATE"])) ? $data["VLN_FLAG_UPDATE"] : null;
        $this->VLN_NILAI_BUMI = (isset($data["VLN_NILAI_BUMI"])) ? $data["VLN_NILAI_BUMI"] : null;
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
                "name" => "VLC_KD_PROPINSI",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLC_KD_DATI2",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLC_KD_KECAMATAN",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLC_KD_KELURAHAN",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLC_KD_BLOK",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLC_NO_URUT",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLC_KD_JNS_OP",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLN_NO_BUMI",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLC_KD_ZNT",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLN_LUAS_BUMI",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLC_TAHUN",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLN_FLAG_UPDATE",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLN_NILAI_BUMI",
                "required" => False
            ));
            
            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }
}       