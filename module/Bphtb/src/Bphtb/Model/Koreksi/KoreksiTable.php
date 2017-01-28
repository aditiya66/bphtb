<?php

namespace Bphtb\Model\Koreksi;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;

class KoreksiTable extends AbstractTableGateway {

    protected $table = 't_detailsptbphtb';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new KoreksiBase());
        $this->initialize();
    }

    public function getDataId($id) {
        $rowset = $this->select(function (Select $select) use ($id) {
            $select->where(array('t_pembayaranspt.t_idpembayaranspt' => $id));
            $select->join('view_sspd', 't_pembayaranspt.t_idspt = view_sspd.t_idspt');
            $select->join('view_sspd_semua_pembayaran', 'view_sspd.t_idspt = view_sspd_semua_pembayaran.t_idspt');
        });
        $row = $rowset->current();
        return $row;
    }

    public function getDataPembayaran($t_idspt) {
        $sql = "select * from t_pembayaranspt where t_idspt=$t_idspt";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getGridCountKoreksi(KoreksiBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_semua_pembayaran');
        $where = new Where();
        $select->where("t_tanggalpembayaran is not null");
        $where->equalTo('t_ketetapanspt', '1');
        $where->isNull('t_inputbpn');
        $kohir = (int) $base->t_kohirspt;
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $where->notIn('t_idjenistransaksi', array(8));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataKoreksi(KoreksiBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_semua_pembayaran');
        $where = new Where();
        $select->where("t_tanggalpembayaran is not null");
        $where->equalTo('t_ketetapanspt', '1');
        $where->isNull('t_inputbpn');
        $kohir = (int) $base->t_kohirspt;
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
        $where->notIn('t_idjenistransaksi', array(8));
        $select->where($where);
        $select->order("t_tanggalpembayaran DESC");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getSptid($t_iddetailsptbphtb) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_sspd_semua_pembayaran");
        $where = new \Zend\Db\Sql\Where();
        $where->equalTo('t_iddetailsptbphtb', $t_iddetailsptbphtb);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->current();
    }

    public function getDataIdKoreksi($id) {
        $rowset = $this->select(function (Select $select) use($id) {
            $select->where(array(
                't_spt.t_idspt' => $id
            ));
            $select->join('t_spt', 't_detailsptbphtb.t_idspt = t_spt.t_idspt');
            $select->join('s_jenistransaksi', 't_spt.t_idjenistransaksi = s_jenistransaksi.s_idjenistransaksi');
            $select->join('s_jenishaktanah', 't_spt.t_idjenishaktanah = s_jenishaktanah.s_idhaktanah');
            $select->join('t_pembayaranspt', 't_pembayaranspt.t_idspt = t_spt.t_idspt');
        });
        $row = $rowset->current();
        return $row;
    }

    public function savedata_koreksiharga($t_iddetailsptbphtb, $t_hargatambahan) {
        $data = array(
            't_hargatambahan' => $t_hargatambahan
        );
        $update = $this->update($data, array(
            't_iddetailsptbphtb' => $t_iddetailsptbphtb
        ));
        return $update;
    }

}
