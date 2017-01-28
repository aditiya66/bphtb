<?php

namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class HargaAcuanTable extends AbstractTableGateway {

    protected $table = 's_acuan';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new HargaAcuanBase());
        $this->initialize();
    }

    public function getGridCountAcuan(HargaAcuanBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_s_acuan");
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

    public function getGridDataAcuan(HargaAcuanBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_s_acuan");
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

    public function savedata(HargaAcuanBase $kc, $session) {
        $array_acuan = explode('.', $kc->t_nopacuan);
        $s_kd_propinsi = $array_acuan[0];
        $s_kd_dati2 = $array_acuan[1];
        $s_kd_kecamatan = $array_acuan[2];
        $s_kd_kelurahan = $array_acuan[3];
        $s_kd_blok = $array_acuan[4];
        $data = array(
            's_kd_propinsi' => $s_kd_propinsi,
            's_kd_dati2' => $s_kd_dati2,
            's_kd_kecamatan' => $s_kd_kecamatan,
            's_kd_kelurahan' => $s_kd_kelurahan,
            's_kd_blok' => $s_kd_blok,
            's_permetertanah' => str_ireplace('.', '', $kc->s_permetertanah)
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $id = (int) $kc->s_idacuan;
        if ($id == 0) {
            $this->insert($data);
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "SIMPAN HARGA ACUAN - " . $kc->t_nopacuan . " - " . number_format($kc->s_permetertanah, 0, ',', '.');
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            $this->update($data, array('s_idacuan' => $kc->s_idacuan));
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "UPDATE HARGA ACUAN - " . $kc->t_nopacuan . " - " . number_format($kc->s_permetertanah, 0, ',', '.');
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        }
    }

    public function savedataimport($rowData) {
        $s_kd_propinsi = str_pad($rowData[0][0], 2, '0', STR_PAD_LEFT);
        $s_kd_dati2 = str_pad($rowData[0][1], 2, '0', STR_PAD_LEFT);
        $s_kd_kecamatan = str_pad($rowData[0][2], 3, '0', STR_PAD_LEFT);
        $s_kd_kelurahan = str_pad($rowData[0][3], 3, '0', STR_PAD_LEFT);
        $s_kd_blok = str_pad($rowData[0][4], 3, '0', STR_PAD_LEFT);
        $s_permeter = $rowData[0][5] * 1000;
        $data = array(
            's_kd_propinsi' => $s_kd_propinsi,
            's_kd_dati2' => $s_kd_dati2,
            's_kd_kecamatan' => $s_kd_kecamatan,
            's_kd_kelurahan' => $s_kd_kelurahan,
            's_kd_blok' => $s_kd_blok,
            's_permetertanah' => $s_permeter
        );
        $this->insert($data);
    }

    public function getDataId($id) {
        $rowset = $this->select(array('s_idacuan' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function hapusData($id, $session) {
        $this->delete(array('s_idacuan' => $id));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = 0;
        $datahistlog['hislog_action'] = "HAPUS HARGA ACUAN - " . $id;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function getdaftaracuan() {
        $sql = "select * from s_acuan order by s_idacuan asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

}
