<?php

namespace Bphtb\Form\Verifikasi;

use Zend\Form\Form;

class VerifikasiSPTFrm extends Form {

    public function __construct($combojenistransaksi, $combohaktanah, $unix_id = null, $persyaratan = null, $persyaratanverifikasi = null) {
        parent::__construct();

        $this->setAttribute("method", "post");

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
            'name' => 't_kohirketetapanspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kohirketetapanspt',
                'class' => 'form-control',
            )
        ));

        $this->add(array(
            'name' => 't_kodebayarbanksppt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kodebayarbanksppt',
                'class' => 'form-control',
                'value' => $unix_id,
                'readonly' => true
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
            'name' => 't_idnotarisspt',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idnotarisspt'
            )
        ));
        $this->add(array(
            'name' => 's_namanotaris',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namanotaris',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_tglverifikasispt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglverifikasispt',
                'class' => 'form-control',
                'value' => date('d-m-Y'),
//                 'onchange' => 'cekvaliditassspd()',
//                 'onblur' => 'cekvaliditassspd()'
            )
        ));
        
        $this->add(array(
            'name' => 't_kohirpembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kohirpembayaran',
                'class' => 'form-control',
//                'onChange' => 'datapembayaran()',
//                'onBlur' => 'datapembayaran()'
            )
        ));

        //Data Wajib Pajak
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
            'name' => 't_npwpwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npwpwppembeli',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_alamatwppembeli',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'id' => 't_alamatwppembeli',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_rtwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rtwppembeli',
                'class' => 'form-control',
                'maxlength' => 3,
                'onKeyPress' => "return numbersonly(this, event)",
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_rwwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rwwppembeli',
                'class' => 'form-control',
                'maxlength' => 3,
                'onKeyPress' => "return numbersonly(this, event)",
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kelurahanwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kelurahanwppembeli',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kecamatanwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kecamatanwppembeli',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kabkotawppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kabkotawppembeli',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kodeposwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kodeposwppembeli',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_telponwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_telponwppembeli',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        //Data Objek Pajak
        $this->add(array(
            'name' => 't_nopbphtbsppt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nopbphtbsppt',
                'class' => 'form-control',
                'onchange' => 'datanop()',
                'onblur' => 'datanop()',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_thnsppt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_thnsppt',
                'class' => 'form-control',
                'onchange' => 'datanop()',
                'onblur' => 'datanop()',
                'maxlength' => 4,
                'onKeyPress' => "return numbersonly(this, event)",
                'readonly' => true
            )
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Checkbox',
            'name' => 't_pemeriksaanop',
            'options' => array(
                'value' => '1',
            ),
            'attributes' => array(
                'id' => 't_pemeriksaanop',
                'onclick' => "if(this.checked){FungsiPemeriksaanOP()}else{FungsiPemeriksaanOP1()}"
            )
        ));

        $this->add(array(
            'name' => 't_alamatop',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'id' => 't_alamatop',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_rtop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rtop',
                'class' => 'form-control',
                'maxlength' => 3,
                'onKeyPress' => "return numbersonly(this, event)",
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_rwop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rwop',
                'class' => 'form-control',
                'maxlength' => 3,
                'onKeyPress' => "return numbersonly(this, event)",
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kelurahanop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kelurahanop',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kecamatanop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kecamatanop',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kabupatenop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kabupatenop',
                'class' => 'form-control',
                'readonly' => true
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
            'name' => 't_njoptanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_njoptanah',
                'class' => 'form-control',
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_totalnjoptanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalnjoptanah',
                'class' => 'form-control',
                'style' => 'text-align:right',
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
            'name' => 't_njopbangunan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_njopbangunan',
                'class' => 'form-control',
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_totalnjopbangunan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalnjopbangunan',
                'class' => 'form-control',
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_grandtotalnjop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_grandtotalnjop',
                'class' => 'form-control',
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));
        
        $this->add(array(
            'name' => 't_nilaitransaksispt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nilaitransaksispt',
                'class' => 'form-control',
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_idjenistransaksi',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_idjenistransaksi',
                'class' => 'form-control',
                'onChange' => 'hitungBphtb()',
                'onBlur' => 'hitungBphtb()',
                'readonly' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combojenistransaksi
            )
        ));

        $this->add(array(
            'name' => 't_idjenishaktanah',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_idjenishaktanah',
                'class' => 'form-control',
                'readonly' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combohaktanah,
            )
        ));

        $this->add(array(
            'name' => 't_nosertifikathaktanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nosertifikathaktanah',
                'class' => 'form-control',
                'readonly' => true
            )
        ));
        
        $this->add(array(
            'name' => 't_tglajb',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglajb',
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
            'name' => 't_tglajbbaru',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglajbbaru',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Checkbox',
            'name' => 'checkboxTerbukti',
            'options' => array(
//                'use_hidden_element' => true,
                'value' => '1',
            ),
            'attributes' => array(
                'onclick' => "if(this.checked){myFunction()}else{myFunction1()}"
            )
        ));
        
        $this->add(array(
            'name' => 'ketwaris',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'id' => 'ketwaris',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        //Informasi Perhitungan Pajak BPHTB
        $this->add(array(
            'name' => 't_npopspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npopspt',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
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
                'readonly' => true,
                'value' => 5
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
        
        //Data Penjual
        $this->add(array(
            'name' => 't_namawppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namawppenjual',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_nikwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nikwppenjual',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_npwpwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npwpwppenjual',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_alamatwppenjual',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'id' => 't_alamatwppenjual',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_rtwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rtwppenjual',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_rwwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rwwppenjual',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kelurahanwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kelurahanwppenjual',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kecamatanwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kecamatanwppenjual',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kabkotawppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kabkotawppenjual',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_kodeposwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kodeposwppenjual',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_telponwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_telponwppenjual',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_statusbayarspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_statusbayarspt',
                'class' => 'form-control',
                'readonly' => true
            )
        ));        

        $this->add(array(
            'name' => 't_tanggalpembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tanggalpembayaran',
                'class' => 'form-control',
                'readonly' => true
//                'value' => date('d-m-Y')
            )
        ));

        //form pemeriksaan objek pajak
        $this->add(array(
            'name' => 'p_luastanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_luastanah',
                'class' => 'form-control',
                'onchange' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 'p_njoptanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_njoptanah',
                'class' => 'form-control',
                'onchange' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'style' => 'text-align:right',
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 'p_luasbangunan',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_luasbangunan',
                'class' => 'form-control',
                'onchange' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 'p_njopbangunan',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_njopbangunan',
                'class' => 'form-control',
                'onchange' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'style' => 'text-align:right',
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 'p_totalnjoptanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_totalnjoptanah',
                'class' => 'form-control',
                'readonly'=> 'readonly',
                'style' => 'text-align:right'
            )
        ));

       
        $this->add(array(
            'name' => 'p_totalnjopbangunan',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_totalnjopbangunan',
                'class' => 'form-control',
                'readonly'=> 'readonly',
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 'p_grandtotalnjop',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_grandtotalnjop',
                'class' => 'form-control',
                'readonly'=> 'readonly',
                'style' => 'text-align:right'
            )
        ));
        
        $this->add(array(
            'name' => 'p_nilaitransaksispt',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_nilaitransaksispt',
                'class' => 'form-control',
                'style' => 'text-align:right',
                'onchange' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'style' => 'text-align:right',
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));


        $this->add(array(
            'type' => 'Zend\Form\Element\Checkbox',
            'name' => 'p_terbukti',
            'options' => array(
//                'use_hidden_element' => true,
                'value' => '1',
            ),
            'attributes' => array(
                'onclick' => "if(this.checked){myFunction()}else{myFunction1()}"
            )
        ));
        
        $this->add(array(
            'name' => 'p_ketwaris',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'id' => 'p_ketwaris',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 'p_namajenistransaksi',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_namajenistransaksi',
                'class' => 'form-control',
                'readonly' => true
            ),
        ));

        $this->add(array(
            'name' => 'p_namahaktanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_namahaktanah',
                'class' => 'form-control',
                'readonly' => true
            ),
        ));

        $this->add(array(
            'name' => 'p_npop',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_npop',
                'class' => 'form-control',
                'readonly'=> 'readonly',
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 'p_potonganspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_potonganspt',
                'class' => 'form-control',
                'readonly'=> 'readonly',
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 'p_persenbphtb',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_persenbphtb',
                'class' => 'form-control',
                'readonly'=> 'readonly',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 'p_npopkp',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_npopkp',
                'class' => 'form-control',
                'readonly'=> 'readonly',
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 'p_totalspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 'p_totalspt',
                'class' => 'form-control',
                'readonly'=> 'readonly',
                'style' => 'text-align:right',
                'readonly' => true
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
            'name' => 't_persyaratan',
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'attributes' => array(
                'id' => 't_persyaratan',          
            ),
            'options' => array(                
                'value_options' => $persyaratan,
            )
        ));
        
        $this->add(array(
            'name' => 't_persyaratanverifikasi',
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'attributes' => array(
                'id' => 't_persyaratanverifikasi',        
            ),
            'options' => array(                
                'value_options' => $persyaratanverifikasi,
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
            'name' => 's_permetertanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_permetertanah',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 'historynjoptanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 'historynjoptanah',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 'analisishargaacuan',
            'type' => 'text',
            'attributes' => array(
                'id' => 'analisishargaacuan',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 'analisisharganjoptanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 'analisisharganjoptanah',
                'class' => 'form-control'
            )
        ));
    }

}
