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
						<form class="bs-example bs-example-form" role="form">
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Name:</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control" id="uname"
										name="name" value="">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="role" class="col-sm-2 control-label">Role:</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control" id="role"
										name="role" value="">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="phone" class="col-sm-2 control-label">Phone:</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control" id="phone"
										name="phone" value="">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="email" class="col-sm-2 control-label">Eamil:</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control" id="email"
										name="email" value="">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="gender" class="col-sm-2 control-label">Gender:</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control" id="gender"
										name="gender" value="">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="address" class="col-sm-2 control-label">Address:</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control" id="address"
										name="address" value="">
								</div>
							</div>
							<h5>&nbsp;</h5>
							<div class="form-group">
								<label for="dob" class="col-sm-2 control-label">Birthday:</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control" id="dob"
										name="dob" value="">
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