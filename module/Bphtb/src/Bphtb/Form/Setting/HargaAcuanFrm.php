<?php

namespace Bphtb\Form\Setting;

class HargaAcuanFrm extends \Zend\Form\Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idacuan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idacuan'
            )
        ));

        // Informasi Objek Pajak
        $this->add(array(
            'name' => 't_nopacuan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nopacuan',
                'class' => 'form-control',
                'data-inputmask' => '"mask": "99.99.999.999.999"',
                'data-mask' => true,
                'placeholder' => '__.__.___.___.___'
//                'data-format' => "dd.dd.ddd.ddd.ddd"
            )
        ));

        $this->add(array(
            'name' => 's_permetertanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_permetertanah',
                'class' => 'form-control',
                'onKeyPress' => "return numbersonly(this, event)",
                'style' => 'text-align:right',
                'onChange' => 'this.value = formatCurrency(this.value);',
                'onBlur' => 'this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value);',
                'onKeyup' => 'this.value = formatCurrency(this.value);',
            )
        ));

        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary btn-flat btn-sm'
            ),
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
            'name' => 'sidx',
        ));

        $this->add(array(
            'type' => 'text',
            'name' => 'sord',
        ));
    }

}
