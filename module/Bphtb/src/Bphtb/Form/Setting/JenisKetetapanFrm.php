<?php

namespace Bphtb\Form\Setting;

class JenisKetetapanFrm extends \Zend\Form\Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idjenisketetapan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idjenisketetapan'
            )
        ));

        $this->add(array(
            'name' => 's_namajenisketetapan',
            'type' => 'text',
            'options' => array(
                'label' => 'Nama Jenis Ketetapan'
            ),
            'attributes' => array(
                'id' => 's_namajenisketetapan',
                'style' => 'width:75%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namasingkatjenisketetapan',
            'type' => 'text',
            'options' => array(
                'label' => 'Nama Singkat Ketetapan'
            ),
            'attributes' => array(
                'id' => 's_namasingkatjenisketetapan',
                'class' => 'form-control',
                'style' => 'width:20%'
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
