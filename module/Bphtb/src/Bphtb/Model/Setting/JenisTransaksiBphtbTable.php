<?php

namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class JenisTransaksiBphtbTable extends AbstractTableGateway {

    protected $table = 's_jenistransaksi';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new JenisTransaksiBphtbBase());
        $this->initialize();
    }

    public function checkExist(JenisTransaksiBphtbBase $kc) {
        $rowset = $this->select(array('s_kodejenistransaksi' => $kc->s_kodejenistransaksi));
        $row = $rowset->current();
        return $row;
    }

    public function checkId(JenisTransaksiBphtbBase $kc) {
        $rowset = $this->select(array('s_idjenistransaksi' => $kc->s_idjenistransaksi));
        $row = $rowset->current();
        return $row;
    }

    public function savedata(JenisTransaksiBphtbBase $kc, $session) {
        $data = array(
            's_kodejenistransaksi' => $kc->s_kodejenistransaksi,
            's_namajenistransaksi' => $kc->s_namajenistransaksi
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $id = (int) $kc->s_idjenistransaksi;
        if ($id == 0) {
            $this->insert($data);
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "SIMPAN JENIS TRANSAKSI - " . $kc->s_kodejenistransaksi . " - " . $kc->s_namajenistransaksi;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            if ($this->checkId($kc)) {
                $this->update($data, array('s_idjenistransaksi' => $kc->s_idjenistransaksi));
                $datahistlog['hislog_idspt'] = 0;
                $datahistlog['hislog_action'] = "UPDATE JENIS TRANSAKSI - " . $kc->s_kodejenistransaksi . " - " . $kc->s_namajenistransaksi;
                $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
                $tabel_histlog->insert($datahistlog);
            } else {
                throw new \Exception('Form id does not exist');
            }
        }
    }

    public function getGridCount(JenisTransaksiBphtbBase $base) {
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

    public function getGridData(JenisTransaksiBphtbBase $base, $offset) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
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

    public function getDataId($id) {
        $rowset = $this->select(array('s_idjenistransaksi' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function hapusData($kb, $session) {
        $this->delete(array('s_idjenistransaksi' => $kb));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = 0;
        $datahistlog['hislog_action'] = "HAPUS JENIS TRANSAKSI - " . $kb;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function comboBox() {
        $resultSet = $this->select();
        return $resultSet;
    }

    public function jumlahsyarat($id_syarat) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_persyaratan');
        $where = new Where();

        $where->literal("s_idjenistransaksi = '$id_syarat'");

        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getdaftarjenistransaksi() {
        $sql = "select * from s_jenistransaksi order by s_kodejenistransaksi asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

}
