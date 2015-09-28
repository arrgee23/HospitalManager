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
	<div class="jumbotron text-center">
		<h1>Add Medicine</h1>
	</div>
	<div class="col-xs-4 col-xs-offset-4">
	<form class="form" action="medicineAction.jsp">
  		Name:<br>
    	<input type="text" class="form-control" name="name" title="Medicine name">
    	<br>
    	Type:<br>
    	<input type="text" class="form-control" name="type" title="Medicine Type">
    	<br>
    	Items in Stock:
    	<br>
    	<input type="number" class="form-control" value="0" name="quantity">
    	<br>
    	Price:
    	<br>
    	<input type="number" class="form-control" value="0" name="price">
    	<br><br>
  		<input type="submit" class="btn btn-success" value="Submit">
	</form>
	</div>

</body>
</html>