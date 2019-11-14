<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>modify</title>
<style>
body {
	background: linear-gradient(to right, #659999, #f4791f);
}
</style>
</head>
<body>
	<script type="text/javascript">
		function populate(s1, s2) {
			var s1 = document.getElementById(s1);
			var s2 = document.getElementById(s2);
			s2.innerHTML = "";

			if (s1.value == "bihar") {
				var optionArray = [ "|", "patna|Patna", "gaya|Gaya", ];
			} else if (s1.value == "jharkhand") {
				var optionArray = [ "|", "dhanbaad|Dhanbaad", "ranchi|Ranchi", ];
			} else if (s1.value == "karnataka") {
				var optionArray = [ "|", "bangalore|Bangalore",
						"maysor|Maysor", ];
			}

			for ( var option in optionArray) {
				var pair = optionArray[option].split("|");
				var newOPtion = document.createElement("option");
				newOPtion.value = pair[0];
				newOPtion.innerHTML = pair[1];
				s2.options.add(newOPtion);
			}
		}

		function validate() {
			myForm = document.myform;
			var fn = myForm.firstname.value;
			var ln = myForm.lastname.value;
			var gender = myForm.gender.value;
			var age = myForm.age.value;
			var sal = myForm.salary.value;
			var dept = myForm.dept.value;
			var state = myForm.slct1.value
			var city = myForm.slct2.value;

			var java = document.getElementById("java").checked;
			var js = document.getElementById("js").checked;
			var j2ee = document.getElementById("j2ee").checked;

			var statusFname = false;
			var statusLname = false;
			var statusGender = false;

			if (fn === '' || fn.length > 50) {
				document.getElementById('firstname').innerHTML = "maxminum length should be 50 and it should be string ";
				statusFname = false;
			} else {
				statusFname = true;
			}

			if (ln.length > 50) {
				document.getElementById('lastname').innerHTML = "Please insert last name";
				statusLname = false;
			} else {
				statusLname = true;
			}

			if (gender === '') {
				document.getElementById('gender').innerHTML = "Please select gender";
				statusGender = false;
			} else {
				statusGender = true;
			}

			var statusAge = 'false';
			if (isNaN(age) || age.length >= 3) {
				document.getElementById('age').innerHTML = "Only Integer and 2 digits";
				statusAge = false;
			} else {
				statusAge = true;
			}

			var statusSalary = 'false';
			if (isNaN(sal) || sal.length >= 6) {
				document.getElementById('salary').innerHTML = "Only Integer and 5 digits";
				statusSalary = false;
			} else {
				statusSalary = true;
			}

			var statusDepartment = 'false';
			if (dept === '') {
				document.getElementById('dept').innerHTML = "Please select atleast one department";
				statusDepartment = false;
			} else {
				statusDepartment = true;
			}

			var statusState = 'false';
			if (state === '') {
				document.getElementById('state').innerHTML = "Please select atleast one state";
				statusState = false;
			} else {
				statusState = true;
			}

			var statusCity = 'false';
			if (city === '') {
				document.getElementById('city').innerHTML = "Please select atleast one city";
				statusCity = false;
			} else {
				statusCity = true;
			}

			var statusJavaJsAndAll = 'false';
			if (!java && !js && !j2ee) {
				document.getElementById('skill').innerHTML = "Please select atleast one skill";
				statusJavaJsAndAll = false;
			} else {
				statusJavaJsAndAll = true;
			}

			return (statusJavaJsAndAll && statusCity && statusState
					&& statusDepartment && statusSalary && statusAge
					&& statusGender && statusLname && statusFname);
		}

		function clearForm() {
			var frm_elements = document.getElementById('myForm');
			for (i = 0; i < frm_elements.length; i++) {
				field_type = frm_elements[i].type.toLowerCase();
				console.log(field_type);
				switch (field_type) {
				case "text":
					frm_elements[i].value = "";
					break;
				case "password":
				case "textarea":
				case "number" :
					frm_elements[i].value = "";
					break;
				case "hidden":
					frm_elements[i].value = "";
					break;
				case "radio":
				case "checkbox":
					if (frm_elements[i].checked) {
						frm_elements[i].checked = false;
					}
					break;
				case "select-one":
				case "select-multi":
					frm_elements[i].selectedIndex = -1;
					break;
				default:
					break;
				}
			}

		}
	</script>
	<h1
		style="text-align: center; color: purple; font-size: 45px; text-decoration: underline;">Welcome
		to JaMocha Tech</h1>
	<h4 style="text-align: center; letter-spacing: 4px; color: #2a4aa5;">MODIFY
		EMPLOYEES DETAILS HERE</h4>
	<table align="center" style="border-collapse: collapse;"
		cellpadding="5" cellspacing="10" border="1">
		<form name="myform"  id="myForm" action="modifyEmployee">
			<table align="center">
				<tr>
					<td><input type="hidden" style="width: 100%;" name="id" value=${empDetails.id}></td>
				</tr>
				<tr>
					<td>FirstName:</td>
					<td><input type="text" style="width: 100%;" size=11
						name="firstname" value=${empDetails.firstname}></td>
				</tr>
				<tr>
					<td>LastName:</td>
					<td><input type="text" style="width: 100%;" size=11
						name="lastname" value=${empDetails.lastname}></td>
				<tr />

				<tr>
					<td>Gender:</td>
					<td><span><input type="radio"
							${empDetails.gender=='M'?'checked':'' } value="M" id="m" name="gender">Male</span> <span> 
							<input ${empDetails.gender=='F'?'checked':'' } type="radio" value="F" id="f" name="gender">Female
					</span></td>

					<td><span id="gender" style="color: red; margin-left: 10px;"></span></td>
				</tr>

				<tr>
					<td>Age:</td>
					<td><input type="number" size=11 name="age" style="width: 100%;"
						value=${empDetails.age}></td>
				</tr>
				
				<tr>
					<td>Salary:</td>
					<td><input type="number" size=11 name="salary" style="width: 100%;"
						value=${empDetails.salary}></td>
				</tr>

				<tr>
					<td>Dept:</td>
					<td><select name="dept" style="width: 100%;">
							<option ${empDetails.dept==''?'selected':'' }></option>
							<option ${empDetails.dept=='Finance'?'selected':'' }
								value="Finance">Finance</option>
							<option ${empDetails.dept=='HR'?'selected':'' } value="HR">HR</option>
							<option ${empDetails.dept=='Test Engineer'?'selected':'' }
								value="Test Engineer">Test Engineer</option>
							<option ${empDetails.dept=='Developer'?'selected':'' }
								value="Developer">Developer</option>

					</select></td>
				</tr>

				<tr>
					<td>State:</td>
					<td><select id="slct1" name="state"
						onChange="populate(this.id, 'slct2')" style="width: 100%;">
							<option ${empDetails.state==''?'selected':'' }></option>

							<option ${empDetails.state=='bihar'?'selected':'' } value="bihar">Bihar</option>
							<option ${empDetails.state=='jharkhand'?'selected':'' }
								value="jharkhand">Jharkhan</option>
							<option ${empDetails.state=='karnataka'?'selected':'' }
								value="karnataka">karnataka</option>
					</select></td>
				</tr>

				</tr>

				<tr>
					<c:choose>
						<c:when test="${empDetails.state eq 'bihar'}">
							<td>city:</td>
							<td><select id="slct2" name="city" style="width: 100%;">
									<option ${empDetails.city=='patna'?'selected':'' }
										value="patna" selected>Patna</option>
									<option ${empDetails.city=='gaya'?'selected':'' } value="gaya">Gaya</option>
							</select></td>
						</c:when>

						<c:when test="${empDetails.state eq 'jharkhand'}">
							<td>city:</td>
							<td><select id="slct2" name="city" style="width: 100%;">
									<option ${empDetails.city=='dhanbaad'?'selected':'' }
										value="dhanbaad">Dhanbaad</option>
									<option ${empDetails.city=='ranchi'?'selected':'' }
										value="ranchi" selected>ranchi</option>
						</c:when>

						<c:when test="${empDetails.state eq 'karnataka'}">
							<td>city:</td>
							<td><select id="slct2" name="city" style="width: 100%;">
									<option ${empDetails.city=='bangalore'?'selected':'' }
										value="Bangalore" selected>dhanbaad</option>
									<option ${empDetails.city=='mysuru'?'selected':'' }
										value="mysuru">Mysuru</option>
						</c:when>
						<c:otherwise>
							<td>city:</td>
							<td><select id="slct2" name="city" style="width: 100%;">
									<option value="bangalore">Bangalore</option>
									<option value="mysuru" selected>Mysuru</option>
							</select></td>
						</c:otherwise>
					</c:choose>
				</tr>
				
				<tr>
					<td>Skill:</td>
					<td><span><input type="checkbox" value="java"
							${String.join('',empDetails.skills).indexOf('java')>=0?'checked':''}
							id="java" name="skills">Java</span> <span><input
							type="checkbox" value="js"
							${String.join('',empDetails.skills).indexOf('js')>=0?'checked':''}
							id="js" name="skills">Js</span> <span><input
							type="checkbox" value="j2ee"
							${String.join('',empDetails.skills).indexOf('j2ee')>=0?'checked':''}
							id="j2ee" name="skills">J2EE</span></td>
				</tr>

				<tr style="height: 2em;">
					<td>Address:</td>
					<td><textarea name="address" style="width: 100%;">${empDetails.address}</textarea></td>
				</tr>
			</table>
			<div class="row">
	<div class="col-lg-4">
	<div class="row">
	<div class="col-lg-4" style="text-align:right"></div>
	<div class="col-lg-4" style="width: 14%; margin-left: auto; margin-right: auto; padding-left: 79px;">&nbsp<input type="button" onclick="clearForm();"  style="width: 66px ;" value="clear" /> &nbsp &nbsp &nbsp <button
				id="reg-btn" >register</button></div>
	</div>
	</div>
	<div class="col-lg-12" id=""></div>
	<br>
</div>
		</form>
</body>
</html>