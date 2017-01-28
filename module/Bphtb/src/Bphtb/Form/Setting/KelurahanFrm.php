<?php

namespace Bphtb\Form\Setting;

use Zend\Form\Form;

class KelurahanFrm extends Form {

    public function __construct($cmb_camat = null) {

        parent::__construct();
        
        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idkelurahan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idkelurahan'
            )
        ));

        $this->add(array(
            'name' => 's_idkecamatan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_idkecamatan',                
                'class'=>'form-control'
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options'=>$cmb_camat,
                'label'=>'Nama Kecamatan',
            )
        ));

        $this->add(array(
            'name' => 's_kodekelurahan',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_kodekelurahan',
                'style' => 'width:100px',
                'class' => 'form-control',
                'minlength'=>4,
                'maxlength'=>4
            ),
            'options' => array (
                'label' => 'Kode Kelurahan'
            )
        ));

        $this->add(array(
            'name' => 's_namakelurahan',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namakelurahan',
                'style' => 'width:400px',
                'class' => 'form-control'
            ),
            'options' => array (
                'label' => 'Nama Kelurahan'
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