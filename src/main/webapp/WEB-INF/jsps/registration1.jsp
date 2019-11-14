<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<!DOCTYPE html>
<html lang="en">

<head>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Employees form </title>

 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style = width=100%;>


</style>
</head>

<body>


<h1
		style="text-align: center; color: purple; font-size: 45px; text-decoration: underline;">Welcome
		to JaMocha Tech</h1>
	<h4 style="text-align: center; letter-spacing: 4px; color: #2a4aa5;">Employee form </h4>
<form name="myform" id="myForm" action="${action }" method="post"
		onsubmit="return validate()">
<div class="row">
<div class="col-lg-4"></div>
<div class="col-lg-4" style=" align-items: center;
    padding-right: 26px;
    padding-top: 26px;
    /* border: 1px solid gray; */
    box-shadow: 1px 3px 5px 1px #8080803b;">
    
    <div class="row">
	<div class="col-lg-12">
	<div class="row">
	<div class="col-lg-6" style="text-align:right;"></div>
	<div class="col-lg-6"> <input type="hidden" style="width: 100%;" value=${empDetails.id} name="id" /></div>
	</div>
	</div>
</div>
    
    
    
    
    

<div class="row">
	<div class="col-lg-12">
		<div class="row">
			<div class="col-lg-6" style="text-align:right">First Name:</div>
			<div class="col-lg-6"> <input type="text" style=" width: 100%;"  name="firstname" pattern="[a-zA-Z]*" value=${empDetails.firstname} ></div>
		</div>
	</div>
	<div class="col-lg-12" >
			<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6" style="color: red;" id="firstname"></div>
		</div>
	</div>
	<br>
</div>
<div class="row">
	<div class="col-lg-12">
	<div class="row">
	<div class="col-lg-6" style="text-align:right;">Last Name:</div>
	<div class="col-lg-6"> <input type="text" style="width: 100%;"  name="lastname" pattern="[a-zA-Z]*"  value=${empDetails.lastname} ></div>
	</div>
	</div>
	<div class="col-lg-12" >
			<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6" style="color: red;" id="lastname"></div>
		</div>
	</div>
	<br>
</div>

<div class="row">
	<div class="col-lg-12">
	<div class="row">
	<div class="col-lg-6" style="text-align:right">Gender:</div>
	<div class="col-lg-6"> <input  id="male" type="radio" ${empDetails.gender=='M'?'checked':'' } value="M"  name="gender" /><label for="male">Male</label> &nbsp &nbsp
	<input type="radio"  ${empDetails.gender=='F'?'checked':'' }  value="F"  id="femal" name="gender" /><label for="femal">Femal</label></div>
	</div>
	</div>
	<div class="col-lg-12">
			<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6" style="color: red;"  id="gender"></div>
		</div>
	</div>
	<br>
</div>

<div class="row">
	<div class="col-lg-12">
	<div class="row">
	<div class="col-lg-6" style="text-align:right">Age:</div>
	<div class="col-lg-6"><input type="text" style="width: 100%;" value="${empDetails.age}"  name="age" /></div>
	</div>
	</div>
	<div class="col-lg-12" >
			<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6" style="color: red;" id="age"></div>
		</div>
	</div>
	<br>
</div>


<div class="row">
	<div class="col-lg-12">
	<div class="row">
	<div class="col-lg-6" style="text-align:right">Salary:</div>
	<div class="col-lg-6"><input type="text"   style="width: 100%;" name="salary" value=${empDetails.salary} ></div>
	</div>
	</div>
	<div class="col-lg-12" >
			<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6" style="color: red;" id="salary"></div>
		</div>
	</div>
	<br>
</div>


<div class="row">
	<div class="col-lg-12">
	<div class="row">
	<div class="col-lg-6" style="text-align:right">Department:</div>
	<div class="col-lg-6"><select style="width: 100%;" type="text" name="dept" >
						<option ${empDetails.dept==''?'selected':'' }></option>
						<option ${empDetails.dept=='Finance'?'selected':'' } value="Finance">Finance</option>
						<option  ${empDetails.dept=='HR'?'selected':'' } value="HR">HR</option>
						<option  ${empDetails.dept=='Test Engineer'?'selected':'' } value="Test Engineer">Test Engineer</option>
						<option ${empDetails.dept=='Developer'?'selected':'' } value="Developer">Developer</option>
				</select></div>
	</div>
	</div>
	<div class="col-lg-12" >
			<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6" style="color: red;" id="dept"></div>
		</div>
	</div>
	<br>
</div>


<div class="row">
	<div class="col-lg-12">
	<div class="row">
	<div class="col-lg-6" style="text-align:right">State:</div>
	<div class="col-lg-6">
	<select type="text" id="slct1" name="state"
					onChange="populate(this.id, 'slct2')" style="width: 100%;">
						<option  ${empDetails.state==''?'selected':'' } value=""></option>
						<option ${empDetails.state=='bihar'?'selected':'' } value="bihar">Bihar</option>
						<option ${empDetails.state=='jharkhand'?'selected':'' } value="jharkhand">Jharkhan</option>
						<option ${empDetails.state=='karnataka'?'selected':'' }  value="karnataka">Karnataka</option>
				</select>
	</div>
	</div>
	</div>
	<div class="col-lg-12" >
			<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6" style="color: red;" id="state"></div>
		</div>
	</div>
	<br>
</div>


<div class="row">
	<div class="col-lg-12">
		<div class="row">
			<div class="col-lg-6" style="text-align:right">City:</div>
			<div class="col-lg-6">
				<select id="slct2" name="city" style="width: 100%;">

					<option ${empDetails.state==''?'selected':'' }></option>

					<c:choose>
						<c:when test="${empDetails.state eq 'bihar'}">
							<option ${empDetails.city=='patna'?'selected':'' } value="patna" selected>Patna</option>
							<option ${empDetails.city=='gaya'?'selected':'' } value="gaya">Gaya</option>
						</c:when>
						<c:when test="${empDetails.state eq 'jharkhand'}">
							<option ${empDetails.city=='dhanbaad'?'selected':'' } value="dhanbaad">Dhanbaad</option>
							<option ${empDetails.city=='ranchi'?'selected':'' }	value="ranchi" selected>ranchi</option>
						</c:when>
						<c:when test="${empDetails.state eq 'karnataka'}">
							<option ${empDetails.city=='bangalore'?'selected':'' } value="Bangalore" selected>dhanbaad</option>
							<option ${empDetails.city=='mysuru'?'selected':'' } value="mysuru">Mysuru</option>
						</c:when>
						</c:choose>
				</select>
			</div>				
		</div>
	</div>
	<div class="col-lg-12" >
		<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6" style="color: red;" id="city"></div>
		</div>
	</div>
	<br>
</div>

<div class="row">
	<div class="col-lg-12">
	<div class="row">
	<div class="col-lg-6" style="text-align:right">Skills:</div>
	<div class="col-lg-6">
	<input type="checkbox" value="java"  ${String.join('',empDetails.skills).indexOf('java')>=0?'checked':''} id="java" name="skills"><label for="java">Java</label>&nbsp
	<input type="checkbox" value="js"  value="js" ${String.join('',empDetails.skills).indexOf('js')>=0?'checked':''}  id="js" name="skills"><label for="js">Js</label>&nbsp
	<input type="checkbox" value="j2ee" value="j2ee" ${String.join('',empDetails.skills).indexOf('j2ee')>=0?'checked':''}  id="j2ee" name="skills"><label for="j2ee">J2ee</label>
	</div>
	</div>
	</div>
	<div class="col-lg-12" >
			<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6" style="color: red;" id="skill"></div>
		</div>
	</div>
	<br>
</div>
 
<div class="row">
	<div class="col-lg-12">
	<div class="row">
	<div class="col-lg-6" style="text-align:right">Address:</div>
	<div class="col-lg-6"><textarea style="width: 100%;" name="address" style="color: red;" >${empDetails.address}</textarea></div>
	</div>
	</div>
	<div class="col-lg-12" id=""></div>
	<br>
</div>

<div class="row">
	<div class="col-lg-12">
	<div class="row">
	<div class="col-lg-6" style="text-align:right"></div>
	<div class="col-lg-6" >&nbsp<input type="button" onclick="clearForm();"  style="width: 66px;" value="clear" /> &nbsp &nbsp &nbsp <button
				id="reg-btn" style="width: 66px;" >Add</button></div>
	</div>
	</div>
	<div class="col-lg-12" id=""></div>
	<br>
</div>
</form>
















</body>

</html>
<script type="text/javascript">

let data ={}; 

document.getElementById('reg-btn').addEventListener('click', function(evt){
 // evt.preventDefault();
  return validate();
} );

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
			    document.getElementById('firstname').innerHTML ="";
				statusFname = true;
			}

			if (ln === '' ||ln.length > 50) {
				document.getElementById('lastname').innerHTML = "maxminum length should be 50 and it should be string";
				statusLname = false;
			} else {
			document.getElementById('lastname').innerHTML ="";
				statusLname = true;
			}

			if (gender === '') {
				document.getElementById('gender').innerHTML = "Please select gender";
				statusGender = false;
			} else {
			document.getElementById('gender').innerHTML = "";
				statusGender = true;
			}

			var statusAge = 'false';
			if (isNaN(age) || age.length >= 3) {
				document.getElementById('age').innerHTML = "Only Integer and 2 digits";
				statusAge = false;
			} else {
			document.getElementById('age').innerHTML ="";
				statusAge = true;
			}

			var statusSalary = 'false';
			if (isNaN(sal) || sal.length >= 6) {
				document.getElementById('salary').innerHTML = "Only Integer and 5 digits";
				statusSalary = false;
			} else {
			document.getElementById('salary').innerHTML ="";
				statusSalary = true;
			}

			var statusDepartment = 'false';
			if (dept === '') {
				document.getElementById('dept').innerHTML = "Please select atleast one department";
				statusDepartment = false;
			} else {
			document.getElementById('dept').innerHTML ="";
				statusDepartment = true;
			}

			var statusState = 'false';
			if (state === '') {
				document.getElementById('state').innerHTML = "Please select atleast one state";
				statusState = false;
			} else {
			document.getElementById('state').innerHTML ="";
				statusState = true;
			}

			var statusCity = 'false';
			if (city === '') {
				document.getElementById('city').innerHTML = "Please select atleast one city";
				statusCity = false;
			} else {
			document.getElementById('city').innerHTML =""
				statusCity = true;
			}

			var statusJavaJsAndAll = 'false';
			if (!java && !js && !j2ee) {
				document.getElementById('skill').innerHTML = "Please select atleast one skill";
				statusJavaJsAndAll = false;
			} else {
			document.getElementById('skill').innerHTML ="";
				statusJavaJsAndAll = true;
			}

			return (statusJavaJsAndAll && statusCity && statusState
					&& statusDepartment && statusSalary && statusAge
					&& statusGender && statusLname && statusFname);
		}

		function clearForm(){
			var frm_elements = document.getElementById('myForm');
			for (i = 0; i < frm_elements.length; i++)
			{
			    field_type = frm_elements[i].type.toLowerCase();
console.log(field_type);
			    switch (field_type)
			    {
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
			        if (frm_elements[i].checked)
			        {
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