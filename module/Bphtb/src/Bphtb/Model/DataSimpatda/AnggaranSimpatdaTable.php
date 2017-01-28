<?php

namespace Bphtb\Model\DataSimpatda;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\ResultSet\ResultSet;

class AnggaranSimpatdaTable extends AbstractTableGateway {

    protected $table = 'view_anggaran_detail';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new AnggaranSimpatdaBase());
        $this->initialize();
    }

    public function getTargetAnggaran() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->where("s_idanggarandetail = 1");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

}
