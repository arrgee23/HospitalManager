<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>Medicine-patient</title>
</head>
<body>
	<%
		String patientId = request.getParameter("id");
	%>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
	
	<sql:query dataSource="${snapshot}" var="result">
		SELECT * FROM PatientMedicine
		WHERE patientId=?;
		<sql:param value="<%=patientId %>" />
	</sql:query>
	
	<table border="1" >
		<tr>
			<th>Medicine Name</th>
			<th>Medicine Type</th>
			<th>Quantity Given</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<sql:query dataSource="${snapshot}" var="result2">
					SELECT * FROM Medicine
					WHERE Id=?;
					<sql:param value="${row.medicineId}" />
				</sql:query>
				<c:forEach var="row2" items="${result2.rows}">
					<td><c:out value="${row2.name}" /></td>
					<td><c:out value="${row2.type}" /></td>
				</c:forEach>
				
				<td><c:out value="${row.quantity}" /></td>
			</tr>
		</c:forEach>
	</table>
	<!-- Done already given medicine
		UPDATE PatientMedicine SET quantity=quantity+12  WHERE patientId=1 and medicineId=2; 
		if doesnt match doesnt do anything
	 -->
	 <a href="addMedicine.jsp?id=<%=patientId %>">Insert/update medicine</a>
	 <br>
	 <a href="checkout.jsp?id=<%=patientId %>">Checkout</a>
</body>
</html>