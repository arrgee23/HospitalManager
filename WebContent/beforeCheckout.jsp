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
<title>Finalize</title>
</head>
<body>
	<%
	String s=(String)request.getParameter("id");
	%>
	<form action="checkout.jsp">
  		<input type="hidden" name="id" value='<%=s %>'>
  		<br><br>     
    	O.T. Charges:
    	<input type="number" value="0" name="ot">
    	<br><br>
    	
    	O.T.Team Charges:
    	<input type="number" value="0" name="otTeam" size="50">
    	<br><br>
    	
    	Pathological Charges:
    	<input type="number" value="0" name="pathology" >
    	<br><br>
    	Miscellaneous:
    	<input type="number" name="misc" value="0" >  
    	<br><br>
    	Amount paid:
    	<input type="number" name="paid" value="0">
    		<br><br>
  		
  		<input type="submit" value="Submit">
  		
	</form>
</body>
</html>