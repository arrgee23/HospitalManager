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
<title>patient insert</title>
</head>
<body>

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
	
	<sql:query dataSource="${snapshot}" var="result">
	SELECT * from Doctors;
	</sql:query>
	
	
	<div class="row">
	<div class="col-xs-8 col-xs-offset-2">
	<div class="jumbotron text-center">
		<h1>Patients</h1>
	</div>
	<form role="form" action="patientsAction.jsp">
  	<fieldset>
    	<legend>Personal information:</legend>
    	<div class=form-group">
    	<label>Full Name: </label>
    	<input class="form-control" type="text" name="name">
    	</div>
    	
    	<div class=form-group">
    	<label>Address:</label>
    	<input class="form-control" type="text" name="address" size="50">
    	</div>
    	
    	<div class=form-group">
    	<label>Guardians Name:</label>
    	<input type="text" class="form-control" name="guardian" >
    	</div>
    	
    	<input type="radio" name="sex" value="M" checked> Male
    	<input type="radio" name="sex" value="F"> Female
  	</fieldset>
  		
  		Admission Date:<br>
  		<div class="from-group">
  		Day<select name="day">
  			<%
  				for(int i=1;i<32;i++){
  					if(i<=9)
  						out.print("<option value='0"+i+"'>"+i+"</option>");
  					else{
  						out.print("<option value='"+i+"'>"+i+"</option>");
  					}
  				}
  			%>
  		</select>
  		Month<select name="month" >
  			<%
  				for(int i=1;i<13;i++){
  					if(i<=9)
  						out.print("<option value='0"+i+"'>"+i+"</option>");
  					else{
  						out.print("<option value='"+i+"'>"+i+"</option>");
  					}
  				}
  			%>
  		</select >
  		
  		<select  name="year">
  			<%
  				for(int i=2015;i<2030;i++)
  					out.print("<option value='"+i+"'>"+i+"</option>");
  			%>
  		</select>
  		</div>
  		<br>
  		Admission Time(input in 24 hr format):<br>
  		Hour<select name="hour" >
  			<%
  				for(int i=0;i<24;i++){
  					if(i<=9)
  						out.print("<option value='0"+i+"'>"+i+"</option>");
  					else{
  						out.print("<option value='"+i+"'>"+i+"</option>");
  					}
  				}
  			%>
  		</select>
  		Minute<select name="minute" >
  			<%
  				for(int i=0;i<60;i++){
  					if(i<=9)
  						out.print("<option value='0"+i+"'>"+i+"</option>");
  					else{
  						out.print("<option value='"+i+"'>"+i+"</option>");
  					}
  				}
  			%>
  		</select>
  		<br><br>
  		
  		Type of Ailment:<br>
  		<input type="text" name="illness" class="form-control">
  		<br>
  		Under Doctor:
  		<select name="doctorId" class="form-control" class="form-control">
  		<c:forEach var="row" items="${result.rows}">
				<option value="<c:out value="${row.id}" />">
					<c:out value="${row.name}"/>
					(<c:out value="${row.speciality}"/>)
				</option>
		</c:forEach>
		</select>
  		<br><br>
  		Bed No:
  		<select name="bedNo" >  
  			<%
  				for(int k=Strings.BED_NO_START;k<=Strings.BED_NO_END;k++){
  						out.print("<option value='"+k+"'>"+k+"</option>");
  				}
  			%>
  		</select>
  		Age:
  		<select name="age" > 
  			<%
  				for(int i=1;i<=120;i++){
  						out.print("<option value='"+i+"'>"+i+"</option>");
  				}
  			%>
  		</select >
  		<br><br>
  		<input type="submit" class="btn btn-success btn-block" value="Submit">
  		<br><br>
	</form>
	</div>
	</div>
</body>
</html>