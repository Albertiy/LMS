<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ page import = "cn.niit.lms.domain.*" language="java" %>
	
	<!DOCTYPE html>
	<html lang='zh-CN'>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>LMS-AddBook</title>
		<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link type="text/css" href="/LMS/assets/css/index.css" rel="stylesheet">
		<link type="text/css" href="/LMS/assets/css/users.css" rel="stylesheet">
		<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
		<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
		<script src="/LMS/assets/js/index.js"></script>
		<script src="/LMS/assets/js/dropdown.js"></script>
		<script>
			$(document).ready(function () {
				/*var str = location.href; //取得整个地址栏
				var num=str.indexOf("?") 
				str=str.substr(num+1); //取得所有参数
				if(str=="done")
					alert("Book has been added! ");
					//strs = str.split("="); //用等号进行分隔 （因为知道只有一个参数 所以直接用等号进分隔 如果有多个参数 要用&号分隔 再用等号进行分隔）
					//alert(strs[1]); //直接弹出第一个参数 （如果有多个参数 还要进行循环的）
				//}*/
				//console.log(window.location);
				console.log('<%=request.getAttribute("message")%>');
				<% String message=(String)request.getAttribute("message");
					if(message=="done"){
				%>
					$('#myModal').modal('show');
				<%
					}else if(message=="existed"){
				%>
					alert("ISBN of this Book is exist!");
				<% 
					}else if(message=="not done"){
				%>
					alert("Add failed");
				<%	
					};
				%>
				/*var myurl = GetQueryString("message");
				console.log(myurl);
				if (myurl != null && myurl.toString().length > 1) {
					//if(GetQueryString("message")=="done")
						alert("Book has been added!");
				}*/
			});

			/*function GetQueryString(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return unescape(r[2]);
				return null;
			};*/
		</script>
	<%
	User user = (User)session.getAttribute("user");
	if (user != null) {
		if (!user.getRole().equals("l") && !user.getRole().equals("a")) {
			System.out.println("[AuthorityUser]: 来者不是Librarian或Admin！");
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}
	} else {
		System.out.println("[AuthorityUser]: 尚未登录！");
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}
%>
	</head>

	<body>
		<jsp:include flush="true" page="nav.jsp"></jsp:include>

		<div class="hero-background">
			<div class="container">
				<h1>&nbsp;</h1>

				<h1 style="text-align: center">Add Book</h1>
				<div style="padding: 20px 100px 10px;">
					<form class="bs-example bs-example-form" id="form-addbook" role="form" 
						action="AddBookServlet" method="post">

						<dl class="form-group">
							<dt class="input-label">
								<label class="form-label f5">ISBN</label>
							</dt>
							<dd>
								<input type="text" name="ISBN" id="ISBN" required="required" pattern="^(\d{11}|\d{13})$" title="only numbers length is 11 or 13"
								    oninvalid="setCustomValidity('only numbers length is 11 or 13')" oninput="setCustomValidity('')"
								     class="form-control form-control-lg" placeholder="Please enter ISBN">
							</dd>
						</dl>
						<br>

						<dl class="form-group">
							<dt class="input-label">
								<label class="form-label f5">Title</label>
							</dt>
							<dd>
								<input type="text" name="Title" id="Title" required="required" pattern="([0-9a-zA-Z]){1,50}" title="maxlength is 50" oninvalid="setCustomValidity('maxlength is 50')"
								    oninput="setCustomValidity('')" class="form-control form-control-lg" placeholder="Please enter Title">
							</dd>
						</dl>
						<br>

						<dl class="form-group">
							<dt class="input-label">
								<label class="form-label f5">Author</label>
							</dt>
							<dd>
								<input type="text" name="Author" id="Author" required="required" pattern="^[a-zA-Z]{1,50}$" title="only character maxlength is 50"
								    oninvalid="setCustomValidity('only character maxlength is 50')" oninput="setCustomValidity('')" class="form-control form-control-lg" placeholder="Please enter Author">
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
									Science
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li id="Science"><a href="#">Science</a></li>
									<li id="Math"><a href="#">Math</a></li>
									<li id="Art"><a href="#">Art</a></li>
									<li id="Ohters"><a href="#">Others</a>
									</li>
								</ul>
							</dd>
							<input type="text" name="Category" id="Category" value="Science" hidden>
						</dl>
						<br>

						<dl class="form-group">
							<dt class="input-label">
								<label class="form-label f5">Price</label>
							</dt>
							<dd>
								<input type="text" name="Price" id="Price" required="required" pattern="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" oninvalid="setCustomValidaty=('round to 2 decimal places')"
								    oninput="setCustomValidity('')" class="form-control form-control-lg" placeholder="Please enter Price">
							</dd>
						</dl>
						<br>
						<dl class="form-group">
							<dt class="input-label">
								<label class="form-label f5">Amount</label>
							</dt>
							<dd>
								<input type="number" name="Amount" id="Amount" required="required" min="1" max="1000" class="form-control form-control-lg"
								    placeholder="Please enter Amount">
							</dd>
						</dl>
						<!--  
						<br>
						<dl class="form-group">
							<dt class="input-label">
								<label class="form-label f5">Cover</label>
							</dt>
							<dd>
								<input id="Cover" type="file" accept="image/*" name="Cover" />
							</dd>
						</dl>
						-->
						<div class="row">

							<div class="col-md-3 col-xs-3">
								<a href="BookManagement.jsp" class="btn btn-primary" role="button">Back</a>
							</div>
							<div class="col-md-9 col-xs-9" align="right">
								<button type="submit" class="btn btn-success">Add</button>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class="modal fade bs-example-modal-sm in" id="myModal" tabindex="-1"
					role="dialog" aria-labelledby="mySmallModalLabel" style="top: 50px">
					<div class="modal-dialog modal-sm" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Add Book</h4>
							</div>
							<div class="modal-body">Book has been added!</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
		
	</body>
	<jsp:include flush="true" page="footer.jsp"></jsp:include>


	</html>