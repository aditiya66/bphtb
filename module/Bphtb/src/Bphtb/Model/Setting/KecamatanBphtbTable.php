<?php

namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class KecamatanBphtbTable extends AbstractTableGateway {

    protected $table = 's_kecamatan';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new KecamatanBphtbBase());
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

    public function checkExist(KecamatanBphtbBase $kc) {
        $rowset = $this->select(array('s_kodekecamatan' => $kc->s_kodekecamatan));
        $row = $rowset->current();
        return $row;
    }

    public function checkId(KecamatanBphtbBase $kc) {
        $rowset = $this->select(array('s_idkecamatan' => $kc->s_idkecamatan));
        $row = $rowset->current();
        return $row;
    }

    public function savedata(KecamatanBphtbBase $kc, $session) {
        $data = array(
            's_kodekecamatan' => $kc->s_kodekecamatan,
            's_namakecamatan' => $kc->s_namakecamatan
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $id = (int) $kc->s_idkecamatan;
        if ($id == 0) {
            $this->insert($data);
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "SIMPAN KECAMATAN - " . $kc->s_kodekecamatan . " - " . $kc->s_namakecamatan;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            if ($this->checkId($kc)) {
                $this->update($data, array('s_idkecamatan' => $kc->s_idkecamatan));
                $datahistlog['hislog_idspt'] = 0;
                $datahistlog['hislog_action'] = "UPDATE KECAMATAN - " . $kc->s_kodekecamatan . " - " . $kc->s_namakecamatan;
                $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
                $tabel_histlog->insert($datahistlog);
            } else {
                throw new \Exception('Form id does not exist');
            }
        }
    }

    public function save($kc) {
        $data = array(
            's_kodekecamatan' => $kc['s_kodekecamatan'],
            's_namakecamatan' => $kc['s_namakecamatan']
        );

        $this->insert($data);
    }

    public function checkEmpty() {
        $resultSet = $this->select();
        return $resultSet->count();
    }

    public function getGridCount(KecamatanBphtbBase $base) {
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

    public function getGridData(KecamatanBphtbBase $base, $offset) {
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

    public function getDataId($id) {
        $rowset = $this->select(array('s_idkecamatan' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function getDataKode($kode) {
        $rowset = $this->select(array('s_kodekecamatan' => $kode));
        $row = $rowset->current();
        return $row;
    }

    public function hapusData($id, $session) {
        $this->delete(array('s_idkecamatan' => $id));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = 0;
        $datahistlog['hislog_action'] = "HAPUS KECAMATAN - " . $id;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function comboBox() {
        $resultSet = $this->select();
        return $resultSet;
    }

    public function getIdKecamatan($kd) {
        $resultSet = $this->select(array('s_kodekecamatan' => $kd));
        return $resultSet->current();
    }

    public function getdaftarkecamatan() {
        $sql = "select * from s_kecamatan order by s_kodekecamatan asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

}
