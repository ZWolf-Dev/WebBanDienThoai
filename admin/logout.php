<?php
session_start();
unset($_SESSION['useradmin'] );
unset($_SESSION['userid']);
unset($_SESSION['fullname']);
header("location: login.php");
?>