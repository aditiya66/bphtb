<?php

namespace Bphtb\Model\DataSismiop;

class DatsubjekpajakBase implements \Zend\InputFilter\InputFilterAwareInterface {

	protected $inputFilter;

	public $ID_SPT_BPHTB, $SUBJEK_PAJAK_ID, $NM_WP, $JALAN_WP, $BLOK_KAV_NO_WP, $RW_WP, $RT_WP, $KELURAHAN_WP, $KOTA_WP, $KD_POS_WP, $TELP_WP, $NPWP, $STATUS_PEKERJAAN_WP, $NOP;

	public function exchangeArray($data) {
		$this->NOP = (isset ( $data ['NOP'] )) ? $data ["NOP"] : null;
		$this->SUBJEK_PAJAK_ID = (isset ( $data ["SUBJEK_PAJAK_ID"] )) ? $data ["SUBJEK_PAJAK_ID"] : null;
		$this->NM_WP = (isset ( $data ["NM_WP"] )) ? $data ["NM_WP"] : null;
		$this->JALAN_WP = (isset ( $data ["JALAN_WP"] )) ? $data ["JALAN_WP"] : null;
		$this->BLOK_KAV_NO_WP = (isset ( $data ["BLOK_KAV_NO_WP"] )) ? $data ["BLOK_KAV_NO_WP"] : null;
		$this->RW_WP = (isset ( $data ["RW_WP"] )) ? $data ["RW_WP"] : null;
		$this->RT_WP = (isset ( $data ["RT_WP"] )) ? $data ["RT_WP"] : null;
		$this->KELURAHAN_WP = (isset ( $data ["KELURAHAN_WP"] )) ? $data ["KELURAHAN_WP"] : null;
		$this->KOTA_WP = (isset ( $data ["KOTA_WP"] )) ? $data ["KOTA_WP"] : null;
		$this->KD_POS_WP = (isset ( $data ["KD_POS_WP"] )) ? $data ["KD_POS_WP"] : null;
		$this->TELP_WP = (isset ( $data ["TELP_WP"] )) ? $data ["TELP_WP"] : null;
		$this->NPWP = (isset ( $data ["NPWP"] )) ? $data ["NPWP"] : null;
		$this->STATUS_PEKERJAAN_WP = (isset ( $data ["STATUS_PEKERJAAN_WP"] )) ? $data ["STATUS_PEKERJAAN_WP"] : null;
		$this->ID_SPT_BPHTB = (isset ( $data ['ID_SPT_BPHTB'] )) ? $data ['ID_SPT_BPHTB'] : null;
	}

	public function exchangeObjectFromBphtb($data) {
		$this->NOP = (isset ( $data->t_nopbphtbsppt )) ? $data->t_nopbphtbsppt : null;
		$this->SUBJEK_PAJAK_ID = (isset ( $data->t_nikwppembeli )) ? $data->t_nikwppembeli : null;
		$this->NM_WP = (isset ( $data->t_namawppembeli )) ? $data->t_namawppembeli : null;
		$this->JALAN_WP = (isset ( $data->t_alamatwppembeli )) ? $data->t_alamatwppembeli : null;
		$this->RW_WP = (isset ( $data->t_rwwppembeli )) ? $data->t_rwwppembeli : null;
		$this->RT_WP = (isset ( $data->t_rtwppembeli )) ? $data->t_rtwppembeli : null;
		$this->KELURAHAN_WP = (isset ( $data->t_kelurahanwppembeli )) ? $data->t_kelurahanwppembeli : null;
		$this->KOTA_WP = (isset ( $data->t_kabkotawppembeli )) ? $data->t_kabkotawppembeli : null;
		$this->KD_POS_WP = (isset ( $data->t_kodeposwppembeli )) ? $data->t_kodeposwppembeli : null;
		$this->TELP_WP = (isset ( $data->t_telponwppembeli )) ? $data->t_telponwppembeli : null;
		$this->NPWP = (isset ( $data->t_npwpwppembeli )) ? $data->t_npwpwppembeli : null;
		$this->ID_SPT_BPHTB = (isset ( $data->t_idspt )) ? $data->t_idspt : null;
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
					"name" => "SUBJEK_PAJAK_ID",
					"required" => TRUE 
			) );
			$inputFilter->add ( array (
					"name" => "NM_WP",
					"required" => TRUE 
			) );
			$inputFilter->add ( array (
					"name" => "JALAN_WP",
					"required" => TRUE 
			) );
			$inputFilter->add ( array (
					"name" => "BLOK_KAV_NO_WP",
					"required" => TRUE 
			) );
			$inputFilter->add ( array (
					"name" => "RW_WP",
					"required" => TRUE 
			) );
			$inputFilter->add ( array (
					"name" => "RT_WP",
					"required" => TRUE 
			) );
			$inputFilter->add ( array (
					"name" => "KELURAHAN_WP",
					"required" => TRUE 
			) );
			$inputFilter->add ( array (
					"name" => "KOTA_WP",
					"required" => TRUE 
			) );
			$inputFilter->add ( array (
					"name" => "KD_POS_WP",
					"required" => TRUE 
			) );
			$inputFilter->add ( array (
					"name" => "TELP_WP",
					"required" => TRUE 
			) );
			$inputFilter->add ( array (
					"name" => "NPWP",
					"required" => TRUE 
			) );
			$inputFilter->add ( array (
					"name" => "STATUS_PEKERJAAN_WP",
					"required" => TRUE 
			) );
			
			$this->inputFilter = $inputFilter;
		}
		return $this->inputFilter;
	}
}       