<?php
namespace Bphtb\Model;
// dieksekusi sebelum insert data ke tabel dat_subjek_pajak
class dat_subjek_pajak_proc_penentuan_njop_bumiBase implements \Zend\InputFilter\InputFilterAwareInterface
{

    protected $inputFilter;

    public $VLC_KD_PROPINSI, $VLC_KD_DATI2, $VLC_KD_KECAMATAN, $VLC_KD_KELURAHAN, $VLC_KD_BLOK, $VLC_NO_URUT, $VLC_KD_JNS_OP, $VLC_TAHUN_PAJAK, $VLN_FLAG_UPDATE, $VLN_NJOP_BUMI;

    public function exchangeArray($data)
    {
        $this->VLC_KD_PROPINSI = (isset($data["VLC_KD_PROPINSI"])) ? $data["VLC_KD_PROPINSI"] : null;
        $this->VLC_KD_DATI2 = (isset($data["VLC_KD_DATI2"])) ? $data["VLC_KD_DATI2"] : null;
        $this->VLC_KD_KECAMATAN = (isset($data["VLC_KD_KECAMATAN"])) ? $data["VLC_KD_KECAMATAN"] : null;
        $this->VLC_KD_KELURAHAN = (isset($data["VLC_KD_KELURAHAN"])) ? $data["VLC_KD_KELURAHAN"] : null;
        $this->VLC_KD_BLOK = (isset($data["VLC_KD_BLOK"])) ? $data["VLC_KD_BLOK"] : null;
        $this->VLC_NO_URUT = (isset($data["VLC_NO_URUT"])) ? $data["VLC_NO_URUT"] : null;
        $this->VLC_KD_JNS_OP = (isset($data["VLC_KD_JNS_OP"])) ? $data["VLC_KD_JNS_OP"] : null;
        $this->VLC_TAHUN_PAJAK = (isset($data["VLC_TAHUN_PAJAK"])) ? $data["VLC_TAHUN_PAJAK"] : null;
        $this->VLN_FLAG_UPDATE = (isset($data["VLN_FLAG_UPDATE"])) ? $data["VLN_FLAG_UPDATE"] : null;
        $this->VLN_NJOP_BUMI = (isset($data["VLN_NJOP_BUMI"])) ? $data["VLN_NJOP_BUMI"] : null;
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
                "name" => "VLC_TAHUN_PAJAK",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLN_FLAG_UPDATE",
                "required" => False
            ));
            $inputFilter->add(array(
                "name" => "VLN_NJOP_BUMI",
                "required" => False
            ));
            
            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }
}       