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
	String s1="checked";
	String s2="checked";
	if(!u.getGender()){
		s1="";}
	else{
		s2="";
	}
	String email = u.getEmail();
	String address = u.getAddress();
	String dob = u.getDob();
	
	
%>
<script src="/LMS/assets/js/Users.js"></script>


</head>
<body>
<form class="bs-example bs-example-form" role="form">
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">Name:</label>
		<div class="col-sm-10">
			<input type="text" readonly="readonly" class="form-control" id="uname" required maxlength="16" 
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
			<input type="text" readonly="readonly" class="form-control" id="phone" required maxlength="11"
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
			<input type="radio" disabled="disabled" name="userGender" id="female"
				value="female" <%=s1 %>> Male 
			<input type="radio" disabled="disabled" name="userGender" id="male" 
				value="male" <%=s2 %> > Female

		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="address" class="col-sm-2 control-label">Address:</label>
		<div class="col-sm-10">
			<input type="text" readonly="readonly" class="form-control" id="address" required
			name="address" value="<%= address %>">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="dob" class="col-sm-2 control-label">Birthday:</label>
		<div class="col-sm-10">
			<input type="date" name="dob" id="dob" disabled="disabled" required
						class="form-control" value="<%=dob %>">
		</div>
	</div>
	<h5>&nbsp;</h5>
		<div class="row">
			<div class="col-md-12 col-xs-12" align="right">
				<button type="button" id="modify" class="btn btn-primary" onclick="modifyinfo()">Modify</button>
				<button type="submit" class="btn btn-success">Confirm</button>
			</div>
		</div>
	</form>

</body>