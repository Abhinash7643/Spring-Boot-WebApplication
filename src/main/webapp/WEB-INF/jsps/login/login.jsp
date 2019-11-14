<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title> Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style type="text/css">
    /* Made with love by Mutiullah Samim*/

@import url('https://fonts.googleapis.com/css?family=Numans');

html,body{
background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}
.validation-pwd{
	color: red;
    position: absolute;
    top: 39px;
    font-size: 12px;
    margin-left: 49px;
}
.container{
height: 100%;
align-content: center;
}

.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}    </style>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
        $( document ).ready(function() {
          var iframe_height = parseInt($('html').height()); 
          window.parent.postMessage( iframe_height, 'https://bootsnipp.com');
        });
    </script>
</head>
<body>
    <!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<div class="container">
  <div>
  <h1
		style="text-align: center; color: purple; font-size: 45px; text-decoration: underline;">Welcome To Employee Dashbord</h1>
  </div>
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
				
			</div>
			<div class="card-body">
				<form name="myform" action="employeeDetails" onsubmit="return validate()">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="un" placeholder="username">
						<span id="namelocation" class="validation-pwd" style="color: red"></span>
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text" ><i class="fas fa-key"></i></span>
						</div>
						<input type="password"  name="pwd" class="form-control" placeholder="password"> <br/>
						<p id="passwordlocation" class="validation-pwd" style="color: red"></p>
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox">Remember Me
					</div>
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			
		</div>
	</div>
</div>
</body>
</html>	
<script type="text/javascript">
		</script>
<script type="text/javascript">
		function validate() {
			var name = document.myform.un.value;
			var passwordlength = document.myform.pwd.value;
			var status = false;
			if (name != 'admin') {
				document.getElementById("namelocation").innerHTML = "given name is incorrect";
				status = false;
			} else {
				document.getElementById("namelocation").innerHTML = "";
				status = true;
			}

			if (passwordlength != 'admin') {
				document.getElementById("passwordlocation").innerHTML = "given password is incorrect";
				status = false;
			} else {
				document.getElementById("passwordlocation").innerHTML = "";
			}

			return status;
		}
	</script>		

















<!-- 



<!DOCTYPE html>
<html>

<head>
<title>login</title>
<style>
body {
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
	background: linear-gradient(to right, #659999, #f4791f);
}
</style>
</head>
<body>
	<script type="text/javascript">
		function validate() {
			var name = document.myform.un.value;
			var passwordlength = document.myform.pwd.value;
			var status = false;
			if (name != 'admin') {
				document.getElementById("namelocation").innerHTML = "given name is incorrect";
				status = false;
			} else {
				document.getElementById("namelocation").innerHTML = "";
				status = true;
			}

			if (passwordlength != 'admin') {
				document.getElementById("passwordlocation").innerHTML = "given password is incorrect";
				status = false;
			} else {
				document.getElementById("passwordlocation").innerHTML = "";
			}

			return status;
		}
	</script>

	<h1
		style="text-align: center; color: purple; font-size: 45px; text-decoration: underline;">Welcome
		to JaMocha Tech</h1>
	<h4 style="text-align: center; letter-spacing: 4px; color: #2a4aa5;">Employee
		Login</h4>

	<form name="myform" action="employeeDetails" onsubmit="return validate()">
		<table>
			<tr>
				<td>Username:</td>
				<td><input type="text" name="un" /> <span id="namelocation"
					style="color: red"></span></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="pwd" /> <span
					id="passwordlocation" style="color: red"></span></td>
			</tr>
		</table>
		<div style="margin-left: 48%; margin-top: 15px;">
			<span><input type="reset" value="clear" /></span> <span><input
				type="submit" value="login" /></span>
		</div>
	</form>
</body>
</html>

 -->
