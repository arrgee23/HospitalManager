<!-- 
	This page is used to add or update medicine to the patient before checking out
 -->

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
<title>Add Update medicine</title>
</head>
<body>
	<%
		String patientId = request.getParameter("id");
	%>
	
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
		
	<sql:query dataSource="${snapshot}" var="result">
		SELECT * from Medicine;
	</sql:query>
	<h3>The number you enter here will be added to the previous amount:</h3>	
	<form action="addMedicineAction.jsp" class="form">
		<input type="hidden" name="patientId" value="<%= patientId %>" />

		Select Medicine:
  		<select name="medicineId">
  		<c:forEach var="row" items="${result.rows}">
				<option value="<c:out value="${row.id}" />">
					<c:out value="${row.name}"/>
					(<c:out value="${row.type}"/>)
				</option>
		</c:forEach>
		</select>
		
		Quantity:
		<input name="quantity" type="number"/>
		
		<input type="submit" value="Submit">
	</form>
</body>
</html>