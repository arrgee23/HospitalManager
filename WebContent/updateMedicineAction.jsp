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
	<!-- Update values for a medicine in inventory -->
	<%
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String quantity=request.getParameter("quantity");
		String type=request.getParameter("type");
		String price=request.getParameter("price");
	%>
	
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
	
	<sql:update dataSource="${snapshot}" var="foo2"> 
		update Medicine set 
		name=?,
		type=?,
		quantity=?,
		price=?
		where id=?;
			
		<sql:param value="<%=name %>" />
		<sql:param value="<%=type %>" />
		<sql:param value="<%=quantity %>" />
		<sql:param value="<%=price %>" />
		<sql:param value="<%=id %>" />
	</sql:update>
	<%
		response.sendRedirect("medicineView.jsp");
	%>
</body>
</html>