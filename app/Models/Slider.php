<?php

namespace App\Models;

use App\Library\Database;

class Slider extends Database
{
    private $table = null;
    public function __construct()
    {
        parent::__construct();
        $this->table = $this->TableName('slider'); //tnh_slider
    }
    //lấy danh sách slider
    public function slider_list($args = array())
    {
        $strwhere = '';
        if (array_key_exists('status', $args)) {
            if ($args['status'] == 'index') {
                $strwhere .= "status!='0'";
            } else {
                $strwhere .= "status='" . $args['status'] . "'";
            }
        }
        if (array_key_exists('position', $args)) {
            if ($strwhere == '') {
                $strwhere .= " position='" . $args['position'] . "'";
            } else {
                $strwhere .= " AND position='" . $args['position'] . "'";
            }
        }
        // Kiểm tra biến strwhere
        if ($strwhere != '') {
            $strwhere = "WHERE " . $strwhere;
        }
        $sql = "SELECT * FROM $this->table $strwhere  ORDER BY created_at DESC";
        return $this->QueryAll($sql);
    }
    // lấy ra 1 mẫu tin - sau này có sửa lại
    public function slider_row($id)
    {
        $sql = "SELECT * FROM $this->table WHERE id ='$id'";
        return $this->QueryOne($sql);
    }
    //Insert 1 mẫu tin
    public function slider_insert($data)
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
    public function slider_update($data, $id)
    {
        $strset = '';
        foreach ($data as $f => $v) {
            $strset .= $f . "='$v', ";
        }
        $strset = rtrim(rtrim($strset), ',');
        $sql = "UPDATE $this->table SET $strset WHERE id='$id'";
        $this->SetQuery($sql);
    }
    // delete mẫu tin 
    public function slider_delete($id)
    {

        $sql = "DELETE FROM $this->table WHERE id='$id'";
        $this->SetQuery($sql);
    }
}
