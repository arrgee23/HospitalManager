<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>patient insert</title>
</head>
<body>
	<div class="col-sm-6">
	<form action="patientAction.jsp">
  	<fieldset>
    	<legend>Personal information:</legend>
    	Name:<br>
    	<input type="text" name="name" value="full name">
    	<br>
    	Address:<br>
    	<input type="text" name="address" size="50" value="your address">
    	<br>
    	Guardians Name:<br>
    	<input type="text" name="address" value="full name">
    	<br>
    	<input type="radio" name="sex" value="male" checked> Male
    	<input type="radio" name="sex" value="female"> Female
  	</fieldset>
  		Admission Date:
  		<input type="datetime-local" name="admissonTime">
  		<br><br>
  		<input type="submit" value="Submit">
	</form>
	</div>
</body>
</html>