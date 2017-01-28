<?php

namespace Bphtb\Form\Pendataan;

use Zend\Form\Form;

class datsubjekpajak extends Form {

	public function __construct() {
		parent::__construct ();
		
		$this->setAttribute ( "method", "post" );
		
		$this->add ( array (
				"name" => "ID_SPT_BPHTB",
				"type" => "hidden",
				'attributes' => array (
						'id' => 'ID_SPT_BPHTB' 
				) 
		) );
		
		$this->add ( array (
				"name" => "NOP",
				"type" => "text",
				"options" => array (
						"label" => "NOP" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'NOP',
						'readonly' => 'readonly' 
				) 
		) );
		
		$this->add ( array (
				"name" => "SUBJEK_PAJAK_ID",
				"type" => "text",
				"options" => array (
						"label" => "ID Subjek Pajak" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'SUBJEK_PAJAK_ID' 
				)
				// 'readonly' => 'readonly'
				 
		) );
		
		$this->add ( array (
				"name" => "NM_WP",
				"type" => "text",
				"options" => array (
						"label" => "Nama Subjek Pajak" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'NM_WP' 
				)
				// 'readonly' => 'readonly'
				 
		) );
		$this->add ( array (
				"name" => "JALAN_WP",
				"type" => "TextArea",
				"options" => array (
						"label" => "Alamat Subjek Pajak" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'JALAN_WP' 
				)
				// 'readonly' => 'readonly'
				 
		) );
		$this->add ( array (
				"name" => "BLOK_KAV_NO_WP",
				"type" => "text",
				"options" => array (
						"label" => "Blok" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'BLOK_KAV_NO_WP' 
				)
				// 'readonly' => 'readonly'
				 
		) );
		$this->add ( array (
				"name" => "RW_WP",
				"type" => "text",
				"options" => array (
						"label" => "Rw" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'RW_WP' 
				)
				// 'readonly' => 'readonly'
				 
		) );
		
		$this->add ( array (
				"name" => "RT_WP",
				"type" => "text",
				"options" => array (
						"label" => "Rt" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'RT_WP' 
				)
				// 'readonly' => 'readonly'
				 
		) );
		
		$this->add ( array (
				"name" => "KELURAHAN_WP",
				"type" => "text",
				"options" => array (
						"label" => "Kelurahan" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'KELURAHAN_WP' 
				)
				// 'readonly' => 'readonly'
				 
		) );
		$this->add ( array (
				"name" => "KOTA_WP",
				"type" => "text",
				"options" => array (
						"label" => "Kabupaten/Kota" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'KOTA_WP' 
				)
				// 'readonly' => 'readonly'
				 
		) );
		$this->add ( array (
				"name" => "KD_POS_WP",
				"type" => "text",
				"options" => array (
						"label" => "Kodepos" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'KD_POS_WP',
						'style' => 'width:50%' 
				)
				// 'readonly' => 'readonly'
				 
		) );
		$this->add ( array (
				"name" => "TELP_WP",
				"type" => "text",
				"options" => array (
						"label" => "Telpon" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'TELP_WP',
						'style' => 'width:50%' 
				)
				// 'readonly' => 'readonly'
				 
		) );
		$this->add ( array (
				"name" => "NPWP",
				"type" => "text",
				"options" => array (
						"label" => "NPWP" 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'NPWP' 
				)
				// 'readonly' => 'readonly'
				 
		) );
		$this->add ( array (
				"name" => "STATUS_PEKERJAAN_WP",
				"type" => "Zend\Form\Element\Select",
				"options" => array (
						"label" => "Pekerjaan",
						'empty_option' => 'Silahkan Pilih',
						'value_options' => array (								
								'1'=>'PNS',
								'2'=>'ABRI/TNI',
								'3'=>'PENSIUNAN',
								'4'=>'BADAN',
								'5'=>'LAINNYA'
						)

						 
				),
				'attributes' => array (
						'class' => 'form-control',
						'id' => 'STATUS_PEKERJAAN_WP' 
				)
				// 'readonly' => 'readonly'
				 
		) );
	}
}
   