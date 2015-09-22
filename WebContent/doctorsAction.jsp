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
		String speciality = request.getParameter("speciality");
		String visit = request.getParameter("visit");
	%>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
	

	<sql:update dataSource="${snapshot}" var="result">
	INSERT INTO Doctors (name,speciality,visit) 
	VALUES (?,?,?);
	
	<sql:param value="<%=name %>" />
	<sql:param value="<%=speciality %>" />
	<sql:param value="<%=visit %>" />
	</sql:update>

	<% response.sendRedirect("doctorsView.jsp"); %>

	 -->
</body>
</html>