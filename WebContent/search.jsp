<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" language="java"%>
<%@page import="cn.niit.lms.domain.User" language="java"%>
<%@page import="cn.niit.lms.domain.Book" language="java"%>
<% session.removeAttribute("backUrl");
System.out.println("search.jsp delete backUrl");%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-Search</title>
<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/index.css" rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/users.css" rel="stylesheet">
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
					<li><a id="about" href="about.jsp">***</a></li>
					<li><a id="contact" href="contact.jsp">***</a></li>
				</ul>
				<!-- 显示Role和名称 -->
				<%if (session.getAttribute("user") == null) {%>
					<ul class="nav navbar-nav navbar-right">
						<li><a id="login" href="login.jsp">Login In</a></li>
						<li><a id="signup" href="signup.jsp">Sign Up</a></li>
					</ul>
					<%}else{
						String role= ((User)session.getAttribute("user")).getRole();
						switch(role){
						default: role = "Student";break;
						case "t": role = "Teacher";break;
						case "l": role = "Librarian";break;
						case "a": role = "Admin";break;
						}
					%>
					<ul class="nav navbar-nav navbar-right">
						<li><a id="user" href=""><strong><%=role %> | ${sessionScope.user.getUname()}</strong></a></li>
						<li><a id="logout" href="Logout">Login Out</a></li>
					</ul>
					<%}%>
			</div>
		</div>
	</nav>
	<div class="hero-background">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>&nbsp;</h1>
					<h1>&nbsp;</h1>
					<div class="row search-group">
						<div class="col-md-2 col-sm-2 col-xs-12">
							<button type="button"
								class="btn btn-default btn-block dropdown-toggle sbutton"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" id="drop_button">
								Title <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" id="search_type">
								<li id="Title"><a>Title</a></li>
								<li id="Author"><a>Author</a></li>
								<li id="ISBN"><a>ISBN</a></li>
								<li id="Category"><a>Category</a></li>
							</ul>
						</div>
						<div class="col-md-8 col-sm-7 col-xs-12">
							<input type="text" id="search_type1" hidden value="Title">
							<input type="text" id="search_info" class="form-control"
								aria-label="..." maxlength="50" title="最大长度不要超过50字符">
						</div>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<button type="button" class="btn btn-default btn-block sbutton"
								onclick="goSearch()">Search</button>
						</div>
					</div>
					<h1>&nbsp;</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<%
                                ArrayList<Book> bookList = (ArrayList<Book>) request.getAttribute("bookList");
                                if (bookList != null && !bookList.isEmpty()) {%>
					<table class="table table-hover">
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
						<tbody>
							<% for (Book b : bookList) {
							%>
							<tr>
								<td><%=b.getISBN()%></td>
								<td><%=b.getTitle()%></td>
								<td><%=b.getAuthor()%></td>
								<td><%=b.getCategory()%></td>
								<td><%=b.getAmount()%></td>
								<td><%=b.getRemain_Amount()%></td>
								<td><%=b.getPrice()%></td>
								<td><input value=<%=b.getISBN()%> type="radio"
									name="radioname" /></td>
							</tr>
							<% } %>
						</tbody>
					</table>
					<% } else { %>
					<h1 style="width:100%; text-align:center; color:red">No result!</h1>
					<% } %>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-xs-3">
					<a href="#" class="btn btn-primary btn-lg" role="button">Back</a>
				</div>
				<div class="col-md-9 col-xs-9" align="right">
					<a class="btn btn-info" role="button" onclick="getRadioValue()">Reserve</a>
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
<script src="/LMS/assets/js/index.js"></script>
<script src="/LMS/assets/js/search.js"></script>
</html>