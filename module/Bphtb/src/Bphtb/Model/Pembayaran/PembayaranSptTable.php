<?php

//modul pembayaran

namespace Bphtb\Model\Pembayaran;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;

class PembayaranSptTable extends AbstractTableGateway {

    protected $table = 't_pembayaranspt';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PembayaranSptBase());
        $this->initialize();
    }

    public function temukanDataSspd(PembayaranSptBase $spt) {
        $sql = "select * from view_sspd_pembayaran where t_kohirspt::text='" . $spt->t_kohirpembayaran . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function temukanDataSkpdkb(PembayaranSptBase $spt) {
        $sql = "select * from view_sspd_validasi where p_kohirskpdkb::text='" . $spt->p_kohirskpdkb . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function cekJumlahhari() {
        $sql = "select * from s_tempo";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function cekValiditasSSPD(PembayaranSptBase $spt, $jumlahhari) {
        $sql = "select * from view_sspd where t_kohirspt=" . $spt->t_kohirpembayaran . " and t_tglprosesspt <= '" . date('Y-m-d', strtotime($spt->t_tanggalpembayaran)) . "' and (t_tglprosesspt + interval '$jumlahhari days') >= '" . date('Y-m-d', strtotime($spt->t_tanggalpembayaran)) . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    //Simpan Pembayaran SSPD / SKPDKB
    //Lokasi : Tambah Pembayaran
    public function savedataPembayaran(PembayaranSptBase $pembspt) {
        $data = array(
            't_idspt' => $pembspt->t_idspt,
            't_periodepembayaran' => date('Y', strtotime($pembspt->t_tanggalpembayaran)),
            't_tanggalpembayaran' => date('Y-m-d', strtotime($pembspt->t_tanggalpembayaran)),
            't_nilaipembayaranspt' => str_ireplace(".", "", $pembspt->t_nilaipembayaranspt),
            't_statusbayarspt' => true
        );
        $this->insert($data);
    }

    public function updatedatapembayaranTrue(PembayaranSptBase $pembspt, $session) {
        $data = array(
            't_statusbayarspt' => TRUE,
            't_periodepembayaran' => date('Y', strtotime($pembspt->t_tanggalpembayaran)),
            't_tanggalpembayaran' => date('Y-m-d', strtotime($pembspt->t_tanggalpembayaran)),
            't_ketetapanspt' => 1,
            't_nilaipembayaranspt' => str_ireplace(".", "", $pembspt->t_nilaipembayaranspt),
            't_dendaspt' => str_ireplace(".", "", $pembspt->t_dendaspt)
        );
        $t_pembayaranspt = new \Zend\Db\TableGateway\TableGateway('t_pembayaranspt', $this->adapter);
        $t_pembayaranspt->update($data, array('t_idpembayaranspt' => $pembspt->t_idpembayaranspt));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = $pembspt->t_idspt;
        $datahistlog['hislog_action'] = "SIMPAN DATA PEMBAYARAN - " . $pembspt->t_namawppembeli . "-" . $pembspt->t_nikwppembeli;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function updatedatapemeriksaanTrue(PembayaranSptBase $pembspt) {
        $data = array(
            'p_pembayaranskpdkb' => TRUE
        );
        $t_pemeriksaan = new \Zend\Db\TableGateway\TableGateway('t_pemeriksaan', $this->adapter);
        $t_pemeriksaan->update($data, array('p_idpemeriksaan' => $pembspt->p_idpemeriksaan));
    }

    public function updatedatapemeriksaanFalse(PembayaranSptBase $pembspt) {
        $data = array(
            'p_pembayaranskpdkb' => FALSE
        );
        $t_pemeriksaan = new \Zend\Db\TableGateway\TableGateway('t_pemeriksaan', $this->adapter);
        $t_pemeriksaan->update($data, array('p_idpemeriksaan' => $pembspt->p_idpemeriksaan));
    }

    //Simpan Pembayaran SSPD / SKPDKB
    //Lokasi : Tambah Pembayaran
    public function savedataPembayaranDenda(PembayaranSptBase $pembspt) {
        $data = array(
            't_idds' => $pembspt->t_idds,
            't_periodepembayaran' => date('Y', strtotime($pembspt->t_tanggalpembayaran)),
            't_tanggalpembayaran' => date('Y-m-d', strtotime($pembspt->t_tanggalpembayaran)),
            't_nilaipembayaranspt' => str_ireplace(".", "", $pembspt->t_jumlahds),
            't_kodebayarbanksppt' => $pembspt->t_kodebayards,
            't_statusbayarspt' => true
        );
        $this->insert($data);
    }

    //jumlah SSPD dan SKPDKB yang dibayarkan
    //Lokasi : Index Pembayaran
    public function getGridCount(PembayaranSptBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_semua_pembayaran');
        $where = new Where();
        $where->isNotNull("t_tanggalpembayaran");
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combocari == "t_tanggalpembayaran") {
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

    //Data SSPD dan SKPDKB yang dibayarkan
    //Lokasi : Index Pembayaran
    public function getGridData(PembayaranSptBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_semua_pembayaran');
        $where = new Where();
        $where->isNotNull("t_tanggalpembayaran");
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combocari == "t_tanggalpembayaran") {
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
            } else {
                $select->order("t_tanggalpembayaran $base->sortasc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_tanggalpembayaran $base->sortdesc");
            }
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getRealisasiAnggaran() {
        $sql = "select sum(t_nilaipembayaranspt) from t_pembayaranspt";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    //Jumlah Data Verifikasi
    //Lokasi : Index Verifikasi
    public function getGridCountVerifikasi(PembayaranSptBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_pembayaran');
        $where = new Where();
        $where->isNotNull('t_tglverifikasispt');
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

    //Data Verifikasi
    //Lokasi : Index Verifikasi
    public function getGridDataVerifikasi(PembayaranSptBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_pembayaran');
        $where = new Where();
        $where->isNotNull('t_tglverifikasispt');
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

    public function getDataId($id) {
        $rowset = $this->select(function (Select $select) use ($id) {
            $select->where(array('t_pembayaranspt.t_idpembayaranspt' => $id));
            $select->join('view_sspd', 't_pembayaranspt.t_idspt = view_sspd.t_idspt');
            $select->join('view_sspd_semua_pembayaran', 'view_sspd.t_idspt = view_sspd_semua_pembayaran.t_idspt');
        });
        $row = $rowset->current();
        return $row;
    }

    public function getDataPemeriksaanId($t_idpembayaran) {
        $sql = "select * from t_pemeriksaan where p_idpembayaranspt=$t_idpembayaran";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    //Hapus Data Pembayaran
    //Lokasi : Index Pembayaran
    public function hapusData(PembayaranSptBase $kb, $session) {
        $data = array("t_statusbayarspt" => null,
            "t_nilaipembayaranspt" => null,
            "t_ketetapanspt" => null,
            "t_tanggalpembayaran" => null,
            "t_periodepembayaran" => null,
            "t_dendaspt" => null
        );
        $this->update($data, array("t_idpembayaranspt" => $kb->t_idpembayaranspt));
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = $kb->t_idpembayaranspt;
        $datahistlog['hislog_action'] = "HAPUS DATA PEMBAYARAN - ID PEMBAYARAN - " . $kb->t_idpembayaranspt;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
        return true;
    }

    public function getDataPembayaran($t_idspt) {
        $sql = "select * from t_pembayaranspt where t_idspt=$t_idspt";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getGridCountBpn(PembayaranSptBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_semua_pembayaran');
        $where = new Where();
        $select->where("t_tanggalpembayaran is not null");
        $where->equalTo('t_ketetapanspt', '1');
        $where->isNull('t_inputbpn');
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
        $where->notIn('t_idjenistransaksi', array(8));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataBpn(PembayaranSptBase $base, $offset) {
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
        $where->notIn('t_idjenistransaksi', array(8));
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

    public function getJumlahPembayaran(PembayaranSptBase $base, $id_user, $userRole = null) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_semua_pembayaran');
        $where = new Where();
        if ($userRole == "Notaris") {
            $where->equalTo('t_idnotarisspt', $id_user);
        }
        $where->isNotNull("t_tanggalpembayaran");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getJumlahVerifikasi(PembayaranSptBase $base, $id_user, $userRole = null) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_sspd_pembayaran');
        $where = new Where();
        if ($userRole == "Notaris") {
            $where->equalTo('t_idnotarisspt', $id_user);
        }
        $where->isNotNull('t_tglverifikasispt');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

}
