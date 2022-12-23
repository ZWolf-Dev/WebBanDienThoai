<?php

use App\Library\Route;

session_start();
if (!isset($_SESSION['useradmin'])) {
    header("location:login.php");
}
if ($_SESSION['roles'] == 0) {
    // echo 'Tài khoản của bạn không phải là tài khoản Admin nên không có quyền truy cập.';
?>
    <!DOCTYPE html>
    <html>

    <head>
        <link rel="stylesheet" type="text/css" href="../public/css/formmain.css" />
        <link rel="stylesheet" type="text/css" href="../public/css/formpage.css" />
        <link rel="icon" href="../public/images/Logo.png" type="image/x-icon" />
        </script>
    </head>

    <body>
        <div class="success-box">
            <h3 class="title-success-order">Tài khoản của bạn không phải là tài khoản Admin nên không có quyền truy cập.</h3>
        </div>
    </body>

    </html>
<?php
} else {
    date_default_timezone_set('Asia/Ho_Chi_Minh');
    require_once("../vendor/autoload.php");
    new Route('admin');
}
