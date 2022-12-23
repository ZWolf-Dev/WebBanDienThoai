<?php

namespace App\Library;

class Route
{
    function __construct($page = 'site')
    {
        if ($page == 'site') {
            $this->url_site();
        } else {
            $this->url_admin();
        }
    }
    //Hàm tuỳ biến url trang quản trị người dùng
    function url_site()
    {
        $pathView = "views/frontend/";
        if (!isset($_REQUEST["option"])) {
            $pathView .= 'home.php';
        } else {
            $pathView .= $_REQUEST["option"];
            if (isset($_REQUEST["id"])) {
                $pathView .= '-detail.php';
            } else {
                if (isset($_REQUEST["cat"])) {
                    $pathView .= '-category.php';
                } else {
                    if (isset($_REQUEST["bra"])) {
                        $pathView .= '-brand.php';
                    } else {
                        $pathView .= '.php';
                    }
                }
            }
        }
        //Kiểm tra pathView có tồn tại hay không
        //if(file_exists($pathView)){
        require_once($pathView);
        //}
        // else {
        // die('Lỗi trang');
        //}
    }
    function url_admin()
    {
        $pathView = "../views/backend/";
        if (!isset($_REQUEST["option"])) {
            $pathView .= 'dashboard/index.php';
        } else {
            $pathView .= $_REQUEST["option"] . '/';
            if (isset($_REQUEST["cat"])) {
                $pathView .= $_REQUEST["cat"] . '.php';
            } else {
                if (isset($_REQUEST["bra"])) {
                    $pathView .= $_REQUEST["bra"] . '.php';
                } else {
                    $pathView .= 'index.php';
                }
            }
        }
        //Kiểm tra pathView có tồn tại hay không
        //if(file_exists($pathView)){
        require_once($pathView);
        //}
        // else {
        // die('Lỗi trang');
        //}
    }
}
