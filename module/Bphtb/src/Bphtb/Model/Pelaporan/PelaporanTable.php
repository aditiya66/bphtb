<?php

namespace Bphtb\Model\Pelaporan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Sql\Where;
use Zend\Db\TableGateway\TableGateway;

class PelaporanTable extends AbstractTableGateway {

    protected $table = 't_pembayaranspt';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PelaporanBase());
        $this->initialize();
    }

    public function getGridCount(PelaporanBase $base, $id_notaris, $userRole = null) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_semua_pembayaran');
        $where = new Where();
        $where->equalTo('t_statusbayarspt', true);
        $where->isNotNull('t_tanggalpembayaran');
        //$where->literal("t_statusbayarspt=true and t_noajbbaru is not null and t_tglajbbaru is not null");
        $where->isNotNull('t_verifikasispt');
        if ($userRole == "Notaris") {
            $where->equalTo('t_idnotarisspt', $id_notaris);
        }
        $kohir = (int) $base->t_kohirspt;
        if ($base->t_kohirspt != 'undefined')
            $where->literal("t_kohirspt::text LIKE '%$kohir%'");
        if ($base->t_tglprosesspt != 'undefined')
            $where->equalTo("t_tglprosesspt", date('Y-m-d', strtotime($base->t_tglprosesspt)));
        if ($base->t_namawppembeli != 'undefined')
            $where->literal("t_namawppembeli::text LIKE '%$base->t_namawppembeli%'");
        if ($base->t_totalspt != 'undefined')
            $where->literal("t_totalspt::text LIKE '%$base->t_totalspt%'");
        if ($base->t_bulanselesaibayar != 'undefined')
            $where->literal("t_bulanselesaibayar::text LIKE '%$base->t_bulanselesaibayar%'");
        if ($base->t_tanggalpembayaran != 'undefined')
            $where->equalTo("t_tanggalpembayaran", date('Y-m-d', strtotime($base->t_tanggalpembayaran)));
        if ($base->t_noajbbaru != 'undefined')
            $where->literal("t_noajbbaru::text LIKE '%$base->t_noajbbaru%'");
        if ($base->t_tglajbbaru != 'undefined')
            $where->equalTo("t_tglajbbaru", date('Y-m-d', strtotime($base->t_tglajbbaru)));
        if ($base->t_idnotarisspt != 'undefined')
            $where->equalTo("t_idnotarisspt", $base->t_idnotarisspt);
        if($base->statuspelaporan != 'undefined'){
            if($base->statuspelaporan == 1){
                $where->equalTo("t_statuspelaporannotaris", TRUE);
            }else if($base->statuspelaporan == 2){
                $where->isNull("t_statuspelaporannotaris");
            }
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(PelaporanBase $base, $offset, $id_notaris, $userRole = null) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_semua_pembayaran');
        $where = new Where();
        $where->equalTo('t_statusbayarspt', true);
        $where->isNotNull('t_tanggalpembayaran');
//         $where->isNotNull('t_tglajbbaru');
//         $where->isNotNull('t_noajbbaru');
        $where->isNotNull('t_verifikasispt');
        if ($userRole == "Notaris") {
            $where->equalTo('t_idnotarisspt', $id_notaris);
        }
        $kohir = (int) $base->t_kohirspt;
        if ($base->t_kohirspt != 'undefined')
            $where->literal("t_kohirspt::text LIKE '%$kohir%'");
        if ($base->t_tglprosesspt != 'undefined')
            $where->equalTo("t_tglprosesspt", date('Y-m-d', strtotime($base->t_tglprosesspt)));
        if ($base->t_namawppembeli != 'undefined')
            $where->literal("t_namawppembeli::text LIKE '%$base->t_namawppembeli%'");
        if ($base->t_totalspt != 'undefined')
            $where->literal("t_totalspt::text LIKE '%$base->t_totalspt%'");
        if ($base->t_bulanselesaibayar != 'undefined')
            $where->literal("t_bulanselesaibayar::text LIKE '%$base->t_bulanselesaibayar%'");
        if ($base->t_tanggalpembayaran != 'undefined')
            $where->equalTo("t_tanggalpembayaran", date('Y-m-d', strtotime($base->t_tanggalpembayaran)));
        if ($base->t_noajbbaru != 'undefined')
            $where->literal("t_noajbbaru::text LIKE '%$base->t_noajbbaru%'");
        if ($base->t_tglajbbaru != 'undefined')
            $where->equalTo("t_tglajbbaru", date('Y-m-d', strtotime($base->t_tglajbbaru)));
        if ($base->t_idnotarisspt != 'undefined')
            $where->equalTo("t_idnotarisspt", $base->t_idnotarisspt);
        if($base->statuspelaporan != 'undefined'){
            if($base->statuspelaporan == 1){
                $where->equalTo("t_statuspelaporannotaris", TRUE);
            }else if($base->statuspelaporan == 2){
                $where->isNull("t_statuspelaporannotaris");
            }
        }
        $select->where($where);
        $select->order("t_tglajbbaru DESC");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountDendaNotaris() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_pendataandendasanksinotaris');
        $where = new Where();
        $where->equalTo('t_ketetapands', 3);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataDendaNotaris(PelaporanBase $base, $start) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_pendataandendasanksinotaris');
//        $select->order($sortname, $sortorder);
        $where = new Where();
        $where->equalTo('t_ketetapands', 3);
        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSanksiNotaris() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_pendataandendasanksinotaris');
        $where = new Where();
        $where->equalTo('t_ketetapands', 4);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSanksiNotaris(PelaporanBase $base, $start) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_pendataandendasanksinotaris');
//        $select->order($sortname, $sortorder);
        $where = new Where();
        $where->equalTo('t_ketetapands', 4);
        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function UbahStatusLaporanNotaris(PelaporanBase $pb) {
        $data = array(
            't_noajbbaru' => $pb->t_noajbbaru,
            't_tglajbbaru' => date('Y-m-d', strtotime($pb->t_tglajbbaru)),
            't_statuspelaporannotaris' => true,
            't_tglpelaporannotaris' => date('Y-m-d', strtotime($pb->t_tglpelaporannotaris)),
            't_jmlpph' => str_ireplace(".", "", $pb->t_jmlpph),
            't_tglpph' => date('Y-m-d', strtotime($pb->t_tglpph)),
        );
        $t_detailsptbphtb = new TableGateway('t_detailsptbphtb', $this->adapter);
        $t_detailsptbphtb->update($data, array(
            't_iddetailsptbphtb' => $pb->t_iddetailsptbphtb
        ));
    }

    public function UbahStatusKonfirmasiNotaris(PelaporanBase $pb) {
        $data = array(
            't_statuskonfirmasinotaris' => true,
            't_tglkonfirmasinotaris' => date('Y-m-d')
        );
        $t_detailsptbphtb = new TableGateway('t_detailsptbphtb', $this->adapter);
        $t_detailsptbphtb->update($data, array(
            't_iddetailsptbphtb' => $pb->t_iddetailsptbphtb
        ));
    }

    public function saveDendaNotaris(PelaporanBase $pb) {
        $dataa = $this->getKohirDs($pb);
        $data = array(
            't_tglprosesds' => date('Y-m-d', strtotime($pb->t_tglprosesds)),
            't_periodeds' => date('Y', strtotime($pb->t_periodeds)),
            't_dendabulan' => $pb->t_dendabulan,
            't_idnotaris' => $pb->t_idnotaris,
            't_jumlahds' => str_ireplace(".", "", $pb->t_jumlahds),
            't_ketetapands' => 3,
            't_kohirds' => $dataa['t_kohirds'] + 1,
            't_kodebayards' => $pb->t_kodebayards
        );
        $tabel_denda = new TableGateway('t_dendasanksinotaris', $this->adapter);
        $tabel_denda->insert($data);
    }

    public function getKohirDs(PelaporanBase $pb) {
        $sql = "select max(t_kohirds) as t_kohirds 
                from t_dendasanksinotaris
                where t_periodeds='" . $pb->t_periodeds . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function saveSanksiNotaris(PelaporanBase $pb) {
        $dataa = $this->getKohirDs($pb);
        $data = array(
            't_tglprosesds' => date('Y-m-d', strtotime($pb->t_tglprosesds)),
            't_periodeds' => date('Y', strtotime($pb->t_periodeds)),
            't_dendabulan' => '',
            't_idnotaris' => $pb->t_idnotaris1,
            't_jumlahds' => str_ireplace(".", "", $pb->t_jumlahds),
            't_ketetapands' => 4,
            't_idspt' => $pb->t_idspt,
            't_kohirds' => $dataa['t_kohirds'] + 1,
            't_kodebayards' => $pb->t_kodebayards
        );
        $tabel_denda = new TableGateway('t_dendasanksinotaris', $this->adapter);
        $tabel_denda->insert($data);
    }

    public function hapusData(PelaporanBase $pb) {
        $tabel_denda = new TableGateway('t_dendasanksinotaris', $this->adapter);
        $tabel_denda->delete(array(
            't_idds' => $pb->t_idds
        ));
    }

    public function CariDataPembayaranDenda($bulanajb) {
        $sql = "select * from t_pembayaranspt
                where t_dendabulan='" . $bulanajb . "'";
        $statement = $this->adapter->query($sql);
        $st = $statement->execute();
        return $st->current();
    }

    public function CariDataPendataanSanksi($idspt) {
        $sql = "select * from view_pendataandendasanksinotaris
                where t_idspt='" . $idspt . "' and t_ketetapands=4";
        $statement = $this->adapter->query($sql);
        $st = $statement->execute();
        return $st->current();
    }

    public function cariDataSanksi($idspt) {
        $sql = "select t_idnotarisspt , t_tglajbbaru, t_noajbbaru, s_namanotaris from view_sspd_semua_pembayaran
                where t_idspt='" . $idspt . "'";
        $statement = $this->adapter->query($sql);
        $st = $statement->execute();
        return $st->current();
    }

    public function cariPendatanSanksi($t_idspt) {
        $sql = "select * from view_pendataandendasanksinotaris where t_idspt =" . $t_idspt . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getDataDenda($t_kohirds) {
        $sql = "select * from view_pendataandendasanksinotaris where t_kohirds =" . $t_kohirds . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getDataPeraturan($t_ketetapan) {
        $sql = "select * from s_peraturan where s_kodeperaturan ='" . $t_ketetapan . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

}
