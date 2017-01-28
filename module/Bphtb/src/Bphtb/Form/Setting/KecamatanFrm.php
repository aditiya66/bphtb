<?php

namespace Bphtb\Form\Setting;

use Zend\Form\Form;

class KecamatanFrm extends Form {
    
    public function __construct() {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idkecamatan',
            'type' => 'hidden',
            'attributes' => array(             
                'id'=>'s_idkecamatan'
            )
        ));
        
        $this->add(array(
            'name' => 's_kodekecamatan',
            'type' => 'text',
            'options'=> array(
                'label'=>'Kode Kecamatan',
            ),
            'attributes' => array(             
                'id'=>'s_kodekecamatan',
                'style'=>'width:100px',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'name' => 's_namakecamatan',
            'type' => 'text',
            'options'=> array (
                'label'=>'Nama Kecamatan',
            ),
            'attributes' => array(             
                'id'=>'s_namakecamatan',
                'style'=>'width:400px',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary',
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