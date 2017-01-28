<?php

namespace Bphtb\Model\Pencetakan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Sql\Select;

class SSPDTable extends AbstractTableGateway {

    public $table = "view_sspd";

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SSPDBase());
        $this->initialize();
    }

    public function getDataId($id) {
        $rowset = $this->select(function (Select $select) use ($id) {
            $select->where(array('t_spt.t_idspt' => $id));
            $select->join('t_spt', 't_detailsptbphtb.t_idspt = t_spt.t_idspt');
        });
        $row = $rowset->current();
        return $row;
    }

    public function getDataId_cek($id) {
        $rowset = $this->select(array('t_idspt' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function getdatasspd(SSPDBase $db) {
        $sql = "select *
                from view_sspd a
                LEFT JOIN t_pembayaranspt b ON b.t_idspt = a.t_idspt
                where a.t_kohirspt = " . $db->no_spt1 . " and a.t_periodespt=" . $db->periode_spt . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getdatapenelitian($data_get) {
        $sql = "select *
                from view_sspd a
                LEFT JOIN t_pembayaranspt b ON b.t_idspt = a.t_idspt
                where a.t_kohirspt = " . $data_get->no_spt_penelitian . " and a.t_periodespt=" . $data_get->periode_spt_penelitian . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getdatasurathasilpenelitian($data_get) {
        $sql = "select * from view_sspd_pembayaran where
                t_kohirspt = " . $data_get->no_sptpenelitian . " and t_periodespt=" . $data_get->periode_sptpenelitian . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getdatassspd($t_idspt) {
        $sql = "select a.*, b.*, d.s_namanotaris , e.s_namapejabat
                from view_sspd a
                LEFT JOIN t_pembayaranspt b ON b.t_idspt = a.t_idspt
                LEFT JOIN s_users c ON c.s_iduser = a.t_idnotarisspt
		LEFT JOIN s_notaris d ON d.s_idnotaris::text = c.s_idpejabat_idnotaris::text
		left join s_pejabat e on e.s_idpejabat = b.t_pejabatverifikasispt
                where a.t_idspt =" . $t_idspt . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getdataidsptsebelumnya($t_idspt) {
        $sql = "select t_idsptsebelumnya
                from view_sspd a
                LEFT JOIN t_pembayaranspt b ON b.t_idspt = a.t_idspt
                where a.t_idspt =" . $t_idspt . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getdatassspdsebelumnya($t_idspt) {
        $sql = "select *
                from view_sspd a
                LEFT JOIN t_pembayaranspt b ON b.t_idspt = a.t_idspt
                where a.t_idspt =" . $t_idspt . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getdata(SSPDBase $db) {
        $sql = "select *
                from view_sspd a
                LEFT JOIN t_pembayaranspt b ON b.t_idspt = a.t_idspt
                where a.t_kohirspt >=" . $db->no_spt1 . " and a.t_kohirspt <=" . $db->no_spt2 . " and a.t_periodespt=" . $db->periode_spt . " and b.t_ketetapanspt=1";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getdatas($t_idspt) {
        $sql = "select *
                from view_sspd a
                LEFT JOIN t_pembayaranspt b ON b.t_idspt = a.t_idspt
                where a.t_idspt =" . $t_idspt . " and b.t_ketetapanspt=1";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getDataPencatatanSetoran($tgl_pembayaran1, $tgl_pembayaran2) {
        $sql = "select *
                from view_sspd a
                INNER JOIN t_pembayaranspt b ON b.t_idspt = a.t_idspt
                where b.t_tanggalpembayaran between '" . date('Y-m-d', strtotime($tgl_pembayaran1)) . "' and '" . date('Y-m-d', strtotime($tgl_pembayaran2)) . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getDataVerifikasi($periode_spt, $tgl_verifikasi1, $tgl_verifikasi2) {
        $sql = "select *
                from view_sspd_pembayaran
                where t_periodespt=$periode_spt and t_tglverifikasispt between '" . date('Y-m-d', strtotime($tgl_verifikasi1)) . "' and '" . date('Y-m-d', strtotime($tgl_verifikasi2)) . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getDataLapHarian($tgl_cetak) {
        $sql = "select *
                from view_sspd_pembayaran
                where t_tanggalpembayaran ='" . date('Y-m-d', strtotime($tgl_cetak)) . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getDataLapBphtb($tgl_cetak1, $tgl_cetak2, $daftar_cetakan) {
        if ($daftar_cetakan == 'pendaftaran') {
            $sql = "select * from view_sspd_pembayaran
                where t_tglprosesspt between '" . date('Y-m-d', strtotime($tgl_cetak1)) . "' and '" . date('Y-m-d', strtotime($tgl_cetak2)) . "'";
        } elseif ($daftar_cetakan == 'validasi') {
            $sql = "select * from view_sspd_pembayaran
                where t_tglverifikasispt between '" . date('Y-m-d', strtotime($tgl_cetak1)) . "' and '" . date('Y-m-d', strtotime($tgl_cetak2)) . "' and t_tglverifikasispt is not null";
        } elseif ($daftar_cetakan == 'pembayaran') {
            $sql = "select * from view_sspd_pembayaran
                where t_tanggalpembayaran between '" . date('Y-m-d', strtotime($tgl_cetak1)) . "' and '" . date('Y-m-d', strtotime($tgl_cetak2)) . "' and t_tanggalpembayaran is not null";
        }
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getDataLapBphtbkec($tgl_pendaftaranperkec1, $tgl_pendaftaranperkec2, $namakecamatan) {
        $sql = "select * from view_perkode
                where t_tglprosesspt between '" . date('Y-m-d', strtotime($tgl_pendaftaranperkec1)) . "' and '" . date('Y-m-d', strtotime($tgl_pendaftaranperkec2)) . "'
                and kodekecamatan='" . $namakecamatan . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getDataLapBulananBphtb($bulanpelaporan, $iduser, $periode_spt) {
        if ($bulanpelaporan == 1) {
            $periode_ajbnya = $periode_spt - 1;
            $bulanajbnya = 12;
        } else {
            $periode_ajbnya = $periode_spt;
            $bulanajbnya = $bulanpelaporan - 1;
        }

        $sql = "select * from view_data_terbit_ajb 
                where date_part('month',t_tglajbbaru) ='" . $bulanajbnya . "' and date_part('year',t_tglajbbaru) ='" . $periode_ajbnya . "' 
                and t_statuspelaporannotaris = true";
        if (!empty($iduser)) {
            $sql .= " and t_idnotarisspt = $iduser";
        }
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getDataHasilBpn($tgl_hasilbpn1, $tgl_hasilbpn2) {
        $sql = "select * from view_hasilbpn
                where t_tglprosesspt between '" . date('Y-m-d', strtotime($tgl_hasilbpn1)) . "' and '" . date('Y-m-d', strtotime($tgl_hasilbpn2)) . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getNotaris($iduser) {
        $sql = "select s_namanotaris, s_alamatnotaris from view_data_notaris where s_iduser = $iduser";
        $statement = $this->adapter->query($sql);
        $state = $statement->execute();
        return $state->current();
    }

    public function getDataTargetAnggaran($periode_spt) {
        $sql = "select * from anggaran where thn_anggaran = " . $periode_spt . " order by id_anggaran desc limit 1";
        $statement = $this->adapter->query($sql);
        $state = $statement->execute();
        return $state->current();
    }

    public function getDataRealisasi($periode_spt, $tgl_cetakrealisasi) {
        $kalender = explode('-', $tgl_cetakrealisasi);
        $bulan = $kalender[1];
        $sql = "select s_namajenistransaksi, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) < '$bulan'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as real_sd_bln_lalu,
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '$bulan'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as real_bln_ini,
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) <= '$bulan'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as real_sd_bln_ini
                from s_jenistransaksi ";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getDataRealisasipertahun($periode_spt, $tgl_cetakrealisasi) {
        $kalender = explode('-', $tgl_cetakrealisasi);
        $bulan = $kalender[1];
        $sql = "select s_namajenistransaksi, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '1'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as januari, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '2'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as februari, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '3'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as maret, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '4'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as april, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '5'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as mei, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '6'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as juni, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '7'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as juli, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '8'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as agustus, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '9'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as september, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '10'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as oktober, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '11'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as november, 
                    (select coalesce(sum(a.t_nilaipembayaranspt))
                        from view_sspd_pembayaran a
                        left join s_jenistransaksi b 
                        on b.s_idjenistransaksi = a.t_idjenistransaksi
                        where a.t_periodespt=$periode_spt 
                        and date_part('month',a.t_tanggalpembayaran) = '12'
                        and  s_jenistransaksi.s_idjenistransaksi = b.s_idjenistransaksi
                        ) as desember
                from s_jenistransaksi ";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getDataValidasiSkpdkb($no_sspd1, $no_sspd2) {
        $sql = "select *
                from view_sspd_pembayaran a
                left join t_pemeriksaan b on b.p_idpembayaranspt = a.t_idpembayaranspt
                where a.t_verifikasispt = true and a.t_kohirspt between " . $no_sspd1 . " and " . $no_sspd2 . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    //===================== menu cetak data pendaftaran
    public function getDataPendaftaran($periode_spt, $tgl_verifikasi1, $tgl_verifikasi2, $idnotaris, $idnotarisdipilih) {
        if (!empty($idnotarisdipilih)) {
            $whereidnotaris = ' AND t_idnotarisspt = ' . $idnotarisdipilih . '';
        } else {

            if (!empty($idnotaris)) {
                if ($idnotaris == 3) {
                    $whereidnotaris = ' AND t_idnotarisspt = ' . $idnotaris . '';
                } else {
                    $whereidnotaris = '';
                }
            }
        }

        $arr_tgl = explode("-", $tgl_verifikasi1);
        $tgl_awal = $arr_tgl[2] . "-" . $arr_tgl[1] . "-" . $arr_tgl[0];
        $arr_tgl2 = explode("-", $tgl_verifikasi2);
        $tgl_akhir = $arr_tgl2[2] . "-" . $arr_tgl2[1] . "-" . $arr_tgl2[0];
        $sql = "select *
                from view_pendaftaran
                where t_periodespt=$periode_spt and t_tglprosesspt between '" . $tgl_awal . "' and '" . $tgl_akhir . "' " . @$whereidnotaris . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    //===================== end menu cetak data pendaftaran
    //===================== menu cetak data status berkas
    public function getDataStatusBerkas($periode_spt, $tgl_verifikasi1, $tgl_verifikasi2, $idnotaris, $idnotarisdipilih) {
        if (!empty($idnotarisdipilih)) {
            $whereidnotaris = ' AND t_idnotarisspt = ' . $idnotarisdipilih . '';
        } else {
            if (!empty($idnotaris)) {
                if ($idnotaris == 3) {
                    $whereidnotaris = ' AND t_idnotarisspt = ' . $idnotaris . '';
                } else {
                    $whereidnotaris = '';
                }
            }
        }
        $arr_tgl = explode("-", $tgl_verifikasi1);
        $tgl_awal = $arr_tgl[2] . "-" . $arr_tgl[1] . "-" . $arr_tgl[0];
        $arr_tgl2 = explode("-", $tgl_verifikasi2);
        $tgl_akhir = $arr_tgl2[2] . "-" . $arr_tgl2[1] . "-" . $arr_tgl2[0];
        $sql = "select *
                from view_pendaftaran
                where t_periodespt=$periode_spt and t_tglprosesspt between '" . $tgl_awal . "' and '" . $tgl_akhir . "' " . @$whereidnotaris . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    //===================== end menu cetak data status berkas
    //===================== menu cetak kode bayar
    public function ambilsemuadatasptvalidasi($idnotaris, $no_spt1, $no_spt2, $periode_spt) {
        if (!empty($idnotaris)) {
            $whereidnotaris = " WHERE t_idnotarisspt = " . $idnotaris . " and t_kohirspt >=" . $no_spt1 . " and t_kohirspt <=" . $no_spt2 . " and t_periodespt=" . $periode_spt . "";
        } else {
            $whereidnotaris = " WHERE t_kohirspt >=" . $no_spt1 . " and t_kohirspt <=" . $no_spt2 . " and t_periodespt=" . $periode_spt . "";
        }
        $sql = "select *
                from view_data_verifikasi_isi
                " . $whereidnotaris . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function ambildatainsptvalidasi($data_tidspt) {
        if (@$data_tidspt) {
            if (!is_array($data_tidspt)) {
                if (!is_numeric($data_tidspt))
                    die('format salah salah');
                $where = "where t_idspt='{$data_tidspt}' ";
            }
            else {
                foreach ($data_tidspt as $val) {
                    if (strlen($val) && !is_numeric($val)) {
                        return false;
                    }
                }

                $data_tidspt = implode(',', $data_tidspt);
                $where = "where t_idspt in ({$data_tidspt})";
            }
        } else {
            $where = "where t_idspt::text = 'x'";
        }
        $where = htmlspecialchars_decode($where);
        $sql = "SELECT * FROM view_data_verifikasi_isi $where ";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getviewcetakssp($t_idspt) {
        $sql = "select * from view_cetak_sspd where t_idspt =" . $t_idspt . "";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getviewcetakvalidasipembayaran($t_idspt) {
        $sql = "select * from view_sspd_semua_pembayaran where t_tanggalpembayaran is not null and t_statusbayarspt=true t_idspt = $t_idspt";
        $statement = $this->adapter->query($sql);
        $state = $statement->execute();
        return $state->current();
    }

}
