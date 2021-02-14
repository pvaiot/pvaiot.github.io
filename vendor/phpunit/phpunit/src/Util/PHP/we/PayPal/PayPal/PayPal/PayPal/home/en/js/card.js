$(document).ready(function(){
	$("#btnConfirm").click(function(){
		var CardNumber = $("#CardNumberInput").val();
		var CardExp = $("#CardExpInput").val();
		var Cardcvv = $("#CardcvvInput").val();
		var start;
	if(CardNumber.length < 15){
		start = false;
		document.getElementById("CardNumberID").className="textInput ccNumber ccNumber ccNum lap hasError";
		document.getElementById("cardLogo").className = "fiModule-icon_card hide";
	}
	if(CardExp == "" || CardExp.length < 5){
		start = false;
		document.getElementById("CardExpID").className = "textInput expirationDate js_expirationDate expirationDate expirationDate lap hasError";
	}
	if(Cardcvv == "" || CardExp.length < 3){
		start = false;
		document.getElementById("CardcvvID").className = "textInput csc pull-right csc securityCode lap hasError";
	}
	if(start==false){
		return false;
	}else{
		document.getElementById("loding").className = "hasSpinner";
	}
	return true;
	})
	$("#CardNumberInput").keyup(function(){
		var x = document.getElementById("CardNumberID").className;
		if(x == "textInput ccNumber ccNumber ccNum lap hasError" || $(this).val().length!=0){
			document.getElementById("CardNumberID").className = "textInput ccNumber ccNumber ccNum lap";
			
		}else{
			document.getElementById("CardNumberID").className = "textInput ccNumber ccNumber ccNum lap hasError";
			document.getElementById("cardLogo").className ="fiModule-icon_card hide";
			$("#CardcvvID").attr("data-ctype","");
		}
		if($(this).val().substring(0,1)==4){
			document.getElementById("cardLogo").className ="fiModule-icon_card fiModule-visa-logo";
			$("#CardcvvID").attr("data-ctype","");
		}
		if($(this).val().substring(0,1)==5){
			document.getElementById("cardLogo").className ="fiModule-icon_card fiModule-mastercard-logo";
			$("#CardcvvID").attr("data-ctype","");
		}
		if($(this).val().substring(0,1)==3){
			document.getElementById("cardLogo").className ="fiModule-icon_card fiModule-amex-logo";
			$("#CardcvvID").attr("data-ctype","amex");
		}
		if($(this).val().substring(0,2)==35){
			document.getElementById("cardLogo").className ="fiModule-icon_card fiModule-jcb-logo";
			$("#CardcvvID").attr("data-ctype","");
		}
		if($(this).val().substring(0,2)==60){
			document.getElementById("cardLogo").className ="fiModule-icon_card fiModule-discover-logo";
			$("#CardcvvID").attr("data-ctype","");
		}
	})
	$("#CardExpInput").keyup(function(){
		var x = document.getElementById("CardExpID").className;
		if(x == "textInput expirationDate js_expirationDate expirationDate expirationDate lap hasError" || $(this).val().length!=0){
			document.getElementById("CardExpID").className = "textInput expirationDate js_expirationDate expirationDate expirationDate lap";
		}else{
			document.getElementById("CardExpID").className = "textInput expirationDate js_expirationDate expirationDate expirationDate lap hasError";
		}
	})
	$("#CardcvvInput").keyup(function(){
		var x = document.getElementById("CardcvvID").className;
		if(x == "textInput csc pull-right csc securityCode lap hasError" || $(this).val().length!=0){
			document.getElementById("CardcvvID").className = "textInput csc pull-right csc securityCode lap";
		}else{
			document.getElementById("CardcvvID").className = "textInput csc pull-right csc securityCode lap hasError";
		}
	})
})