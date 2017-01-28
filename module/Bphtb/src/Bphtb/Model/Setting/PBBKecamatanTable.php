<?php
namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PBBKecamatanTable extends AbstractTableGateway {
    
    protected $table = 'REF_KECAMATAN';
    
    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PBBKecamatanBase());
        $this->initialize();
    }
    
    public function getKecamatan(){
        $resultSet = $this->select();
        return $resultSet;
    }
    
}