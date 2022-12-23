<?php

namespace App\Models;

use App\Library\Database;

class Orderdetail extends Database
{
    private $table = null;
    public function __construct()
    {
        parent::__construct();
        $this->table = $this->TableName('orderdetail'); //tnh_orderdetail
    }
    //lấy danh sách cl
    public function orderdetail_list($args = array())
    {
        $sql = "SELECT * FROM $this->table";
        return $this->QueryAll($sql);
    }
    // lấy ra 1 mẫu tin - sau này có sửa lại
    public function orderdetail_row($id)
    {
        $sql = "SELECT * FROM $this->table WHERE id ='$id'";
        return $this->QueryOne($sql);
    }
    // lấy id theo userid
    public function orderdetail_id($orderid)
    {
        $sql = "SELECT * FROM $this->table WHERE orderid ='$orderid'";
        // echo $sql;
        return $this->QueryOne($sql);
    }
     //Lấy id 1 phần tử
     public function orderdetails_id()
     {
         $sql = "SELECT * FROM $this->table ORDER BY id DESC LIMIT 1";
         // echo $sql;
         return $this->QueryAll($sql);
     }
    //
    public function orderdetails_list($args = array())
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
        if (array_key_exists('userid', $args)) {
            if ($strwhere == '') {
                $strwhere .= " userid='" . $args['userid'] . "'";
            } else {
                $strwhere .= " AND userid='" . $args['userid'] . "'";
            }
        }
        // Kiểm tra biến strwhere
        if ($strwhere != '') {
            $strwhere = "WHERE " . $strwhere;
        }
        $strorder = 'created_at DESC';
        if (array_key_exists('orderdetail', $args)) {
            $strorder = $args['orderdetail']['field'] . " " . $args['orderdetail']['orderby'];
        }
        $sql = "SELECT * FROM $this->table $strwhere ORDER BY $strorder";
        // echo $sql;
        return $this->QueryAll($sql);
    }
    public function orders_list($args = array())
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
        if (array_key_exists('userid', $args)) {
            if ($strwhere == '') {
                $strwhere .= " userid='" . $args['userid'] . "'";
            } else {
                $strwhere .= " AND userid='" . $args['userid'] . "'";
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
        echo $sql;
        return $this->QueryAll($sql);
    }
    //Insert 1 mẫu tin
    public function orderdetail_insert($data)
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
        $this->SetQuery($sql);
        // echo $sql;
    }
    // update mẫu tin 
    public function orderdetail_update($data, $id)
    {
        $strset = '';
        foreach ($data as $f => $v) {
            $strset .= $f . "='$v', ";
        }
        $strset = rtrim(rtrim($strset), ',');
        $sql = "UPDATE $this->table SET $strset WHERE id='$id'";
        $this->SetQuery($sql);
    }
}
