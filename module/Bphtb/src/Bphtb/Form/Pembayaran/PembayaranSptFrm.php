<?php

namespace Bphtb\Form\Pembayaran;

use Zend\Form\Form;

class PembayaranSptFrm extends Form {

    public function __construct($combonotaris = null) {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idnotarisspt',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_idnotarisspt',
                'class' => 'selectpicker form-control',
                'data-live-search' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combonotaris,
            )
        ));

        $this->add(array(
            'name' => 't_idds',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idds'
            )
        ));

        $this->add(array(
            'name' => 't_idpembayaranspt',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idpembayaranspt'
            )
        ));

        $this->add(array(
            'name' => 'p_idpemeriksaan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 'p_idpemeriksaan'
            )
        ));

        $this->add(array(
            'name' => 't_idspt',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idspt'
            )
        ));

        $this->add(array(
            'name' => 'p_kohirskpdkb',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_kohirskpdkb',
                'class' => 'form-control',
                'onchange' => 'dataskpdkb()',
                'onblur' => 'dataskpdkb()'
            )
        ));

        $this->add(array(
            'name' => 't_tanggalpembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tanggalpembayaran',
                'class' => 'form-control',
                'value' => date('d-m-Y'),
                'onchange' => 'cekvaliditassspd()',
                'onblur' => 'cekvaliditassspd()',
            )
        ));

        $this->add(array(
            'name' => 't_kohirpembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kohirpembayaran',
                'class' => 'form-control',
                'onchange' => 'datapendataansspd()',
                'onblur' => 'datapendataansspd();cekvaliditassspd();'
            )
        ));

        $this->add(array(
            'name' => 't_namawppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namawppembeli',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_nikwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nikwppembeli',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => "jenis_pembayaran",
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 'jenis_pembayaran',
                'class' => 'form-control',
                'onChange' => 'ShowHideTable()',
            ),
            'options' => array(
//                'empty_option' => 'Silahkan Pilih',
                'value_options' => array(
                    '1' => 'Pembayaran SSPD',
                    '2' => 'Pembayaran Denda 250.000',
                    '3' => 'Pembayaran Sanksi 7.500.000'
                )
            )
        ));

        $this->add(array(
            'name' => 't_kodebayarbanksppt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kodebayarbanksppt',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_luastanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_luastanah',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_luasbangunan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_luasbangunan',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_njoptanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_njoptanah',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_njopbangunan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_njopbangunan',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_totalnjoptanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalnjoptanah',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_totalnjopbangunan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalnjopbangunan',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_grandtotalnjop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_grandtotalnjop',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_nilaitransaksispt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nilaitransaksispt',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 's_namajenistransaksi',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namajenistransaksi',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 's_namahaktanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namahaktanah',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_potonganspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_potonganspt',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 'npopnya',
            'type' => 'text',
            'attributes' => array(
                'id' => 'npopnya',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));
        
        $this->add(array(
            'name' => 't_grandtotalspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_grandtotalspt',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));
        
        $this->add(array(
            'name' => 't_dendaspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_dendaspt',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));
        
        $this->add(array(
            'name' => 't_bulandendaspt',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_bulandendaspt',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_nilaipembayaranspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nilaipembayaranspt',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_nilaipembayarandenda',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nilaipembayarandenda',
                'class' => 'form-control',
                'onKeyPress' => "return numbersonly(this, event)",
                'style' => 'text-align:right',
                'onChange' => 'this.value = formatCurrency(this.value);',
                'onBlur' => 'this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'value' => '250.000'
            )
        ));

        $this->add(array(
            'name' => 't_nilaipembayaransanksi',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nilaipembayaransanksi',
                'class' => 'form-control',
                'onKeyPress' => "return numbersonly(this, event)",
                'style' => 'text-align:right',
                'onChange' => 'this.value = formatCurrency(this.value);',
                'onBlur' => 'this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'value' => '7.500.000'
            )
        ));

        $this->add(array(
            'name' => 'pembayaransebelumnya',
            'type' => 'text',
            'attributes' => array(
                'id' => 'pembayaransebelumnya',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 'kurangbayar',
            'type' => 'text',
            'attributes' => array(
                'id' => 'kurangbayar',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary'
            )
        ));

        $this->add(array(
            'type' => 'text',
            'name' => 'page',
        ));

        $this->add(array(
            'type' => 'text',
            'name' => 'rows',
        ));

        $this->add(array(
            'type' => 'text',
            'name' => 'sidx'
        ));

        $this->add(array(
            'text' => 'text',
            'name' => 'sord'
        ));

        $this->add(array(
            'name' => 't_tglajbbaru',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglajbbaru',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_noajbbaru',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_noajbbaru',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_namanotaris',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namanotaris',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 's_alamatnotaris',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_alamatnotaris',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_dendabulan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_dendabulan',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kodebayards',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kodebayards',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kohirds',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kohirds',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_jumlahds',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlahds',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_idnotaris',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_idnotaris',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_npopkpspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npopkpspt',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_persenbphtb',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_persenbphtb',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_totalspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalspt',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));
    }

}
