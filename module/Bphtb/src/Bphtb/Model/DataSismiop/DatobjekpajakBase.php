<?php

namespace Bphtb\Model\DataSismiop;

class DatobjekpajakBase implements \Zend\InputFilter\InputFilterAwareInterface {

	protected $inputFilter;

	public $KD_PROPINSI, $KD_DATI2, $KD_KECAMATAN, $KD_KELURAHAN, $KD_BLOK, $NO_URUT, $KD_JNS_OP, $SUBJEK_PAJAK_ID, $NO_FORMULIR_SPOP, $NO_PERSIL, $JALAN_OP, $BLOK_KAV_NO_OP, $RW_OP, $RT_OP, $KD_STATUS_CABANG, $KD_STATUS_WP, $TOTAL_LUAS_BUMI, $TOTAL_LUAS_BNG, $NJOP_BUMI, $NJOP_BNG, $STATUS_PETA_OP, $JNS_TRANSAKSI_OP, $TGL_PENDATAAN_OP, $NIP_PENDATA, $TGL_PEMERIKSAAN_OP, $NIP_PEMERIKSA_OP, $TGL_PEREKAM_OP, $NIP_PEREKAM_OP;

	public 

	function exchangeArray($data) {
		$this->KD_PROPINSI = (isset ( $data ["KD_PROPINSI"] )) ? $data ["KD_PROPINSI"] : null;
		$this->KD_DATI2 = (isset ( $data ["KD_DATI2"] )) ? $data ["KD_DATI2"] : null;
		$this->KD_KECAMATAN = (isset ( $data ["KD_KECAMATAN"] )) ? $data ["KD_KECAMATAN"] : null;
		$this->KD_KELURAHAN = (isset ( $data ["KD_KELURAHAN"] )) ? $data ["KD_KELURAHAN"] : null;
		$this->KD_BLOK = (isset ( $data ["KD_BLOK"] )) ? $data ["KD_BLOK"] : null;
		$this->NO_URUT = (isset ( $data ["NO_URUT"] )) ? $data ["NO_URUT"] : null;
		$this->KD_JNS_OP = (isset ( $data ["KD_JNS_OP"] )) ? $data ["KD_JNS_OP"] : null;
		$this->SUBJEK_PAJAK_ID = (isset ( $data ["SUBJEK_PAJAK_ID"] )) ? $data ["SUBJEK_PAJAK_ID"] : null;
		$this->NO_FORMULIR_SPOP = (isset ( $data ["NO_FORMULIR_SPOP"] )) ? $data ["NO_FORMULIR_SPOP"] : null;
		$this->NO_PERSIL = (isset ( $data ["NO_PERSIL"] )) ? $data ["NO_PERSIL"] : null;
		$this->JALAN_OP = (isset ( $data ["JALAN_OP"] )) ? $data ["JALAN_OP"] : null;
		$this->BLOK_KAV_NO_OP = (isset ( $data ["BLOK_KAV_NO_OP"] )) ? $data ["BLOK_KAV_NO_OP"] : null;
		$this->RW_OP = (isset ( $data ["RW_OP"] )) ? $data ["RW_OP"] : null;
		$this->RT_OP = (isset ( $data ["RT_OP"] )) ? $data ["RT_OP"] : null;
		$this->KD_STATUS_CABANG = (isset ( $data ["KD_STATUS_CABANG"] )) ? $data ["KD_STATUS_CABANG"] : null;
		$this->KD_STATUS_WP = (isset ( $data ["KD_STATUS_WP"] )) ? $data ["KD_STATUS_WP"] : null;
		$this->TOTAL_LUAS_BUMI = (isset ( $data ["TOTAL_LUAS_BUMI"] )) ? $data ["TOTAL_LUAS_BUMI"] : null;
		$this->TOTAL_LUAS_BNG = (isset ( $data ["TOTAL_LUAS_BNG"] )) ? $data ["TOTAL_LUAS_BNG"] : null;
		$this->NJOP_BUMI = (isset ( $data ["NJOP_BUMI"] )) ? $data ["NJOP_BUMI"] : null;
		$this->NJOP_BNG = (isset ( $data ["NJOP_BNG"] )) ? $data ["NJOP_BNG"] : null;
		$this->STATUS_PETA_OP = (isset ( $data ["STATUS_PETA_OP"] )) ? $data ["STATUS_PETA_OP"] : null;
		$this->JNS_TRANSAKSI_OP = (isset ( $data ["JNS_TRANSAKSI_OP"] )) ? $data ["JNS_TRANSAKSI_OP"] : null;
		$this->TGL_PENDATAAN_OP = (isset ( $data ["TGL_PENDATAAN_OP"] )) ? $data ["TGL_PENDATAAN_OP"] : null;
		$this->NIP_PENDATA = (isset ( $data ["NIP_PENDATA"] )) ? $data ["NIP_PENDATA"] : null;
		$this->TGL_PEMERIKSAAN_OP = (isset ( $data ["TGL_PEMERIKSAAN_OP"] )) ? $data ["TGL_PEMERIKSAAN_OP"] : null;
		$this->NIP_PEMERIKSA_OP = (isset ( $data ["NIP_PEMERIKSA_OP"] )) ? $data ["NIP_PEMERIKSA_OP"] : null;
		$this->TGL_PEREKAM_OP = (isset ( $data ["TGL_PEREKAM_OP"] )) ? $data ["TGL_PEREKAM_OP"] : null;
		$this->NIP_PEREKAM_OP = (isset ( $data ["NIP_PEREKAM_OP"] )) ? $data ["NIP_PEREKAM_OP"] : null;
	}

	public function getArrayCopy() {
		return get_object_vars ( $this );
	}

	public function setInputFilter(\Zend\InputFilter\InputFilterInterface $inputFilter) {
		throw new \Exception ( "Not used" );
	}

	public function getInputFilter() {
		if (! $this->inputFilter) {
			$inputFilter = new \Zend\InputFilter\InputFilter ();
			
			$inputFilter->add ( array (
					"name" => "KD_PROPINSI",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "KD_DATI2",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "KD_KECAMATAN",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "KD_KELURAHAN",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "KD_BLOK",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "NO_URUT",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "KD_JNS_OP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "SUBJEK_PAJAK_ID",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "NO_FORMULIR_SPOP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "NO_PERSIL",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "JALAN_OP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "BLOK_KAV_NO_OP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "RW_OP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "RT_OP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "KD_STATUS_CABANG",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "KD_STATUS_WP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "TOTAL_LUAS_BUMI",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "TOTAL_LUAS_BNG",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "NJOP_BUMI",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "NJOP_BNG",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "STATUS_PETA_OP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "JNS_TRANSAKSI_OP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "TGL_PENDATAAN_OP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "NIP_PENDATA",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "TGL_PEMERIKSAAN_OP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "NIP_PEMERIKSA_OP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "TGL_PEREKAM_OP",
					"required" => False 
			) );
			$inputFilter->add ( array (
					"name" => "NIP_PEREKAM_OP",
					"required" => False 
			) );
			
			$this->inputFilter = $inputFilter;
		}
		return $this->inputFilter;
	}
}       