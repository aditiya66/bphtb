<?php

namespace Bphtb\Form\Setting;

class TarifBphtbFrm extends \Zend\Form\Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idtarifbphtb',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idtarifbphtb'
            )
        ));

        $this->add(array(
            'name' => 's_tarifbphtb',
            'type' => 'text',
            'options' => array(
                'label' => 'Tarif BPHTB (%)'
            ),
            'attributes' => array(
                'id' => 's_tarifbphtb',
                'style' => 'width:15%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_dasarhukumtarifbphtb',
            'type' => 'text',
            'options' => array(
                'label' => 'Dasar Hukum'
            ),
            'attributes' => array(
                'id' => 's_dasarhukumtarifbphtb',
                'class' => 'form-control',
                'style' => 'width:50%'
            )
        ));
        
        $this->add(array(
            'name' => 's_tanggaltarifbphtb',
            'type' => 'text',
            'options' => array(
                'label' => 'Tanggal Tarif Berlaku'
            ),
            'attributes' => array(
                'id' => 's_tanggaltarifbphtb',
                'class' => 'form-control',
                'style' => 'width:20%'
            )
        ));
        
        $this->add(array(
            'name' => 's_statustarifbphtb',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_statustarifbphtb',
                'class'=>'form-control',
                'style'=>'width:20%'
            ),
            'options' => array(
                'label'=>'Status Tarif',
                'empty_option' => 'Silahkan pilih',
                'value_options' => array("0"=>"Tidak Aktif",
                    "1"=>"Aktif")
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
