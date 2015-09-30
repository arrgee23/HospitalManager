<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="resorces.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String patientId = request.getParameter("patientId");
		String medicineId = request.getParameter("medicineId");
		String quantity = request.getParameter("quantity");
	%>
	
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
	
	<sql:update dataSource="${snapshot}" var="result">
	UPDATE Medicine SET quantity=quantity-? WHERE id=?; 
	
	<sql:param value="<%=quantity %>" />
	<sql:param value="<%=medicineId %>" />
	</sql:update>
	
	
	<sql:update dataSource="${snapshot}" var="result">
	UPDATE PatientMedicine SET quantity=quantity+?  WHERE patientId=? and medicineId=?; 
	
	<sql:param value="<%=quantity %>" />
	<sql:param value="<%=patientId %>" />
	<sql:param value="<%=medicineId %>" />
	</sql:update>
	
	
	
	<c:if test="${result == 0}">
		<sql:update dataSource="${snapshot}" var="result2"> 
			INSERT INTO PatientMedicine (quantity,patientId,medicineId) VALUES(?,?,?);
			<sql:param value="<%=quantity %>" />
			<sql:param value="<%=patientId %>" />
			<sql:param value="<%=medicineId %>" />
		</sql:update>
	</c:if>
	<% response.sendRedirect("patientMedicine.jsp?id="+patientId); %>
</body>
</html>