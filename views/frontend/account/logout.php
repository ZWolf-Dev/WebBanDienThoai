<?php
session_start();
unset($_SESSION['useradmin'] );
unset($_SESSION['userid']);
unset($_SESSION['name']);
header("location:index.php?option=home");
?>