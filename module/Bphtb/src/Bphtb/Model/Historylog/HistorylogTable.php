<?php

namespace Bphtb\Model\Historylog;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class HistorylogTable extends AbstractTableGateway {

    protected $table = 'history_log';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new HistorylogBase());
        $this->initialize();
    }

    public function getcarihislognamatgl($nama) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_history_log");
        $select->columns(array(
            'hislog_tgl'
        ));
        $where = new Where();
        $where->literal("LOWER(hislog_opr_nama::text) LIKE LOWER('%$nama%')");
        $select->where($where);
        $select->group("hislog_tgl");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getcarihislognama($fixtanggal, $nama) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_history_log");
        $where = new Where();
        $where->literal("LOWER(hislog_opr_nama::text) LIKE LOWER('%$nama%')");
        $where->equalTo("hislog_tgl", $fixtanggal);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getcarihislogaktifitastgl($aktifitas) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_history_log");
        $select->columns(array(
            'hislog_tgl'
        ));
        $where = new Where();
        $where->literal("LOWER(hislog_action::text) LIKE LOWER('%$aktifitas%')");
        $select->where($where);
        $select->group("hislog_tgl");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getcarihislogaktifitas($fixtanggal, $aktifitas) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_history_log");
        $where = new Where();
        $where->literal("LOWER(hislog_action::text) LIKE LOWER('%$aktifitas%')");
        $where->equalTo("hislog_tgl", $fixtanggal);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getcarihislogtime($tglcari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        $where->literal("hislog_time::text LIKE '%$tglcari%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

}
