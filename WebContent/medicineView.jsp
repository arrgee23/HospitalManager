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
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/HospitalManager" user="root"
		password="ramgorurer8chana" />

	<sql:query dataSource="${snapshot}" var="result">
	SELECT * from Medicine;
	</sql:query>

	<table border="1" >
		<tr>
			<th>Medicine ID</th>
			<th>Medicine Name</th>
			<th>Medicine Name</th>
			<th>Quantity(units available)</th>
			<th>price per unit</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.id}" /></td>
				<td><c:out value="${row.name}" /></td>
				<td><c:out value="${row.type}" /></td>
				<td><c:out value="${row.quantity}" /></td>
				<td><c:out value="${row.price}" /></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>