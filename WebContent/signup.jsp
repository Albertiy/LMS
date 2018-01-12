<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-Sign up</title>
<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/login.css" rel="stylesheet">
</head>
<body>
	<nav id="top_navbar" class="navbar navbar-default  navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">Library Management System</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a id="home" href="index.jsp">Home</a></li>
					<li><a id="about" href="#">***</a></li>
					<li><a id="contact" href="#">***</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a id="login" href="login.jsp">Login In</a></li>
					<li><a id="signup" href="signup.jsp">Sign Up</a></li>
				</ul>
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
					<div class="contain-form">
						<form accept-charset="UTF-8" action="/signup" autocomplete="off"
							class="home-hero-signup js-signup-form" method="post">
							<div style="margin: 0; padding: 0; display: inline">
								<input name="utf8" type="hidden" value="✓">
							</div>
							<dl class="form-group">
								<dt class="input-label">
									<label class="form-label f5" for="user[login]">Username</label>
								</dt>
								<dd>
									<input type="text" name="user[login]" id="user[login]"
										class="form-control form-control-lg input-block"
										placeholder="Pick a username"
										data-autocheck-url="/signup_check/username"
										data-autocheck-authenticity-token="tqUoviSiDwlvzm1Rt+7jxdb489oYxL09LUxyF1rYw7trLnK4YeKpkAO3mRJnOQn4LGc866nKnHJz2Yuhe45otQ=="
										autofocus="autofocus">
								</dd>
							</dl>
							<dl class="form-group">
								<dt class="input-label">
									<label class="form-label f5" for="user[email]">Email</label>
								</dt>
								<dd>
									<input type="text" name="user[email]" id="user[email]"
										class="form-control form-control-lg input-block js-email-notice-trigger"
										placeholder="you@example.com"
										data-autocheck-url="/signup_check/email"
										data-autocheck-authenticity-token="/7iuTyA25nBz30Bl9Ecu0QOSSWDyuSd54YUkk6u+C/CWQ/o6f9jIyRgfkUpncX6l8gLgFq6aV0LuHfK0pFDvdg==">
								</dd>
							</dl>
							<dl class="form-group">
								<dt class="input-label">
									<label class="form-label f5" for="user[password]">Password</label>
								</dt>
								<dd>
									<input type="password" name="user[password]"
										id="user[password]"
										class="form-control form-control-lg input-block"
										placeholder="Create a password"
										data-autocheck-url="/signup_check/password"
										data-autocheck-authenticity-token="ZMBEZYNOYBiugrka5S8zRoTcmhdORD8dEt6Du2dOVdXYKN5GoJDTen8ZO3nh4wvZA+NrETZae4KJkG181s69Fg==">
								</dd>
							</dl>
							<input class="form-control" name="" type="hidden" value="">
							<button class="btn btn-primary btn-large f4 btn-block"
								type="submit">Sign up</button>
							<button type="button" class="btn btn-link pull-right">Click
								to Login</button>
						</form>
						<a></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<h1>&nbsp;</h1>

	<footer class="footer">
		<div class="container">
			<p class="text-muted">
				<u>Library Management System</u> design and build by <strong>BayMax</strong>,
				<strong>Damon</strong> and <strong>Albert</strong>.
			</p>
		</div>
	</footer>
	<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
	<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>