<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import = "cn.niit.lms.dao.*" language="java" %>
	<%@ page import = "java.sql.*" language="java"  %>
	<%  ResultSet rs = BookDao.readbook(); %>
	<!DOCTYPE html>
	<html lang='zh-CN'>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>LMS-BookManagement</title>
		<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link type="text/css" href="/LMS/assets/css/index.css" rel="stylesheet">
		<link type="text/css" href="/LMS/assets/css/users.css" rel="stylesheet">

		<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
		<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
		<script src="/LMS/assets/js/index.js"></script>
		<script src="/LMS/assets/js/DeleteBook.js"></script>
		<script src="/LMS/assets/js/EditBook.js"></script>
		<script src="/LMS/assets/js/SingleBook.js"></script>
		<script>
			$(document).ready(function () {
				console.log('<%=request.getAttribute("message")%>');
				<% String message=(String)request.getAttribute("message");
					if(message=="done"){
				%>
					alert("Book has been deleted!");
				<%
					}else if(message=="unexist"){
				%>
					alert("This book is not in DataBase");
				<%
					}else if(message=="notequal"){
				%>
					alert("This book has not been cleared");
				<% 
					}else if(message=="not done"){
				%>
					alert("Delete failed");
				<%	
					};
				%>
				
			});
		</script>
	</head>

	<body>
		<nav id="top_navbar" class="navbar navbar-default  navbar-fixed-top">
			<!-- 白色导航条是 navbar-default navbar-fixed-top让导航条固定在顶部，static-top为默认-->
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
							<a id="about" href="about.jsp">***</a>
						</li>
						<li>
							<a id="contact" href="contact.jsp">***</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a id="users" href="users.jsp">Role</a>
						</li>
						<!-- 角色类型从数据库读取 -->
						<li>
							<a id="logout" href="index.jsp">Log out</a>
						</li>
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
								<button type="button" class="btn btn-default btn-block dropdown-toggle sbutton" data-toggle="dropdown" aria-haspopup="true"
								 aria-expanded="false" id="drop_button">
									Title
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li id="Title">
										<a href="#">Title</a>
									</li>
									<li id="Author">
										<a href="#">Author</a>
									</li>
									<li id="ISBN">
										<a href="#">ISBN</a>
									</li>
									<li id="Category">
										<a href="#">Category</a>
									</li>
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
								<th></th>
							</tr>
						</thead>
						<tbody id="bookrecords">
							
							<%while(rs.next()){ %>  
							<tr>
								<td><%=rs.getString("ISBN") %></td>
								<td><%=rs.getString("Title") %></td>
								<td><%=rs.getString("Author") %></td>
								<td><%=rs.getString("Category") %></td>
								<td><%=rs.getInt("Amounts") %></td>
								<td><%=rs.getInt("Remain_Amounts") %></td>
								<td><%=rs.getFloat("Price") %></td>
								<td>
									<input value=<%=rs.getString("ISBN") %> 
										type="radio" name="radio" id="radio"/>
								</td>
								
							</tr>
					 		<%} %>
					 		<% System.out.println("BookManagement数据插入成功"); %> 
					 		<% rs.close(); %>
					 		<% System.out.println("BookManagementd rs.close()"); %> 
						</tbody>
					</table>
				</div>
				<div class="col-md-3 col-xs-3">
					<a href="Manage.jsp" class="btn btn-primary " role="button">Back</a>
				</div>
				<div class="col-md-9 col-xs-9" align="right">
					<button type="button" class="btn btn-info" id="" onclick="singlegetRadioValue()">Details</button>
					<a href="AddBook.jsp" class="btn btn-success " role="button">ADD</a>
					<button type="button" class="btn btn-info" id="" onclick="editgetRadioValue()">Edit</button>
					<button type="button" class="btn btn-danger" id="" onclick="deletegetRadioValue()">Delete</button>
				</div>

			</div>
		</div>
	</body>
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

	</html>