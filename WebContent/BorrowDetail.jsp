<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-UserManagement</title>
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
					<li><a id="home" href="index.jsp">Home</a></li>
					<li><a id="about" href="about.jsp">***</a></li>
					<li><a id="contact" href="contact.jsp">***</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a id="librarian" href="#">Librarian</a></li>
					<!-- 角色类型从数据库读取 -->
					<li><a id="logout" href="index.jsp">Log out</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="hero-background">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>&nbsp;</h1>
					<h1>&nbsp;</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ISBN</th>
								<th>Title</th>
								<th>Author</th>
								<th>Category</th>
								<th>Borrow Date</th>
								<th>Limit Date</th>
								<th>Fine</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1000001</td>
								<td>Notre-Dame Cathedral</td>
								<td>Victor Hugo</td>
								<td>Literature</td>
								<td>2018-01-01</td>
								<td>2018-04-01</td>
								<td>0</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th> Total Fine :</th>
								<td> 100 </td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-xs-3">
					<a href="UserManagement.jsp" class="btn btn-primary btn-lg active" role="button">Back</a>
				</div>
			</div>
		</div>
	</div>
</body>
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
</html>