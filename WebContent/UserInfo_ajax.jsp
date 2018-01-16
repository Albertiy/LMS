<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "cn.niit.lms.dao.*" language="java" %>
	<%@ page import = "java.sql.*" language="java"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form class="bs-example bs-example-form" role="form">
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">Name:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="uname"
			name="name" value="">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="role" class="col-sm-2 control-label">Role:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="role"
			name="role" value="">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="phone" class="col-sm-2 control-label">Phone:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="phone"
			name="phone" value="">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">Eamil:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="email"
			name="email" value="">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="gender" class="col-sm-2 control-label">Gender:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="gender"
			name="gender" value="">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="address" class="col-sm-2 control-label">Address:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="address"
			name="address" value="">
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="dob" class="col-sm-2 control-label">Birthday:</label>
		<div class="col-sm-10">
			<input type="text" readonly class="form-control" id="dob"
			name="dob" value="">
		</div>
	</div>
	</form>