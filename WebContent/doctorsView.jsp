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
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
	
	<sql:query dataSource="${snapshot}" var="result">
	SELECT * from Doctors;
	</sql:query>

	<table border="1" >
		<tr>
			<th>Doctor ID</th>
			<th>Doctor Name</th>
			<th>Speciality</th>
			<th>Visit</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.id}" /></td>
				<td><c:out value="${row.name}" /></td>
				<td><c:out value="${row.speciality}" /></td>
				<td><c:out value="${row.visit}" /></td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>