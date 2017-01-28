<?php

namespace Bphtb\Form\Setting;

class JenisTransaksiFrm extends \Zend\Form\Form {
    public function __construct() {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idjenistransaksi',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idjenistransaksi'
            )
        ));

        $this->add(array(
            'name' => 's_kodejenistransaksi',
            'type' => 'text',
            'options'=> array(
                'label'=>'Kode Jenis Transaksi'
            ),
            'attributes' => array(
                'id' => 's_kodejenistransaksi',
                'style' => 'width:15%',
                'class'=>'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namajenistransaksi',
            'type' => 'text',
            'options'=>array(
                'label'=>'Nama Jenis Transaksi'
            ),
            'attributes' => array(
                'id' => 's_namajenistransaksi',
                'class'=>'form-control',
                'style' => 'width:50%',
                //'onblur' => 'nippejabat();'
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