<?php

namespace Bphtb\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Sql\Where;
use Bphtb\Model\Pembayaran\PembayaranSptBase;
use Zend\Db\TableGateway\TableGateway;

class SSPDBphtbTable extends AbstractTableGateway {

    protected $table = 't_detailsptbphtb';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SSPDBphtbBase());
        $this->initialize();
    }

    public function getDataId($id) {
        $rowset = $this->select(function (Select $select) use($id) {
            $select->where(array(
                't_spt.t_idspt' => $id
            ));
            $select->join('t_spt', 't_detailsptbphtb.t_idspt = t_spt.t_idspt');
            $select->join('s_jenistransaksi', 's_jenistransaksi.s_idjenistransaksi = t_spt.t_idjenistransaksi');
            $select->join('s_jenishaktanah', 's_jenishaktanah.s_idhaktanah = t_spt.t_idjenishaktanah');
        });
        $row = $rowset->current();
        return $row;
    }

    public function getGridCount(SSPDBphtbBase $base, $id_notaris, $userRole = null) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_pembayaran');
        $where = new Where();
        if ($userRole == "Notaris") {
            $where->equalTo('t_idnotarisspt', $id_notaris);
        }
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combocari == "t_tglprosesspt") {
                    $base->kolomcari = date('Y-m-d', strtotime($base->kolomcari));
                }
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

    public function getGridData(SSPDBphtbBase $base, $offset, $id_notaris, $userRole = null) {
        // Tambahkan field s_iduser pada view_sspd_semua_pembayaran dari join table user
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_pembayaran');
        $where = new Where();
        if ($userRole == "Notaris") {
            $where->equalTo('t_idnotarisspt', $id_notaris);
        }
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combocari == "t_tglprosesspt") {
                    $base->kolomcari = date('Y-m-d', strtotime($base->kolomcari));
                }
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

    public function getGridCountBlmVerifikasi(\Bphtb\Model\Pembayaran\PembayaranSptBase $base, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_blm_validasi');
        $where = new Where();
        if ($parametercari->t_kohirsptcari != '')
            $where->literal("t_kohirspt::text LIKE '%$parametercari->t_kohirsptcari%'");
        if ($parametercari->t_nopcari != '')
            $where->literal("t_nopbphtbsppt::text LIKE '%$parametercari->t_nopcari%'");
        if ($parametercari->t_namapembelicari != '')
            $where->literal("t_namawppembeli::text LIKE '%$parametercari->t_namapembelicari%'");
        if ($parametercari->t_namapenjualcari != '')
            $where->literal("t_namawppenjual::text LIKE '%$parametercari->t_namapenjualcari%'");
        $where->literal('t_ketetapanspt is null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataBlmVerifikasi(\Bphtb\Model\Pembayaran\PembayaranSptBase $base, $start, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_blm_validasi');
        $where = new Where();
        if ($parametercari->t_kohirsptcari != '')
            $where->literal("t_kohirspt::text LIKE '%$parametercari->t_kohirsptcari%'");
        if ($parametercari->t_nopcari != '')
            $where->literal("t_nopbphtbsppt::text LIKE '%$parametercari->t_nopcari%'");
        if ($parametercari->t_namapembelicari != '')
            $where->literal("t_namawppembeli::text LIKE '%$parametercari->t_namapembelicari%'");
        if ($parametercari->t_namapenjualcari != '')
            $where->literal("t_namawppenjual::text LIKE '%$parametercari->t_namapenjualcari%'");
        $where->literal('t_ketetapanspt is null');
        $select->where($where);
        $select->order("t_kohirspt DESC");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountPembayaran(\Bphtb\Model\Pembayaran\PembayaranSptBase $base, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_sudah_tervalidasi');
        $where = new Where();
        if ($parametercari->t_kodebayarbankspptcari != '')
            $where->literal("t_kodebayarbanksppt::text LIKE '%$parametercari->t_kodebayarbankspptcari%'");
        if ($parametercari->t_kohirketetapansptcari != '')
            $where->literal("t_kohirketetapanspt::text LIKE '%$parametercari->t_kohirketetapansptcari%'");
        if ($parametercari->t_nopcari != '')
            $where->literal("t_nopbphtbsppt::text LIKE '%$parametercari->t_nopcari%'");
        if ($parametercari->t_namapembelicari != '')
            $where->literal("LOWER(t_namawppembeli::text) LIKE LOWER('%$parametercari->t_namapembelicari%')");
        if ($parametercari->t_namapenjualcari != '')
            $where->literal("t_namawppenjual::text LIKE '%$parametercari->t_namapenjualcari%'");
        $where->isNull('t_tanggalpembayaran');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataPembayaran(\Bphtb\Model\Pembayaran\PembayaranSptBase $base, $start, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_sudah_tervalidasi');
        $where = new Where();
        if ($parametercari->t_kodebayarbankspptcari != '')
            $where->literal("t_kodebayarbanksppt::text LIKE '%$parametercari->t_kodebayarbankspptcari%'");
        if ($parametercari->t_kohirketetapansptcari != '')
            $where->literal("t_kohirketetapanspt::text LIKE '%$parametercari->t_kohirketetapansptcari%'");
        if ($parametercari->t_nopcari != '')
            $where->literal("t_nopbphtbsppt::text LIKE '%$parametercari->t_nopcari%'");
        if ($parametercari->t_namapembelicari != '')
            $where->literal("LOWER(t_namawppembeli::text) LIKE LOWER('%$parametercari->t_namapembelicari%')");
        if ($parametercari->t_namapenjualcari != '')
            $where->literal("t_namawppenjual::text LIKE '%$parametercari->t_namapenjualcari%'");
        $where->isNull('t_tanggalpembayaran');
        $select->where($where);
//        $select->order($sortname, $sortorder);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountDS(PembayaranSptBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_pembayarandenda');
        $where = new Where();
//         if ($query) {
//             $where->literal("$qtype::text LIKE '%$query%'");
//         }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataDS(PembayaranSptBase $base, $start) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_pembayarandenda');
        $where = new Where();
//         if ($query) {
//             $where->literal("$qtype::text LIKE '%$query%'");
//         }
        $select->where($where);
//         $select->order($sortname, $sortorder);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountVerifikasi($query, $qtype) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_pembayaran');
        $where = new Where();
        if ($query) {
            $where->literal("$qtype::text LIKE '%$query%' and t_tglverifikasispt IS NULL");
        } else {
            $where->literal("t_tglverifikasispt IS NULL");
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataVerifikasi($sortname, $sortorder, $query, $qtype, $start, $rp) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_pembayaran');
        $where = new Where();

        if ($query) {
            $where->literal("$qtype::text LIKE '%$query%' and t_tglverifikasispt IS NULL and t_ketetapanspt=1");
        } else {
            $where->literal("t_tglverifikasispt IS NULL and t_ketetapanspt=1");
        }
        $select->where($where);
        $select->order($sortname, $sortorder);
        $select->limit($rp);
        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function savedatadetail(SSPDBphtbBase $sspddetail, $idspt = null, $session) {
        $id = (int) $sspddetail->t_iddetailsptbphtb;
        if (!empty($sspddetail->t_tglajbbaru)) {
            $tglajbbaru = date("Y-m-d", strtotime($sspddetail->t_tglajbbaru));
            $noajbaru = $sspddetail->t_noajbbaru;
        } else {
            $tglajbbaru = null;
            $noajbaru = null;
        }
        $data = array(
            't_idspt' => $idspt,
            // Data Wajib Pajak
            't_namawppembeli' => $sspddetail->t_namawppembeli,
            't_nikwppembeli' => $sspddetail->t_nikwppembeli,
            't_npwpwppembeli' => $sspddetail->t_npwpwppembeli,
            't_alamatwppembeli' => $sspddetail->t_alamatwppembeli,
            't_rtwppembeli' => $sspddetail->t_rtwppembeli,
            't_rwwppembeli' => $sspddetail->t_rwwppembeli,
            't_kecamatanwppembeli' => $sspddetail->t_kecamatanwppembeli,
            't_kelurahanwppembeli' => $sspddetail->t_kelurahanwppembeli,
            't_kabkotawppembeli' => $sspddetail->t_kabkotawppembeli,
            't_telponwppembeli' => $sspddetail->t_telponwppembeli,
            't_kodeposwppembeli' => $sspddetail->t_kodeposwppembeli,
            // Data Objek Pajak
            't_namasppt' => $sspddetail->t_namasppt,
            't_alamatop' => $sspddetail->t_alamatop,
            't_rtop' => $sspddetail->t_rtop,
            't_rwop' => $sspddetail->t_rwop,
            't_kelurahanop' => $sspddetail->t_kelurahanop,
            't_kecamatanop' => $sspddetail->t_kecamatanop,
            't_kabupatenop' => $sspddetail->t_kabupatenop,
            't_luastanah' => str_ireplace(".", "", $sspddetail->t_luastanah),
            't_njoptanah' => str_ireplace(".", "", $sspddetail->t_njoptanah),
            't_totalnjoptanah' => str_ireplace(".", "", $sspddetail->t_totalnjoptanah),
            't_luasbangunan' => str_ireplace(".", "", $sspddetail->t_luasbangunan),
            't_njopbangunan' => str_ireplace(".", "", $sspddetail->t_njopbangunan),
            't_totalnjopbangunan' => str_ireplace(".", "", $sspddetail->t_totalnjopbangunan),
            't_grandtotalnjop' => str_ireplace(".", "", $sspddetail->t_grandtotalnjop),
            't_nosertifikathaktanah' => $sspddetail->t_nosertifikathaktanah,
            't_ketwaris' => $sspddetail->t_ketwaris,
            't_terbukti' => $sspddetail->t_terbukti,
            't_tglajb' => date('Y-m-d', strtotime($sspddetail->t_tglajb)),
            't_namasppt' => $sspddetail->t_namasppt,
            't_tglajbbaru' => $tglajbbaru,
            't_noajbbaru' => $noajbaru,
            // Data Penjual
            't_namawppenjual' => $sspddetail->t_namawppenjual,
            't_nikwppenjual' => $sspddetail->t_nikwppenjual,
            't_npwpwppenjual' => $sspddetail->t_npwpwppenjual,
            't_alamatwppenjual' => $sspddetail->t_alamatwppenjual,
            't_kelurahanwppenjual' => $sspddetail->t_kelurahanwppenjual,
            't_kecamatanwppenjual' => $sspddetail->t_kecamatanwppenjual,
            't_kabkotawppenjual' => $sspddetail->t_kabkotawppenjual,
            't_telponwppenjual' => $sspddetail->t_telponwppenjual,
            't_kodeposwppenjual' => $sspddetail->t_kodeposwppenjual,
            't_rtwppenjual' => $sspddetail->t_rtwppenjual,
            't_rwwppenjual' => $sspddetail->t_rwwppenjual
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        if ($id == 0) {
            $this->insert($data);
            $datahistlog['hislog_idspt'] = $idspt;
            $datahistlog['hislog_action'] = "SIMPAN DATA PENDAFTARAN - " . $sspddetail->t_namawppembeli . "-" . $sspddetail->t_nikwppembeli;
            $tabel_histlog = new TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            $data['t_idspt'] = $sspddetail->t_idspt;
            $this->update($data, array(
                't_iddetailsptbphtb' => $sspddetail->t_iddetailsptbphtb
            ));
            $datahistlog['hislog_idspt'] = $sspddetail->t_idspt;
            $datahistlog['hislog_action'] = "UPDATE DATA PENDAFTARAN - " . $sspddetail->t_namawppembeli . "-" . $sspddetail->t_nikwppembeli;
            $tabel_histlog = new TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        }
    }

    public function savedatadetailbpn(SSPDBphtbBase $sspddetail, $idspt, $t_luastanahbpn, $t_luasbangunanbpn) {
        $data = array(
            't_idspt' => $idspt,
            // Data Wajib Pajak
            't_namawppembeli' => $sspddetail->t_namawppembeli,
            't_nikwppembeli' => $sspddetail->t_nikwppembeli,
            't_npwpwppembeli' => $sspddetail->t_npwpwppembeli,
            't_alamatwppembeli' => $sspddetail->t_alamatwppembeli,
            't_rtwppembeli' => $sspddetail->t_rtwppembeli,
            't_rwwppembeli' => $sspddetail->t_rwwppembeli,
            't_kecamatanwppembeli' => $sspddetail->t_kecamatanwppembeli,
            't_kelurahanwppembeli' => $sspddetail->t_kelurahanwppembeli,
            't_kabkotawppembeli' => $sspddetail->t_kabkotawppembeli,
            't_telponwppembeli' => $sspddetail->t_telponwppembeli,
            't_kodeposwppembeli' => $sspddetail->t_kodeposwppembeli,
            // Data Objek Pajak
            't_namasppt' => $sspddetail->t_namasppt,
            't_alamatop' => $sspddetail->t_alamatop,
            't_rtop' => $sspddetail->t_rtop,
            't_rwop' => $sspddetail->t_rwop,
            't_kelurahanop' => $sspddetail->t_kelurahanop,
            't_kecamatanop' => $sspddetail->t_kecamatanop,
            't_kabupatenop' => $sspddetail->t_kabupatenop,
            't_luastanah' => $t_luastanahbpn,
            't_njoptanah' => str_ireplace(".", "", $sspddetail->t_njoptanah),
            't_totalnjoptanah' => str_ireplace(".", "", $sspddetail->t_totalnjoptanah),
            't_luasbangunan' => $t_luasbangunanbpn,
            't_njopbangunan' => str_ireplace(".", "", $sspddetail->t_njopbangunan),
            't_totalnjopbangunan' => str_ireplace(".", "", $sspddetail->t_totalnjopbangunan),
            't_grandtotalnjop' => str_ireplace(".", "", $sspddetail->t_grandtotalnjop),
            't_nosertifikathaktanah' => $sspddetail->t_nosertifikathaktanah,
            't_ketwaris' => $sspddetail->t_ketwaris,
            't_terbukti' => $sspddetail->t_terbukti,
            't_tglajb' => date('Y-m-d', strtotime($sspddetail->t_tglajb)),
            't_namasppt' => $sspddetail->t_namasppt,
            // Data Penjual
            't_namawppenjual' => $sspddetail->t_namawppenjual,
            't_nikwppenjual' => $sspddetail->t_nikwppenjual,
            't_npwpwppenjual' => $sspddetail->t_npwpwppenjual,
            't_alamatwppenjual' => $sspddetail->t_alamatwppenjual,
            't_kelurahanwppenjual' => $sspddetail->t_kelurahanwppenjual,
            't_kecamatanwppenjual' => $sspddetail->t_kecamatanwppenjual,
            't_kabkotawppenjual' => $sspddetail->t_kabkotawppenjual,
            't_telponwppenjual' => $sspddetail->t_telponwppenjual,
            't_kodeposwppenjual' => $sspddetail->t_kodeposwppenjual,
            't_rtwppenjual' => $sspddetail->t_rtwppenjual,
            't_rwwppenjual' => $sspddetail->t_rwwppenjual,
            't_inputbpn' => true
        );
        $this->insert($data);
    }

    public function savedatadetailkoreksi(SSPDBphtbBase $sspddetail, $idspt) {
        $data = array(
            't_idspt' => $idspt,
            // Data Wajib Pajak
            't_namawppembeli' => $sspddetail->t_namawppembeli,
            't_nikwppembeli' => $sspddetail->t_nikwppembeli,
            't_npwpwppembeli' => $sspddetail->t_npwpwppembeli,
            't_alamatwppembeli' => $sspddetail->t_alamatwppembeli,
            't_rtwppembeli' => $sspddetail->t_rtwppembeli,
            't_rwwppembeli' => $sspddetail->t_rwwppembeli,
            't_kecamatanwppembeli' => $sspddetail->t_kecamatanwppembeli,
            't_kelurahanwppembeli' => $sspddetail->t_kelurahanwppembeli,
            't_kabkotawppembeli' => $sspddetail->t_kabkotawppembeli,
            't_telponwppembeli' => $sspddetail->t_telponwppembeli,
            't_kodeposwppembeli' => $sspddetail->t_kodeposwppembeli,
            // Data Objek Pajak
            't_namasppt' => $sspddetail->t_namasppt,
            't_alamatop' => $sspddetail->t_alamatop,
            't_rtop' => $sspddetail->t_rtop,
            't_rwop' => $sspddetail->t_rwop,
            't_kelurahanop' => $sspddetail->t_kelurahanop,
            't_kecamatanop' => $sspddetail->t_kecamatanop,
            't_kabupatenop' => $sspddetail->t_kabupatenop,
            't_luastanah' => $sspddetail->t_luastanah,
            't_njoptanah' => str_ireplace(".", "", $sspddetail->t_njoptanah),
            't_totalnjoptanah' => str_ireplace(".", "", $sspddetail->t_totalnjoptanah),
            't_luasbangunan' => $sspddetail->t_luasbangunan,
            't_njopbangunan' => str_ireplace(".", "", $sspddetail->t_njopbangunan),
            't_totalnjopbangunan' => str_ireplace(".", "", $sspddetail->t_totalnjopbangunan),
            't_grandtotalnjop' => str_ireplace(".", "", $sspddetail->t_grandtotalnjop),
            't_nosertifikathaktanah' => $sspddetail->t_nosertifikathaktanah,
            't_ketwaris' => $sspddetail->t_ketwaris,
            't_terbukti' => $sspddetail->t_terbukti,
            't_tglajb' => date('Y-m-d', strtotime($sspddetail->t_tglajb)),
            't_namasppt' => $sspddetail->t_namasppt,
            // Data Penjual
            't_namawppenjual' => $sspddetail->t_namawppenjual,
            't_nikwppenjual' => $sspddetail->t_nikwppenjual,
            't_npwpwppenjual' => $sspddetail->t_npwpwppenjual,
            't_alamatwppenjual' => $sspddetail->t_alamatwppenjual,
            't_kelurahanwppenjual' => $sspddetail->t_kelurahanwppenjual,
            't_kecamatanwppenjual' => $sspddetail->t_kecamatanwppenjual,
            't_kabkotawppenjual' => $sspddetail->t_kabkotawppenjual,
            't_telponwppenjual' => $sspddetail->t_telponwppenjual,
            't_kodeposwppenjual' => $sspddetail->t_kodeposwppenjual,
            't_rtwppenjual' => $sspddetail->t_rtwppenjual,
            't_rwwppenjual' => $sspddetail->t_rwwppenjual,
            't_inputbpn' => false,
            't_inputkoreksi' => true,
        );
        $this->insert($data);
    }

    public function savedatatglajbbaru(SSPDBphtbBase $sspddetail) {
        $data = array(
            't_tglajbbaru' => date('Y-m-d', strtotime($sspddetail->t_tglajbbaru)),
            't_noajbbaru' => $sspddetail->t_noajbbaru
        );
        $this->update($data, array(
            't_iddetailsptbphtb' => $sspddetail->t_iddetailsptbphtb
        ));
    }

    public function getPendataanSspdBphtb(SSPDBphtbBase $ss) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_sspd_pembayaran");
        $where = new \Zend\Db\Sql\Where();
        $where->equalTo("t_idspt", $ss->t_idspt);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->current();
    }

    public function getPendataanDS($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_pembayarandenda");
        $where = new \Zend\Db\Sql\Where();
        $where->equalTo("t_idds", (int) $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->current();
    }

    public function getSkpdkbBphtb(SSPDBphtbBase $ss) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_sspd_validasi");
        $where = new \Zend\Db\Sql\Where();
        $where->equalTo("t_idspt", $ss->t_idspt);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->current();
    }

    public function hapusData(SSPDBphtbBase $kb, $session) {
        $this->delete(array(
            't_idspt' => $kb->t_idspt
        ));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = $kb->t_idspt;
        $datahistlog['hislog_action'] = "HAPUS DATA PENDAFTARAN - " . $kb->t_namawppembeli . "-" . $kb->t_nikwppembeli;
        $tabel_histlog = new TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function hapusDataWaris($id) {
        $t_penerimawaris = new \Zend\Db\TableGateway\TableGateway('t_penerimawaris', $this->adapter);
        $t_penerimawaris->delete(array(
            't_idspt' => $id
        ));
    }

    // belum valid
    public function temukanDataHistory(SSPDBphtbBase $kb) {
        $sql = "select * from view_sspd a
                left join t_pembayaranspt b on b.t_idspt = a.t_idspt
                left join t_penerimawaris c on c.t_idspt = a.t_idspt
                where a.t_nikwppembeli='" . $kb->t_nikwppembeli . "' 
                and date_part('Year',a.t_tglajb)='" . date('Y', strtotime($kb->t_tglajb)) . "'";

        if (!empty($kb->t_idspt)) {
            $sql .= " and a.t_idspt not in(" . $kb->t_idspt . ")  and a.t_idspt < " . $kb->t_idspt . "";
        }
//                and a.t_periodespt='" . date('Y', strtotime($kb->t_tglajb)) . "' AND a.t_tglprosesspttime < '" . date("Y-m-d h:i:s", strtotime($kb->t_tglprosesspttime)) . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->count();
    }

    public function temukanhistorywaris(SSPDBphtbBase $kb) {
        $sql = "select * from view_sspd a
                left join t_pembayaranspt b on b.t_idspt = a.t_idspt
                left join t_penerimawaris c on c.t_idspt = a.t_idspt
                where a.t_nikwppembeli='" . $kb->t_nikwppembeli . "' or c.t_nikpenerima ='" . $kb->t_nikwppembeli . "'
                and a.t_periodespt='" . date('Y', strtotime($kb->t_tglprosesspt)) . "' AND a.t_idjenistransaksi = " . $kb->t_idjenistransaksi;
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    // belum valid
    public function temukanDataHistory22(SSPDBphtbBase $kb) {
        $sql = "select * from view_sspd a
                left join t_pembayaranspt b on b.t_idspt = a.t_idspt
                where a.t_nikwppembeli='" . $kb->t_nikwppembeli . "'
                and a.t_periodespt='" . date('Y', strtotime($kb->t_tglprosesspt)) . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function temukanDataHistory2(SSPDBphtbBase $kb) {
        $sql = "select * from view_sspd a
                left join t_pembayaranspt b on b.t_idspt = a.t_idspt
                where a.t_nikwppembeli='" . $kb->t_nikwppembeli . "' 
                and a.t_periodespt='" . date('Y', strtotime($kb->t_tglprosesspt)) . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function temukanDataNPOPTKP(SSPDBphtbBase $kb) {
        $tahun = date('Y', strtotime($kb->t_tglajb));
        if ($tahun < 1997) {
            $tahunnya = 1997;
        } else {
            $tahunnya = $tahun;
        }

        $sql = "select * from s_tarifnpoptkp
                where s_idjenistransaksinpotkp='" . $kb->t_idjenistransaksi . "' and s_tarifnpotkptahunajb1<=" . $tahunnya . " and s_tarifnpotkptahunajb2>=" . $tahunnya . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function temukanDataTarifBphtb() {
        $sql = "select * from s_tarifbphtb where s_idtarifbphtb=2";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function temukanPersyaratan($kb) {
        $sql = "select * from s_persyaratan where s_idjenistransaksi =$kb->t_idjenistransaksi order by s_idpersyaratan";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    // Belum valid
    public function gethistorybphtb($nikpembeli, $idspt, $periode) {
        $sql = "select * from view_sspd a
                left join t_pembayaranspt b on b.t_idspt = a.t_idspt 
                where a.t_nikwppembeli='$nikpembeli' and a.t_idspt not in ($idspt)
                and a.t_periodespt='" . $periode . "' order by a.t_idspt";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function savedata_koreksiluas($id, $t_luastanahbpn, $t_luasbangunanbpn, $idspt, $namapembeli, $nikpembeli, $session) {
        $data = array(
            't_luastanahbpn' => $t_luastanahbpn,
            't_luasbangunanbpn' => $t_luasbangunanbpn
        );
        $update = $this->update($data, array(
            't_iddetailsptbphtb' => $id
        ));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = $idspt;
        $datahistlog['hislog_action'] = "KOREKSI LUAS TANAH BPN - " . $namapembeli . "-" . $nikpembeli;
        $tabel_histlog = new TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
        return $update;
    }

    public function savedata_sertifikatbaru($id, $t_nosertifikatbaru, $t_tglsertifikatbaru) {
        $data = array(
            't_nosertifikatbaru' => $t_nosertifikatbaru,
            't_tglsertifikatbaru' => date('Y-m-d', strtotime($t_tglsertifikatbaru))
        );
        $update = $this->update($data, array(
            't_iddetailsptbphtb' => $id
        ));
        return $update;
    }

    public function getSptid($t_iddetailsptbphtb) {
        $rowset = $this->select(array(
            't_iddetailsptbphtb' => $t_iddetailsptbphtb
        ));
        $row = $rowset->current();
        return $row;
    }

    public function getDataPemeriksaan($id) {
        $sql = "select * from view_sspd_semua_pembayaran where t_idspt=$id";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getDataPemeriksaan1($id) {
        $sql = "select * from view_sspd_semua_pembayaran where t_iddetailsptbphtb=$id";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getDataIdBpn($id) {
        $rowset = $this->select(function (Select $select) use($id) {
            $select->where(array(
                't_spt.t_idspt' => $id
            ));
            $select->join('t_spt', 't_detailsptbphtb.t_idspt = t_spt.t_idspt');
            $select->join('s_jenistransaksi', 't_spt.t_idjenistransaksi = s_jenistransaksi.s_idjenistransaksi');
            $select->join('s_jenishaktanah', 't_spt.t_idjenishaktanah = s_jenishaktanah.s_idhaktanah');
            $select->join('t_pembayaranspt', 't_pembayaranspt.t_idspt = t_spt.t_idspt');
            $datapemeriksaan = $this->getDataPemeriksaan($id);
            if ($datapemeriksaan['p_idpemeriksaan'] != null) {
                $select->join('t_pemeriksaan', 't_pemeriksaan.p_idpembayaranspt = t_pembayaranspt.t_idpembayaranspt');
            }
        });
        $row = $rowset->current();
        return $row;
    }

    public function getSemuaData($t_iddetailsptbphtb) {
        $rowset = $this->select(function (Select $select) use($t_iddetailsptbphtb) {
            $select->where(array(
                't_detailsptbphtb.t_iddetailsptbphtb' => $t_iddetailsptbphtb
            ));
            $select->join('t_spt', 't_detailsptbphtb.t_idspt = t_spt.t_idspt');
            $select->join('s_jenistransaksi', 't_spt.t_idjenistransaksi = s_jenistransaksi.s_idjenistransaksi');
            $select->join('s_jenishaktanah', 't_spt.t_idjenishaktanah = s_jenishaktanah.s_idhaktanah');
            $select->join('t_pembayaranspt', 't_pembayaranspt.t_idspt = t_spt.t_idspt');
            $datapemeriksaan = $this->getDataPemeriksaan1($t_iddetailsptbphtb);
            if ($datapemeriksaan['p_idpemeriksaan'] != null) {
                $select->join('t_pemeriksaan', 't_pemeriksaan.p_idpembayaranspt = t_pembayaranspt.t_idpembayaranspt');
            }
        });
        $row = $rowset->current();
        return $row;
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

    public function getGridCountSismiop(SSPDBphtbBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_terbit_ajb');
        $where = new Where();
        $kohir = (int) $base->t_kohirspt;
        if ($base->t_kohirspt != 'undefined')
            $where->literal("t_kohirspt::text LIKE '%$kohir%'");
        if ($base->t_periodespt != 'undefined')
            $where->equalTo("t_periodespt", $base->t_periodespt);
        if ($base->t_tglprosesspt != 'undefined')
            $where->equalTo("t_tglprosesspt", date('Y-m-d', strtotime($base->t_tglprosesspt)));
        if ($base->t_namawppembeli != 'undefined')
            $where->literal("t_namawppembeli::text LIKE '%$base->t_namawppembeli%'");
        if ($base->t_totalspt != 'undefined')
            $where->literal("t_totalspt::text LIKE '%$base->t_totalspt%'");
        if ($base->s_namajenistransaksi != 'undefined')
            $where->literal("s_namajenistransaksi::text LIKE '%$base->s_namajenistransaksi%'");
        if ($base->t_noajbbaru != 'undefined')
            $where->literal("t_noajbbaru::text LIKE '%$base->t_noajbbaru%'");
        if ($base->t_tglajbbaru != 'undefined')
            $where->equalTo("t_tglajbbaru", date('Y-m-d', strtotime($base->t_tglajbbaru)));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSismiop(SSPDBphtbBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_terbit_ajb');
        $where = new Where();
        $kohir = (int) $base->t_kohirspt;
        if ($base->t_kohirspt != 'undefined')
            $where->literal("t_kohirspt::text LIKE '%$kohir%'");
        if ($base->t_periodespt != 'undefined')
            $where->equalTo("t_periodespt", $base->t_periodespt);
        if ($base->t_tglprosesspt != 'undefined')
            $where->equalTo("t_tglprosesspt", date('Y-m-d', strtotime($base->t_tglprosesspt)));
        if ($base->t_namawppembeli != 'undefined')
            $where->literal("t_namawppembeli::text LIKE '%$base->t_namawppembeli%'");
        if ($base->t_totalspt != 'undefined')
            $where->literal("t_totalspt::text LIKE '%$base->t_totalspt%'");
        if ($base->s_namajenistransaksi != 'undefined')
            $where->literal("s_namajenistransaksi::text LIKE '%$base->s_namajenistransaksi%'");
        if ($base->t_noajbbaru != 'undefined')
            $where->literal("t_noajbbaru::text LIKE '%$base->t_noajbbaru%'");
        if ($base->t_tglajbbaru != 'undefined')
            $where->equalTo("t_tglajbbaru", date('Y-m-d', strtotime($base->t_tglajbbaru)));
        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getJumlahPendataan(SSPDBphtbBase $base, $id_notaris, $userRole = null) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_pembayaran');
        $where = new Where();
        if ($userRole == "Notaris") {
            $where->equalTo('t_idnotarisspt', $id_notaris);
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function temukanJmlPersyaratan($kb) {
        $sql = "select * from s_persyaratan where s_idjenistransaksi =$kb->t_idjenistransaksi order by s_idpersyaratan";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->count();
    }

    public function temukanJmlPersyaratanver($t_idjenistransaksi) {
        $sql = "select * from s_persyaratan where s_idjenistransaksi =$t_idjenistransaksi order by s_idpersyaratan";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->count();
    }

    public function getcaritransaksimonitoringtgl($tglcari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_pembayaran');
        $where = new Where();
        $where->equalTo('t_tglprosesspt', $tglcari);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getcaritransaksimonitoringnop($nopcari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_pembayaran');
        $where = new Where();
        $where->literal("t_nopbphtbsppt::text LIKE '%$nopcari%'");
        $select->where($where);
        $select->order("t_tanggalpembayaran DESC");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getcaridetailmonitoring($idsptnya) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_pembayaran');
        $where = new Where();
        $where->equalTo('t_idspt', (int) $idsptnya);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

}
