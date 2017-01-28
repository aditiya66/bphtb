<?php

namespace Bphtb\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\ResultSet\ResultSet;

class SPTWarisTable extends AbstractTableGateway {

    protected $table = 't_penerimawaris';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SPTWarisBase());
        $this->initialize();
    }

    public function savedatawaris($nama, $alamat, $nik) {
        $id = 0;
        $dataa = $this->getIdSpt();
        if ($id == 0) {
            $data = array(
                't_idspt' => $dataa['t_idspt'],
                't_namapenerima' => $nama,
                't_alamatpenerima' => $alamat,
                't_nikpenerima' => $nik,
            );
            $this->insert($data);
        } else {
            $data = array(
                't_idspt' => $dataa['t_kohirspt'],
                't_namapenerima' => $nama,
                't_alamatpenerima' => $alamat,
                't_nikpenerima' => $nik,
            );
            $this->update($data, array('t_idpenerima' => $spt->t_idspt));
        }
    }

    public function getIdSpt() {
        $sql = "select max(t_idspt) as t_idspt 
                from t_spt";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }
    
    public function CariPenerimaWaris($idspt){
        $sql = "select * from t_penerimawaris where t_idspt=$idspt";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }
}