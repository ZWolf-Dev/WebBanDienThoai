<?php
namespace App\Library;
use App\Library\Config;
use mysqli;
class Database extends Config
{
    private $coon =null;
    function __construct()
    {
      $this->coon = new mysqli ($this->host,$this->user,$this->pass,$this->db);
      $this->coon->set_charset("utf8");
    }
    // xử lý tiền tố bảng
    protected function TableName($name)
    {
        return $this->prefix . $name;
    }
    //Truy vấn trả về nhiều mẫu tin 
    protected function QueryAll($sql)
    {
        $result = $this->coon->query($sql);
        return $result->fetch_all(MYSQLI_ASSOC);
    }
    //Truy vấn trả về một mẫu tin
    protected function QueryOne($sql)
    {
        $result = $this->coon->query($sql);
        return $result->fetch_assoc();
    }
    //Truy vấn trả về nhiều mẫu tin
    protected function QueryCount($sql)
    {
        $result = $this->coon->query($sql);
        return $result->num_rows;
    }
    //Truy vấn trả về nhiều mẫu tin
    protected function SetQuery($sql)
    {
         $this->coon->query($sql);
    }
}