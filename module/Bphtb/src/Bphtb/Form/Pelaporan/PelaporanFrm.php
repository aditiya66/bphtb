<?php

namespace Bphtb\Form\Pelaporan;

use Zend\Form\Form;

class PelaporanFrm extends Form {

    public function __construct($combonotaris = null) {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idspt',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idspt'
            )
        ));

        $this->add(array(
            'name' => 't_iddetailsptbphtb',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_iddetailsptbphtb'
            )
        ));

        $this->add(array(
            'name' => 't_idds',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idds'
            )
        ));

        $this->add(array(
            'name' => 't_tglprosesds',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglprosesds',
                'value' => date('d-m-Y'),
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_periodeds',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_periodeds',
                'value' => date('Y'),
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_dendabulan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_dendabulan',
                'class' => 'selectpicker form-control',
                'data-live-search' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => array(
                    '1' => 'Januari',
                    '2' => 'Februari',
                    '3' => 'Maret',
                    '4' => 'April',
                    '5' => 'Mei',
                    '6' => 'Juni',
                    '7' => 'Juli',
                    '8' => 'Agustus',
                    '9' => 'September',
                    '10' => 'Oktober',
                    '11' => 'November',
                    '12' => 'Desember'
                )
            )
        ));

        $this->add(array(
            'name' => 't_idnotaris',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_idnotaris',
                'class' => 'selectpicker form-control',
                'data-live-search' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combonotaris,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_jumlahds',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlahds',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_noajbbaru',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_noajbbaru',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_namanotaris',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namanotaris',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_tglajbbaru',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglajbbaru',
                'value' => date('d-m-Y'),
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_jmlpph',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlpph',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_tglpph',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpph',
                'value' => date('d-m-Y'),
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_tglpelaporannotaris',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpelaporannotaris',
                'value' => date('d-m-Y'),
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_idnotaris1',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idnotaris1',
            )
        ));
        
        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary'
            )
        ));
        
    }
}
