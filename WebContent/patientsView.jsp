<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="resorces.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Patients</title>
</head>
<body>

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
	
	<sql:query dataSource="${snapshot}" var="result">
	select * from Patients WHERE releaseTime IS NULL; 
	</sql:query>
	<div class="row">
	<div class="col-xs-10 col-xs-offset-1">
	<div class="jumbotron text-center">
		<h1>Patients</h1>
	</div>
	<table border="1" class="table" >
		<thead>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Admission Time</th>
			<th>Type of ailment</th>
			<th>Doctor Id</th>
			<th>Bed No</th>
			<th>Age</th>
			<th>Update</th>
			<th>View</th>
			<th>Checkout</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.id}" /></td>
				<td><c:out value="${row.name}" /></td>
				<td><c:out value="${row.admissionTime}" /></td>
				<td><c:out value="${row.illness}" /></td>
				<td><c:out value="${row.doctorid}" /></td>
				<td><c:out value="${row.bedNo}" /></td>
				<td><c:out value="${row.age}" /></td>
				<td><a href="patientMedicine.jsp?id=<c:out value="${row.id}" />">Add Medicine</a></td>
				<td><a href="viewPatientStatus.jsp?id=<c:out value="${row.id}" />">View Record</a></td>
				<td><a href="beforeCheckout.jsp?id=<c:out value="${row.id}" />">Release</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<a class="btn btn-success btn-block" href="patientsInsert.jsp">Add a new Patient</a><br>
	</div>
	</div>
</body>
</html>