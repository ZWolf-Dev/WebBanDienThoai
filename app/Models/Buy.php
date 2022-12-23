<?php

namespace App\Models;

use App\Library\Database;

class Buy extends Database
{
    private $table = null;
    public function __construct()
    {
        parent::__construct();
        $this->table = $this->TableName('buy');
    }
    //lấy sp theo ký tự
    public function buy_search($listsearch)
    {
        $sql = "SELECT * FROM $this->table WHERE name LIKE ("."'%".$listsearch."%'".") AND status='1' ORDER BY created_at";
        // echo $sql;
        return $this->QueryAll($sql);
    }
    //láy sp theo categoryid
    public function buy_home($listcategoryid,$limit=8)
    {
        $sql = "SELECT * FROM $this->table WHERE categoryid IN (".implode(',',$listcategoryid).") AND status='1' ORDER BY created_at DESC LIMIT $limit";
        //echo $sql;
        return $this->QueryAll($sql);
    }
    public function buy_category($listcategoryid, $offset=0, $limit=8)
    {
        $sql = "SELECT * FROM $this->table WHERE categoryid IN (".implode(',',$listcategoryid).") AND status='1' ORDER BY created_at DESC LIMIT $offset, $limit";
        //echo $sql;
        return $this->QueryAll($sql);
    }
    public function buy_category_count($listcategoryid)
    {
        $sql = "SELECT * FROM $this->table WHERE categoryid IN (".implode(',',$listcategoryid).") AND status='1'";
        //echo $sql;
        return count($this->QueryAll($sql));
    }
    //láy sp theo brandid
    public function buy_brand($listbrandid,$listcategoryid)
    {
        $sql = "SELECT * FROM $this->table WHERE categoryid = ".implode($listcategoryid)." AND brandid = ".implode($listbrandid)." AND status='1' ORDER BY created_at";
        // SELECT * FROM db_buy WHERE brandid = 1 and categoryid = 4 AND status='1' ORDER BY created_at DESC
        // echo $sql;
        return $this->QueryAll($sql);
    }
    //
    public function buy_id($listid)
    {
        $sql = "SELECT * FROM $this->table WHERE id IN (".implode(',',$listid).") AND status='1'";
        // echo $sql;
        return $this->QueryAll($sql);
    }
//láy ds buy
    public function buy_list($args = array())
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

    public function buy_row($id = array())
    {
        $sql = "SELECT * FROM $this->table WHERE id='$id'";
        // echo $sql;
        return $this->QueryOne($sql);
    }
    //insert 
    public function buy_insert($data)
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
    public function buy_update($data, $id)
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
    public function buy_delete($id)
    {
        $sql = "DELETE FROM $this->table WHERE id='$id'";
        // echo $sql;
        $this->SetQuery($sql);
    }
    //l
    public function buy_pro($buypro)
    {
        $sql = "SELECT * FROM $this->table WHERE userid = $buypro and status != 2";
        // echo $sql;
        return $this->QueryAll($sql);
    }
}
