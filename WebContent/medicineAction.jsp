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
<title>Insert title here</title>
</head>
<body>
	<%
		/*String name = request.getParameter("name");
		String type = request.getParameter("type");
		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");*/
		
		String type = "analgesic";
		String quantity = "12";
		String name = "ethanol";
		String price = "201";
		
		
	%>

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/HospitalManager" user="root"
		password="ramgorurer8chana" />

	<sql:update dataSource="${snapshot}" var="result">
	INSERT INTO Medicine (name,type,quantity,price) 
	VALUES ("baka","test","12","23");
	</sql:update>

	<c:out value="${result}"></c:out>
</body>
</html>