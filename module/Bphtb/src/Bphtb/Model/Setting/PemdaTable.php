<?php

namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PemdaTable extends AbstractTableGateway {

    protected $table = "s_pemda";

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new \Bphtb\Model\Setting\PemdaBase());
        $this->initialize();
    }

    public function getdata() {
        $rowset = $this->select();
        $row = $rowset->current();
        return $row;
    }

    public function savedata(\Bphtb\Model\Setting\PemdaBase $db, $path, $session) {
        $data = array("s_namaprov" => $db->s_namaprov,
            "s_namakabkot" => $db->s_namakabkot,
            "s_namaibukotakabkot" => $db->s_namaibukotakabkot,
            "s_kodeprovinsi" => $db->s_kodeprovinsi,
            "s_kodekabkot" => $db->s_kodekabkot,
            "s_namainstansi" => $db->s_namainstansi,
            "s_namasingkatinstansi" => $db->s_namasingkatinstansi,
            "s_alamatinstansi" => $db->s_alamatinstansi,
            "s_notelinstansi" => $db->s_notelinstansi,
            "s_namabank" => $db->s_namabank,
            "s_norekbank" => $db->s_norekbank);
        if (!empty($path)) {
            $data["s_logo"] = $path;
        }
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $id = (int) $db->s_idpemda;
        if ($id == 0) {
            $this->insert($data);
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "SIMPAN DATA PEMDA - " . $db->s_kodekabkot . " - " . $db->s_namakabkot;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        } else {
            $this->update($data, array("s_idpemda" => $db->s_idpemda));
            $datahistlog['hislog_idspt'] = 0;
            $datahistlog['hislog_action'] = "UPDATE DATA PEMDA - " . $db->s_kodekabkot . " - " . $db->s_namakabkot;
            $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
            $tabel_histlog->insert($datahistlog);
        }
    }

}
