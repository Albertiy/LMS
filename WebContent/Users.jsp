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

<script type="text/javascript" src="jquery/jquery-3.2.1.js"></script>
<script src="/LMS/assets/js/Users.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#info").click(function(){
			htmlobj=$.ajax({url:"UserInfo_ajax.jsp",async:false});
			$("#showdiv").html(htmlobj.responseText);
		});
		$("#blist").click(function(){
			htmlobj=$.ajax({url:"UserBorrowList_ajax.jsp",async:false});
			$("#showdiv").html(htmlobj.responseText);
		});
		$("#recommend").click(function(){
			htmlobj=$.ajax({url:"UserRecommend_ajax.jsp",async:false});
			$("#showdiv").html(htmlobj.responseText);
		});
		
	});
		
</script> 

		<script>
			$(document).ready(function () {
				console.log('<%=request.getAttribute("message")%>');
				<% String message=(String)request.getAttribute("message");
					if(message=="Add done"){
				%>
					alert("Book has been recommended!");
				<%
					}else if(message=="not done"){
				%>
					alert("Recommend failed");
				<%
					}else if(message=="modify successfully"){
				%>
					alert("UserInfo has been changed");
				<%
					}else if(message=="modify failed"){
				%>
					alert("Modify userinfo failed");
				<%			
					};
				%>
				
				
			});
			
		</script>

<%@ page import = "cn.niit.lms.domain.*" %>
<%@ page import = "cn.niit.lms.dao.*" %>

<%
	User u = (User)session.getAttribute("user");
	String name = u.getUname();
	String phone = u.getPhone();
	String role = "Student";
	if(u.getRole()=="t"){
		role = "Teacher";}
	else if(u.getRole() == "l"){
		role = "Librarian";}
	
	String s1="checked";
	String s2="checked";
	if(!u.getGender()){
		s1="";}
	else{
		s2="";
	}
	String email = u.getEmail();
	String address = u.getAddress();
	String dob = u.getDob();
	
	
%>

</head>

<body>
	<jsp:include flush="true" page="nav.jsp"></jsp:include>
	<h1>&nbsp;</h1>
	<div class="hero-background">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<h1>&nbsp;</h1>
					<div class="col-xs-6 col-md-4">
						<ul class="nav nav-pills nav-stacked">
							<li id="info" role="presentation" class="active"><a href="#">Info</a></li>
  							<li id="blist" role="presentation"><a href="#">Borrow List</a></li>
  							<li id="recommend" role="presentation"><a href="#">Recommend</a></li>
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
					//使点击元素变为active
					    			this.classList.add("active");
					    		});
						});
					</script>
					
					<div id="showdiv" class="col-xs-12 col-md-8">
						<form class="bs-example bs-example-form" role="form" action="ModifyInfo" method="post">
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Name:</label>
								<div class="col-sm-10">
									<input type="text" readonly="readonly" class="form-control" required maxlength="16" 
										pattern="[^ ]*"	oninvalid="setCustomValidity('maxlength is 16')"
										oninput="setCustomValidity('')"
										id="Name" name="Name" value="<%= name %>">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="role" class="col-sm-2 control-label">Role:</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control" id="role"
										name="role" value="<%= role %>">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="phone" class="col-sm-2 control-label">Phone:</label>
								<div class="col-sm-10">
									<input type="tel" readonly="readonly" class="form-control" id="Phone" maxlength="11"
										oninvalid="setCustomValidity('maxlength is 11')"
										oninput="setCustomValidity('')"
										required name="Phone" value="<%=phone %>">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="email" class="col-sm-2 control-label">Eamil:</label>
								<div class="col-sm-10">
									<input type="email" readonly class="form-control" id="Email"
										name="Email" value="<%= email%>">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="gender" class="col-sm-2 control-label">Gender:</label>
								<div class="col-sm-10">
									<input type="radio" disabled="disabled" name="Gender" id="male"
										value="Male" <%=s1 %>> Male 
									<input type="radio" disabled="disabled" name="Gender" id="female" 
										value="Female" <%=s2 %> > Female
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="address" class="col-sm-2 control-label">Address:</label>
								<div class="col-sm-10">
									<input type="text" readonly="readonly" class="form-control" id="Address"
										required maxlength="50" 
										oninvalid="setCustomValidity('Cannot be null')"
										oninput="setCustomValidity('')"
										name="Address" value="<%= address %>">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="dob" class="col-sm-2 control-label">Birthday:</label>
								<div class="col-sm-10">
									<input type="date" name="Dob" id="Dob" disabled="disabled" required
										class="form-control" value="<%=dob %>">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="row">
								<div class="col-md-12 col-xs-12" align="right">
									<button type="button" id="modify" class="btn btn-primary" onclick="modifyinfo()">Modify</button>
									<button type="submit" class="btn btn-success">Confirm</button>
								</div>
							</div>
						</form>


					</div>
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