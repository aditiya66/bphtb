<?php

// Modul Notifikasi 
namespace Bphtb\Model\Notifikasi;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;

class NotifikasiTable extends AbstractTableGateway {
    protected $table = "t_notifikasi";
    
    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new NotifikasiBase());
        $this->initialize();
    }
    
    public function savedata($useridreceive, $userreadstatus, $usermessages, $usersend, $idnotifikasi = null){
        $data = array(
            't_iduserreceive' => $useridreceive,
            't_userreadstatus' => $userreadstatus,
            't_usermessages' => $usermessages,
            't_idusersend' => $usersend
        );
        $id = (int) $idnotifikasi;
        if($id == 0){
            $this->insert($data);
        }else{
            $this->update($data, array("t_idnotifikasi"=>$idnotifikasi));
        }
    }
}
