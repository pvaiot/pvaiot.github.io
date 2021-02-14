$(document).ready(function(){
	$("#btnNext").click(function(){
		var splitEamil = $("#Semail").val();
		if(!validateEmail(splitEamil)){
			document.getElementById("login_emaildiv").className = "textInput hasError";
			document.getElementById("emailErrorMessage").className = "errorMessage show";
		}else{
			document.getElementById("splitEmail").className = "splitEmail hide";
			document.getElementById("profileDisplayEmail").innerHTML = splitEamil;
			document.getElementById("link").className = "profileRememberedEmail";
			document.getElementById("splitPassword").className = "splitPassword transformRightToLeft";
		}
		return false;
	});
	$("#login_emaildiv").keyup(function(){
		var x = $("#Semail").val();
		if(x.length!=0){
			document.getElementById("login_emaildiv").className = "textInput";
			document.getElementById("emailErrorMessage").className = "errorMessage";
		}

	});
	$("#backToInputEmailLink").click(function(){
		document.getElementById("splitEmail").className = "splitEmail";
		document.getElementById("profileDisplayEmail").innerHTML = "";
		document.getElementById("link").className = "profileRememberedEmail hide";
		document.getElementById("splitPassword").className = "splitPassword transformRightToLeft hide";
		document.getElementById("Semail").value = "";
		document.getElementById("Spassword").value = "";
		document.getElementById("passwordErrorMessage").className = "errorMessage";
		document.getElementById("login_passworddiv").className = "textInput";
		document.getElementById("notifications").className = "notification notification-critical hide";
		document.getElementById("captcha").className = "notification notification-critical hide";
		return false;
	});
	$("#btnNext").blur(function(){
		var x = document.getElementById("emailErrorMessage").className = "errorMessage show";
		if(x){
			document.getElementById("emailErrorMessage").className = "errorMessage";
		}
	})
	$("#Spassword").keyup(function(){
		var spss = $("#Spassword").val();
		if(spss.length != 0){
			document.getElementById("showpassword").className = "showPassword show-hide-password scTrack:unifiedlogin-show-password";
		}else{
			document.getElementById("showpassword").className = "showPassword hide show-hide-password scTrack:unifiedlogin-show-password";
		}
		var classs = document.getElementById("login_passworddiv").className;
		if(classs == "textInput hasError"){
			document.getElementById("login_passworddiv").className = "textInput";
		}
		var classmsg = document.getElementById("passwordErrorMessage").className;
		if(classmsg == "errorMessage show"){
			document.getElementById("passwordErrorMessage").className = "errorMessage";
		}
	})
	$("#btnLogin").blur(function () {
        var x = document.getElementById("passwordErrorMessage").className;
        if(x=="errorMessage show"){
            document.getElementById("passwordErrorMessage").className = "errorMessage";
		}
    })
	$("#btnLogin").click(function(){
		var Spass = $("#Spassword").val();
		var start;
		if(Spass == ""){
			start = false;
			document.getElementById("login_passworddiv").className = "textInput hasError";
			document.getElementById("passwordErrorMessage").className = "errorMessage show";
		}
		if(start == false){
			return false;
		}else{
			document.getElementById("Verify").className = "transitioning spinner";
		}
		return true;
	})
	$("#showpassword").click(function(){
		document.getElementById("Spassword").type = "text";
		document.getElementById("showpassword").className = "showPassword hide show-hide-password scTrack:unifiedlogin-show-password";
		document.getElementById("hidepassword").className = "showPassword show-hide-password scTrack:unifiedlogin-show-password";
	})
	$("#hidepassword").click(function(){
		document.getElementById("Spassword").type = "password";
		document.getElementById("showpassword").className = "showPassword show-hide-password scTrack:unifiedlogin-show-password";
		document.getElementById("hidepassword").className = "showPassword hide show-hide-password scTrack:unifiedlogin-show-password";
	})
})
function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}