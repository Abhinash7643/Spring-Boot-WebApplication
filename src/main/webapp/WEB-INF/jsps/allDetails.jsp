<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"  href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css
">
<title>Employee Details</title>
<style>
body {
	background: linear-gradient(to right, #659999, #f4791f);
}
</style>

	

</head>
<body>
	<h1
		style="text-align: center; color: purple; font-size: 45px; text-decoration: underline;">Welcome
		to Employee Dashboard</h1>
	<div style="display: flex; justify-content: space-around;">
		<h2 style="margin-right: -4em;">Employee List</h2>
		<span><h2>
				<a href="register">Register</a>
			</h2></span>
			
			<span><h2>
				<a href="getHighChartDetailsDepartMentWise">Hichart</a>
			</h2></span>
			
			
			
			
			
			
			
			
	</div>

	<c:if test="${not empty updateMessage}">
		<div style="text-align: center; color: #00FF7F;">
			<font size="+2"><label>${updateMessage}</label></font>
		</div>
	</c:if>

	<table align="center" style="border-collapse: collapse;"
		cellpadding="5" cellspacing="10" border="1">
		<tr bgcolor="green">
			<td>ACTION</td>
			<td>First Name</td>
			<td>Last Name</td>
			<td>Gender</td>
			<td>Age</td>
			<td>Salary</td>
			<td>Department</td>
			<td>State &nbsp>&nbsp City</td>
			<td>Skills</td>
			<td>Address</td>
		</tr>
	
		<tr>
			<c:forEach items="${empDetails}" var="empDetails">
				<td><a href="showEmployeeModify?id=${empDetails.id}"><i class="fa fa-pencil-square-o" aria-hidden="true"  style="font-size: 21px; color: black;"></i></a>
				<a title="Delete User" id="delete" href="deleteEmployee?id=${empDetails.id}"><i class="icon-remove-sign">  <i class="fa fa-trash-o" aria-hidden="true" style="font-size: 21px"></i></a></td>
				<td><c:out value="${empDetails.firstname}" /></td>
				<td><c:out value="${empDetails.lastname}" /></td>
				<td><c:out value="${empDetails.gender}" /></td>
				<td><c:out value="${empDetails.age}" /></td>
				<td><c:out value="${empDetails.salary}" /></td>
				<td><c:out value="${empDetails.dept}" /></td>
				
				<td><c:out value="${empDetails.state}"/>&nbsp > &nbsp
				<c:out value="${empDetails.city}"/></td>
         			<td><c:out value="${empDetails.skills}" /></td>
				<td><c:out value="${empDetails.address}" /></td>
		</tr>
		</c:forEach>
	</table>
	
	</table>
	    <h2 style="text-align: center; color: #7FFF00">This is summary table of..</h2>
	<table align="center" style="border-collapse: collapse;"
		cellpadding="5" cellspacing="10" border="1">
		<tr bgcolor="red">
			<td>Department name</td>
			<td>Number Of Employees</td>
			<td>Total Salary of Employee</td>
		</tr>
		<tr>
			<c:forEach items="${deptDetails}" var="deptDetails">
				<td><c:out value="${deptDetails.deptName}" /></td>
				<td><c:out value="${deptDetails.noOfEmployee}" /></td>
				<td><c:out value="${deptDetails.totalSalary}" /></td>
		</tr>
		</c:forEach>
	</table>
	

	
	
	
	
	
	
	
	
	
</body>
</html>