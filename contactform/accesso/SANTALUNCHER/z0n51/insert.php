<?php

$fp = fopen('id.txt', 'w');
fwrite($fp, $_GET['id']);
fclose($fp);
header("Location: ../in.php");
?>