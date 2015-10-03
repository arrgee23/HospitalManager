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
<title>patient Status</title>
</head>
<body>
<%
String patientId = request.getParameter("id");
%>
<!-- get medicine used by patient and total bill -->
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
	
	
	
	<!----------------------------- get the number of days patient was in -------------------------------------------------->
	<sql:query dataSource="${snapshot}" var="patientRow">
		SELECT * FROM Patients
		WHERE id=?;
		<sql:param value="<%=patientId %>" />
	</sql:query>
	<% 
		org.apache.taglibs.standard.tag.common.sql.ResultImpl r = (org.apache.taglibs.standard.tag.common.sql.ResultImpl)
																pageContext.getAttribute("patientRow");
		SortedMap<String,Object>[] patient = r.getRows();
		//out.print((Timestamp)s[0].get("admissionTime"));
		Timestamp ts = (Timestamp)patient[0].get("admissionTime");
		Calendar admissionTime = Calendar.getInstance();
		admissionTime.setTimeInMillis(ts.getTime());
        
        Calendar dischargeTime = Calendar.getInstance();
		
        String adt = TimeManager.prettyStringFromCalendar(admissionTime);
        String dis = TimeManager.prettyStringFromCalendar(dischargeTime);
        
        //out.println(adt+"<br>");
        
        //out.println(dis);
        
        int yearDiff = dischargeTime.get(Calendar.YEAR)-admissionTime.get(Calendar.YEAR);
        int sday,eday;
        
        eday=dischargeTime.get(Calendar.DAY_OF_YEAR);
        eday -= 1;
        if(dischargeTime.get(Calendar.HOUR_OF_DAY)>= 8 || 
        		(dischargeTime.get(Calendar.HOUR_OF_DAY)==8 && dischargeTime.get(Calendar.MINUTE)>=0) ){
        	eday += 1;
        }
        sday = admissionTime.get(Calendar.DAY_OF_YEAR);
        sday -= 1;
        if(admissionTime.get(Calendar.HOUR_OF_DAY) >= 8 || 
        		(admissionTime.get(Calendar.HOUR_OF_DAY)==8 && admissionTime.get(Calendar.MINUTE)>=0) ){
        	sday += 1;
        }
        int dayDiff = eday-sday+1 + 365*yearDiff;
        
        //out.println(dayDiff);
	%>
	<!-- -------------------------------------------------------------------------------- -->
	<!--  get the doctor under which patient was admitted -->
	
	<sql:query dataSource="${snapshot}" var="doctor">
		SELECT doctorId FROM Patients
		WHERE id=?;
		<sql:param value="<%=patientId %>" />
	</sql:query>
	
	<% 
		org.apache.taglibs.standard.tag.common.sql.ResultImpl r2 = (org.apache.taglibs.standard.tag.common.sql.ResultImpl)
																pageContext.getAttribute("doctor");
		SortedMap<Integer,Object>[] s2 = r2.getRows();
		//out.print((Timestamp)s[0].get("admissionTime"));
		Integer did = (Integer)s2[0].get("doctorId");
		//out.print(patientId);
	%>
	<!-- get his fee ----------------------------------------------------------------------------------- -->
	<sql:query dataSource="${snapshot}" var="fees">
		SELECT * FROM Doctors
		WHERE id=?;
		<sql:param value="<%=did %>" />
	</sql:query>
	
	<%org.apache.taglibs.standard.tag.common.sql.ResultImpl r3 = (org.apache.taglibs.standard.tag.common.sql.ResultImpl)
																pageContext.getAttribute("fees");
		SortedMap<Integer,Object>[] s3 = r3.getRows();
		//out.print((Timestamp)s[0].get("admissionTime"));
		Integer visit = (Integer)s3[0].get("visit");
		String doctorName = (String)s3[0].get("name");
		//out.print(visit*dayDiff);
	%>


<!-- View part ------------------------------------------------------------------------------------------------->
<!-- total,visit,daydiff,doctorName,adt,dis -->

	<% int total = 0; %>
	
	<c:forEach var="row" items="${result.rows}">
		
			<c:set var="cost" value="${row.total}" />
			<%
			Long l = (Long)pageContext.getAttribute("cost");
			total += l;
			%>
	
	</c:forEach>
	
	<div class="page-header">
		<h1 class="text-center">Till Now</h1>
	</div>
	
	
		<div class="row">
			<div class="col-xs-4 text-left">
			<b>Patient's Name:</b> <%= (String)patient[0].get("name")%>
			</div>
			<div class="col-xs-4 text-center">
			<b>Age:</b> <%= (Integer)patient[0].get("age")%>
			</div>
			<div class="col-xs-4 text-center">
			<b>Sex:</b> <%= (String)patient[0].get("sex")%>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-12 text-left">
			<b>Address:</b> <%= (String)patient[0].get("address")%>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-6 text-left">
			<b>Date of Admission:</b> <%= adt%>
			</div>
			
		</div>
		<br>
		<div class="row">
			<div class="col-xs-6 text-left">
			<b>Bed no:</b> <%= (Integer)patient[0].get("bedNo")%>
			</div>
			<div class="col-xs-6 text-left">
			<b>Under Doctor:</b> <%= doctorName%>
			</div>
		</div>
	<!-- ------------------------------------------------------------- -->
	<%
		int grandTotal = dayDiff*visit+total+dayDiff*Strings.BED_CHARGE;
	%>
	<br><br>
	<table class="table table-striped table-bordered">
    <thead>
        <tr>
        	<th>Services</th>
            <th>Particulars</th>
            <th>Amount</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Bed Charges</td>
            <td><%=dayDiff %> x <%=Strings.BED_CHARGE %></td>
            <td><%=dayDiff*Strings.BED_CHARGE %> </td>
        </tr>
        
        
        <tr>
            <td>Doctor's Fee</td>
            <td><%=doctorName %>, <%=dayDiff %> days</td>
           	<td><%=dayDiff*visit %></td>
        </tr>
        
        <tr>
            <td>Medicine/Kit</td>
            <td>N/A</td>
           	<td><%=total %></td>
        </tr>
       
        
        <tr>
            <td></td>
            <td>Total</td>
           	<td><%=grandTotal %></td>
        </tr>
    
    </tbody>
</table>
<br>
	<a class="btn btn-block btn-success" href="patientsView.jsp">Done? Go Back</a>
<br>
</body>
</html>