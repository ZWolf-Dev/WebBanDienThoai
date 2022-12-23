<?php

namespace App\Models;

use App\Library\Database;

class Topic extends Database
{
    private $table = null;
    public function __construct()
    {
        parent::__construct();
        $this->table = $this->TableName('topic');
    }

    public function topic_list($args = array())
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

    public function topic_row($id)
    {
        $sql = "SELECT * FROM $this->table WHERE id='$id'";
        return $this->QueryOne($sql);
    }
    //insert 
    public function topic_insert($data)
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
        //echo $sql;
        $this->SetQuery($sql);
    }
//update
    public function topic_update($data, $id)
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
    public function topic_delete($id)
    {
        $sql = "DELETE FROM $this->table WHERE id='$id'";
        $this->SetQuery($sql);
    }
}