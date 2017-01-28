<?php

namespace Bphtb\Form\Setting;

class HakTanahFrm extends \Zend\Form\Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idhaktanah',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idhaktanah'
            )
        ));

        $this->add(array(
            'name' => 's_kodehaktanah',
            'type' => 'text',
            'options' => array(
                'label' => 'Kode Hak Tanah'
            ),
            'attributes' => array(
                'id' => 's_kodehaktanah',
                'style' => 'width:15%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namahaktanah',
            'type' => 'text',
            'options' => array(
                'label' => 'Nama Hak Tanah'
            ),
            'attributes' => array(
                'id' => 's_namahaktanah',
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
