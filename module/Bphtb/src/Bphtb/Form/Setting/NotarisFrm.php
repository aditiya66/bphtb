<?php
namespace Bphtb\Form\Setting;

class NotarisFrm extends \Zend\Form\Form {
    
    public function __construct() {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idnotaris',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idnotaris'
            )
        ));

        $this->add(array(
            'name' => 's_namanotaris',
            'type' => 'text',
            'options'=> array(
                'label'=>'Nama Notaris'
            ),
            'attributes' => array(
                'id' => 's_namanotaris',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'name' => 's_alamatnotaris',
            'type' => 'textarea',
            'options'=> array(
                'label'=>'Alamat Notaris'
            ),
            'attributes' => array(
                'id' => 's_alamatnotaris',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'name' => 's_kodenotaris',
            'type' => 'text',
            'options'=> array(
                'label'=>'Kode Notaris'
            ),
            'attributes' => array(
                'id' => 's_kodenotaris',
                'style' => 'width:25%',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'name' => 's_sknotaris',
            'type' => 'text',
            'options'=> array(
                'label'=>'No. SK Notaris'
            ),
            'attributes' => array(
                'id' => 's_sknotaris',
                'style' => 'width:50%',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'name' => 's_tgl1notaris',
            'type' => 'text',
            'options'=> array(
                'label'=>'Tanggal SK Notaris Mulai Berlaku' 
            ),
            'attributes' => array(
                'id' => 's_tgl1notaris',
                'style' => 'width:15%',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'name' => 's_tgl2notaris',
            'type' => 'text',
            'options'=> array(
                'label'=>'Tanggal SK Notaris Berakhir' 
            ),
            'attributes' => array(
                'id' => 's_tgl2notaris',
                'style' => 'width:15%',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'name' => 's_statusnotaris',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_statusnotaris',
                'class'=>'form-control',
                'style'=>'width:20%'
            ),
            'options' => array(
                'label'=>'Status Notaris',
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