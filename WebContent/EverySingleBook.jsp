<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page import = "cn.niit.lms.dao.*" language="java" %>
<%@ page import = "java.sql.*" language="java"  %>
<%@ page import = "cn.niit.lms.dao.SingleBookDao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "cn.niit.lms.domain.*" %>

<%  	String ISBN = request.getParameter("ISBN");
		System.out.println("ISBN in EverySingleBook.jsp:"+ISBN);
		ArrayList<SingleBook> test = new ArrayList<SingleBook>();
		if(ISBN==null){
		ISBN = (String)request.getAttribute("ISBN");
		System.out.println("ISBN in if:"+ISBN);
		test = SingleBookDao.readsingleBook(ISBN);
		System.out.println("EverySingleBook when ISBN==null: "+test.size());
		}else{
			System.out.println("ISBN in EverySingleBook.jsp when ISBN!= null:"+ISBN);
			test = SingleBookDao.readsingleBook(ISBN);
			System.out.println("EverySingleBook when ISBN !=null: "+test.size());
		}
		
	%>	
	<!DOCTYPE html>
	<html lang='zh-CN'>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>LMS-DetailsBook</title>
		<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link type="text/css" href="/LMS/assets/css/index.css" rel="stylesheet">
		<link type="text/css" href="/LMS/assets/css/users.css" rel="stylesheet">

		<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
		<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
		<script src="/LMS/assets/js/SingleBook.js"></script>
		
		<script>
			$(document).ready(function () {
				console.log('<%=request.getAttribute("message")%>');
				<% String message=(String)request.getAttribute("message");
					if(message=="delete done"){
				%>
					alert("SingleBook has been deleted!");
				<%
					}else if(message=="borrwed"){
				%>
					alert("This book has been borrowed");
				
				<% 
					}else if(message=="delete not done"){
				%>
					alert("Delete failed");
					<% 
					}else if(message=="add done"){
				%>
					alert("Add failed");
					<% 
					}else if(message=="add not done"){
				%>
					alert("Add failed");
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
				<h1>&nbsp;</h1>
			
			<h1 style="text-align: center">Every Single Book</h1>
			<div style="padding: 20px 100px 10px;">
				<form class="bs-example bs-example-form" id="form-addbook" role="form" >
				<div class="col-md-12">
					<table class="table table-hover" id="booktable">
						<thead>
							<tr>
								<th>ISBN</th>
								<th>BID</th>
								<th>Title</th>
								<th>Author</th>
								<th>Category</th>
								<th></th>
								
							</tr>
						</thead>
						<tbody id="SingleBookrecords">
							<%for (SingleBook sb : test){ %>  
							<tr>
								<td><%=sb.getISBN() %></td>
								<td><%=sb.getBID() %></td>
								<td><%=sb.getTitle() %></td>
								<td><%=sb.getAuthor() %></td>
								<td><%=sb.getCategory() %></td>
								
								<td>
									<input value=<%=sb.getBID()%> 
										type="radio" name="radio" id="radio"/>
								</td>
								
							</tr>
							<tr>
								<td>
									<input type="text" value=<%=sb.getISBN()%> name="ISBN" id="ISBN" hidden="hidden"/>
								<td/>
							</tr>
							
					 		<%	
					 			} 
					 		%>
					 		<% System.out.println("EverySingleBook数据插入成功"); %> 
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-md-3 col-xs-3">
						<a href="BookManagement.jsp" class="btn btn-primary" role="button">Back</a>
					</div>
					<div class="col-md-9 col-xs-9" align="right">
						<button type="button" class="btn btn-success" onclick="prom()">Add</button>
						<button type="button" class="btn btn-danger" onclick="deletesingle()">Delete</button>
					</div>
				</div>
				</form>
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