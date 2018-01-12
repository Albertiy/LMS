<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-Manage</title>
<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/manage.css" rel="stylesheet">
</head>
<body>
	<nav id="top_navbar" class="navbar navbar-default  navbar-fixed-top">
	<!-- 白色导航条是 navbar-default navbar-fixed-top让导航条固定在顶部，static-top为默认-->
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
					<li><a id="home" href="home.jsp">Home</a></li>
					<li><a id="about" href="about.jsp">***</a></li>
					<li><a id="contact" href="contact.jsp">***</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a>librarian</a></li>
					<li><a id="logout" href="index.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<h1>&nbsp;</h1>
	<br></br><br></br><br></br><br></br><br></br>
	<div class="hero-background">
		<div class="container"> 
			<div class="row">
			<div class="col-md-12">
				<div class="col-md-2"></div>
				<div class="col-md-4">
						<a id="manageusers" href="UserManagement.jsp">
						<button type="button" class="btn btn-primary btn-lg btn-block">Manage Users</button>
						</a>
						<style>
							button{
								height:100px;
							}
						</style>
				</div>
				<div class="col-md-4">
						<a id="managebooks" href="BookManagement.jsp">
						<button type="button" class="btn btn-primary btn-lg btn-block" >Manage Books</button>
						</a>
						<style>
							button{
								height:100px;
							}
						</style>
				</div>
				<div class="col-md-2"></div>
			</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="container">
			<p class="text-muted" >
				<u>Library Management System</u> design and build by <strong>BayMax</strong>,
				<strong>Damon</strong> and <strong>Albert</strong>.
			</p>
		</div>
	</footer>
	<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
	<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>