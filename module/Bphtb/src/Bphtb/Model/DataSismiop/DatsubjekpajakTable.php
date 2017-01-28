<?php

namespace Bphtb\Model\DataSismiop;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\ResultSet\ResultSet;

class DatsubjekpajakTable extends AbstractTableGateway {

	protected $table = "DAT_SUBJEK_PAJAK";

	public function __construct(Adapter $adapter) {
		$this->adapter = $adapter;
		$this->resultSetPrototype = new ResultSet ();
		$this->resultSetPrototype->setArrayObjectPrototype ( new DatsubjekpajakBase () );
		$this->initialize ();
	}

	public function ceksubjekid(DatsubjekpajakBase $base) {
		$data = $this->select ( array (
				"SUBJEK_PAJAK_ID" => $base->SUBJEK_PAJAK_ID 
		) );
		return $data->count ();
	}

	public function simpansubjek(DatsubjekpajakBase $base) {
		$data = array (
				"SUBJEK_PAJAK_ID" => $base->SUBJEK_PAJAK_ID,
				"NM_WP" => $base->NM_WP,
				"JALAN_WP" => $base->JALAN_WP,
				"BLOK_KAV_NO_WP" => $base->BLOK_KAV_NO_WP,
				"RW_WP" => $base->RW_WP,
				"RT_WP" => $base->RT_WP,
				"KELURAHAN_WP" => $base->KELURAHAN_WP,
				"KOTA_WP" => $base->KOTA_WP,
				"KD_POS_WP" => $base->KD_POS_WP,
				"TELP_WP" => $base->TELP_WP,
				"NPWP" => 'npwp',
				"STATUS_PEKERJAAN_WP" => $base->STATUS_PEKERJAAN_WP 
		);
		$this->insert ( $data );
	}
}