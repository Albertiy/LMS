<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "cn.niit.lms.manage.BorrowDetail" language="java" %>
<%@ page import = "java.sql.*" language="java"  %>
<%@page import="cn.niit.lms.domain.User" language="java"%>
<% String uid = request.getParameter("uid");%>
<% System.out.println("---BorrowDetail.jsp 开始加载---");  ResultSet rs = BorrowDetail.RS(uid); %>

<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-BorrowDetail</title>
<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/index.css" rel="stylesheet">
<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
<script src="/LMS/assets/js/index.js"></script>
<script type="text/javascript" src="/LMS/assets/js/BorrowDetail.js"></script>

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
	<div class="hero-background"  style="background:url(${pageContext.request.contextPath}/assets/img/te.jpg)">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>&nbsp;</h1>
					<h1>&nbsp;</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover" id="BorrowDetailTable">
					<%int fine = 0;%>
						<thead>
							<tr>
								<th>ISBN</th>
								<th>Title</th>
								<th>Author</th>
								<th>Category</th>
								<th>Borrow Date</th>
								<th>Limit Date</th>
								<th>Fine</th>
								<th>Appointment</th>
								<th></th><th></th>
							</tr>
						</thead>
						<tbody>
							<%while(rs.next()){ %>  
							<tr>
								<td><%=rs.getString("ISBN") %></td>
								<td><%=rs.getString("title") %></td>
								<td><%=rs.getString("author") %></td>
								<td><%=rs.getString("category") %></td>
								<td><%=rs.getString("Borrow_Date") %></td>
								<td><%=rs.getString("Limit_Date") %></td>
								<!-- 计算总罚金fine -->
								<%fine += rs.getInt("Fine"); 
								if (rs.getInt("Fine")>0){
								%>
								<td><b><font color = red><%=rs.getInt("Fine") %></font></b></td>
								<%} else { %>
								<td><%=rs.getInt("Fine") %></td>
								<!-- 如果书处于预约状态 -->
								<%} if(rs.getInt("State")==0){%>
								<td><b><font color = red>Incomplete</font></b></td>
								<td >
								<button value=<%=rs.getInt("BID")%> name="breturn" class="btn btn-warning btn-xs" type="button" 
								onclick="SubmitBook(this.value,<%=uid%>)">Submit</button>
								</td>
								<td>
								<button value=<%=rs.getInt("BID")%> name="breturn" class="btn btn-danger btn-xs" type="button" 
								onclick="BookReturn(this.value,<%=uid%>)">Cancel</button>
								</td>
								<!-- 如果罚金不为零 -->
								<% } if(rs.getInt("State")!=0&&rs.getInt("Fine")!=0){ %>
								<td><b><font color = green>Completed</font></b></td>
								<td ><button value=<%=rs.getInt("BID")%> name="breturn" class="btn btn-success btn-xs" type="button" 
								onclick="BookReturn(this.value,<%=uid%>)">ClearR</button></td><td></td>
								<% } if(rs.getInt("State")!=0&&rs.getInt("Fine")==0) { %>
								<td><b><font color = green>Completed</font></b></td>
								<td ><button value=<%=rs.getInt("BID")%> name="breturn" class="btn btn-info btn-xs" type="button" 
								onclick="BookReturn(this.value,<%=uid%>)">Return</button></td><td></td>
								<%} %>
							</tr>
					 		<%} %> 
					 	<% rs.close(); System.out.println("--清理成功--"); %> 
						</tbody>
						<tfoot>
							<tr>
								<td></td><td></td><td></td><td></td>
								<td></td><td></td><td></td>
								<th> Total Fine :</th>
								<%if (fine > 0){ %>
									<td><b><font color = red><%=fine %></font></b></td>
								<%}  else {%>
									<td><%=fine %></td>
								<%} %>
								<%BorrowDetail.setfine(fine);%>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-xs-3">
					<a href="UserManagement.jsp" class="btn btn-primary btn-lg " role="button">Back</a>
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
<% System.out.println("---BorrowDetail.jsp 加载完成---"); %>
<% System.out.println("--------------------------------------"); %>