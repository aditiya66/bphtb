<?php

namespace Bphtb\Form\Setting;

class PersyaratanFrm extends \Zend\Form\Form {

    public function __construct($cmb_jenis_transaksi = null) {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idpersyaratan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idpersyaratan'
            )
        ));

        $this->add(array(
            'name' => 's_idjenistransaksi',
            'type' => 'Zend\Form\Element\Select',
            'options' => array(
                'label' => 'Jenis Transaki',
                'empty_option' => 'Silahkan pilih',
                'value_options'=>$cmb_jenis_transaksi,
            ),
            'attributes' => array(
                'id' => 's_idjenistransaksi',
                'style' => 'width:auto',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namapersyaratan',
            'type' => 'text',
            'options' => array(
                'label' => 'Nama Persyaratan',                
            ),
            'attributes' => array(
                'id' => 's_namapersyaratan',
                'class' => 'form-control',
                'style' => 'width:90%'
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
