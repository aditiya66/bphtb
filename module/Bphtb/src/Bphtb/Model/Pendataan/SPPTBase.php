<?php

namespace Bphtb\Model\Pendataan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SPPTBase implements InputFilterAwareInterface {
    public $t_nopbphtbsppt, $t_thnsppt, $t_nopbphtbspptinfoop, $t_thnspptinfoop,$t_nilaitransaksispt, $t_grandtotalnjop, $t_idjenistransaksi, $checkboxTerbukti;
    public $KD_PROPINSI, $KD_DATI2, $KD_KECAMATAN, $KD_KELURAHAN, $KD_BLOK, $NO_URUT, $KD_JENIS_OP, $THN_PAJAK_SPPT, $SIKLUS_SPPT;
    public $KD_KANWIL, $KD_KANTOR, $KD_TP, $NM_WP_SPPT, $JLN_WP_SPPT, $BLOK_KAV_NO_WP_SPPT, $RW_WP_SPPT, $RT_WP_SPPT, $KELURAHAN_WP_SPPT;
    public $KOTA_WP_SPPT, $KD_POS_WP_SPPT, $NPWP_SPPT, $NO_PERSIL_SPPT, $KD_KLS_TANAH, $THN_AWAL_KLS_TANAH, $KD_KLS_BNG, $THN_AWAL_KLS_BNG;
    public $TGL_JATUH_TEMPO_SPPT, $LUAS_BUMI_SPPT, $LUAS_BNG_SPPT, $NJOP_BUMI_SPPT, $NJOP_BNG_SPPT, $NJOP_SPPT, $NJOPTKP_SPPT, $PBB_TERHUTANG_SPPT;
    public $FAKTOR_PENGURANG_SPPT, $PBB_YANG_HARUS_DIBAYAR_SPPT, $STATUS_PEMBAYARAN_SPPT, $STATUS_TAGIHAN_SPPT, $STATUS_CETAK_SPPT;
    public $TGL_TERBIT_SPPT, $TGL_CETAK_SPPT, $NIP_PENCETAK_SPPT, $KD_JNS_OP;
    public $page;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        //Data BPHTB
        $this->t_nopbphtbsppt = (isset($data['t_nopbphtbsppt'])) ? $data['t_nopbphtbsppt'] : null;
        $this->t_thnsppt = (isset($data['t_thnsppt'])) ? $data['t_thnsppt'] : null;
        $this->checkboxTerbukti = (isset($data['checkboxTerbukti'])) ? $data['checkboxTerbukti'] : null;
        $this->s_idjenistransaksi = (isset($data['s_idjenistransaksi'])) ? $data['s_idjenistransaksi'] : null;
        $this->t_grandtotalnjop = (isset($data['t_grandtotalnjop'])) ? $data['t_grandtotalnjop'] : null;
        $this->t_nilaitransaksispt = (isset($data['t_nilaitransaksispt'])) ? $data['t_nilaitransaksispt'] : null;
        
        //Data PBB
        $this->KD_PROPINSI = (isset($data['KD_PROPINSI'])) ? $data['KD_PROPINSI'] : null;
        $this->KD_DATI2 = (isset($data['KD_DATI2'])) ? $data['KD_DATI2'] : null;
        $this->KD_KECAMATAN = (isset($data['KD_KECAMATAN'])) ? $data['KD_KECAMATAN'] : null;
        $this->KD_KELURAHAN = (isset($data['KD_KELURAHAN'])) ? $data['KD_KELURAHAN'] : null;
        $this->KD_BLOK = (isset($data['KD_BLOK'])) ? $data['KD_BLOK'] : null;
        $this->NO_URUT = (isset($data['NO_URUT'])) ? $data['NO_URUT'] : null;
        $this->KD_JENIS_OP = (isset($data['KD_JENIS_OP'])) ? $data['KD_JENIS_OP'] : null;
        $this->KD_JNS_OP = (isset($data['KD_JNS_OP'])) ? $data['KD_JNS_OP'] : null;
        $this->THN_PAJAK_SPPT = (isset($data['THN_PAJAK_SPPT'])) ? $data['THN_PAJAK_SPPT'] : null;
        $this->SIKLUS_SPPT = (isset($data['SIKLUS_SPPT'])) ? $data['SIKLUS_SPPT'] : null;
        $this->KD_KANWIL = (isset($data['KD_KANWIL'])) ? $data['KD_KANWIL'] : null;
        $this->KD_KANTOR = (isset($data['KD_KANTOR'])) ? $data['KD_KANTOR'] : null;
        $this->KD_TP = (isset($data['KD_TP'])) ? $data['KD_TP'] : null;
        $this->NM_WP_SPPT = (isset($data['NM_WP_SPPT'])) ? $data['NM_WP_SPPT'] : null;
        $this->JLN_WP_SPPT = (isset($data['JLN_WP_SPPT'])) ? $data['JLN_WP_SPPT'] : null;
        $this->BLOK_KAV_NO_WP_SPPT = (isset($data['BLOK_KAV_NO_WP_SPPT'])) ? $data['BLOK_KAV_NO_WP_SPPT'] : null;
        $this->RW_WP_SPPT = (isset($data['RW_WP_SPPT'])) ? $data['RW_WP_SPPT'] : null;
        $this->RT_WP_SPPT = (isset($data['RT_WP_SPPT'])) ? $data['RT_WP_SPPT'] : null;
        $this->KELURAHAN_WP_SPPT = (isset($data['KELURAHAN_WP_SPPT'])) ? $data['KELURAHAN_WP_SPPT'] : null;
        $this->KOTA_WP_SPPT = (isset($data['KOTA_WP_SPPT'])) ? $data['KOTA_WP_SPPT'] : null;
        $this->KD_POS_WP_SPPT = (isset($data['KD_POS_WP_SPPT'])) ? $data['KD_POS_WP_SPPT'] : null;
        $this->NPWP_SPPT = (isset($data['NPWP_SPPT'])) ? $data['NPWP_SPPT'] : null;
        $this->NO_PERSIL_SPPT = (isset($data['NO_PERSIL_SPPT'])) ? $data['NO_PERSIL_SPPT'] : null;
        $this->KD_KLS_TANAH = (isset($data['KD_KLS_TANAH'])) ? $data['KD_KLS_TANAH'] : null;
        $this->THN_AWAL_KLS_TANAH = (isset($data['THN_AWAL_KLS_TANAH'])) ? $data['THN_AWAL_KLS_TANAH'] : null;
        $this->KD_KLS_BNG = (isset($data['KD_KLS_BNG'])) ? $data['KD_KLS_BNG'] : null;
        $this->THN_AWAL_KLS_BNG = (isset($data['KD_PROPINSI'])) ? $data['KD_PROPINSI'] : null;
        $this->TGL_JATUH_TEMPO_SPPT = (isset($data['TGL_JATUH_TEMPO_SPPT'])) ? $data['TGL_JATUH_TEMPO_SPPT'] : null;
        $this->LUAS_BUMI_SPPT = (isset($data['LUAS_BUMI_SPPT'])) ? $data['LUAS_BUMI_SPPT'] : null;
        $this->LUAS_BNG_SPPT = (isset($data['LUAS_BNG_SPPT'])) ? $data['LUAS_BNG_SPPT'] : null;
        $this->NJOP_BUMI_SPPT = (isset($data['NJOP_BUMI_SPPT'])) ? $data['NJOP_BUMI_SPPT'] : null;
        $this->NJOP_BNG_SPPT = (isset($data['NJOP_BNG_SPPT'])) ? $data['NJOP_BNG_SPPT'] : null;
        $this->NJOP_SPPT = (isset($data['NJOP_SPPT'])) ? $data['NJOP_SPPT'] : null;
        $this->NJOPTKP_SPPT = (isset($data['NJOPTKP_SPPT'])) ? $data['NJOPTKP_SPPT'] : null;
        $this->PBB_TERHUTANG_SPPT = (isset($data['PBB_TERHUTANG_SPPT'])) ? $data['PBB_TERHUTANG_SPPT'] : null;
        $this->FAKTOR_PENGURANG_SPPT = (isset($data['FAKTOR_PENGURANG_SPPT'])) ? $data['FAKTOR_PENGURANG_SPPT'] : null;
        $this->PBB_YANG_HARUS_DIBAYAR_SPPT = (isset($data['PBB_YANG_HARUS_DIBAYAR_SPPT'])) ? $data['PBB_YANG_HARUS_DIBAYAR_SPPT'] : null;
        $this->STATUS_TAGIHAN_SPPT = (isset($data['STATUS_TAGIHAN_SPPT'])) ? $data['STATUS_TAGIHAN_SPPT'] : null;
        $this->STATUS_CETAK_SPPT = (isset($data['STATUS_CETAK_SPPT'])) ? $data['STATUS_CETAK_SPPT'] : null;
        $this->TGL_TERBIT_SPPT = (isset($data['TGL_TERBIT_SPPT'])) ? $data['TGL_TERBIT_SPPT'] : null;
        $this->TGL_CETAK_SPPT = (isset($data['TGL_CETAK_SPPT'])) ? $data['TGL_CETAK_SPPT'] : null;
        $this->NIP_PENCETAK_SPPT = (isset($data['NIP_PENCETAK_SPPT'])) ? $data['NIP_PENCETAK_SPPT'] : null;
        
        $this->t_nopbphtbspptinfoop = (isset($data['t_nopbphtbspptinfoop'])) ? $data['t_nopbphtbspptinfoop'] : null;
        $this->t_thnspptinfoop = (isset($data['t_thnspptinfoop'])) ? $data['t_thnspptinfoop'] : null;

        $this->page = (isset($data['page'])) ? $data['page'] : null;
        $this->rows = (isset($data['rows'])) ? $data['rows'] : null;
        $this->sidx = (isset($data['sidx'])) ? $data['sidx'] : null;
        $this->sord = (isset($data['sord'])) ? $data['sord'] : null;
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
