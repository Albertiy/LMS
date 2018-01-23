<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "cn.niit.lms.dao.*" language="java" %>
	<%@ page import = "java.sql.*" language="java"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User's info page</title>

<%@ page import = "cn.niit.lms.domain.*" %>
<%@ page import = "cn.niit.lms.dao.*" %>

<%
	User u = (User)session.getAttribute("user");
	String name = u.getUname();
	String phone = u.getPhone();
	String role = "Student";
	if(u.getRole()=="t"){
		role = "Teacher";}
	else if(u.getRole() == "l"){
		role = "Librarian";}
	String gender = "Male";
	if(!u.getGender()){
		gender="Female";}
	String email = u.getEmail();
	String address = u.getAddress();
	String dob = u.getDob();
	
	
%>

</head>
<body>
<form class="bs-example bs-example-form" role="form">
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">Name:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="uname"
			name="name" value="<%= name %>">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="role" class="col-sm-2 control-label">Role:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="role"
			name="role" value="<%= role %>">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="phone" class="col-sm-2 control-label">Phone:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="phone"
			name="phone" value="<%= phone %>">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">Eamil:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="email"
			name="email" value="<%= email %>">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="gender" class="col-sm-2 control-label">Gender:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="gender"
			name="gender" value="<%= gender %>">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="address" class="col-sm-2 control-label">Address:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="address"
			name="address" value="<%= address %>">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="dob" class="col-sm-2 control-label">Birthday:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="dob"
			name="dob" value="<%= dob %>">
		</div>
	</div>
	</form>

</body>