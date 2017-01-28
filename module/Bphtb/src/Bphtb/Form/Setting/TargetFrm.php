<?php

namespace Bphtb\Form\Setting;

class TargetFrm extends \Zend\Form\Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 'id_anggaran',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 'id_anggaran'
            )
        ));

        $this->add(array(
            'name' => 'thn_anggaran',
            'type' => 'text',
            'options' => array(
                'label' => 'Tahun Anggaran'
            ),
            'attributes' => array(
                'id' => 'thn_anggaran',
                'onKeyPress' => "return numbersonly(this, event)",
                'class' => 'form-control',
                'style' => 'width:50%'
            )
        ));

        $this->add(array(
            'name' => 'target_anggaran',
            'type' => 'text',
            'options' => array(
                'label' => 'Target Anggaran'
            ),
            'attributes' => array(
                'id' => 'target_anggaran',
                'class' => 'form-control',
                'onKeyPress' => "return numbersonly(this, event)",
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onfocus' => 'this.value = unformatCurrency(this.value)',
                'onKeyup' => 'this.value = formatCurrency(this.value)',
                'style' => 'text-align:right;width:50%'
            )
        ));

        $this->add(array(
            'name' => "jenis_anggaran",
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 'jenis_anggaran',
                'class' => 'form-control',
            ),
            'options' => array(
                'value_options' => array(
                    'Murni' => 'Murni',
                    'Perubahan' => 'Perubahan',
                )
            )
        ));

        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary'
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
