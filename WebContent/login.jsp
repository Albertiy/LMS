<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-Login</title>
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
					<h1>Welcome back!</h1>
				</div>
				<div class="mx-auto col-sm-8 col-md-5 hide-sm out-contain-form">
					<div class="contain-form">
						<form accept-charset="UTF-8" action="Login" autocomplete="off"
							class="home-hero-signup js-signup-form" method="post">
							<dl class="form-group">
								<dt class="input-label">
									<label class="form-label f5" for="input_email">Email</label>
								</dt>
								<dd>
									<input type="email" name="email" id="input_email" required
										class="form-control form-control-lg input-block js-email-notice-trigger"
										placeholder="you@example.com">
								</dd>
							</dl>
							<dl class="form-group">
								<dt class="input-label">
									<label class="form-label f5" for="input_pwd">Password</label>
								</dt>
								<dd>
									<input type="password" name="pwd" id="input_pwd" required
										class="form-control form-control-lg input-block"
										placeholder="Enter your password">
								</dd>
							</dl>
							<% if(request.getAttribute("warn")!=null
							&& (boolean)request.getAttribute("warn")){%>
							<div class="alert alert-danger" role="alert">Email or
								Password is wrong.</div>
							<%}%>
							<button class="btn btn-primary btn-large f4 btn-block"
								type="submit">Login In</button>
							<a type="button" class="btn btn-link pull-right"
								href="signup.jsp">Sign up now</a>
						</form>
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
	<script type="text/javascript">
	$(document).ready(function () {
		   
	});                
    </script>
</body>
</html>