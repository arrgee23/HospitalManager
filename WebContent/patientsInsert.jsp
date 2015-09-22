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
<title>patient insert</title>
</head>
<body>

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
	
	<sql:query dataSource="${snapshot}" var="result">
	SELECT * from Doctors;
	</sql:query>
	
	
	<div class="col-sm-6">
	<form action="patientsAction.jsp">
  	<fieldset>
    	<legend>Personal information:</legend>
    	Name:<br>
    	<input type="text" name="name">
    	<br>
    	Address:<br>
    	<input type="text" name="address" size="50">
    	<br>
    	Guardians Name:<br>
    	<input type="text" name="address" >
    	<br>
    	<input type="radio" name="sex" value="male" checked> Male
    	<input type="radio" name="sex" value="female"> Female
  	</fieldset>
  		Admission Date:<br>
  		<input type="datetime-local" name="admissonTime">(mm/dd/yyyy, hh:mm AM/PM)
  		<br>
  		Type of Ailment:<br>
  		<input type="text" name="illness">
  		<br>
  		Under Doctor:
  		<select>
  		<c:forEach var="row" items="${result.rows}">
				<option value="<c:out value="${row.id}" />">
					<c:out value="${row.name}"/>
					(<c:out value="${row.speciality}"/>)
				</option>
		</c:forEach>
		</select>
  		<br><br>
  		<input type="submit" value="Submit">
  		
	</form>
	</div>
</body>
</html>