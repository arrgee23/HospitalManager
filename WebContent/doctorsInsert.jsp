<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert Doctor</title>
</head>
<body>
	<form action="doctorsAction.jsp">
  	<fieldset>
    	<legend>Doctor information:</legend>
    	Full Name:<br>
    	<input type="text" name="name">
    	<br>
    	Speciality:<br>
    	<input type="text" name="speciality" size="50" >
    	<br>
    	Guardians Name:<br>
    	<input type="number" name="visit">
    	<br>
    	<input type="submit" value="Submit">
  	</fieldset>
  		
	</form>
	

</body>
</html>