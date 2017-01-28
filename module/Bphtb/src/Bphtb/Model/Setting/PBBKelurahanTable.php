<?php
namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PBBKelurahanTable extends AbstractTableGateway {
    
    protected $table = 'REF_KELURAHAN';
    
    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PBBKelurahanBase());
        $this->initialize();
    }
    
    public function getKelurahan(){
        $resultSet = $this->select();
        return $resultSet;
    }
    
}