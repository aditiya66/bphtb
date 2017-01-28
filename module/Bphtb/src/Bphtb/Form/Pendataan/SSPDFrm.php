<?php

namespace Bphtb\Form\Pendataan;

use Zend\Form\Form;

class SSPDFrm extends Form {

    public function __construct($combojenistransaksi = null, $combohaktanah = null, $combojenisdoktanah = null, $unix_id = null, $combonotaris = null, $persyaratan = null, $combonotaris1 = null) {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idnotarisspt',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_idnotarisspt',
                'class' => 'form-control select2',
                'data-live-search' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combonotaris,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_idnotarisspt1',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_idnotarisspt1',
                'class' => 'form-control select2',
                'data-live-search' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combonotaris1,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_idnotarissptcetak',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_idnotarissptcetak',
                'class' => 'form-control select2',
                'data-live-search' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combonotaris,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_iddetailsptbphtb',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_iddetailsptbphtb'
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
            'name' => 't_idspt',
            'type' => 'hidden',
            'options' => array(
                'label' => 'ID SPT'
            ),
            'attributes' => array(
                'id' => 't_idspt'
            )
        ));

        $this->add(array(
            'name' => 't_tglprosesspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglprosesspt',
                'class' => 'form-control',
                'value' => date('d-m-Y')
            )
        ));

        $this->add(array(
            'name' => 't_tglprosesspttime',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglprosesspttime',
                'class' => 'form-control',
                'value' => date('d-m-Y h:i:s')
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

        //Informasi Wajib Pajak
        $this->add(array(
            'name' => 't_namawppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namawppembeli',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_nikwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nikwppembeli',
                'class' => 'form-control',
                'maxlength' => 16,
//                'onKeyPress' => "return numbersonly(this, event)",
                'onchange' => 'historybphtb();',
                'onblur' => 'historybphtb();'
            )
        ));

        $this->add(array(
            'name' => 't_npwpwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npwpwppembeli',
                'data-inputmask' => '"mask": "99.999.999.9-999.999"',
                'data-mask' => true,
                'placeholder' => '__.___.___._-___.___',
                'class' => 'form-control',
//                'class' => 'form-control input-medium bfh-phone',
//                'data-format' => "dd.ddd.ddd.d-ddd.ddd"
            )
        ));

        $this->add(array(
            'name' => 't_alamatwppembeli',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'id' => 't_alamatwppembeli',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_rtwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rtwppembeli',
                'class' => 'form-control',
                'maxlength' => 3,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_rwwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rwwppembeli',
                'class' => 'form-control',
                'maxlength' => 3,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_kelurahanwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kelurahanwppembeli',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_kecamatanwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kecamatanwppembeli',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_kabkotawppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kabkotawppembeli',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_kodeposwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kodeposwppembeli',
                'class' => 'form-control',
                'maxlength' => 5,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_telponwppembeli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_telponwppembeli',
                'class' => 'form-control',
                'maxlength' => 12,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        // Informasi Objek Pajak
        $this->add(array(
            'name' => 't_nopbphtbsppt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nopbphtbsppt',
                'data-inputmask' => '"mask": "99.99.999.999.999.9999.9"',
                'data-mask' => true,
                'placeholder' => '__.__.___.___.___.____._',
                'class' => 'form-control',
                'style' => 'width:190px;'
//                'class' => 'form-control input-medium bfh-phone',
//                'data-format' => "dd.dd.ddd.ddd.ddd.dddd.d"
            )
        ));

        $this->add(array(
            'name' => 't_thnsppt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_thnsppt',
                'class' => 'form-control',
//                'onchange' => 'datanop()',
//                'onblur' => 'datanop()',
                'maxlength' => 4,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_namasppt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namasppt',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_alamatop',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'id' => 't_alamatop',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_rtop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rtop',
                'class' => 'form-control',
                'maxlength' => 3,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_rwop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rwop',
                'class' => 'form-control',
                'maxlength' => 3,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_kelurahanop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kelurahanop',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_kecamatanop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kecamatanop',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_kabupatenop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kabupatenop',
                'class' => 'form-control',
                'value' => 'KABUPATEN BANDUNG BARAT'
            )
        ));

        $this->add(array(
            'name' => 't_luastanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_luastanah',
//                'class' => 'form-control',
                'onKeyPress' => "return numbersonly(this, event)",
                'onchange' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'style' => 'width:95%'
            )
        ));

        $this->add(array(
            'name' => 't_njoptanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_njoptanah',
                'class' => 'form-control',
                'onKeyPress' => "return numbersonly(this, event)",
                'style' => 'text-align:right;',
                'onchange' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'style' => 'width:95%'
//                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_totalnjoptanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalnjoptanah',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right;width:95%;'
            )
        ));

        $this->add(array(
            'name' => 't_luasbangunan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_luasbangunan',
                'class' => 'form-control',
                'onKeyPress' => "return numbersonly(this, event)",
                'onchange' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'style' => 'width:95%'
            )
        ));

        $this->add(array(
            'name' => 't_njopbangunan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_njopbangunan',
                'class' => 'form-control',
                'onKeyPress' => "return numbersonly(this, event)",
                'style' => 'text-align:right',
                'onchange' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungnjop();this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'style' => 'width:95%'
//                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_totalnjopbangunan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalnjopbangunan',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right;width:95%;'
            )
        ));

        $this->add(array(
            'name' => 't_grandtotalnjop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_grandtotalnjop',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right;width:95%;'
            )
        ));

        $this->add(array(
            'name' => 't_nilaitransaksispt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nilaitransaksispt',
                'class' => 'form-control',
                'onKeyPress' => "return numbersonly(this, event)",
                'style' => 'text-align:right;width:95%;',
                'onChange' => 'this.value = formatCurrency(this.value); TentukanNPOP();',
                'onBlur' => 'this.value = formatCurrency(this.value); TentukanNPOP();',
                'onfocus' => 'this.value = unformatCurrency(this.value)'
            )
        ));

        $this->add(array(
            'name' => 't_idjenistransaksi',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_idjenistransaksi',
                'class' => 'select2 form-control',
                'onChange' => 'TampilPersyaratan()',
                'onBlur' => 'TampilPersyaratan()',
            //'data-live-search' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combojenistransaksi,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_idjenishaktanah',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_idjenishaktanah',
                'class' => 'select2 form-control',
                'data-live-search' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combohaktanah,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Checkbox',
            'name' => 't_terbukti',
            'options' => array(
                'value' => '1',
            ),
            'attributes' => array(
                'id' => 't_terbukti',
                'onclick' => "if(this.checked){myFunction()}else{myFunction1()}"
            )
        ));

        $this->add(array(
            'name' => 't_ketwaris',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'id' => 't_ketwaris',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_idjenisdoktanah',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_idjenisdoktanah',
                'class' => 'select2 form-control',
                'data-live-search' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combojenisdoktanah,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_nosertifikathaktanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nosertifikathaktanah',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_tglajb',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglajb',
                'class' => 'form-control',
                'value' => date('d-m-Y'),
                'onChange' => 'hitungBphtb();',
                'onBlur' => 'hitungBphtb();'
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



        //Informasi Penjual
        $this->add(array(
            'name' => 't_namawppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namawppenjual',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_nikwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nikwppenjual',
                'class' => 'form-control',
                'maxlength' => 16,
//                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_npwpwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npwpwppenjual',
                'data-inputmask' => '"mask": "99.999.999.9-999.999"',
                'data-mask' => true,
                'placeholder' => '__.___.___._-___.___',
                'class' => 'form-control',
//                'class' => 'form-control input-medium bfh-phone',
//                'data-format' => "dd.ddd.ddd.d-ddd.ddd",
            )
        ));

        $this->add(array(
            'name' => 't_alamatwppenjual',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'id' => 't_alamatwppenjual',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_rtwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rtwppenjual',
                'class' => 'form-control',
                'maxlength' => 3,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_rwwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rwwppenjual',
                'class' => 'form-control',
                'maxlength' => 3,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_kelurahanwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kelurahanwppenjual',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_kecamatanwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kecamatanwppenjual',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_kabkotawppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kabkotawppenjual',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_kodeposwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kodeposwppenjual',
                'class' => 'form-control',
                'maxlength' => 5,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_telponwppenjual',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_telponwppenjual',
                'class' => 'form-control',
                'maxlength' => 12,
                'onKeyPress' => "return numbersonly(this, event)"
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
            //'class' => 'form-control',                
            ),
            'options' => array(
                'value_options' => $persyaratan,
                'disable_inarray_validator' => true,
            )
        ));

        $this->add(array(
            'name' => 't_luastanahbpn',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_luastanahbpn',
                'class' => 'form-control',
                'maxlength' => 16,
                'onKeyPress' => "return numbersonly(this, event)",
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)'
            )
        ));

        $this->add(array(
            'name' => 't_luasbangunanbpn',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_luasbangunanbpn',
                'class' => 'form-control',
                'maxlength' => 16,
                'onKeyPress' => "return numbersonly(this, event)",
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)'
            )
        ));

        $this->add(array(
            'name' => 't_tglajbbaru',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglajbbaru',
                'class' => 'form-control',
//                'value' => date('d-m-Y')
            )
        ));

        $this->add(array(
            'name' => 't_noajbbaru',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_noajbbaru',
                'class' => 'form-control',
                'maxlength' => 10,
//                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 's_namahaktanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namahaktanah',
                'class' => 'form-control',
            )
        ));

        $this->add(array(
            'name' => 's_namajenistransaksi',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namajenistransaksi',
                'class' => 'form-control',
            )
        ));

        $this->add(array(
            'name' => 't_nosertifikatbaru',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nosertifikatbaru',
                'class' => 'form-control',
                'maxlength' => 16,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_tglsertifikatbaru',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglsertifikatbaru',
                'class' => 'form-control',
                'value' => date('d-m-Y')
            )
        ));

        $this->add(array(
            'name' => 't_tanggalpembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tanggalpembayaran',
                'class' => 'form-control',
                'value' => date('d-m-Y')
            )
        ));

        $this->add(array(
            'name' => 't_nilaipembayaranspt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nilaipembayaranspt',
                'class' => 'form-control',
            )
        ));

        $this->add(array(
            'name' => 't_tglverifikasispt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nilaipembayaranspt',
                'class' => 'form-control',
            )
        ));

        $this->add(array(
            'name' => 't_nopbphtbspptinfoop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nopbphtbspptinfoop',
                'data-inputmask' => '"mask": "99.99.999.999.999.9999.9"',
                'data-mask' => true,
                'placeholder' => '__.__.___.___.___.____._',
                'class' => 'form-control',
//                'maxlength' => 18,
//                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_thnspptinfoop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_thnspptinfoop',
                'class' => 'form-control',
                'maxlength' => 4,
                'onKeyPress' => "return numbersonly(this, event)"
            )
        ));

        $this->add(array(
            'name' => 't_idpembayaranspt',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idpembayaranspt'
            )
        ));
    }

}
