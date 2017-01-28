<?php

namespace Bphtb\Model\Setting;

use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Where;

class NotarisBphtbTable extends \Zend\Db\TableGateway\AbstractTableGateway {

    protected $table = "s_notaris", $table_user = 's_users';

    public function __construct(\Zend\Db\Adapter\Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new \Zend\Db\ResultSet\ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new NotarisBphtbBase());
        $this->initialize();
    }

    public function checkId($id) {
        $rowset = $this->select(array('s_idnotaris' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function getdataCombo() {

        $sql = "select * from s_notaris a "
                . "left join s_users b on b.s_idpejabat_idnotaris::text = a.s_idnotaris::text "
                . "where b.s_tipe_pejabat = '2' order by s_namanotaris asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
//        
//        $sql = new \Zend\Db\Sql\Sql($this->adapter);
//        $select = $sql->select();
//        $select->from($this->table);
//        $select->join($this->table_user, "$this->table_user.s_idpejabat_idnotaris::int = $this->table.s_idnotaris");
//        $where = new Where();
//        $where->equalTo("$this->table_user.s_tipe_pejabat", "2");
//        $select->where($where);
//        $state = $sql->prepareStatementForSqlObject($select);
//        $res = $state->execute();
//        return $res;
    }

    public function getdata() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function checkExist(NotarisBphtbBase $pj) {
        $rowset = $this->select(array('s_namanotaris' => $pj->s_namanotaris));
        $row = $rowset->current();
        return $row;
    }

    public function savedata(NotarisBphtbBase $np, $session) {
        $data = array(
            "s_namanotaris" => $np->s_namanotaris,
            "s_alamatnotaris" => $np->s_alamatnotaris,
            "s_kodenotaris" => $np->s_kodenotaris,
            "s_sknotaris" => $np->s_sknotaris,
            "s_tgl1notaris" => date('Y-m-d', strtotime($np->s_tgl1notaris)),
            "s_tgl2notaris" => date('Y-m-d', strtotime($np->s_tgl2notaris)),
            "s_statusnotaris" => $np->s_statusnotaris
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );

        $id = (int) $np->s_idnotaris;
        if ($id == 0) {
            $this->insert($data);
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "SIMPAN DATA NOTARIS - " . $np->s_kodenotaris . " - " . $np->s_namanotaris;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            $this->update($data, array("s_idnotaris" => $np->s_idnotaris));
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "UPDATE DATA NOTARIS - " . $np->s_kodenotaris . " - " . $np->s_namanotaris;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        }
    }

    public function getGridCount(NotarisBphtbBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(NotarisBphtbBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new \Zend\Db\Sql\Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $select->where($where);
        if ($base->sortasc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortasc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            }
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function hapusData($pb, $session) {
        $this->delete(array('s_idnotaris' => $pb));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = 0;
        $datahistlog['hislog_action'] = "HAPUS NOTARIS - " . $pb;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function getdaftarnotaris() {
        $sql = "select * from s_notaris order by s_kodenotaris asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

}
