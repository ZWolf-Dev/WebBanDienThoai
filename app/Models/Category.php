<?php

namespace App\Models;

use App\Library\Database;

class Category extends Database
{
    private $table = null;
    public function __construct()
    {
        parent::__construct();
        $this->table = $this->TableName('category');
    }
    //lấy danh sach the pảentid
    public function category_parentid($parentid = 0)
    {
        $sql = "SELECT * FROM $this->table WHERE parentid='$parentid' AND status='1' ORDER BY orders ASC";
        return $this->QueryAll($sql);
    }
    //lấy id
    public function category_id($slug)
    {
        $sql = "SELECT parentid FROM $this->table WHERE slug='$slug' AND status='1'";
        // SELECT id FROM `db_brand` WHERE name ='samsung'
        return $this->QueryOne($sql);
    }
    //Lấy danh sach category
    public function category_list($args = array())
    {
        $strwhere = '';
        if (array_key_exists('status', $args)) {
            if ($args['status'] == 'index') {
                $strwhere .= "status!='0'";
            } else {
                $strwhere .= "status='" . $args['status'] . "'";
            }
        }
        //KT biến strwhere
        if ($strwhere != '') {
            $strwhere = "WHERE " . $strwhere;
        }
        $sql = "SELECT * FROM $this->table $strwhere ORDER BY created_at DESC";
        return $this->QueryAll($sql);
    }
    //Lấy danh sach category để hiện menu
    public function categorys_list($args = array())
    {
        $strwhere = '';
        if (array_key_exists('status', $args)) {
            if ($args['status'] == 'index') {
                $strwhere .= "status!='0'";
            } else if ($args['status'] == 'trash') {
                $strwhere .= "status='0'";
            } else {
                $strwhere .= "status='" . $args['status'] . "'";
            }
        }
        if (array_key_exists('parentid', $args)) {
            if ($strwhere == '') {
                $strwhere .= " parentid='" . $args['parentid'] . "'";
            } else {
                $strwhere .= " AND parentid='" . $args['parentid'] . "'";
            }
        }
        // Kiểm tra biến strwhere
        if ($strwhere != '') {
            $strwhere = "WHERE " . $strwhere;
        }
        $strorder = 'created_at DESC';
        if (array_key_exists('order', $args)) {
            $strorder = $args['order']['field'] . " " . $args['order']['orderby'];
        }

        $sql = "SELECT * FROM $this->table $strwhere ORDER BY $strorder";
        // echo $sql;
        return $this->QueryAll($sql);
    }
    //
    public function category_brandid()
    {
        $sql = "SELECT * FROM $this->table WHERE parentid=0 AND status='1' ORDER BY orders ASC";
        // echo $sql;
        return $this->QueryAll($sql);
    }

    //lấy ra mẫu tin
    public function category_row($id)
    {
        if (is_numeric($id)) {
            $sql = "SELECT * FROM $this->table WHERE id='$id'";
        } else {
            $sql = "SELECT * FROM $this->table WHERE slug='$id' AND status='1'";
        }
        return $this->QueryOne($sql);
    }
    //insert 
    public function category_insert($data)
    {
        $strf = '';
        $strv = '';
        foreach ($data as $f => $v) {
            $strf .= $f . ", ";
            $strv .= "'$v', ";
        }
        $strf = rtrim(rtrim($strf), ',');
        $strv = rtrim(rtrim($strv), ',');
        $sql = "INSERT INTO $this->table($strf) VALUES($strv)";
        //echo $sql;
        $this->SetQuery($sql);
    }
    //update
    public function category_update($data, $id)
    {
        $strset = '';
        foreach ($data as $f => $v) {
            $strset .= $f . "='$v', ";
        }
        $strset = rtrim(rtrim($strset), ',');
        $sql = "UPDATE $this->table SET  $strset WHERE id='$id'";
        $this->SetQuery($sql);
    }
    //delete
    public function category_delete($id)
    {
        $sql = "DELETE FROM $this->table WHERE id='$id'";
        $this->SetQuery($sql);
    }
}
