<?php

namespace Bphtb\Form\Setting;

use Zend\Form\Form;
use Zend\Form\Element;

class PemdaFrm extends Form {

    public function __construct($sourceFile = null) {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idpemda',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_idpemda',
                'style' => 'width:50%'
            )
        ));

        $this->add(array(
            'name' => 's_namaprov',
            'type' => 'text',
            'options' => array(
                'label' => 'Nama Provinsi',
            ),
            'attributes' => array(
                'id' => 's_namaprov',
                'style' => 'width:50%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namakabkot',
            'type' => 'text',
            'options' => array(
                'label' => 'Nama Kabupaten/Kota',
            ),
            'attributes' => array(
                'id' => 's_namakabkot',
                'style' => 'width:50%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namaibukotakabkot',
            'type' => 'text',
            'options' => array(
                'label' => 'Nama Ibukota kabupaten/Kota',
            ),
            'attributes' => array(
                'id' => 's_namaibukotakabkot',
                'style' => 'width:50%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_kodeprovinsi',
            'type' => 'text',
            'options' => array(
                'label' => 'Kode Provinsi',
            ),
            'attributes' => array(
                'id' => 's_kodeprovinsi',
                'style' => 'width:50px',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_kodekabkot',
            'type' => 'text',
            'options' => array(
                'label' => 'Kode Kabupaten/Kota',
            ),
            'attributes' => array(
                'id' => 's_kodekabkot',
                'style' => 'width:50px',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namainstansi',
            'type' => 'text',
            'options' => array(
                'label' => 'Nama Instansi',
            ),
            'attributes' => array(
                'id' => 's_namainstansi',
                'style' => 'width:50%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namasingkatinstansi',
            'type' => 'text',
            'options' => array(
                'label' => 'Nama Singkat Instansi',
            ),
            'attributes' => array(
                'id' => 's_namasingkatinstansi',
                'style' => 'width:25%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_alamatinstansi',
            'type' => 'Zend\Form\Element\Textarea',
            'options' => array(
                'label' => 'Alamat Kantor Instansi',
            ),
            'attributes' => array(
                'id' => 's_alamatinstansi',
                'style' => 'width:80%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_notelinstansi',
            'type' => 'text',
            'options' => array(
                'label' => 'Nomor Telpon Kantor Instansi',
            ),
            'attributes' => array(
                'id' => 's_notelinstansi',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namabank',
            'type' => 'text',
            'options' => array(
                'label' => 'Nama Bank',
            ),
            'attributes' => array(
                'id' => 's_namabank',
                'style' => 'width:30%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_norekbank',
            'type' => 'text',
            'options' => array(
                'label' => 'Nomor Rekening',
            ),
            'attributes' => array(
                'id' => 's_norekbank',
                'style' => 'width:30%',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_logofile',
            'type' => 'Zend\Form\Element\File',
            'options' => array(
                'label' => 'Logo Kabupaten/Kota',
            ),
            'attributes' => array(
                'id' => 's_logofile'
            )
        ));
        if ($sourceFile != NULL) {
            $this->add(array(
                'name' => 's_logo',
                'type' => 'Zend\Form\Element\Image',
                'attributes' => array(
                    'id' => 's_logo',
                    'src' => $sourceFile,
                    'style'=>'width:250px;'
                )
            ));
        }else{
            $this->add(array(
                'name' => 's_logo',
                'type' => 'hidden',
                'attributes' => array(
                    'id' => 's_logo',                    
                )
            ));
        }
    }

}
