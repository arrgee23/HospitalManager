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
<title>Checkout</title>
</head>
<body>
	<%
		String patientId = request.getParameter("id");
	%>
	
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="<%=Strings.DB_SERVER_URL %>" user="<%=Strings.DB_USERNAME %>"
		password="<%=Strings.DB_PASSWORD %>" />
	
	<sql:query dataSource="${snapshot}" var="result">
		SELECT Medicine.name,Medicine.type,PatientMedicine.quantity, PatientMedicine.quantity*Medicine.price AS total  
		FROM Medicine,PatientMedicine 
		WHERE PatientMedicine.patientId=? 
		AND  
		Medicine.id=PatientMedicine.medicineId;
		<sql:param value="<%=patientId %>" />
	</sql:query>
	
	<% int total = 0; %>
	<table border="2" >
		<tr>
			<th>Medicine Name</th>
			<th>Medicine  Type</th>
			<th>Quantity</th>
			<th>Cost</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.name}" /></td>
				<td><c:out value="${row.type}" /></td>
				<td><c:out value="${row.quantity}" /></td>
				<td><c:out value="${row.total}" /></td>
				<c:set var="cost" value="${row.total}" />
				<%
					Long l = (Long)pageContext.getAttribute("cost");
					total += l;
				%>
			</tr>
		</c:forEach>
		<tr>
			<td></td><td></td><td>Total</td><td><%= total %></td>
		</tr>
	</table>
	
	<!----------------------------- get the number of days patient was in -------------------------------------------------->
	<sql:query dataSource="${snapshot}" var="patientRow">
		SELECT * FROM Patients
		WHERE id=?;
		<sql:param value="<%=patientId %>" />
	</sql:query>
	<% 
		org.apache.taglibs.standard.tag.common.sql.ResultImpl r = (org.apache.taglibs.standard.tag.common.sql.ResultImpl)
																pageContext.getAttribute("patientRow");
		SortedMap<String,Object>[] s = r.getRows();
		//out.print((Timestamp)s[0].get("admissionTime"));
		Timestamp admissionTime = (Timestamp)s[0].get("admissionTime");
		Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(admissionTime.getTime());
        
        Calendar dischargeTime = Calendar.getInstance();
	
      //Time Difference Calculations Begin
       	long milliSec1 = calendar.getTimeInMillis();
        long milliSec2 = dischargeTime.getTimeInMillis();
        long timeDifInMilliSec = milliSec2 - milliSec1;
        long timeDifDays = timeDifInMilliSec / (24 * 60 * 60 * 1000);
        
        //out.println(timeDifDays);
	%>
	
	<!-- -------------------------------------------------------------------------------- -->
	
	<sql:query dataSource="${snapshot}" var="doctor">
		SELECT doctorId FROM Patients
		WHERE id=?;
		<sql:param value="<%=patientId %>" />
	</sql:query>
	
	<% 
		org.apache.taglibs.standard.tag.common.sql.ResultImpl r2 = (org.apache.taglibs.standard.tag.common.sql.ResultImpl)
																pageContext.getAttribute("doctor");
		SortedMap<Long,Object>[] s2 = r2.getRows();
		//out.print((Timestamp)s[0].get("admissionTime"));
		Long did = (Long)s2[0].get("doctorId");
		
	%>
	<!-- -------------------------------------------------------------------------------- -->
	<sql:query dataSource="${snapshot}" var="fees">
		SELECT * FROM Doctors
		WHERE id=?;
		<sql:param value="<%=did %>" />
	</sql:query>
	
	<%org.apache.taglibs.standard.tag.common.sql.ResultImpl r3 = (org.apache.taglibs.standard.tag.common.sql.ResultImpl)
																pageContext.getAttribute("fees");
		SortedMap<Long,Object>[] s3 = r3.getRows();
		//out.print((Timestamp)s[0].get("admissionTime"));
		Long visit = (Long)s3[0].get("visit");
		out.print(visit*timeDifDays);
	%>
	
</body>
</html>