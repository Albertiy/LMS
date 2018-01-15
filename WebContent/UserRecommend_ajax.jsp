<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="form-group">
		<label for="isbn" class="col-sm-2 control-label">ISBN:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="isbn"
			name="isbn" value="">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="title" class="col-sm-2 control-label">Title:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="title"
			name="title" value="" required="required">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="author" class="col-sm-2 control-label">Author:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="author"
			name="author" value="">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="col-md-12 col-xs-12" align="right">
		<a href="#" class="btn btn-success " role="button">Confirm</a>
	</div>
</body>
</html>