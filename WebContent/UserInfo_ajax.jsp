<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "cn.niit.lms.dao.*" language="java" %>
	<%@ page import = "java.sql.*" language="java"  %>

<!DOCTYPE html>
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
	<form class="bs-example bs-example-form" role="form"
		action="ModifyInfo" method="post">
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">Name:</label>
			<div class="col-sm-10">
				<input type="text" readonly="readonly" class="form-control" required
					maxlength="16" pattern="[^ ]*"
					oninvalid="setCustomValidity('maxlength is 16')"
					oninput="setCustomValidity('')" id="Name" name="Name"
					value="<%= name %>">
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
				<input type="tel" readonly="readonly" class="form-control"
					id="Phone" maxlength="11"
					oninvalid="setCustomValidity('maxlength is 11')"
					oninput="setCustomValidity('')" required name="Phone"
					value="<%=phone %>">
			</div>
		</div>
		<h5>&nbsp;</h5>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">Eamil:</label>
			<div class="col-sm-10">
				<input type="email" readonly class="form-control" id="Email"
					name="Email" value="<%= email%>">
			</div>
		</div>
		<h5>&nbsp;</h5>
		<div class="form-group">
			<label for="gender" class="col-sm-2 control-label">Gender:</label>
			<div class="col-sm-10">
				<input type="radio" disabled="disabled" name="Gender" id="male"
					value="Male" <%=s1 %>> Male <input type="radio"
					disabled="disabled" name="Gender" id="female" value="Female"
					<%=s2 %>> Female
			</div>
		</div>
		<h5>&nbsp;</h5>
		<div class="form-group">
			<label for="address" class="col-sm-2 control-label">Address:</label>
			<div class="col-sm-10">
				<input type="text" readonly="readonly" class="form-control"
					id="Address" required maxlength="50"
					oninvalid="setCustomValidity('Cannot be null')"
					oninput="setCustomValidity('')" name="Address"
					value="<%= address %>">
			</div>
		</div>
		<h5>&nbsp;</h5>
		<div class="form-group">
			<label for="dob" class="col-sm-2 control-label">Birthday:</label>
			<div class="col-sm-10">
				<input type="date" name="Dob" id="Dob" disabled="disabled" required
					class="form-control" value="<%=dob %>">
			</div>
		</div>
		<h5>&nbsp;</h5>
		<div class="row">
			<div class="col-md-12 col-xs-12" align="right">
				<button type="button" id="modify" class="btn btn-primary"
					onclick="modifyinfo()">Modify</button>
				<button type="submit" class="btn btn-success">Confirm</button>
			</div>
		</div>
	</form>

</body>