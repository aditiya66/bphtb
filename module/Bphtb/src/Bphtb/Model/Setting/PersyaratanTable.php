<?php

namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PersyaratanTable extends AbstractTableGateway {

    protected $table = 'view_s_persyaratan';
    protected $table_transaksi = "s_jenistransaksi";

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PersyaratanBase());
        $this->initialize();
    }

    public function savedata(PersyaratanBase $pb, $session) {
        $data = array(
            's_idjenistransaksi' => $pb->s_idjenistransaksi,
            's_namapersyaratan' => $pb->s_namapersyaratan,
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $id = (int) $pb->s_idpersyaratan;
        if ($id == 0) {
            $tabel_persyaratan = new \Zend\Db\TableGateway\TableGateway('s_persyaratan', $this->adapter);
            $tabel_persyaratan->insert($data);
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "SIMPAN DATA PERSYARATAN - " . $pb->s_namapersyaratan;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            $tabel_persyaratan = new \Zend\Db\TableGateway\TableGateway('s_persyaratan', $this->adapter);
            $tabel_persyaratan->update($data, array('s_idpersyaratan' => $pb->s_idpersyaratan));
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "UPDATE DATA PERSYARATAN - " . $pb->s_namapersyaratan;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        }
    }

    public function getGridCount(PersyaratanBase $base) {
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

    public function getGridData(PersyaratanBase $base, $offset) {
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
        $rowset = $this->select(array('s_idpersyaratan' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function getDataIdTransaksis($id) {
        $rowset = $this->select(array('s_idjenistransaksi' => $id));
        return $rowset;
    }

    public function getDataSyaratSPT($idsyarat, $idspt) {
        $sql = "select t_persyaratan from t_spt where t_idspt=$idspt and t_persyaratan  like '%$idsyarat%'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function hapusData($id, $session) {
        $tabel_persyaratan = new \Zend\Db\TableGateway\TableGateway('s_persyaratan', $this->adapter);
        $tabel_persyaratan->delete(array('s_idpersyaratan' => (int) $id));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = 0;
        $datahistlog['hislog_action'] = "HAPUS PERSYARATAN - " . $id;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function comboBox($s_idjenistransaksi) {
        $rowset = $this->select(array('s_idjenistransaksi' => $s_idjenistransaksi));
        return $rowset;
    }

    public function getdaftarpersyaratan() {
        $sql = "select * from  s_persyaratan a left join s_jenistransaksi b on b.s_idjenistransaksi=a.s_idjenistransaksi order by a.s_idpersyaratan";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

}
