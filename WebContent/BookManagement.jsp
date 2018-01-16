<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-BookManagement</title>
<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/index.css" rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/users.css" rel="stylesheet">

<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
<script src="/LMS/assets/js/index.js"></script>

<script type="text/javascript">
	$("#divTable").ready(function () {
		var tbody = document.getElementById("records");
		//获得所有商品的数组
		var ListArray = Request.getAttribute("bookList");
		//遍历数组,将商品添加到页面中的列表中
		for (var i = 0; i < ListArray.length; ) {
			//创建tr对象
			var tr = document.createElement("tr");
			//取出一个商品
			var record1 = ListArray[i++];
			//创建td对象
			var td = document.createElement("td");
			td.innerHTML = record1["ISBN"];
			//将td添加到tr中
			tr.appendChild(td);
			var td = document.createElement("td");
			td.innerHTML = record1["Title"];
			tr.appendChild(td);
			var td = document.createElement("td");
			td.innerHTML = record1["Author"];
			tr.appendChild(td);
			var td = document.createElement("td");
			td.innerHTML = record1["Category"];
			tr.appendChild(td);
			var td = document.createElement("td");
			td.innerHTML = record1["Amount"];
			tr.appendChild(td);
			var td = document.createElement("td");
			td.innerHTML = record1["Remain_Amount"];
			tr.appendChild(td);
			tr.appendChild(td);
			var td = document.createElement("td");
			td.innerHTML = record1["Price"];
			tr.appendChild(td);
			//tr添加到表格中
			tbody.appendChild(tr);
		}
	});
</script>

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
			<div class="row">
				<div class="col-md-12">
					<h1>&nbsp;</h1>
					<h2 class="text-center">Book Management</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h1>&nbsp;</h1>
					<div class="row search-group">
						<div class="col-md-2 col-xs-12">
							<button type="button" class="btn btn-default btn-block dropdown-toggle sbutton"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" id="drop_button">
								Title <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li id="Title"><a href="#">Title</a></li>
								<li id="Author"><a href="#">Author</a></li>
								<li id="ISBN"><a href="#">ISBN</a></li>
								<li id="Category"><a href="#">Category</a></li>
							</ul>
						</div>
						<div class="col-md-8 col-xs-12">
							<input type="text" class="form-control" aria-label="...">
						</div>
						<div class="col-md-2 col-xs-12">
							<button type="button" class="btn btn-default btn-block sbutton">Search</button>
						</div>
					</div>
					<h1>&nbsp;</h1>
				</div>
			</div>
			<div class="col-md-12">
				<table class="table table-hover" id="booktable">
					<thead>
						<tr>
							<th>ISBN</th>
							<th>Title</th>
							<th>Author</th>
							<th>Category</th>
							<th>Amount</th>
							<th>Remaining Amount</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody id="bookrecords">
						<tr>
							<td>123456</td>
							<td>Java</td>
							<td>Damon</td>
							<td>Science</td>
							<td>100</td>
							<td>55</td>
							<td>26.5</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3 col-xs-3">
				<a href="Manage.jsp" class="btn btn-primary btn-lg " role="button">Back</a>
			</div>
			<div class="col-md-9 col-xs-9" align="right">
				<a href="AddBook.jsp" class="btn btn-success " role="button">ADD</a>
				<a href="EditBook.jsp" class="btn btn-info " role="button">Edit</a>
				<button type="button" class="btn btn-danger">Delete</button>
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