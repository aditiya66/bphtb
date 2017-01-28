<?php

namespace Bphtb\Form\Setting;

use Zend\Form\Form;

class PenggunaFrm extends Form {

    public function __construct($ar_role=array(),
            $ar_pejabatnotaris=array(),
            $pendaftaran = null, 
            $validasi = null, 
            $pembayaran = null, 
            $s_standart = null,
            $s_pendataansspd = null, 
            $s_verifikasisspd = null, 
            $s_pembayaransspd = null, 
            $s_bpn = null, 
            $s_cetaklaporan = null, 
            $s_cetaksspd = null, 
            $s_pelaporannotaris = null,
            $s_doktanah = null, 
            $s_haktanah = null, 
            $s_jenistransaksi = null, 
            $s_notaris = null, 
            $s_pejabat = null, 
            $s_pemda = null, 
            $s_persyaratantransaksi = null,
            $s_tarifbphtb = null, 
            $s_tarifnpoptkp = null, 
            $s_user = null, 
            $s_hargaacuan = null,
            $s_pendataanpbb = null,
            $s_koreksi = null,
            $s_monitoring = null,
            $s_historylog = null,
            $s_kecamatan = null,
            $s_kelurahan = null,
            $s_target = null
            ) {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_iduser',
            'type' => 'hidden',
        ));

        $this->add(array(
            'name' => 's_username',
            'type' => 'text',
            'options'=>array(
                'label'=>'Username'
            ),
            'attributes' => array(
                'id'=>'s_username',
                'class'=>'form-control',
                'style'=>'width:100%;'
            )
        ));

        $this->add(array(
            'name' => 's_password',
            'type' => 'password',
            'attributes' => array(
                'class'=>'form-control',
                'id'=>'s_password'
            ),
            'options'=>array(
                'label'=>'Password',                
            ),
        ));

        $this->add(array(
            'name' => 't_pass2',
            'type' => 'password',
            'attributes' => array(
                'class'=>'form-control',
                'id'=>'t_pass2'
            ),
            'options'=>array(
                'label'=>'Ulangi Password',                
            ),
        ));

        $this->add(array(
            'name' => 's_jabatan',
            'type' => 'text',
            'attributes' => array(
                'class'=>'form-control',
                'id'=>'s_jabatan',
            ),
            'options'=>array(
                'label'=>'Jabatan'
            ),
        ));

        // $this->add(array(
        //     'type' => 'Zend\Form\Element\MultiCheckbox',
        //     'name' => 's_akses',
        //     'options' => array(
        //         'value_options' => array(
        //             '1' => 'Administrator',
        //             '2' => 'Pendaftaran',
        //             '3' => 'Pendataan',
        //             '4' => 'Penetapan',
        //             '5' => 'Pembayaran'
        //         ),
        //         'label'=>'Hak Akses'
        //     ),
        //     'attributes' => array(
        //         //'class'=>'form-control',
        //         'id'=>'s_akses',
        //     ),            
        // ));

        $this->add(array(
            'name' => 's_akses',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_akses',                
                'class'=>'form-control'
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options'=>$ar_role,
                'label'=>'Tipe Pengguna (Hak Akses)',
            )
        ));

         $this->add(array(
            'name' => 's_tipe_pejabat',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_tipe_pejabat',                
                'class'=>'form-control'
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options'=>array(
                    '1'=>'Pejabat',
                    '2'=>'Pejabat Notaris/PPAT',
                ),
                'label'=>'Tipe Pejabat',
            )
        ));

        $this->add(array(
            'name' => 's_idpejabat_idnotaris',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_list_pejabat',                
                'class'=>'form-control'
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options' => $ar_pejabatnotaris,
                'label'=>'Pejabat atau Notaris/PPAT',
                'disable_inarray_validator' => true
            )
        ));        
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_pendataansspd',
            'options' => array(
                'value_options' => $s_pendataansspd,
                'label'=>'Pendataan SSPD'
            ),
            'attributes' => array(
                'id'=>'s_pendataansspd',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_verifikasisspd',
            'options' => array(
                'value_options' => $s_verifikasisspd,
                'label'=>'Verifikasi SSPD'
            ),
            'attributes' => array(
                'id'=>'s_verifikasisspd',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_pembayaransspd',
            'options' => array(
                'value_options' => $s_pembayaransspd,
                'label'=>'Pembayaran SSPD'
            ),
            'attributes' => array(
                'id'=>'s_pembayaransspd',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_bpn',
            'options' => array(
                'value_options' => $s_bpn,
                'label'=>'BPN'
            ),
            'attributes' => array(
                'id'=>'s_bpn',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_cetaklaporan',
            'options' => array(
                'value_options' => $s_cetaklaporan,
                'label'=>'Cetak Laporan'
            ),
            'attributes' => array(
                'id'=>'s_cetaklaporan',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_cetaksspd',
            'options' => array(
                'value_options' => $s_cetaksspd,
                'label'=>'Cetak SSPD'
            ),
            'attributes' => array(
                'id'=>'s_cetaksspd',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_pelaporannotaris',
            'options' => array(
                'value_options' => $s_pelaporannotaris,
                'label'=>'Cetak Pelaporan Notaris'
            ),
            'attributes' => array(
                'id'=>'s_pelaporannotaris',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_doktanah',
            'options' => array(
                'value_options' => $s_doktanah,
                'label'=>'Setting Jenis Dokumen Tanah'
            ),
            'attributes' => array(
                'id'=>'s_doktanah',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_haktanah',
            'options' => array(
                'value_options' => $s_haktanah,
                'label'=>'Setting Jenis Hak Tanah'
            ),
            'attributes' => array(
                'id'=>'s_haktanah',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_jenistransaksi',
            'options' => array(
                'value_options' => $s_jenistransaksi,
                'label'=>'Setting Jenis Transaksi'
            ),
            'attributes' => array(
                'id'=>'s_jenistransaksi',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_notaris',
            'options' => array(
                'value_options' => $s_notaris,
                'label'=>'Setting Notaris'
            ),
            'attributes' => array(
                'id'=>'s_notaris',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_pejabat',
            'options' => array(
                'value_options' => $s_pejabat,
                'label'=>'Setting Pejabat'
            ),
            'attributes' => array(
                'id'=>'s_pejabat',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_pemda',
            'options' => array(
                'value_options' => $s_pemda,
                'label'=>'Setting Pemerintah Daerah'
            ),
            'attributes' => array(
                'id'=>'s_pemda',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_persyaratantransaksi',
            'options' => array(
                'value_options' => $s_persyaratantransaksi,
                'label'=>'Setting Persyaratan Transaksi'
            ),
            'attributes' => array(
                'id'=>'s_persyaratantransaksi',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_tarifbphtb',
            'options' => array(
                'value_options' => $s_tarifbphtb,
                'label'=>'Setting Tarif BPHTB'
            ),
            'attributes' => array(
                'id'=>'s_tarifbphtb',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_tarifnpoptkp',
            'options' => array(
                'value_options' => $s_tarifnpoptkp,
                'label'=>'Setting Tarif NPOPTKP'
            ),
            'attributes' => array(
                'id'=>'s_tarifnpoptkp',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_user',
            'options' => array(
                'value_options' => $s_user,
                'label'=>'Setting Pengguna'
            ),
            'attributes' => array(
                'id'=>'s_user',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_koreksi',
            'options' => array(
                'value_options' => $s_koreksi,
                'label'=>'Menu Koreksi'
            ),
            'attributes' => array(
                'id'=>'s_koreksi',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_standart',
            'options' => array(
                'value_options' => $s_standart,
                'label'=>'Modul Standart'
            ),
            'attributes' => array(
                'id'=>'s_standart',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_hargaacuan',
            'options' => array(
                'value_options' => $s_hargaacuan,
                'label'=>'Modul Harga Acuan Tanah/m2'
            ),
            'attributes' => array(
                'id'=>'s_hargaacuan',
            ),            
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_pendataanpbb',
            'options' => array(
                'value_options' => $s_pendataanpbb,
                'label'=>'Modul Pendataan SIMPBB/SISMIOP'
            ),
            'attributes' => array(
                'id'=>'s_pendataanpbb',
            ),
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_monitoring',
            'options' => array(
                'value_options' => $s_monitoring,
                'label'=>'Modul Monitoring'
            ),
            'attributes' => array(
                'id'=>'s_monitoring',
            ),
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_historylog',
            'options' => array(
                'value_options' => $s_historylog,
                'label'=>'Modul History Log'
            ),
            'attributes' => array(
                'id'=>'s_historylog',
            ),
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_kecamatan',
            'options' => array(
                'value_options' => $s_kecamatan,
                'label'=>'Modul Kecamatan'
            ),
            'attributes' => array(
                'id'=>'s_kecamatan',
            ),
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_kelurahan',
            'options' => array(
                'value_options' => $s_kelurahan,
                'label'=>'Modul Kelurahan'
            ),
            'attributes' => array(
                'id'=>'s_kelurahan',
            ),
        ));
        
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 's_target',
            'options' => array(
                'value_options' => $s_target,
                'label'=>'Modul Target Anggaran'
            ),
            'attributes' => array(
                'id'=>'s_target',
            ),
        ));

        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary'
            ),
        ));
        
    }

    public function populateValues($data) {
        foreach ($data as $key => $row) {
            if (is_array(@json_decode($row))) {
                $data[$key] = new \ArrayObject(\Zend\Json\Json::decode($row), \ArrayObject::ARRAY_AS_PROPS);
            }
        }
        parent::populateValues($data);
    }

}