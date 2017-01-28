<?php

namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class TarifNpotkpTable extends AbstractTableGateway {

    protected $table = 's_tarifnpoptkp', $table_ref1 = "s_jenistransaksi";

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new TarifNpotkpBase());
        $this->initialize();
    }

    public function savedata(TarifNpotkpBase $kc, $session) {
        $data = array(
            's_idjenistransaksinpotkp' => $kc->s_idjenistransaksinpotkp,
            's_tarifnpotkp' => $kc->s_tarifnpotkp,
            's_tarifnpotkptambahan' => $kc->s_tarifnpotkptambahan,
            's_dasarhukumnpotkp' => $kc->s_dasarhukumnpotkp,
            's_statusnpotkp' => $kc->s_statusnpotkp,
            's_tarifnpotkptahunajb1' => $kc->s_tarifnpotkptahunajb1,
            's_tarifnpotkptahunajb2' => $kc->s_tarifnpotkptahunajb2
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $id = (int) $kc->s_idtarifnpotkp;
        if ($id == 0) {
            $this->insert($data);
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "SIMPAN DATA TARIF NPOPTKP - " . $kc->s_idjenistransaksinpotkp . " - " . number_format($kc->s_tarifnpotkp, 0, ',', '.') . " - " . $kc->s_tarifnpotkptahunajb1 . " - " . $kc->s_tarifnpotkptahunajb2;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            $this->update($data, array('s_idtarifnpotkp' => $kc->s_idtarifnpotkp));
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "UPDATE DATA TARIF NPOPTKP - " . $kc->s_idjenistransaksinpotkp . " - " . number_format($kc->s_tarifnpotkp, 0, ',', '.') . " - " . $kc->s_tarifnpotkptahunajb1 . " - " . $kc->s_tarifnpotkptahunajb2;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        }
    }

    public function getGridCount(TarifNpotkpBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->join("$this->table_ref1", "$this->table_ref1.s_idjenistransaksi = $this->table.s_idjenistransaksinpotkp");
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

    public function getGridData(TarifNpotkpBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->join("$this->table_ref1", "$this->table_ref1.s_idjenistransaksi = $this->table.s_idjenistransaksinpotkp");
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
        $rowset = $this->select(array('s_idtarifnpotkp' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function hapusData($id, $session) {
        $this->delete(array('s_idtarifnpotkp' => $id));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = 0;
        $datahistlog['hislog_action'] = "HAPUS TARIF NPOPTKP - " . $id;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function comboBox() {
        $resultSet = $this->select();
        return $resultSet;
    }

    public function getdaftartarifnpoptkp() {
        $sql = "select * from s_jenistransaksi a left join s_tarifnpoptkp b on b.s_idjenistransaksinpotkp=a.s_idjenistransaksi order by a.s_kodejenistransaksi asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

}
