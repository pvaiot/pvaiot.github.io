<?php
require_once __DIR__ . '/../function.php';

$_SESSION['bill_name']     = $_POST['fname']." | ".$_POST['lname'];
$_SESSION['bill_address']  = $_POST['address'];
$_SESSION['bill_city']     = $_POST['city'];
$_SESSION['bill_state']    = $_POST['state'];
$_SESSION['bill_zip']      = $_POST['zip'];
$_SESSION['bill_phone']    = $_POST['phone'];
$_SESSION['dob']           = $_POST['dob'];
?>
