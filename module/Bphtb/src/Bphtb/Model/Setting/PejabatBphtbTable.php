<?php

namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PejabatBphtbTable extends AbstractTableGateway {

    protected $table = 's_pejabat';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PejabatBphtbBase());
        $this->initialize();
    }

    public function getdata() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataid($pj) {
        $rowset = $this->select(array('s_idpejabat' => $pj));
        $row = $rowset->current();
        return $row;
    }

    public function checkExist(PejabatBphtbBase $pj) {
        $rowset = $this->select(array('s_nippejabat' => $pj->s_nippejabat));
        $row = $rowset->current();
        return $row;
    }

    public function checkId($id) {
        $rowset = $this->select(array('s_idpejabat' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function savedata(PejabatBphtbBase $pj, $session) {
        if (empty($pj->s_golonganpejabat)) {
            $pj->s_golonganpejabat = NULL;
        }
        $data = array(
            's_namapejabat' => $pj->s_namapejabat,
            's_nippejabat' => $pj->s_nippejabat,
            's_jabatanpejabat' => $pj->s_jabatanpejabat,
            's_golonganpejabat' => $pj->s_golonganpejabat
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $id = (int) $pj->s_idpejabat;
        if ($id == 0) {
            $this->insert($data);
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "SIMPAN DATA PEJABAT - " . $pj->s_nippejabat . " - " . $pj->s_namapejabat;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            if ($this->checkId($id)) {
                $this->update($data, array('s_idpejabat' => $pj->s_idpejabat));
                $datahistlog['hislog_idspt'] = 0;
                $datahistlog['hislog_action'] = "UPDATE DATA PEJABAT - " . $pj->s_nippejabat . " - " . $pj->s_namapejabat;
                $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
                $tabel_histlog->insert($datahistlog);
            } else {
                throw new \Exception('Form id does not exist');
            }
        }
    }

    public function comboBoxGolongan() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('ss_golonganpejabat');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCount(PejabatBphtbBase $base) {
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

    public function getGridData(PejabatBphtbBase $base, $offset) {
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
        $this->delete(array('s_idpejabat' => $pb));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = 0;
        $datahistlog['hislog_action'] = "HAPUS PEJABAT - " . $pb;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function getallid($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table)
                ->join('ss_golonganpejabat', 'ss_golonganpejabat.ss_idgolongan = s_pejabat.s_golonganpejabat');
        $where = new Where();
        $where->equalTo("$this->table.s_idpejabat", $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getdaftarpejabat() {
        $sql = "select * from s_pejabat a left join ss_golonganpejabat b on b.ss_idgolongan=a.s_golonganpejabat order by a.s_idpejabat asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

}
