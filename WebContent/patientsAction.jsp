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
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String guardian = request.getParameter("guardian");
		
		String hour = request.getParameter("hour");
		String minute = request.getParameter("minute");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		// mysql timestamp yyyy-MM-dd HH:mm:ss
		String timestamp = year+"-"+month+"-"+day+" "+hour+":"+minute+":00";
		String admissionTime = timestamp;
		
		String sex = request.getParameter("sex");
		String doctorId = request.getParameter("doctorId");
		String illness = request.getParameter("illness");
	%>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
	
	<sql:update dataSource="${snapshot}" var="result">
	INSERT INTO Patients 
	(name,address,guardian,admissionTime,illness,sex,doctorId) 
	VALUES (?,?,?,?,?,?,?);
	
	<sql:param value="<%=name %>" />
	<sql:param value="<%=address %>" />
	<sql:param value="<%=guardian %>" />
	<sql:param value="<%=admissionTime %>" />
	<sql:param value="<%=illness %>" />
	<sql:param value="<%=sex %>" />
	<sql:param value="<%=doctorId %>" />
	</sql:update>
	<c:out value="${result}"/>
	
	<%
	response.sendRedirect("patientsView.jsp"); 
	%>
</body>
</html>