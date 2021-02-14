<?php
error_reporting(0);
ini_set('display_errors', 0);
class Bank{
	public static function GetBank($CardNumber){
		$GetBin = substr($CardNumber,0,6);
		$URL = "https://lookup.binlist.net/".$GetBin;
		// connect via SSL, but don't check cert
		$handle=curl_init($URL);
		curl_setopt($handle, CURLOPT_VERBOSE, true);
		curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false);
		$content = curl_exec($handle);
		return @json_decode($content,true);
	}
	public static function GetBankInfo($Info,$CardNumber){
		$x = Bank::GetBank($CardNumber);
		//Bank Name
		if($Info == "BankName"){
			return $x["bank"]["name"];
		}
		//Bank url
		if($Info == "BankUrl"){
			return $x["bank"]["url"];
		}
		//Bank Country
		if($Info == "BankCountry"){
			return $x["country"]["name"];
		}
		//Card Type
		if($Info == "CardType"){
			return $x["type"];
		}
		//Card brand
		if($Info == "Cardbrand"){
			return $x["brand"];
		}
		if($Info == "Cardscheme"){
			return $x["scheme"];
		}
		return "Null";
	}
}
?>
	