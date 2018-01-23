<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.niit.lms.domain.User" language="java"%>
<%@page import="cn.niit.lms.service.BookSearchService" language="java"%>
<%@page import="java.util.ArrayList" language="java"%>
<%@page import="cn.niit.lms.domain.Book" language="java" %>
<% session.removeAttribute("backUrl");
System.out.println("[index.jsp]: delete backUrl");%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LMS-Index</title>
<link type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/assets/css/index.css"
	rel="stylesheet">
</head>
<body>
<jsp:include flush="true" page="nav.jsp"></jsp:include>
    
	<div class="hero-background"
		style="background-image:url(${pageContext.request.contextPath}/assets/img/te.jpg)">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>&nbsp;</h1>
					<h2 class="text-center">Welcome</h2>
					<h3 class="text-center">To</h3>
					<h2 class="text-center">NIIT Online Library</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
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
							<input type="text" id="search_info" class="form-control" aria-label="..." maxlength="50" title="最大长度不要超过50字符">
						</div>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<button type="button" class="btn btn-default btn-block sbutton" onclick="goSearch()">Search</button>
						</div>
					</div>
					<h1>&nbsp;</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="page-header">
			<h1>
				Hot Books <small>Just Now</small>
			</h1>
		</div>
		<div class="row">
		<% BookSearchService bsservice = new BookSearchService();
		   ArrayList<Book> hotBooks = bsservice.hotBook(3);
		   if(hotBooks!=null&&!hotBooks.isEmpty()){
			   for (Book b : hotBooks) { %>
			<div class="col-xs-6 col-md-4">
				<img
					src="${pageContext.request.contextPath}/assets/img/book_thumb.jpg"
					alt="book_thumb.jpg"
					class="img-thumbnail img-responsive book_thumb center-block">
				<h6>&nbsp;</h6>
				<h4 class="text-center"><%=b.getTitle() %></h4>
				<h5 class="text-center"><%=b.getAuthor() %></h5>
				<h5 class="text-center"><%=b.getISBN() %></h5>
			</div>
			<%}}else{ %>
			<h3 style="color:red">Get Hot Books Failed!</h3>
			<%} %>
		</div>
	</div>
	<h1>&nbsp;</h1>
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
</body>
</html>