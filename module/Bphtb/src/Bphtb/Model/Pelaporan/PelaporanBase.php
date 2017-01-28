<?php

namespace Bphtb\Model\Pelaporan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PelaporanBase implements InputFilterAwareInterface {

    public $t_statuspelaporannoratis, $t_idpembayaranspt, $t_idspt, $t_iddetailsptbphtb, $t_tanggalpembayaran;
    public $t_dendabulan, $t_idnotarisspt, $t_nilaipembayarandenda, $t_idnotaris, $t_nilaipembayaransanksi, $t_statuskonfirmasinotaris;
    public $t_noajbbaru, $t_tglajbbaru, $t_idnotaris1, $t_namanotaris;
    public $t_idds, $t_tglprosesds, $t_periodeds, $t_jumlahds, $t_ketetapands, $t_kohirds, $t_kodebayards;
    public $t_kohirspt, $t_tglprosesspt, $t_namawppembeli, $t_totalspt, $s_namajenistransaksi, $s_namanotaris, $t_bulanselesaibayar, $t_tglpelaporannotaris;
    public $t_jmlpph, $t_tglpph, $statuspelaporan;
    public $page, $direction;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;
    
    public function exchangeArray($data) {
        $this->t_kohirspt = (isset($data['t_kohirspt'])) ? $data['t_kohirspt'] : null;
        $this->t_tglprosesspt = (isset($data['t_tglprosesspt'])) ? $data['t_tglprosesspt'] : null;
        $this->t_namawppembeli = (isset($data['t_namawppembeli'])) ? $data['t_namawppembeli'] : null;
        $this->t_totalspt = (isset($data['t_totalspt'])) ? $data['t_totalspt'] : null;
        $this->s_namajenistransaksi = (isset($data['s_namajenistransaksi'])) ? $data['s_namajenistransaksi'] : null;
        $this->s_namanotaris = (isset($data['s_namanotaris'])) ? $data['s_namanotaris'] : null;
        
        $this->t_idpembayaranspt = (isset($data['t_idpembayaranspt'])) ? $data['t_idpembayaranspt'] : null;
        $this->t_idspt = (isset($data['t_idspt'])) ? $data['t_idspt'] : null;
        $this->t_iddetailsptbphtb = (isset($data['t_iddetailsptbphtb'])) ? $data['t_iddetailsptbphtb'] : null;
        $this->t_tanggalpembayaran = (isset($data['t_tanggalpembayaran'])) ? $data['t_tanggalpembayaran'] : null;
        $this->t_nilaipembayarandenda = (isset($data['t_nilaipembayarandenda'])) ? $data['t_nilaipembayarandenda'] : null;
        $this->t_nilaipembayaransanksi = (isset($data['t_nilaipembayaransanksi'])) ? $data['t_nilaipembayaransanksi'] : null;
        $this->t_statuspelaporannoratis = (isset($data['t_statuspelaporannoratis'])) ? $data['t_statuspelaporannoratis'] : null;
        $this->t_statuskonfirmasinotaris = (isset($data['t_statuskonfirmasinotaris'])) ? $data['t_statuskonfirmasinotaris'] : null;
        
        $this->t_noajbbaru = (isset($data['t_noajbbaru'])) ? $data['t_noajbbaru'] : null;
        $this->t_tglajbbaru = (isset($data['t_tglajbbaru'])) ? $data['t_tglajbbaru'] : null;
        $this->t_idnotaris1 = (isset($data['t_idnotaris1'])) ? $data['t_idnotaris1'] : null;
        $this->t_namanotaris = (isset($data['t_namanotaris'])) ? $data['t_namanotaris'] : null;
                
        $this->t_idds = (isset($data['t_idds'])) ? $data['t_idds'] : null;
        $this->t_tglprosesds = (isset($data['t_tglprosesds'])) ? $data['t_tglprosesds'] : null;
        $this->t_periodeds = (isset($data['t_periodeds'])) ? $data['t_periodeds'] : null;
        $this->t_dendabulan = (isset($data['t_dendabulan'])) ? $data['t_dendabulan'] : null;
        $this->t_idnotaris = (isset($data['t_idnotaris'])) ? $data['t_idnotaris'] : null;
        $this->t_jumlahds = (isset($data['t_jumlahds'])) ? $data['t_jumlahds'] : null;
        $this->t_ketetapands = (isset($data['t_ketetapands'])) ? $data['t_ketetapands'] : null;
        $this->t_kohirds = (isset($data['t_kohirds'])) ? $data['t_kohirds'] : null;
        $this->t_kodebayards = (isset($data['t_kodebayards'])) ? $data['t_kodebayards'] : null;
        $this->t_idnotarisspt = (isset($data['t_idnotarisspt'])) ? $data['t_idnotarisspt'] : null;
        $this->t_bulanselesaibayar = (isset($data['t_bulanselesaibayar'])) ? $data['t_bulanselesaibayar'] : null;
        $this->t_tglpelaporannotaris = (isset($data['t_tglpelaporannotaris'])) ? $data['t_tglpelaporannotaris'] : null;
        $this->t_jmlpph = (isset($data['t_jmlpph'])) ? $data['t_jmlpph'] : null;
        $this->t_tglpph = (isset($data['t_tglpph'])) ? $data['t_tglpph'] : null;
        $this->statuspelaporan = (isset($data['statuspelaporan'])) ? $data['statuspelaporan'] : null;
        
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
        throw new \Exception("Not Used");
    }

    public function getInputFilter() {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            $factory = new InputFactory();
           
            $inputFilter->add($factory->createInput(array(
                        'name' => 't_idds',
                        'required' => false
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 't_tglprosesds',
                        'required' => false
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 't_periodeds',
                        'required' => false
            )));
           
            $inputFilter->add($factory->createInput(array(
                        'name' => 't_dendabulan',
                        'required' => false
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 't_idnotaris',
                        'required' => false
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 't_jumlahds',
                        'required' => false
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 't_ketetapands',
                        'required' => false
            )));
            
            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
