<?php

namespace Bphtb\Form\Setting;

class TarifNpotkpFrm extends \Zend\Form\Form {

    public function __construct($jenistransaksi = null) {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idtarifnpotkp',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idtarifnpotkp'
            )
        ));

        $this->add(array(
            'name' => 's_tarifnpotkp',
            'type' => 'text',
            'options' => array(
                'label' => 'Tarif NPOTKP'
            ),
            'attributes' => array(
                'id' => 's_tarifnpotkp',
                'style' => 'width:15%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_tarifnpotkptambahan',
            'type' => 'text',
            'options' => array(
                'label' => 'Tarif NPOTKP Tambahan'
            ),
            'attributes' => array(
                'id' => 's_tarifnpotkptambahan',
                'style' => 'width:25%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_dasarhukumnpotkp',
            'type' => 'text',
            'options' => array(
                'label' => 'Dasar Hukum'
            ),
            'attributes' => array(
                'id' => 's_dasarhukumnpotkp',
                'class' => 'form-control',
                'style' => 'width:50%'
            )
        ));
        
        $this->add(array(
            'name' => 's_statusnpotkp',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_statusnpotkp',
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
            'name' => 's_idjenistransaksinpotkp',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_idjenistransaksinpotkp',
                'class'=>'form-control',
                'style'=>'width:auto'
            ),
            'options' => array(
                'label'=>'Jenis Transaksi',
                'empty_option' => 'Silahkan pilih',
                'value_options' => $jenistransaksi
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
            'name' => 's_tarifnpotkptahunajb1',
            'type' => 'text',
            'options' => array(
                'label' => 'Tahun Mulai Berlaku AJB'
            ),
            'attributes' => array(
                'id' => 's_tarifnpotkptahunajb1',
                'style' => 'width:15%',
                'class' => 'form-control',
                'maxlength'=>4,
            )
        ));
        
        $this->add(array(
            'name' => 's_tarifnpotkptahunajb2',
            'type' => 'text',
            'options' => array(
                'label' => 'Tahun Selesai Berlaku AJB'
            ),
            'attributes' => array(
                'id' => 's_tarifnpotkptahunajb2',
                'style' => 'width:15%',
                'class' => 'form-control',
                'maxlength'=>4,
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
            'name' => 'sidx',
        ));

        $this->add(array(
            'type' => 'text',
            'name' => 'sord',
        ));
    }

}
