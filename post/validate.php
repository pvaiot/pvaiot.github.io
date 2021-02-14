<?php
class CreditCard {
  protected static $cards = array(
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
  public static function validCreditCard($number, $type = null){
    $ret = array(
      'valid' => false,
      'number' => '',
      'type' => '',
    );
    $number = preg_replace('/[^0-9]/', '', $number);
    if(empty($type)){
      $type = self::creditCardType($number);
    }
    if(array_key_exists($type, self::$cards) && self::validCard($number, $type)){
      return array(
        'valid' => true,
        'number' => $number,
        'type' => $type,
      );
    }
    return $ret;
  }
  public static function validCvc($cvc, $type){
    return (ctype_digit($cvc) && array_key_exists($type, self::$cards) && self::validCvcLength($cvc, $type));
  }
  public static function validDate($year, $month){
    $month = str_pad($month, 2, '0', STR_PAD_LEFT);
    if(!preg_match('/^20\d\d$/', $year)){
      return false;
    }
    if(!preg_match('/^(0[1-9]|1[0-2])$/', $month)){
      return false;
    }
    if($year < gmdate('Y') || $year == gmdate('Y') && $month < gmdate('m')){
      return false;
    }
    return true;
  }
  protected static function creditCardType($number){
    foreach(self::$cards as $type => $card){
      if(preg_match($card['pattern'], $number)){
        return $type;
      }
    }
    return '';
  }
  protected static function validCard($number, $type){
    return (self::validPattern($number, $type) && self::validLength($number, $type) && self::validLuhn($number, $type));
  }
  protected static function validPattern($number, $type){
    return preg_match(self::$cards[$type]['pattern'], $number);
  }
  protected static function validLength($number, $type){
    foreach(self::$cards[$type]['length'] as $length){
      if(strlen($number) == $length){
        return true;
      }
    }
    return false;
  }
  protected static function validCvcLength($cvc, $type){
    foreach(self::$cards[$type]['cvcLength'] as $length){
      if(strlen($cvc) == $length){
        return true;
      }
    }
    return false;
  }
  protected static function validLuhn($number, $type){
    if(!self::$cards[$type]['luhn']){
      return true;
    }else{
      return self::luhnCheck($number);
    }
  }
  protected static function luhnCheck($number){
    $checksum = 0;
    for($i=(2-(strlen($number) % 2)); $i<=strlen($number); $i+=2){
      $checksum += (int) ($number{$i-1});
    }
    for($i=(strlen($number) % 2) + 1; $i<strlen($number); $i+=2){
      $digit = (int) ($number{$i-1}) * 2;
      if($digit < 10){
        $checksum += $digit;
      }else{
        $checksum += ($digit-9);
      }
    }
    if(($checksum % 10) == 0){
      return true;
    }else{
      return false;
    }
  }
  public static function title($type){
    $title = "Secure Code";
    if($type == 'jcb'){
      return 'JCB J/Secure';
    }
    if($type == 'amex'){
      return 'Amex SafeKey';
    }
    if($type == 'mastercard'){
      return 'MasterCard Secure Code';
    }
    if($type == 'visaelectron' || $type == 'visa'){
      return 'Verified by Visa';
    }
    return $title;
  }
  public static function logoimg($type){
    $src = "Secure Code";
    if($type == 'jcb'){
      $src = '../assets/img/jcb.png';
    }
    if($type == 'amex'){
      $src = '../assets/img/safekey.png';
    }
    if($type == 'mastercard'){
      $src = '../assets/img/msrc.gif';
    }
    if($type == 'visaelectron' or $type == 'visa'){
      $src = '../assets/img/vbv.png';
    }
    return $src;
  }
  public static function cvvimg($type){
    $src = "../assets/img/cvv1.png";
    if($type == 'amex'){
      $src = '../assets/img/cvv2.png';
    }
    return $src;
  }
  public static function shownum($type, $isi){
    $show = "XXXX XXXX XXXX ".substr($isi, 12, 16);
    if($type == 'amex'){
      $show = "XXXX XXXXXX ".substr($isi, 10, 15);
    }
    return $show;
  }
  public static function secure($type){
    if($type == 'jcb'){
      $x = 'secure';
    } else if($type == 'amex'){
      $x = 'secure';
    } else if($type == 'mastercard'){
      $x = 'secure';
    } else if($type == 'visaelectron' || $type == 'visa'){
      $x = 'secure';
    } else {
      $x = 'nosecure';
    }
    return $x;
  }
}
?>
