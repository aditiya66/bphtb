<?php

namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class JenisKetetapanTable extends AbstractTableGateway {

    protected $table = 's_jenisketetapan';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new JenisKetetapanBase());
        $this->initialize();
    }

    public function savedata(JenisKetetapanBase $kc, $session) {
        $data = array(
            's_namajenisketetapan' => $kc->s_namajenisketetapan,
            's_namasingkatjenisketetapan' => $kc->s_namasingkatjenisketetapan,
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $id = (int) $kc->s_idjenisketetapan;
        if ($id == 0) {
            $this->insert($data);
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "SIMPAN JENIS KETETAPAN - " . $kc->s_namajenisketetapan . " - " . $kc->s_namasingkatjenisketetapan;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            $this->update($data, array('s_idjenisketetapan' => $kc->s_idjenisketetapan));
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "UPDATE JENIS KETETAPAN - " . $kc->s_namajenisketetapan . " - " . $kc->s_namasingkatjenisketetapan;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        }
    }

    public function getGridCount(JenisKetetapanBase $kb) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        //$select->order($kb->sidx . " " . $kb->sord);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(JenisKetetapanBase $kb, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->order($kb->sidx . " " . $kb->sord);
        $select->limit($kb->rows = (int) $kb->rows);
        $select->offset($offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataId($id) {
        $rowset = $this->select(array('s_idjenisketetapan' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function hapusData($id) {
        $this->delete(array('s_idjenisketetapan' => $id));
    }

    public function comboBox() {
        $resultSet = $this->select();
        return $resultSet;
    }

}
