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
<title>Update Medicine</title>
</head>
<body>
	<%
		String id=request.getParameter("id");
	%>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
	
	<sql:query dataSource="${snapshot}" var="result">
	SELECT * from Medicine
	WHERE id=<%=id %>;
	</sql:query>
<div class="row">
	<div class="col-xs-10 col-xs-offset-1">
	<div class="jumbotron text-center">
		<h1>Update Medicine Values</h1>
	</div>
	
	<div class="row">
	<h3 class="text-center">Current Values</h3>
	<table class="table" >
		<tr>
			<th>Medicine ID</th>
			<th>Medicine Name</th>
			<th>Medicine Type</th>
			<th>Quantity(units available)</th>
			<th>Price per unit</th>
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
		<div class="row">
			<form action="updateMedicineAction.jsp" class="form col-sm-4 col-sm-offset-4">
				
				<c:forEach var="row" items="${result.rows}">
					<input type="hidden" name="id" value="<c:out value="${row.id}" />">
					
					<div class="form-group">
						<label>
							Modify Name:
						</label>
						<input type="text" name="name" class="form-control" value="<c:out value="${row.name}" />">
					</div>
					
					<div class="form-group">
						<label>
							Modify type:
						</label>
						<input type="text" name="type" class="form-control" value="<c:out value="${row.type}" />">
					</div>
					
					<div class="form-group">
						<label>
							Modify Quantity:
						</label>
						<input type="number" name="quantity" class="form-control" value="<c:out value="${row.quantity}" />">
					</div>
					
					<div class="form-group">
						<label>
							Modify Price:
						</label>
						<input type="number" name="price" class="form-control" value="<c:out value="${row.price}" />">
					</div>
					<br><br>
					<input type="submit" class="btn btn-success btn-block" value="Submit">
					<br><br>
				</c:forEach>
			</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>