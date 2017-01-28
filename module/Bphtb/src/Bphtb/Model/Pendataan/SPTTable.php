<?php

namespace Bphtb\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\ResultSet\ResultSet;

class SPTTable extends AbstractTableGateway {

    protected $table = 't_spt';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SPTBase());
        $this->initialize();
    }

    public function savedata(SPTBase $spt, $nop, $kodebayarbankop, $s_idjenistransaksi, $s_idhaktanah, $bphtbterhutangop, $hargatransaksiop, $potongan, $idnotaris, $dt) {
        $id = (int) $spt->t_idspt;        
        if ($id == 0) {
            $dataa = $this->getKohirFSave($spt);             
            $data = array(
                't_kohirspt' => $dataa['t_kohirspt'] + 1,
                't_tglprosesspt' => date('Y-m-d', strtotime($spt->t_tglprosesspt)),
                't_periodespt' => date('Y', strtotime($spt->t_tglprosesspt)),
                't_idnotarisspt' => $idnotaris,
//                't_objekspt' => null,
//                't_idtarifspt' => null,
//                't_ketetapanspt' => null,
//                't_tglketetapanspt' => null,
                't_tgljatuhtempospt' => $spt->t_tgljatuhtempospt,
                't_nopbphtbsppt' => $nop,
                't_kodebayarbanksppt' => $kodebayarbankop,
                't_idjenistransaksi' => $s_idjenistransaksi,
                't_idjenishaktanah' => $s_idhaktanah,
//                't_idrefspt' => null,
//                't_pejabatverifikasispt' => null,
                't_dasarspt' => $spt->t_dasarspt,
                't_totalspt' => str_ireplace(".", "", $bphtbterhutangop),
                't_nilaitransaksispt' => str_ireplace(".", "", $hargatransaksiop),
                't_potonganspt' => str_ireplace(".", "", $potongan),
                't_thnsppt' => $spt->t_thnsppt,
                't_persyaratan' => \Zend\Json\Json::encode($spt->t_persyaratan),
                't_idjenisdoktanah' => $spt->t_idjenisdoktanah,
                't_dendaspt' => str_ireplace(".", "", $spt->t_dendaspt),
                't_bulandendaspt' => str_ireplace(".", "", $spt->t_bulandendaspt),
            	't_tglprosesspttime' => date("Y-m-d h:i:s")
            );
            $this->insert($data);
            $rowset1 = $this->select(array('t_kohirspt' => $data['t_kohirspt'], 't_periodespt' => date('Y', strtotime($spt->t_tglprosesspt))));
            $row1 = $rowset1->current();
            return $row1;
        } else {
            $data = array(
//                't_kohirspt' => $this->getKohirFSave($spt),
                't_tglprosesspt' => date('Y-m-d', strtotime($spt->t_tglprosesspt)),
                't_periodespt' => date('Y', strtotime($spt->t_tglprosesspt)),
                't_idnotarisspt' => $idnotaris,
//                't_objekspt' => null,
//                't_idtarifspt' => null,
//                't_ketetapanspt' => null,
//                't_tglketetapanspt' => null,
                't_tgljatuhtempospt' => $spt->t_tgljatuhtempospt,
                't_nopbphtbsppt' => $nop,
                't_kodebayarbanksppt' => $kodebayarbankop,
                't_idjenistransaksi' => $s_idjenistransaksi,
                't_idjenishaktanah' => $s_idhaktanah,
//                't_idrefspt' => 1,
//                't_pejabatverifikasispt' => 1,
                't_dasarspt' => $spt->t_dasarspt,
                't_totalspt' => str_ireplace(".", "", $bphtbterhutangop),
                't_nilaitransaksispt' => str_ireplace(".", "", $hargatransaksiop),
                't_potonganspt' => str_ireplace(".", "", $potongan),
                't_thnsppt' => $spt->t_thnsppt,
                't_persyaratan' => \Zend\Json\Json::encode($spt->t_persyaratan),
                't_dendaspt' => str_ireplace(".", "", $spt->t_dendaspt),
                't_bulandendaspt' => str_ireplace(".", "", $spt->t_bulandendaspt)
            );
            $this->update($data, array('t_idspt' => $spt->t_idspt));
            $rowset = $this->select(array('t_kohirspt' => $spt->t_kohirspt, 't_periodespt' => date('Y', strtotime($spt->t_tglprosesspt))));
            $row = $rowset->current();
            return $row;
        }
    }

    public function persyaratan($dt) {
//        $data = "";
//        foreach ($dt->persyaratann as $row) {
//            $data .= "|" . $row;
//        }
//        return $data;
    }

    public function getKohirFsave(SPTBase $spt) {
        $sql = "select max(t_kohirspt) as t_kohirspt 
                from t_spt
                where t_periodespt='" . date('Y', strtotime($spt->t_tglprosesspt)) . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }
    
    public function getKohirKetetapanFsave(SPTBase $spt) {
        $sql = "select max(t_kohirketetapanspt) as t_kohirketetapanspt 
                from t_spt
                where t_periodespt='" . date('Y', strtotime($spt->t_tglprosesspt)) . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function hapusDataSpt(SPTBase $kb) {
        $this->delete(array('t_idspt' => $kb->t_idspt));
    }

    public function savedatabpn(SPTBase $spt) {
        $total = (int) $spt->t_totalspt;
        $dataa = $this->getKohirFSave($spt);
        $dataaa = $this->getKohirKetetapanFsave($spt);
        $data = array(
            't_kohirspt' => $dataa['t_kohirspt'] + 1,
            't_kohirketetapanspt' => null,
            't_tglprosesspt' => date('Y-m-d'),
            't_periodespt' => date('Y'),
            't_idnotarisspt' => $spt->t_idnotarisspt,
            't_tgljatuhtempospt' => $spt->t_tgljatuhtempospt,
            't_nopbphtbsppt' => $spt->t_nopbphtbsppt,
            't_kodebayarbanksppt' => $spt->t_kodebayarbanksppt,
            't_idjenistransaksi' => $spt->t_idjenistransaksi,
            't_idjenishaktanah' => $spt->t_idjenishaktanah,
            't_dasarspt' => $spt->t_dasarspt,
            't_totalspt' => $total,
            't_nilaitransaksispt' => $spt->t_nilaitransaksispt,
            't_potonganspt' => $spt->t_potonganspt,
            't_thnsppt' => $spt->t_thnsppt,
            't_persyaratan' => $spt->t_persyaratan,
            't_idjenisdoktanah' => $spt->t_idjenisdoktanah,
            't_idsptsebelumnya' => $spt->t_idspt
        );
        $this->insert($data);
        $rowset1 = $this->select(array('t_kohirspt' => $data['t_kohirspt'], 
        		't_periodespt' => $data['t_periodespt'],
        		't_tglprosesspt' => date('Y-m-d',strtotime($data['t_tglprosesspt'])),
        		't_idsptsebelumnya' => $spt->t_idspt
        ));
        $row1 = $rowset1->current();
        return $row1;
    }

    public function getSptid($t_idspt) {
        $rowset = $this->select(array('t_idspt' => $t_idspt));
        $row = $rowset->current();
        return $row;
    }

    public function savedatakoreksi(SPTBase $spt) {
        $total = (int) $spt->t_totalspt;
        $dataa = $this->getKohirFSave($spt);
        $dataaa = $this->getKohirKetetapanFsave($spt);
        $data = array(
            't_kohirspt' => $dataa['t_kohirspt'] + 1,
            't_kohirketetapanspt' => null,
            't_tglprosesspt' => date('Y-m-d'),
            't_periodespt' => date('Y'),
            't_idnotarisspt' => $spt->t_idnotarisspt,
            't_tgljatuhtempospt' => $spt->t_tgljatuhtempospt,
            't_nopbphtbsppt' => $spt->t_nopbphtbsppt,
            't_kodebayarbanksppt' => $spt->t_kodebayarbanksppt,
            't_idjenistransaksi' => $spt->t_idjenistransaksi,
            't_idjenishaktanah' => $spt->t_idjenishaktanah,
            't_dasarspt' => $spt->t_dasarspt,
            't_totalspt' => $total,
            't_nilaitransaksispt' => $spt->t_nilaitransaksispt,
            't_potonganspt' => $spt->t_potonganspt,
            't_thnsppt' => $spt->t_thnsppt,
            't_persyaratan' => $spt->t_persyaratan,
            't_idjenisdoktanah' => $spt->t_idjenisdoktanah,
            't_idsptsebelumnya' => $spt->t_idspt
        );
        $this->insert($data);
        $rowset1 = $this->select(array('t_kohirspt' => $data['t_kohirspt'], 
        		't_periodespt' => $data['t_periodespt'],
        		't_tglprosesspt' => date('Y-m-d',strtotime($data['t_tglprosesspt'])),
        		't_idsptsebelumnya' => $spt->t_idspt
        ));
        $row1 = $rowset1->current();
        return $row1;
    }

    public function getIDSPTmax() {
        $sql = "select max(t_idspt) as t_idsptne from t_spt";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

}
