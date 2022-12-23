<?php

namespace App\Models;

use App\Library\Database;

class User extends Database
{
    private $table = null;
    public function __construct()
    {
        parent::__construct();
        $this->table = $this->TableName('user');
    }

    public function user_list($args = array())
    {
        $strwhere = '';
        if (array_key_exists('status', $args)) { 
            if ($args['status'] == 'index')
            {
                $strwhere .= "status!='0'";
            }
            else{
                $strwhere .= "status='" . $args['status'] . "'";
            }
        }
        //KT biến strwhere
        if ($strwhere !='')
        {
            $strwhere ="WHERE " . $strwhere;
        }
        $sql = "SELECT * FROM $this->table $strwhere ORDER BY created_at DESC";
        // echo $sql;
        return $this->QueryAll($sql);
    }
    public function user_row($args = array())
    {
        $strwhere = '';
        if (array_key_exists('status', $args)) { 
            if ($args['status'] == 'index'){
                $strwhere .= "status!='0'";
            } else {
                $strwhere .= "status='" . $args['status'] . "'";
            }
        }
        if (array_key_exists('username', $args)) { 
            if($strwhere != '')
            {
                $strwhere .= " AND username='" . $args['username'] . "'";
            }
        }
        if (array_key_exists('email', $args)) { 
            if($strwhere != '')
            {
                $strwhere .= " AND email='" . $args['email'] . "'";
            }
        }
        $sql = "SELECT * FROM $this->table WHERE $strwhere LIMIT 1";
        //echo $sql;
        return $this->QueryOne($sql);
    }
    public function users_row($id)
    {
        if(is_numeric($id))
        {
            $sql = "SELECT * FROM $this->table WHERE id='$id'";
            // echo $sql;
        }
        else
        {
            $sql = "SELECT * FROM $this->table WHERE slug='$id' AND status='1'";
        }
        return $this->QueryOne($sql);
    }
    //insert 
    public function user_insert($data)
    {
        $strf = '';
        $strv = '';
        foreach ($data as $f => $v)
        {
            $strf .= $f . ", ";
            $strv .= "'$v', ";
        }
        $strf = rtrim(rtrim($strf), ',');
        $strv = rtrim(rtrim($strv), ',');
        $sql = "INSERT INTO $this->table($strf) VALUES($strv)";
        // echo $sql;
        $this->SetQuery($sql);
   }
//update
public function user_update($data, $id)
{
    $strset='';
    foreach($data as $f=>$v)
    {
        $strset .=$f . "='$v', ";
    }
    $strset = rtrim(rtrim($strset), ',');
    $sql = "UPDATE $this->table SET  $strset WHERE id='$id'";
      echo $sql;
    // $this->SetQuery($sql);
}
//update
    public function user_delete($id)
    {
        $sql = "UPDATE $this->table WHERE id='$id'";
        $this->SetQuery($sql);
    }
     //insert 
     public function register_insert($data)
     {
         $strf = '';
         $strv = '';
         foreach ($data as $f => $v)
         {
             $strf .= $f . ", ";
             $strv .= "'$v', ";
         }
         $strf = rtrim(rtrim($strf), ',');
         $strv = rtrim(rtrim($strv), ',');
         $sql = "INSERT INTO $this->table($strf) VALUES($strv)";
        //  echo $sql;
         $this->SetQuery($sql);
    }
    public function users_list($args = array())
    {
        $strwhere = '';
        if (array_key_exists('status', $args)) {
            if ($args['status'] == 'index') {
                $strwhere .= "status!='0'";
            } else {
                $strwhere .= "status='" . $args['status'] . "'";
            }
        }
        if (array_key_exists('roles', $args)) {
            if ($strwhere == '') {
                $strwhere .= " roles='" . $args['roles'] . "'";
            } else {
                $strwhere .= " AND roles='" . $args['roles'] . "'";
            }
        }
        // Kiểm tra biến strwhere
        if ($strwhere != '') {
            $strwhere = "WHERE " . $strwhere;
        }
        $sql = "SELECT * FROM $this->table $strwhere  ORDER BY created_at DESC";
        return $this->QueryAll($sql);
    }
    

}