<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.niit.lms.domain.User" language="java"%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-Search</title>
</head>
<body>
	<nav id="top_navbar" class="navbar navbar-default  navbar-fixed-top">
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
				</ul>
				<!-- 显示Role和名称 -->
				<%  System.out.println("[nav.jsp]: Include the nav bar!");
                String userInfo="";
                if (session.getAttribute("user") == null) {%>
				<ul class="nav navbar-nav navbar-right">
					<li><a id="login" href="login.jsp">Login In</a></li>
					<li><a id="signup" href="signup.jsp">Sign Up</a></li>
				</ul>
				<%}else{
                    String role= ((User)session.getAttribute("user")).getRole();
                    switch(role){
                    default: role = "Student";userInfo="Users.jsp";break;
                    case "t": role = "Teacher";userInfo="Users.jsp";break;
                    case "l": role = "Librarian";break;
                    case "a": role = "Admin";break;
                    }
                %>
				<ul class="nav navbar-nav navbar-right">
					<li><a id="user" href="<%=userInfo %>"><strong><%=role %>
								| ${sessionScope.user.getUname()}</strong></a></li>
					<li><a id="logout" href="Logout">Login Out</a></li>
				</ul>
				<%}%>
			</div>
		</div>
	</nav>
</body>
</html>