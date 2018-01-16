<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-EditBook</title>
<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/index.css" rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/users.css" rel="stylesheet">

<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>

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
			
			<h1 style="text-align: center">Edit Book</h1>
			<div style="padding: 20px 100px 10px;">
				<form class="bs-example bs-example-form" role="form" action="AddBookServlet">
				<!-- 书籍的具体信息根据要编辑的ISBN号从数据库检索 -->
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
							<button type="button" class="btn btn-default btn-block dropdown-toggle sbutton"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" id="drop_button">
								Science <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li id="Science"><a href="#">Science</a></li>
								<li id="Math"><a href="#">Math</a></li>
								<li id="Art"><a href="#">Art</a></li>								
								<li id="Ohters"><a href="#">Others</a></li>
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
							<label class="form-label f5">Cover</label>
						</dt>
						<dd>
							<img src="${pageContext.request.contextPath}/assets/img/te.jpg" alt="book_thumb.jpg"
								class="book_thumb ">
							<!-- 图片根据ISBN号在数据库检索 -->
							<input id="fileId1" type="file" accept="image/*	" name="file" />
						</dd>
					</dl>
				</form>


				<div class="row">
					<div class="col-md-3 col-xs-3">
						<a href="BookManagement.jsp" class="btn btn-primary" role="button">Back</a>
					</div>
					<div class="col-md-9 col-xs-9" align="right">
						<a href="#" class="btn btn-success " role="button">Confirm</a>
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

</html>