<?php

namespace App\Models;

use App\Library\Database;

class Productdetail extends Database
{
    private $table = null;
    public function __construct()
    {
        parent::__construct();
        $this->table = $this->TableName('productdetail');
    }
    //láy sp theo categoryid
    public function productdetail_home($listcategoryid, $limit = 8)
    {
        $sql = "SELECT * FROM $this->table WHERE categoryid IN (" . implode(',', $listcategoryid) . ") AND status='1' ORDER BY created_at DESC LIMIT $limit";
        //echo $sql;
        return $this->QueryAll($sql);
    }
    public function productdetail_category($listcategoryid, $offset = 0, $limit = 8)
    {
        $sql = "SELECT * FROM $this->table WHERE categoryid IN (" . implode(',', $listcategoryid) . ") AND status='1' ORDER BY created_at DESC LIMIT $offset, $limit";
        //echo $sql;
        return $this->QueryAll($sql);
    }
    public function productdetail_category_count($listcategoryid)
    {
        $sql = "SELECT * FROM $this->table WHERE categoryid IN (" . implode(',', $listcategoryid) . ") AND status='1'";
        //echo $sql;
        return count($this->QueryAll($sql));
    }
    //láy sp theo brandid
    public function productdetails_home($listbrandid, $limit = 8)
    {
        $sql = "SELECT * FROM $this->table WHERE brandid IN (" . implode(',', $listbrandid) . ") AND status='1' ORDER BY created_at DESC LIMIT $limit";
        //echo $sql;
        return $this->QueryAll($sql);
    }
    public function productdetail_brand($listbrandid, $offset = 0, $limit = 8)
    {
        $sql = "SELECT * FROM $this->table WHERE brandid IN (" . implode(',', $listbrandid) . ") AND status='1' ORDER BY created_at DESC LIMIT $offset, $limit";
        //echo $sql;
        return $this->QueryAll($sql);
    }
    public function productdetail_brand_count($listbrandid)
    {
        $sql = "SELECT * FROM $this->table WHERE brandid IN (" . implode(',', $listbrandid) . ") AND status='1'";
        //echo $sql;
        return count($this->QueryAll($sql));
    }
    //láy ds productdetail
    public function productdetail_list($args = array())
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

    public function productdetail_row($id)
    {
        $sql = "SELECT * FROM $this->table WHERE id='$id'";
        return $this->QueryOne($sql);
    }
    //Lấy id 1 phần tử
    public function productdetail_id()
    {
        $sql = "SELECT * FROM $this->table ORDER BY id DESC LIMIT 1";
        // echo $sql;
        return $this->QueryAll($sql);
    }
    //insert 
    public function productdetail_insert($data)
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
        // echo $sql;
        $this->SetQuery($sql);
    }
    //update
    public function productdetail_update($data, $id)
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
    public function productdetail_delete($id)
    {
        $sql = "DELETE FROM $this->table WHERE id='$id'";
        // echo $sql;
        $this->SetQuery($sql);
    }
}
