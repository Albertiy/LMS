<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.niit.lms.domain.User" language="java"%>
<% User user = (User)session.getAttribute("user");
   if(user!=null){
	   if(!user.getRole().equals("l")&&!user.getRole().equals("a")){
		   System.out.println("[AuthorityUser]: 来者不是Librarian或Admin！");
		   response.sendRedirect(request.getContextPath()+"/index.jsp");
		   return;
	   }
   }else{
	   System.out.println("[AuthorityUser]: 尚未登录！");
	   response.sendRedirect(request.getContextPath()+"/login.jsp");
       return;
   }
%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-Manage</title>
<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/manage.css" rel="stylesheet">

 <link type="text/css" href="/LMS/assets/css/index.css" rel="stylesheet"> 
<link type="text/css" href="/LMS/assets/css/users.css" rel="stylesheet">
</head>
<body>
	<!-- <jsp:include flush="true" page="AuthorityManager.jsp"></jsp:include> -->
	<jsp:include flush="true" page="nav.jsp"></jsp:include>
	<div class="hero-background"
		style="background:url(${pageContext.request.contextPath}/assets/img/te.jpg)">
		<div class="container"> 
			<div class="row">
				<div class="col-md-12">
					<h1>&nbsp;</h1>
					<br></br><br></br><br></br>
					<h2 class="text-center">Librarain Management</h2>
				</div>
			</div>
			<h1>&nbsp;</h1>
			<br></br><br></br>
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
						<button type="button" class="btn btn-primary btn-lg btn-block">Manage Books</button>
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