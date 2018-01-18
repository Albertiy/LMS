<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.niit.lms.domain.User" language="java"%>
<% if(session.getAttribute("backUrl") == null){
	session.setAttribute("backUrl", request.getHeader("Referer"));
	System.out.println("signup.jsp: "+request.getHeader("Referer"));
}else{
	System.out.println("Abbribure - signup.jsp: "+session.getAttribute("backUrl"));
}  %>
	<!DOCTYPE html>
	<html lang='zh-CN'>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>LMS-Sign up</title>
		<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link type="text/css" href="/LMS/assets/css/signup.css" rel="stylesheet">
	</head>

	<body>
		<nav id="top_navbar" class="navbar navbar-default  navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand">Library Management System</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li>
							<a id="home" href="index.jsp">Home</a>
						</li>
						<li>
							<a id="about" href="#">***</a>
						</li>
						<li>
							<a id="contact" href="#">***</a>
						</li>
					</ul>
					<!-- 显示Role和名称 -->
				<%if (session.getAttribute("user") == null) {%>
					<ul class="nav navbar-nav navbar-right">
						<li><a id="login" href="login.jsp">Login In</a></li>
						<li><a id="signup" href="signup.jsp">Sign Up</a></li>
					</ul>
					<%}else{
						String role= ((User)session.getAttribute("user")).getRole();
						switch(role){
						default: role = "Student";break;
						case "t": role = "Teacher";break;
						case "l": role = "Librarian";break;
						case "a": role = "Admin";break;
						}
					%>
					<ul class="nav navbar-nav navbar-right">
						<li><a id="user" href=""><strong><%=role %> | ${sessionScope.user.getUname()}</strong></a></li>
						<li><a id="logout" href="Logout">Login Out</a></li>
					</ul>
					<%}%>
				</div>
			</div>
		</nav>

		<h1>&nbsp;</h1>
		<div class="out-container">
			<div class="container-lg p-responsive position-relative">
				<div class="d-md-flex flex-items-center gutter-md-spacious">
					<div class="col-md-7 text-center text-md-left">
						<h1 class="">Sign up to LMS Now!</h1>
						&nbsp;
						<p class="lead">Reading together with enjoying life person!</p>
					</div>
					<div class="mx-auto col-sm-8 col-md-5 hide-sm out-contain-form">
						<div class="bg-white constrain p-03 shadow-lg">
							<div class="bg-white panel-border p-03">
								<div class="bg-white panel-border py-4 px-4">
									<p>&nbsp;</p>
									<div class="contain-form">
										<!-- action=""为空时会刷新本页面，无法实现Ajax  -->
										<form id="formSignup" accept-charset="UTF-8"  autocomplete="off" class="home-hero-signup js-signup-form" method="post">
											<dl class="form-group">
												<dt class="input-label">
													<label class="form-label f5" for="userUname">Username</label>
												</dt>
												<dd>
													<input type="text" name="userUname" id="userUname" required maxlength="16" pattern="[^ ]*"
													class="form-control form-control-lg input-block" placeholder="Pick a username,use only char and number"
													 autofocus="autofocus">
												</dd>
											</dl>
											<dl class="form-group">
												<dt class="input-label">
													<label class="form-label f5" for="userEmail">Email</label>
												</dt>
												<dd>
													<input type="userEmail" name="userEmail" id="userEmail" required maxlength="32"
													 class="form-control form-control-lg input-block js-email-notice-trigger"
													 placeholder="you@example.com">
												</dd>
											</dl>
											<dl class="form-group">
												<dt class="input-label">
													<label class="form-label f5" for="userRole">Role</label>
												</dt>
												<dd>
													<select class="form-control" id="userRole" name="userRole">
														<option>Student</option>
														<option>Teacher</option>
													</select>
												</dd>
											</dl>
											<dl class="form-group">
												<dt class="input-label">
													<label class="form-label f5" for="userPwd">Password</label>
												</dt>
												<dd>
													<input type="password" name="userPwd" id="userPwd" required minlength="6" maxlength="16" pattern="[0-9A-Za-z_]{6,16}"
													 class="form-control form-control-lg input-block" placeholder="Create a password">
												</dd>
											</dl>
											<dl class="form-group" id="inputRepwd">
												<dd>
													<input type="password" name="userRePwd" id="userRePwd" required minlength="6" maxlength="16" pattern="[0-9A-Za-z_]{6,16}"
													 class="form-control form-control-lg input-block" placeholder="Confirm your password">
												</dd>
											</dl>
											<span id="helpConfirmPW" class="help-block" style=" color:red">Inconsistent with password</span>
											<dl class="form-group">
												<dt class="input-label">
													<label class="form-label f5" for="userPhone">Phone</label>
												</dt>
												<dd>
													<input type="tel" name="userPhone" id="userPhone" required  maxlength="11"
													 class="form-control form-control-lg input-block" placeholder="Phone number">
												</dd>
											</dl>
											<dl class="form-group">
												<dt class="input-label">
													<label class="form-label f5" for="userGender">Gender</label>
												</dt>
												<dd>
													<label class="radio-inline">
														<input type="radio" name="userGender" id="female" value="female" checked> Female
													</label>
													<label class="radio-inline">
														<input type="radio" name="userGender" id="male" value="male"> Male
													</label>
												</dd>
											</dl>
											<dl class="form-group">
												<dt class="input-label">
													<label class="form-label f5" for="userDob">Birthday</label>
												</dt>
												<dd>
													<input type="date" name="userDob" id="userDob" required class="form-control form-control-lg input-block" placeholder="">
												</dd>
											</dl>
											<dl class="form-group">
												<dt class="input-label">
													<label class="form-label f5" for="userAddress">Address</label>
												</dt>
												<dd>
													<input type="text" name="userAddress" id="userAddress" required maxlength="50"
													 class="form-control form-control-lg input-block" placeholder="Address">
												</dd>
											</dl>
											<span class="help-block" style="color:#f00"><font id="ErrorInfo" color="red">${requestScope.error}</font></span>
											<button class="btn btn-primary btn-large f4 btn-block" type="submit">Sign up</button>
											<a type="button" class="btn btn-link pull-right" href="login.jsp">Click to Login</a>
										</form>
									</div>
									<p>&nbsp;</p>
									<p>&nbsp;</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<h1>&nbsp;</h1>

		<footer class="footer">
			<div class="container">
				<p class="text-muted">
					<u>Library Management System</u> design and build by
					<strong>BayMax</strong>,
					<strong>Damon</strong> and
					<strong>Albert</strong>.
				</p>
			</div>
		</footer>
		<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
		<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
		<script src="/LMS/assets/js/signup.js"></script>
	</body>

	</html>