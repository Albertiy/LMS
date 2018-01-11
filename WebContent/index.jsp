<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-Index</title>
<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/index.css" rel="stylesheet">
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
					<li><a id="login" href="login.jsp">Login In</a></li>
					<li><a id="signup" href="signup.jsp">Sign Up</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="hero-background">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>&nbsp;</h1>
					<h2 class="text-center">Welcome</h2>
					<h3 class="text-center">To</h3>
					<h2 class="text-center">NIIT Online Library</h2>
				</div>
			</div>
			<div class="row">

				<div class="col-md-12">
					<h1>&nbsp;</h1>
					<div class=" input-group search-group">
						<div class="input-group-btn">
							<!-- Button and drop down menu -->
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								Title <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">Title</a></li>
								<li><a href="#">Author</a></li>
								<li><a href="#">ISBN</a></li>
								<li><a href="#">Category</a></li>
							</ul>
							<button type="button" class="btn btn-default dropdown-toggle"
                                data-toggle="dropdown2" aria-haspopup="true"
                                aria-expanded="false">
                                Tech <span class="caret"></span>
                            </button>
                            <ul class="dropdown2-menu">
                                <li><a href="#">Tech</a></li>
                                <li><a href="#">Art</a></li>
                                <li><a href="#">Health</a></li>
                            </ul>
						</div>
						<input type="text" class="form-control" aria-label="...">
						<div class="input-group-btn">
							<button type="button" class="btn btn-default">Search</button>
						</div>
					</div>
					<h1>&nbsp;</h1>
				</div>

			</div>
		</div>
	</div>

	<div class="container">
		<div class="page-header">
			<h1>
				Hot Books <small>Just Now</small>
			</h1>
		</div>
		<div class="row">
			<div class="col-xs-6 col-md-4">
				<img src="assets/img/book_thumb.jpg" alt="book_thumb.jpg"
					class="img-thumbnail img-responsive book_thumb center-block">
				<h6>&nbsp;</h6>
				<h4 class="text-center">JAVA SPEED LEARN</h4>
				<h5 class="text-center">Nobody</h5>

			</div>
			<div class="col-xs-6 col-md-4">
				<img src="assets/img/book_thumb.jpg" alt="book_thumb.jpg"
					class="img-thumbnail img-responsive book_thumb center-block">
				<h6>&nbsp;</h6>
				<h4 class="text-center">JAVA SPEED LEARN</h4>
				<h5 class="text-center">Nobody</h5>
			</div>
			<div class="col-xs-6 col-md-4">
				<img src="assets/img/book_thumb.jpg" alt="book_thumb.jpg"
					class="img-thumbnail img-responsive book_thumb center-block">
				<h6>&nbsp;</h6>
				<h4 class="text-center">JAVA SPEED LEARN</h4>
				<h5 class="text-center">Nobody</h5>
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