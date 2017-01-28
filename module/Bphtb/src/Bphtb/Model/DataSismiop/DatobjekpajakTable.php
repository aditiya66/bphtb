<?php

namespace Bphtb\Model\DataSismiop;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\ResultSet\ResultSet;

class DatobjekpajakTable extends AbstractTableGateway {

	protected $table = "DAT_OBJEK_PAJAK";

	public function __construct(Adapter $adapter) {
		$this->adapter = $adapter;
		$this->resultSetPrototype = new ResultSet ();
		$this->resultSetPrototype->setArrayObjectPrototype ( new DatobjekpajakBase () );
		$this->initialize ();
	}

	public function getnop(DatobjekpajakBase $base) {
		$data = $this->select ( array (
				"KD_PROPINSI" => $base->KD_PROPINSI,
				"KD_DATI2" => $base->KD_DATI2,
				"KD_KECAMATAN" => $base->KD_KECAMATAN,
				"KD_KELURAHAN" => $base->KD_KELURAHAN,
				"KD_BLOK" => $base->KD_BLOK,
				"NO_URUT" => $base->NO_URUT,
				"KD_JNS_OP" => $base->KD_JNS_OP 
		) );
		return $data->current ();
	}

	public function updateSubjekId(DatobjekpajakBase $base) {
		$data = array (
				"SUBJEK_PAJAK_ID" => $base->SUBJEK_PAJAK_ID 
		);
		$this->update ( $data, array (
				"KD_PROPINSI" => $base->KD_PROPINSI,
				"KD_DATI2" => $base->KD_DATI2,
				"KD_KECAMATAN" => $base->KD_KECAMATAN,
				"KD_KELURAHAN" => $base->KD_KELURAHAN,
				"KD_BLOK" => $base->KD_BLOK,
				"NO_URUT" => $base->NO_URUT,
				"KD_JNS_OP" => $base->KD_JNS_OP 
		) );
	}
}