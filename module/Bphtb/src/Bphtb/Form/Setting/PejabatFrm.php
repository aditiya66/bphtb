<?php

namespace Bphtb\Form\Setting;

use Zend\Form\Form;

class PejabatFrm extends Form {

    public function __construct($golongan) {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idpejabat',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idpejabat'
            )
        ));

        $this->add(array(
            'name' => 's_namapejabat',
            'type' => 'text',
            'options'=> array(
                'label'=>'Nama Pejabat'
            ),
            'attributes' => array(
                'id' => 's_namapejabat',
                'style' => 'width:75%',
                'class'=>'form-control',
                //'onblur' => 'namapejabat();'
            )
        ));

        $this->add(array(
            'name' => 's_nippejabat',
            'type' => 'text',
            'options'=>array(
                'label'=>'NIP Pejabat'
            ),
            'attributes' => array(
                'id' => 's_nippejabat',
                'class'=>'form-control',
                'style' => 'width:30%',
                //'onblur' => 'nippejabat();'
            )
        ));

        $this->add(array(
            'name' => 's_jabatanpejabat',
            'type' => 'text',
            'options'=>array(
                'label'=>'Jabatan'
            ),
            'attributes' => array(
                'id' => 's_jabatanpejabat',
                'style' => 'width:75%',
                'class'=>'form-control',
                //'onblur' => 'jabatan();'
            )
        ));

        $this->add(array(
            'name' => 's_golonganpejabat',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_golonganpejabat',
                'class'=>'form-control',
                //'onblur' => 'golongan();'
            ),
            'options' => array(
                'label'=>'Golongan/Pangkat',
                'empty_option' => 'Silahkan pilih',
                'value_options' => $golongan,
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
