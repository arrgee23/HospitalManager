<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Medicine</title>
</head>
<body>
	<form action="medicineAction.jsp">
  		Name:<br>
    	<input type="text" name="name" title="Medicine name">
    	<br>
    	Type:<br>
    	<input type="text" name="type" title="Medicine Type">
    	<br>
    	Items in Stock:
    	<br>
    	<input type="number" name="quantity">
    	<br>
    	Price:
    	<br>
    	<input type="number" name="price">
    	<br><br>
  		<input type="submit" value="Submit">
	</form>
</body>
</html>