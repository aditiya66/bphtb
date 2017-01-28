<?php

namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class KelurahanBphtbTable extends AbstractTableGateway {

    protected $table = 's_kelurahan';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new KelurahanBphtbBase());
        $this->initialize();
    }

    public function getdata() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function checkExist(KelurahanBphtbBase $kb) {
        $rowset = $this->select(array('s_kodekelurahan' => $kb->s_kodekelurahan));
        $row = $rowset->current();
        return $row;
    }

    public function checkId(KelurahanBphtbBase $kb) {
        $rowset = $this->select(array('s_idkelurahan' => $kb->s_idkelurahan));
        $row = $rowset->current();
        return $row;
    }

    public function savedata(KelurahanBphtbBase $kb, $session) {
        $data = array(
            's_idkecamatan' => $kb->s_idkecamatan,
            's_kodekelurahan' => $kb->s_kodekelurahan,
            's_namakelurahan' => $kb->s_namakelurahan
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $id = (int) $kb->s_idkelurahan;
        if ($id == 0) {
            $this->insert($data);
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "SIMPAN KELURAHAN - " . $kb->s_kodekelurahan . " - " . $kb->s_namakelurahan;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            if ($this->checkId($kb)) {
                $this->update($data, array('s_idkelurahan' => $kb->s_idkelurahan));
                $datahistlog['hislog_idspt'] = 0;
                $datahistlog['hislog_action'] = "UPDATE KELURAHAN - " . $kb->s_kodekelurahan . " - " . $kb->s_namakelurahan;
                $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
                $tabel_histlog->insert($datahistlog);
            } else {
                throw new \Exception('Form id does not exist');
            }
        }
    }

    public function save($kc) {
        $data = array(
            's_idkecamatan' => $kc['s_idkecamatan'],
            's_kodekelurahan' => $kc['s_kodekelurahan'],
            's_namakelurahan' => $kc['s_namakelurahan']
        );

        $this->insert($data);
    }

    public function checkEmpty() {
        $resultSet = $this->select();
        return $resultSet->count();
    }

    public function getGridCount(KelurahanBphtbBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_kelurahan");
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

    public function getGridData(KelurahanBphtbBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_kelurahan");
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

    public function getDataId($kb) {
        $rowset = $this->select(array('s_idkelurahan' => $kb));
        $row = $rowset->current();
        return $row;
    }

    public function hapusData($id, $session) {
        $this->delete(array('s_idkelurahan' => $id));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = 0;
        $datahistlog['hislog_action'] = "HAPUS KELURAHAN - " . $id;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function comboBox() {
        $resultSet = $this->select();
        return $resultSet;
    }

    public function getByKecamatan(KelurahanBphtbBase $kb) {
        $resultSet = $this->select(array('s_idkecamatan' => $kb->s_idkecamatan));
        return $resultSet;
    }

    public function getByKecamatan2($id) {
        $resultSet = $this->select(array('s_idkecamatan' => $id));
        return $resultSet;
    }

    public function getdaftarkelurahan() {
        $sql = "select * from view_kelurahan order by s_kodekelurahan asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

}
