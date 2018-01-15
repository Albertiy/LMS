<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-Users</title>
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
	<h1>&nbsp;</h1>
	<div class="hero-background">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<h1>&nbsp;</h1>
					<div class="col-xs-6 col-md-4">
						<ul class="nav nav-pills nav-stacked">
							<li role="presentation" class="active"><a href="#">Info</a></li>
  							<li role="presentation"><a href="#">Borrow List</a></li>
  							<li role="presentation"><a href="#">Fine</a></li>
  							<li role="presentation"><a href="#">Recommend</a></li>
						</ul>
					</div>
					
					<script type="text/javascript">
					//获取所有li的节点
						var items = document.querySelectorAll("li");
					// 可以使用Array.prototype.forEach.call进行遍历
						[].forEach.call(items, function (item) {
					//添加click事件
					    	item.addEventListener("click", function() {
					//遍历所有兄弟节点this.parentNode.children
					    		Array.prototype.forEach.call(this.parentNode.children, function (child) {
					//删除元素的某个class
					    			child.classList.remove("active");})
					    			this.classList.add("active");
					    		});
						});
					</script>
					
					<div class="col-xs-12 col-md-8">
					User Info:
					
					
					</div>
				</div>
			</div>
		</div>
	</div>


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