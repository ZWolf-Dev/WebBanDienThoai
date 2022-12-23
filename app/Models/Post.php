<?php

namespace App\Models;

use App\Library\Database;

class Post extends Database
{
    private $table = null;
    public function __construct()
    {
        parent::__construct();
        $this->table = $this->TableName('post');
    }
    //láy sp theo topid
    public function post_home($listtopid,$limit=8)
    {
        $sql = "SELECT * FROM $this->table WHERE topid IN (".implode(',',$listtopid).") AND status='1' ORDER BY created_at DESC LIMIT $limit";
        //echo $sql;
        return $this->QueryAll($sql);
    }
    public function post_category($listtopid, $offset=0, $limit=8)
    {
        $sql = "SELECT * FROM $this->table WHERE topid IN (".implode(',',$listtopid).") AND status='1' ORDER BY created_at DESC LIMIT $offset, $limit";
        //echo $sql;
        return $this->QueryAll($sql);
    }
    public function post_category_count($listtopid)
    {
        $sql = "SELECT * FROM $this->table WHERE topid IN (".implode(',',$listtopid).") AND status='1'";
        //echo $sql;
        return count($this->QueryAll($sql));
    }
//láy ds post
    // public function post_list($args = array())
    // {
    //     $strwhere = '';
    //     if (array_key_exists('status', $args)) { 
    //         if ($args['status'] == 'index')
    //         {
    //             $strwhere .= "status!='0'";
    //         }
    //         else{
    //             $strwhere .= "status='" . $args['status'] . "'";
    //         }
    //     }
    //     //KT biến strwhere
    //     if ($strwhere !='')
    //     {
    //         $strwhere ="WHERE " . $strwhere;
    //     }
    //     $sql = "SELECT * FROM $this->table $strwhere ORDER BY created_at DESC";
    //     return $this->QueryAll($sql);
    // }
    //////////////////////////////////////////
    public function post_list($args = array())
    {
        $strwhere = '';
        if (array_key_exists('status', $args)) { 
            if ($args['status'] == 'index') {
                $strwhere .= "status!='0'";
            }
            if ($args['status'] == 'trash') {
                $strwhere .= "status='0'";
            }

            else {
                $strwhere .= "status='" . $args['status'] . "'";
            }
        }
        if (array_key_exists('topicid', $args)) { 
            if($strwhere == '') {
                $strwhere .= " topicid='" . $args['topicid'] . "'";
            }
            else {
                $strwhere .= " AND topicid='" . $args['topicid'] . "'";
            }
        }  
        //KT biến strwhere
        if ($strwhere !='') {
            $strwhere ="WHERE " . $strwhere;
        }
        $strorder= ' created_at DESC';
        if (array_key_exists('order', $args)) { 
            $strorder=$args['order']['field']." ".$args['order']['orderby'];
        }
        $sql = "SELECT * FROM $this->table $strwhere ORDER BY $strorder";
        //echo $sql;
        return $this->QueryAll($sql);
    }
    ///////////////////////////////////////////////////////
    public function post_row($id)
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
    public function post_insert($data)
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
public function post_update($data, $id)
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
    public function post_delete($id)
    {
        $sql = "DELETE FROM $this->table WHERE id='$id'";
        $this->SetQuery($sql);
    }
}