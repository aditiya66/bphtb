<?php

namespace Bphtb\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class SettingUserTable extends AbstractTableGateway {

    protected $table = 's_users';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SettingUserBase());
        $this->initialize();
    }

    public function getGridCount(SettingUserBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
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
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(SettingUserBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
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
            } else {
                $select->order("s_iduser asc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("s_iduser asc");
            }
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function fetchAll() {
        $resultSet = $this->select();
        return $resultSet;
    }

    public function getUser(SettingUserBase $sb) {
        $rowset = $this->select(array('s_iduser' => $sb->s_iduser));
        $row = $rowset->current();
        return $row;
    }

    public function getUserId($id) {
        $rowset = $this->select(array('s_iduser' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function getUserEdit(SettingUserBase $sb) {
        $rowset = $this->select(array('s_username' => $sb->s_username, 's_tipe_pejabat' => $sb->s_tipe_pejabat, 's_idpejabat_idnotaris' => $sb->s_idpejabat_idnotaris));
        $row = $rowset->current();
        return $row;
    }

    public function saveData(SettingUserBase $sb) {
        $data = array(
            's_username' => $sb->s_username,
            's_password' => md5($sb->s_password),
            's_jabatan' => $sb->s_jabatan,
            's_akses' => $sb->s_akses,
            's_idpejabat_idnotaris' => $sb->s_idpejabat_idnotaris,
            's_tipe_pejabat' => $sb->s_tipe_pejabat
        );

        $id = (int) $sb->s_iduser;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_iduser' => $sb->s_iduser));
        }
        $rowset = $this->select(array('s_username' => $sb->s_username,
            's_password' => md5($sb->s_password)));
        $row = $rowset->current();
        return $row;
    }

    public function saveresourcepermission($s_iduser, $s_akses) {
        $sql = "INSERT INTO permission_resource (s_iduser, s_idpermission) VALUES (" . $s_iduser . "," . $s_akses . ")";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function savesession($session) {
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = 0;
        $datahistlog['hislog_action'] = "SIMPAN / EDIT DATA USER - " . $s_iduser;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function deleteResourcePermision($s_iduser) {
        $sql = "DELETE FROM permission_resource WHERE s_iduser = " . $s_iduser;
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

//    public function saveUserRole(SettingUserBase $userrole) {
//        $sql = "INSERT INTO user_role(user_id,role_id) VALUES (" . $userrole->s_iduser . "," . $userrole->s_akses . ")";
//        $st = $this->adapter->query($sql);
//        $rs = $st->execute();
//    }
//    public function saveRolePermission($role_id, $permission_id) {
//        $sql = "INSERT INTO role_permission(role_id, permission_id) VALUES ($role_id,$permission_id)";
//        $st = $this->adapter->query($sql);
//        $rs = $st->execute();
//    }

    public function getRole() {
        $sql = "SELECT * FROM role";
        $st = $this->adapter->query($sql);
        $rs = $st->execute();
        foreach ($rs as $key => $value) {
            $ar_role[$value['rid']] = $value['role_name'];
        }
        return $ar_role;
    }

    public function getPejabat() {
        $sql = "SELECT * FROM s_pejabat";
        $st = $this->adapter->query($sql);
        return $st->execute();
    }

    public function getNotaris() {
        $sql = "SELECT * FROM s_notaris";
        $st = $this->adapter->query($sql);
        return $st->execute();
    }

    public function getuserdata($user) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->join(array('role' => 'role'), 'role.rid = s_users.s_akses', array('rid', 'role_name'), 'LEFT');
//        $select->join(array('userRole' => 'user_role'), "userRole.user_id = role.rid", array('role_id'), 'LEFT');
        $where = new \Zend\Db\Sql\Where();
        $where->equalTo("s_username", $user);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->current();
    }

    public function hapusData($id, $session) {
        $this->delete(array('s_iduser' => $id));
        $sql = "DELETE FROM permission_resource WHERE s_iduser=$id";
        $st = $this->adapter->query($sql);
        $st->execute();
        $datahistlog = array(
            'hislog_opr_id' => $session['s_iduser'],
            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
            'hislog_opr_nama' => $session['s_username'],
            'hislog_time' => date("Y-m-d h:i:s")
        );
        $datahistlog['hislog_idspt'] = 0;
        $datahistlog['hislog_action'] = "HAPUS USER - " . $id;
        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
        $tabel_histlog->insert($datahistlog);
    }

    public function getPermission($resource_id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('permission');
        $select->order('permission_name', 'asc');
        $where = new \Zend\Db\Sql\Where();
        $where->equalTo("resource_id", $resource_id);
        if ($resource_id != 1) {
            $where->in("id", array(1, 5, 7, 8, 9, 10, 11, 12, 15, 16, 17, 18, 21, 22, 23, 24, 26, 27, 28, 29, 31, 32, 33, 34, 36, 37, 38, 39, 41, 42, 43, 44,
                46, 47, 48, 49, 51, 52, 53, 54, 55, 56, 57, 58, 62, 63, 64, 65, 68, 70, 72, 74, 89, 90, 92, 105, 108, 110, 111, 114, 115, 117, 118, 119, 122, 128,
                130, 138, 151, 153, 154, 155, 162, 163, 76, 93, 94, 95, 96, 97, 98, 103, 104, 129, 134, 135, 137, 142, 145, 148, 150, 157, 165, 166, 167, 168, 169, 170, 172,
                173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202
            ));
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getPermissionAcc() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('permission');
        $select->order('permission_name', 'asc');
        $where = new \Zend\Db\Sql\Where();
        $where->notIn("id", array(1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 15, 16, 17, 18, 21, 22, 23, 24, 26, 27, 28, 29, 31, 32, 33, 34, 36, 37, 38, 39, 41, 42, 43, 44,
            46, 47, 48, 49, 51, 52, 53, 54, 55, 56, 57, 58, 62, 63, 64, 65, 68, 70, 72, 74, 89, 90, 92, 105, 108, 110, 111, 114, 115, 117, 118, 119, 122, 128,
            130, 138, 151, 153, 154, 155, 162, 163, 76, 93, 94, 95, 96, 97, 98, 103, 104, 129, 134, 135, 137, 142, 145, 148, 150, 157, 165, 166, 167, 168, 169, 170, 172,
            173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202
        ));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();

        $i = 0;
        $data_array = array();
        foreach ($res as $row) {
            $data_array[$i] = $row['id'];
            $i++;
        }
        return $data_array;
    }

    public function getResourcePermision($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('permission_resource');
        $where = new \Zend\Db\Sql\Where();
        $where->equalTo("s_iduser", $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();

        $returnArray = array();
        foreach ($res as $row) {
            $returnArray[] = $row['s_idpermission'];
        }
        return $returnArray;
    }

    public function savepassword(SettingUserBase $sb) {
        $data = array(
            's_password' => md5($sb->s_password)
        );
        $this->update($data, array('s_iduser' => $sb->s_iduser));
    }

}
