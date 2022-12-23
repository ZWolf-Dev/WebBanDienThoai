<?php

namespace App\Models;

use App\Library\Database;

class Contact extends Database
{
    private $table = null;
    public function __construct()
    {
        parent::__construct();
        $this->table = $this->TableName('contact');
    }
    //lấy danh sach the pảentid
    public function contact_parentid($parentid = 0)
    {
        $sql = "SELECT * FROM $this->table WHERE parentid='$parentid' AND status='1' ORDER BY orders ASC";
        return $this->QueryAll($sql);
    }
//Lấy danh sach contact
    public function contact_list($args = array())
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
        return $this->QueryAll($sql);
    }
//lấy ra mẫu tin
    public function contact_row($id)
    {
        if(is_numeric($id))
        {
            $sql = "SELECT * FROM $this->table WHERE id='$id'";
        }
        else
        {
            $sql = "SELECT * FROM $this->table WHERE slug='$id' AND status='1'";
        }
        return $this->QueryOne($sql);
    }
    //insert 
    public function contact_insert($data)
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
    public function contact_update($data, $id)
    {
        $strset='';
        foreach($data as $f=>$v)
        {
            $strset .=$f . "='$v', ";
        }
        $strset = rtrim(rtrim($strset), ',');
        $sql = "UPDATE $this->table SET  $strset WHERE id='$id'";
        $this->SetQuery($sql);
    }
//delete
    public function contact_delete($id)
    {
        $sql = "DELETE FROM $this->table WHERE id='$id'";
        $this->SetQuery($sql);
    }
}