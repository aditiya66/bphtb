<?php

namespace Bphtb\Model\Verifikasi;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\TableGateway;
use Zend\Db\Sql\Sql;

class VerifikasiSPTTable extends AbstractTableGateway {

    protected $table = 't_pembayaranspt';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new VerifikasiSPTBase());
        $this->initialize();
    }

    public function temukanDataPembayaran(VerifikasiSPTBase $spt) {
        $sql = "select * from view_sspd a left join t_pembayaranspt b on b.t_idspt = a.t_idspt where  b.t_kohirpembayaran=" . $spt->t_kohirpembayaran . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getDatas($spt) {
        $sql = "select * from view_sspd_pembayaran where t_idpembayaranspt = " . $spt->t_idpembayaranspt . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function savedata(VerifikasiSPTBase $verspt, $t_pejabatverifikasi, $session) {
        $id_pembayaran = (int) $verspt->t_idpembayaranspt;
        $data = array(
            't_verifikasispt' => \Zend\Json\Json::encode($verspt->t_persyaratanverifikasi),
            't_tglverifikasispt' => date('Y-m-d', strtotime($verspt->t_tglverifikasispt)),
            't_pejabatverifikasispt' => $t_pejabatverifikasi,
            't_kodebayarbanksppt' => $verspt->t_kodebayarbanksppt
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        if ($id_pembayaran == 0) {
            $data['t_idspt'] = $verspt->t_idspt;
            $data['t_idnotaris'] = $verspt->t_idnotarisspt;
            $this->insert($data);
            $datahistlog['hislog_idspt'] = $verspt->t_idspt;
            $datahistlog['hislog_action'] = "SIMPAN DATA VALIDASI - " . $verspt->t_namawppembeli . "-" . $verspt->t_nikwppembeli;
            $tabel_histlog = new TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            $this->update($data, array('t_idpembayaranspt' => $verspt->t_idpembayaranspt));
            $datahistlog['hislog_idspt'] = $verspt->t_idspt;
            $datahistlog['hislog_action'] = "UPDATE DATA VALIDASI - " . $verspt->t_namawppembeli . "-" . $verspt->t_nikwppembeli;
            $tabel_histlog = new TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        }
    }

    public function savedataverifikasipembayaran(VerifikasiSPTBase $verspt, $t_pejabatverifikasi, $session) {
        $data = array(
            //Berhubungan dengan Verifikasi
            't_idspt' => $verspt->t_idspt,
            't_idnotaris' => $verspt->t_idnotarisspt,
            't_verifikasispt' => \Zend\Json\Json::encode($verspt->t_persyaratanverifikasi),
            't_tglverifikasispt' => date('Y-m-d', strtotime($verspt->t_tglverifikasispt)),
            't_pejabatverifikasispt' => $t_pejabatverifikasi,
            //Berhubungan dengan Pembayaran
            't_periodepembayaran' => date('Y', strtotime($verspt->t_tglverifikasispt)),
            't_tanggalpembayaran' => date('Y-m-d', strtotime($verspt->t_tglverifikasispt)),
            't_ketetapanspt' => 1,
            't_nilaipembayaranspt' => 0,
            't_statusbayarspt' => true
        );
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = $verspt->t_idspt;
        $datahistlog['hislog_action'] = "SIMPAN DATA VALIDASI DAN PEMBAYARAN - " . $verspt->t_namawppembeli . "-" . $verspt->t_nikwppembeli;
        $tabel_histlog = new TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
        $this->insert($data);
    }

    public function updatenosspd(VerifikasiSPTBase $verspt, $max) {
        $data = array(
            't_kohirketetapanspt' => $max + 1
        );
        $t_spt = new TableGateway('t_spt', $this->adapter);
        $t_spt->update($data, array('t_idspt' => $verspt->t_idspt));
    }

    public function savedataverbayarbpn(VerifikasiSPTBase $verspt, $idspt, $kodebayarbank) {
        $data = array(
            //Berhubungan dengan Verifikasi
            't_idspt' => $idspt,
            't_idnotaris' => $verspt->t_idnotaris,
            't_verifikasispt' => $verspt->t_verifikasispt,
            't_tglverifikasispt' => $verspt->t_tglverifikasispt,
            't_pejabatverifikasispt' => $verspt->t_pejabatverifikasispt,
            //Berhubungan dengan Pembayaran
            't_periodepembayaran' => date('Y'),
            't_tanggalpembayaran' => date('Y-m-d'),
            't_ketetapanspt' => 1,
            't_nilaipembayaranspt' => 0,
            't_statusbayarspt' => true
        );
        $this->insert($data);
    }

    public function savedataverifikasibpn(VerifikasiSPTBase $verspt, $idspt, $kodebayarbank) {
        $data = array(
            't_idspt' => $idspt,
            't_idnotaris' => $verspt->t_idnotaris,
            't_verifikasispt' => $verspt->t_verifikasispt,
            't_tglverifikasispt' => $verspt->t_tglverifikasispt,
            't_pejabatverifikasispt' => $verspt->t_pejabatverifikasispt,
            't_kodebayarbanksppt' => $kodebayarbank
        );
        $this->insert($data);
    }

    public function getidpemeriksaanexist($idspt) {
        $sql = "select * from t_pemeriksaan WHERE p_idpembayaranspt = $idspt";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function savedatapemeriksaan($dt) {
        $id_bayar = $this->getIdPembayaran();
        $id_pemeriksaan = $this->getidpemeriksaanexist($id_bayar['max']);
        $dt->p_idpemeriksaan = $id_pemeriksaan['p_idpemeriksaan'];
        $data = array(
            "p_idpembayaranspt" => $id_bayar['max'],
            "p_luastanah" => str_ireplace(".", "", $dt->p_luastanah),
            "p_luasbangunan" => str_ireplace(".", "", $dt->p_luasbangunan),
            "p_njoptanah" => str_ireplace(".", "", $dt->p_njoptanah),
            "p_njopbangunan" => str_ireplace(".", "", $dt->p_njopbangunan),
            "p_totalnjoptanah" => str_ireplace(".", "", $dt->p_totalnjoptanah),
            "p_totalnjopbangunan" => str_ireplace(".", "", $dt->p_totalnjopbangunan),
            "p_grandtotalnjop" => str_ireplace(".", "", $dt->p_grandtotalnjop),
            "p_nilaitransaksispt" => str_ireplace(".", "", $dt->p_nilaitransaksispt),
            "p_ketwaris" => $dt->p_ketwaris,
            "p_terbukti" => $dt->p_terbukti,
            "p_idjenistransaksi" => $dt->p_idjenistransaksi,
            "p_idjenishaktanah" => $dt->p_idjenishaktanah,
            "p_potonganspt" => str_ireplace(".", "", $dt->p_potonganspt),
            "p_totalspt" => str_ireplace(".", "", $dt->p_totalspt)
        );
        if ($dt->p_idpemeriksaan == 0) {
            $t_pemeriksaan = new TableGateway('t_pemeriksaan', $this->adapter);
            $t_pemeriksaan->insert($data);
            // untuk edit total pajak dari transaksi yang perlu dibeneri
            $t_spt = new TableGateway('t_spt', $this->adapter);
            $id_sebelumnya = $this->getsptsebelumnya($dt->t_idspt);
            $total_sebelumnya = $this->gettotalsptsebelumnya($id_sebelumnya['t_idsptsebelumnya']);
            $totalpajakpemeriksaan = str_ireplace(".", "", $dt->p_totalspt);
            $totalpajaksebelumnya = $total_sebelumnya['t_totalspt'];
            $datasptne["t_totalspt"] = $totalpajakpemeriksaan - $totalpajaksebelumnya;
            $t_spt->update($datasptne, array('t_idspt' => $dt->t_idspt));
        } else {
            $data['p_idpemeriksaan'] = $dt->p_idpemeriksaan;
            $t_pemeriksaan = new TableGateway('t_pemeriksaan', $this->adapter);
            $t_pemeriksaan->update($data, array('p_idpemeriksaan' => $dt->p_idpemeriksaan));
        }
    }

    public function batalVerifikasi($verspt) {
        $dp = $this->getDatas($verspt);

        $data = array(
            't_verifikasispt' => NULL,
            't_tglverifikasispt' => NULL,
//            't_pejabatverifikasispt' => $pembspt->t_alamatwppenjual,
        );
        if ($dp['t_statusbayarspt']) {
            $this->update($data, array('t_idpembayaranspt' => $verspt->t_idpembayaranspt));
        } else {
            $this->delete(array('t_idpembayaranspt' => $verspt->t_idpembayaranspt));
        }
    }

    public function hapusDataPemeriksaan($id) {
        $t_pemeriksaan = new TableGateway('t_pemeriksaan', $this->adapter);
        $t_pemeriksaan->delete(array('p_idpembayaranspt' => $id->t_idpembayaranspt));
    }

    public function getIdPembayaran() {
        $sql = "select max(t_idpembayaranspt) from t_pembayaranspt";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getSptid($t_idpembayaranspt) {
        $rowset = $this->select(array('t_idpembayaranspt' => $t_idpembayaranspt));
        $row = $rowset->current();
        return $row;
    }

    public function getViewPendaftaran($t_idspt) {
        $sql = "select * from view_pendaftaran where t_idspt = " . $t_idspt . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getHargaAcuan($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok) {
        $sql = "select * from s_acuan where s_kd_propinsi = '" . $s_kd_propinsi . "' 
                and s_kd_dati2 = '" . $s_kd_dati2 . "' 
                and s_kd_kecamatan = '" . $s_kd_kecamatan . "' 
                and s_kd_kelurahan = '" . $s_kd_kelurahan . "'
                and s_kd_blok = '" . $s_kd_blok . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getHargaHistoryNJOPTanah($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok, $t_idpembayaranspt) {
        $sql = "select max(njoptanahtransaksi) as njoptanahtransaksi , max(njoptanah) as njoptanah from view_harganjoptanah
                where t_nopbphtbsppt like '%" . $s_kd_propinsi . "." . $s_kd_dati2 . "." . $s_kd_kecamatan . "." . $s_kd_kelurahan . "." . $s_kd_blok . "%'
                and t_idpembayaranspt not in ($t_idpembayaranspt)";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getHargaHistoryNJOPTanahpilih($s_kd_propinsi, $s_kd_dati2, $s_kd_kecamatan, $s_kd_kelurahan, $s_kd_blok, $t_idspt) {
        $sql = "select max(njoptanahtransaksi) as njoptanahtransaksi , max(njoptanah) as njoptanah from view_harganjoptanah
                where t_nopbphtbsppt like '%" . $s_kd_propinsi . "." . $s_kd_dati2 . "." . $s_kd_kecamatan . "." . $s_kd_kelurahan . "." . $s_kd_blok . "%'
                and t_idspt not in ($t_idspt)";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getPresentase($nilaipresentase) {
        $sql = "select * from s_presentase where s_presentase >= " . $nilaipresentase . " and s_presentasemin <= " . $nilaipresentase . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getmaxkohir() {
        $sql = "select max(t_kohirketetapanspt) as t_kohirketetapanspt from t_spt where t_periodespt = " . date('Y');
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getsptsebelumnya($idspt) {
        $sql = "select t_idsptsebelumnya from t_spt where t_idspt = " . $idspt . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function gettotalsptsebelumnya($idsebelumnya) {
        $sql = "select t_totalspt from t_spt where t_idspt = " . $idsebelumnya . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

}
