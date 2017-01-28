<?php

namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class TarifBphtbTable extends AbstractTableGateway {

    protected $table = 's_tarifbphtb';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new TarifBphtbBase());
        $this->initialize();
    }

    public function savedata(TarifBphtbBase $kc, $session) {
        $data = array(
            's_tarifbphtb' => $kc->s_tarifbphtb,
            's_dasarhukumtarifbphtb' => $kc->s_dasarhukumtarifbphtb,
            's_tanggaltarifbphtb' => date('Y-m-d', strtotime($kc->s_tanggaltarifbphtb)),
            's_statustarifbphtb' => $kc->s_statustarifbphtb
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $id = (int) $kc->s_idtarifbphtb;
        if ($id == 0) {
            $this->insert($data);
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "SIMPAN DATA TARIF - " . $kc->s_tarifbphtb;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            $this->update($data, array('s_idtarifbphtb' => $kc->s_idtarifbphtb));
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "UPDATE DATA TARIF - " . $kc->s_tarifbphtb;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        }
    }

    public function getGridCount(TarifBphtbBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        if ($base->s_tarifbphtb != 'undefined')
            $where->literal("$this->table.s_tarifbphtb::text LIKE '%$base->s_tarifbphtb%'");
        if ($base->s_tanggaltarifbphtb != 'undefined')
            $where->literal("$this->table.s_tanggaltarifbphtb::text LIKE '%$base->s_tanggaltarifbphtb%'");
        if ($base->s_dasarhukumtarifbphtb != 'undefined')
            $where->literal("$this->table.s_dasarhukumtarifbphtb::text LIKE '%$base->s_dasarhukumtarifbphtb%'");
        if ($base->s_statustarifbphtb != 'undefined')
            $where->literal("$this->table.s_statustarifbphtb::text LIKE '%$base->s_statustarifbphtb%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(TarifBphtbBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        if ($base->s_tarifbphtb != 'undefined')
            $where->literal("$this->table.s_tarifbphtb::text LIKE '%$base->s_tarifbphtb%'");
        if ($base->s_tanggaltarifbphtb != 'undefined')
            $where->literal("$this->table.s_tanggaltarifbphtb::text LIKE '%$base->s_tanggaltarifbphtb%'");
        if ($base->s_dasarhukumtarifbphtb != 'undefined')
            $where->literal("$this->table.s_dasarhukumtarifbphtb::text LIKE '%$base->s_dasarhukumtarifbphtb%'");
        if ($base->s_statustarifbphtb != 'undefined')
            $where->literal("$this->table.s_statustarifbphtb::text LIKE '%$base->s_statustarifbphtb%'");
        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataId($id) {
        $rowset = $this->select(array('s_idtarifbphtb' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function hapusData($id, $session) {
        $this->delete(array('s_idtarifbphtb' => $id));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = 0;
        $datahistlog['hislog_action'] = "HAPUS TARIF BPHTB - " . $id;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function comboBox() {
        $resultSet = $this->select();
        return $resultSet;
    }

}
