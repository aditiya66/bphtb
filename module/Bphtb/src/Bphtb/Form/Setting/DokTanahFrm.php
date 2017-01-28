<?php

namespace Bphtb\Form\Setting;

class DokTanahFrm extends \Zend\Form\Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_iddoktanah',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_iddoktanah'
            )
        ));

        $this->add(array(
            'name' => 's_namadoktanah',
            'type' => 'text',
            'options' => array(
                'label' => 'Nama Dokumen Tanah'
            ),
            'attributes' => array(
                'id' => 's_namadoktanah',
                'class' => 'form-control',
                'style' => 'width:50%'
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
