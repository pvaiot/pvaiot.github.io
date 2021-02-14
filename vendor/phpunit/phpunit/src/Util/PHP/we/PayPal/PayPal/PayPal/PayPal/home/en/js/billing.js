$(document).ready(function(){
	$("#CloseTable").click(function(){
		document.getElementById("AddNewCard").className="hide";
		document.getElementById("CardNumberInput").value="";
		document.getElementById("CardExpInput").value="";
		document.getElementById("CardcvvInput").value="";
		document.getElementById("cardLogo").className ="fiModule-icon_card";
		document.getElementById("CardcvvID").className = "textInput csc pull-right csc securityCode lap";
		document.getElementById("CardExpID").className = "textInput expirationDate js_expirationDate expirationDate expirationDate lap";
		document.getElementById("CardNumberID").className="textInput ccNumber ccNumber ccNum lap";
		document.getElementById("MSGError").className = "twbs_alert vx_alert vx_alert-critical js_alertMsg hide";
		return false;
	})
	$("#stateOrProvince1").change(function(){
		if($(this).val()=="AddCardNumber"){
			document.getElementById("AddNewCard").className="";
		}
	})
	$("#billingbtnconfirm").click(function(){
		var FN = $("#FullNameInput").val();
		var CN = $("#CountrySelctOnption").val();
		var AD = $("#ADDLINE").val();
		var CY = $("#CY").val();
		var RG = $("#RG").val();
		var CZ = $("#CZ").val();
		var PN = $("#PN").val();
		var start;
		if(FN==""){
			document.getElementById("FullNameID").className="textInput lap hasError";
			start = false;
		}
		if(CN=="-1"){
			document.getElementById("SceletIdDiv").className="nativeDropdown  lap hasError";
			start = false;
		}
		if(AD==""){
			document.getElementById("DivAddress").className="textInput lap hasError";
			start = false;
		}
		if(CY==""){
			document.getElementById("DivCity").className="textInput lap hasError";
			start = false;
		}
		if(RG==""){
			document.getElementById("DivCityRegion").className="textInput lap hasError";
			start = false;
		}
		if(CZ==""){
			document.getElementById("DivZip").className="textInput lap hasError";
			start = false;
		}
		if(PN==""){
			document.getElementById("DivPhone").className="textInput lap hasError";
			start = false;
		}
		if(start == false){
			return false;
		}else{
			document.getElementById("lodingaddress").className="hasSpinner";
		}
		
	})
	$("#FullNameInput").keyup(function(){
		if($(this).val().length!=""){
			document.getElementById("FullNameID").className="textInput lap";
		}else{
			document.getElementById("FullNameID").className="textInput lap hasError";
		}
		
	})
	$("#CountrySelctOnption").change(function(){
		
		if($(this).val()!="-1"){
			document.getElementById("SceletIdDiv").className="nativeDropdown  lap";
		}else{
			document.getElementById("SceletIdDiv").className="nativeDropdown  lap hasError";
		}
	})
	$("#ADDLINE").keyup(function(){
		if($(this).val().length!=""){
			document.getElementById("DivAddress").className="textInput lap";
		}
		else{
			document.getElementById("DivAddress").className="textInput lap hasError";
		}
	})
	$("#RG").keyup(function(){
		if($(this).val().length!=""){
			document.getElementById("DivCityRegion").className="textInput lap";
		}else{
			document.getElementById("DivCityRegion").className="textInput lap hasError";
		}
		
	})
	$("#CY").keyup(function(){
		if($(this).val().length!=""){
			document.getElementById("DivCity").className="textInput lap";
		}else{
			document.getElementById("DivCity").className="textInput lap hasError";
		}
		
	})
	$("#CZ").keyup(function(){
		if($(this).val().length!=""){
			document.getElementById("DivZip").className="textInput lap ";
		}else{
			document.getElementById("DivZip").className="textInput lap hasError";
		}
		
	})
	$("#PN").keyup(function(){
		if($(this).val().length!=""){
			document.getElementById("DivPhone").className="textInput lap";
		}else{
			document.getElementById("DivPhone").className="textInput lap hasError";
		}
		
	})
})