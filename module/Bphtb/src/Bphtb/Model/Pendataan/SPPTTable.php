<?php

namespace Bphtb\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Where;

class SPPTTable extends AbstractTableGateway {

    protected $table = 'SPPT';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SPPTBase());
        $this->initialize();
    }

    //Mencari Nilai NOP dari database PBB
    public function temukanData(SPPTBase $spt) {
        $nop = explode('.', $spt->t_nopbphtbsppt);
        $KD_PROPINSI = $nop[0];
        $KD_DATI2 = $nop[1];
        $KD_KECAMATAN = $nop[2];
        $KD_KELURAHAN = $nop[3];
        $KD_BLOK = $nop[4];
        $NO_URUT = $nop[5];
        $KD_JNS_OP = $nop[6];
        $sql = "SELECT A.*, B.NM_KECAMATAN, C.NM_KELURAHAN, D.NILAI_PER_M2_TANAH, E.NILAI_PER_M2_BNG, F.JALAN_OP, F.BLOK_KAV_NO_OP, F.RW_OP, F.RT_OP
                from SPPT A
                LEFT JOIN REF_KECAMATAN B ON B.KD_PROPINSI = A.KD_PROPINSI AND B.KD_DATI2 = A.KD_DATI2 AND B.KD_KECAMATAN = A.KD_KECAMATAN
                LEFT JOIN REF_KELURAHAN C ON C.KD_PROPINSI = A.KD_PROPINSI AND C.KD_DATI2 = A.KD_DATI2 AND C.KD_KECAMATAN = A.KD_KECAMATAN AND C.KD_KELURAHAN = A.KD_KELURAHAN
                LEFT JOIN KELAS_TANAH D ON D.KD_KLS_TANAH = A.KD_KLS_TANAH
                LEFT JOIN KELAS_BANGUNAN E ON E.KD_KLS_BNG = A.KD_KLS_BNG
                LEFT JOIN DAT_OBJEK_PAJAK F ON F.KD_PROPINSI = A.KD_PROPINSI AND F.KD_DATI2 = A.KD_DATI2 AND F.KD_KECAMATAN = A.KD_KECAMATAN AND F.KD_KELURAHAN = A.KD_KELURAHAN AND F.KD_BLOK = A.KD_BLOK AND F.NO_URUT = A.NO_URUT AND F.KD_JNS_OP = A.KD_JNS_OP
                WHERE A.KD_PROPINSI = '$KD_PROPINSI'
                AND A.KD_DATI2 = '$KD_DATI2'
                AND A.KD_KECAMATAN = '$KD_KECAMATAN'
                AND A.KD_KELURAHAN = '$KD_KELURAHAN'
                AND A.KD_BLOK = '$KD_BLOK'
                AND A.NO_URUT = '$NO_URUT'
                AND A.KD_JNS_OP='$KD_JNS_OP'
                AND A.THN_PAJAK_SPPT='" . $spt->t_thnsppt . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function temukanDataInfoop(SPPTBase $spt) {
        $nop = explode('.', $spt->t_nopbphtbspptinfoop);
        $KD_PROPINSI = $nop[0];
        $KD_DATI2 = $nop[1];
        $KD_KECAMATAN = $nop[2];
        $KD_KELURAHAN = $nop[3];
        $KD_BLOK = $nop[4];
        $NO_URUT = $nop[5];
        $KD_JNS_OP = $nop[6];
        $sql = "SELECT A.*, B.NM_KECAMATAN, C.NM_KELURAHAN, D.NILAI_PER_M2_TANAH, E.NILAI_PER_M2_BNG, F.JALAN_OP, F.BLOK_KAV_NO_OP, F.RW_OP, F.RT_OP
                from SPPT A
                LEFT JOIN REF_KECAMATAN B ON B.KD_PROPINSI = A.KD_PROPINSI AND B.KD_DATI2 = A.KD_DATI2 AND B.KD_KECAMATAN = A.KD_KECAMATAN
                LEFT JOIN REF_KELURAHAN C ON C.KD_PROPINSI = A.KD_PROPINSI AND C.KD_DATI2 = A.KD_DATI2 AND C.KD_KECAMATAN = A.KD_KECAMATAN AND C.KD_KELURAHAN = A.KD_KELURAHAN
                LEFT JOIN KELAS_TANAH D ON D.KD_KLS_TANAH = A.KD_KLS_TANAH
                LEFT JOIN KELAS_BANGUNAN E ON E.KD_KLS_BNG = A.KD_KLS_BNG
                LEFT JOIN DAT_OBJEK_PAJAK F ON F.KD_PROPINSI = A.KD_PROPINSI AND F.KD_DATI2 = A.KD_DATI2 AND F.KD_KECAMATAN = A.KD_KECAMATAN AND F.KD_KELURAHAN = A.KD_KELURAHAN AND F.KD_BLOK = A.KD_BLOK AND F.NO_URUT = A.NO_URUT AND F.KD_JNS_OP = A.KD_JNS_OP
                WHERE A.KD_PROPINSI = '$KD_PROPINSI'
                AND A.KD_DATI2 = '$KD_DATI2'
                AND A.KD_KECAMATAN = '$KD_KECAMATAN'
                AND A.KD_KELURAHAN = '$KD_KELURAHAN'
                AND A.KD_BLOK = '$KD_BLOK'
                AND A.NO_URUT = '$NO_URUT'
                AND A.KD_JNS_OP='$KD_JNS_OP'
                AND A.THN_PAJAK_SPPT='" . $spt->t_thnspptinfoop . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getGridCount($query, $qtype) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        if ($query) {
            $where->literal("$qtype LIKE '%$query%'");
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData($query, $qtype, $start, $rp, $sortname, $sortorder) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        if ($query) {
            $where->literal("$qtype LIKE '%$query%'");
        }
        $select->where($where);
        $select->order($sortname, $sortorder);
        $select->limit($rp);
        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getNOP(SPPTBase $ss) {
        $sql = "SELECT A.*, B.NM_KECAMATAN, C.NM_KELURAHAN, D.NILAI_PER_M2_TANAH, E.NILAI_PER_M2_BNG, F.NM_DATI2
                from SPPT A
                LEFT JOIN REF_KECAMATAN B ON B.KD_PROPINSI = A.KD_PROPINSI AND B.KD_DATI2 = A.KD_DATI2 AND B.KD_KECAMATAN = A.KD_KECAMATAN
                LEFT JOIN REF_KELURAHAN C ON C.KD_PROPINSI = A.KD_PROPINSI AND C.KD_DATI2 = A.KD_DATI2 AND C.KD_KECAMATAN = A.KD_KECAMATAN AND C.KD_KELURAHAN = A.KD_KELURAHAN
                LEFT JOIN KELAS_TANAH D ON D.KD_KLS_TANAH = A.KD_KLS_TANAH
                LEFT JOIN KELAS_BANGUNAN E ON E.KD_KLS_BNG = A.KD_KLS_BNG
                LEFT JOIN REF_DATI2 F ON F.KD_DATI2 = A.KD_DATI2 
                where A.KD_PROPINSI = '". $ss->KD_PROPINSI ."'
                AND A.KD_DATI2 = '". $ss->KD_DATI2 ."'
                AND A.KD_KECAMATAN = '". $ss->KD_KECAMATAN ."'
                AND A.KD_KELURAHAN = '". $ss->KD_KELURAHAN ."'
                AND A.KD_BLOK = '". $ss->KD_BLOK ."'
                AND A.NO_URUT = '". $ss->NO_URUT ."'
                AND A.KD_JNS_OP = '". $ss->KD_JNS_OP ."'
                AND A.THN_PAJAK_SPPT='" . $ss->THN_PAJAK_SPPT . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function temukanDataInfoopcetak($spt) {
        $nop = explode('.', $spt->t_nopbphtbspptinfoop);
        $KD_PROPINSI = $nop[0];
        $KD_DATI2 = $nop[1];
        $KD_KECAMATAN = $nop[2];
        $KD_KELURAHAN = $nop[3];
        $KD_BLOK = $nop[4];
        $NO_URUT = $nop[5];
        $KD_JNS_OP = $nop[6];
        $sql = "SELECT A.*, B.NM_KECAMATAN, C.NM_KELURAHAN, D.NILAI_PER_M2_TANAH, E.NILAI_PER_M2_BNG, F.JALAN_OP, F.BLOK_KAV_NO_OP, F.RW_OP, F.RT_OP
                from SPPT A
                LEFT JOIN REF_KECAMATAN B ON B.KD_PROPINSI = A.KD_PROPINSI AND B.KD_DATI2 = A.KD_DATI2 AND B.KD_KECAMATAN = A.KD_KECAMATAN
                LEFT JOIN REF_KELURAHAN C ON C.KD_PROPINSI = A.KD_PROPINSI AND C.KD_DATI2 = A.KD_DATI2 AND C.KD_KECAMATAN = A.KD_KECAMATAN AND C.KD_KELURAHAN = A.KD_KELURAHAN
                LEFT JOIN KELAS_TANAH D ON D.KD_KLS_TANAH = A.KD_KLS_TANAH
                LEFT JOIN KELAS_BANGUNAN E ON E.KD_KLS_BNG = A.KD_KLS_BNG
                LEFT JOIN DAT_OBJEK_PAJAK F ON F.KD_PROPINSI = A.KD_PROPINSI AND F.KD_DATI2 = A.KD_DATI2 AND F.KD_KECAMATAN = A.KD_KECAMATAN AND F.KD_KELURAHAN = A.KD_KELURAHAN AND F.KD_BLOK = A.KD_BLOK AND F.NO_URUT = A.NO_URUT AND F.KD_JNS_OP = A.KD_JNS_OP
                WHERE A.KD_PROPINSI = '$KD_PROPINSI'
                AND A.KD_DATI2 = '$KD_DATI2'
                AND A.KD_KECAMATAN = '$KD_KECAMATAN'
                AND A.KD_KELURAHAN = '$KD_KELURAHAN'
                AND A.KD_BLOK = '$KD_BLOK'
                AND A.NO_URUT = '$NO_URUT'
                AND A.KD_JNS_OP='$KD_JNS_OP'
                AND A.THN_PAJAK_SPPT='" . $spt->t_thnspptinfoop . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function temukanDataTunggakanop(SPPTBase $spt) {
        $nop = explode('.', $spt->t_nopbphtbspptinfoop);
        $KD_PROPINSI = $nop[0];
        $KD_DATI2 = $nop[1];
        $KD_KECAMATAN = $nop[2];
        $KD_KELURAHAN = $nop[3];
        $KD_BLOK = $nop[4];
        $NO_URUT = $nop[5];
        $KD_JNS_OP = $nop[6];
        $sql = "SELECT A.THN_PAJAK_SPPT, A.PBB_YG_HARUS_DIBAYAR_SPPT, TO_CHAR(A.TGL_JATUH_TEMPO_SPPT,'DD-MM-YYYY') AS JATUH_TEMPO 
                from SPPT A 
                LEFT JOIN PEMBAYARAN_SPPT B 
                ON B.KD_PROPINSI = A.KD_PROPINSI AND B.KD_DATI2 = A.KD_DATI2 AND B.KD_KECAMATAN = A.KD_KECAMATAN AND B.KD_KELURAHAN = A.KD_KELURAHAN
                AND B.KD_BLOK = A.KD_BLOK AND B.NO_URUT = A.NO_URUT AND B.KD_JNS_OP = A.KD_JNS_OP
                AND B.THN_PAJAK_SPPT= A.THN_PAJAK_SPPT
                WHERE A.KD_PROPINSI = '$KD_PROPINSI'
                AND A.KD_DATI2 = '$KD_DATI2'
                AND A.KD_KECAMATAN = '$KD_KECAMATAN'
                AND A.KD_KELURAHAN = '$KD_KELURAHAN'
                AND A.KD_BLOK = '$KD_BLOK'
                AND A.NO_URUT = '$NO_URUT'
                AND A.KD_JNS_OP='$KD_JNS_OP'
                AND A.STATUS_PEMBAYARAN_SPPT='0' 
                AND B.THN_PAJAK_SPPT IS NULL
                order by A.THN_PAJAK_SPPT ASC";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function temukanDataTunggakanopcetak($spt) {
        $nop = explode('.', $spt->t_nopbphtbspptinfoop);
        $KD_PROPINSI = $nop[0];
        $KD_DATI2 = $nop[1];
        $KD_KECAMATAN = $nop[2];
        $KD_KELURAHAN = $nop[3];
        $KD_BLOK = $nop[4];
        $NO_URUT = $nop[5];
        $KD_JNS_OP = $nop[6];
        $sql = "SELECT A.THN_PAJAK_SPPT, A.PBB_YG_HARUS_DIBAYAR_SPPT, TO_CHAR(A.TGL_JATUH_TEMPO_SPPT,'DD-MM-YYYY') AS JATUH_TEMPO 
                from SPPT A 
                LEFT JOIN PEMBAYARAN_SPPT B 
                ON B.KD_PROPINSI = A.KD_PROPINSI AND B.KD_DATI2 = A.KD_DATI2 AND B.KD_KECAMATAN = A.KD_KECAMATAN AND B.KD_KELURAHAN = A.KD_KELURAHAN
                AND B.KD_BLOK = A.KD_BLOK AND B.NO_URUT = A.NO_URUT AND B.KD_JNS_OP = A.KD_JNS_OP
                AND B.THN_PAJAK_SPPT= A.THN_PAJAK_SPPT
                WHERE A.KD_PROPINSI = '$KD_PROPINSI'
                AND A.KD_DATI2 = '$KD_DATI2'
                AND A.KD_KECAMATAN = '$KD_KECAMATAN'
                AND A.KD_KELURAHAN = '$KD_KELURAHAN'
                AND A.KD_BLOK = '$KD_BLOK'
                AND A.NO_URUT = '$NO_URUT'
                AND A.KD_JNS_OP='$KD_JNS_OP'
                AND A.STATUS_PEMBAYARAN_SPPT='0' 
                AND B.THN_PAJAK_SPPT IS NULL
                order by A.THN_PAJAK_SPPT ASC";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }
    
    public function getKelurahanpbb (){
        $sql = "SELECT * FROM REF_KELURAHAN";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }
}
