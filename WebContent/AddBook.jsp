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
<link type="text/css" href="/LMS/assets/css/users.css" rel="stylesheet">
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
					<li><a id="users" href="users.jsp">Role</a></li>
					<!-- 角色类型从数据库读取 -->
					<li><a id="logout" href="index.jsp">Log out</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="hero-background">
		<div class="container">
			<h1>&nbsp;</h1>
			
			<h1 style="text-align: center">Add Book</h1>
			<div style="padding: 20px 100px 10px;">
				<form class="bs-example bs-example-form" role="form">
				
					<dl class="form-group">
						<dt class="input-label">
							<label class="form-label f5">ISBN</label>
						</dt>
						<dd>
							<input type="text" name="ISBN" id="ISBN"
								class="form-control form-control-lg"
								placeholder="Please enter ISBN">
						</dd>
					</dl>
					<br>
					
					<dl class="form-group">
						<dt class="input-label">
							<label class="form-label f5">Title</label>
						</dt>
						<dd>
							<input type="text" name="Title" id="Title"
								class="form-control form-control-lg"
								placeholder="Please enter Title">
						</dd>
					</dl>
					<br>
					
					<dl class="form-group">
						<dt class="input-label">
							<label class="form-label f5">Author</label>
						</dt>
						<dd>
							<input type="text" name="Author" id="Author"
								class="form-control form-control-lg"
								placeholder="Please enter Author">
						</dd>
					</dl>
					<br>
					
					<dl class="form-group">
						<dt class="input-label">
							<label class="form-label f5">Category</label>
						</dt>
						<dd class="btn-group">
							<button type="button" class="btn btn-default">Action</button>
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<span class="caret"></span> 
								<span class="sr-only">Toggle Dropdown</span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>								
								<li><a href="#">Separated link</a></li>
							</ul>
						</dd>
					</dl>
					<br>
					
					<dl class="form-group">
						<dt class="input-label">
							<label class="form-label f5">Price</label>
						</dt>
						<dd>
							<input type="text" name="Price" id="Price"
								class="form-control form-control-lg"
								placeholder="Please enter Price">
						</dd>
					</dl>
					<br>
					
					<dl class="form-group">
						<dt class="input-label">
							<label class="form-label f5">Price</label>
						</dt>
						<dd>
							<input type="text" name="Price" id="Price"
								class="form-control form-control-lg"
								placeholder="Please enter Price">
						</dd>
					</dl>
					<br>
					<dl class="form-group">
						<dt class="input-label">
							<label class="form-label f5">Cover</label>
						</dt>
						<dd>
							<input type="text" name="Price" id="Price"
								class="form-control form-control-lg"
								placeholder="Please enter Price">
						</dd>
					</dl>
				</form>


			<div class="row">

				<div class="col-md-3 col-xs-3">
					<a href="#" class="btn btn-primary btn-lg active" role="button">Back</a>
				</div>
				<div class="col-md-9 col-xs-9" align="right">
					<a href="#" class="btn btn-success active" role="button">ADD</a>
				</div>

			</div>
		</div>
	</div>	
	</div>
</body>
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