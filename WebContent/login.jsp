<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.niit.lms.domain.User" language="java"%>
    <% if(session.getAttribute("backUrl") == null){
        session.setAttribute("backUrl", request.getHeader("Referer"));
        System.out.println("login.jsp: "+request.getHeader("Referer"));
    }else{
    	System.out.println("Abbribure - login.jsp: "+session.getAttribute("backUrl"));
    } %>
	<!DOCTYPE html>
	<html lang='zh-CN'>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>LMS-Login</title>
		<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link type="text/css" href="/LMS/assets/css/login.css" rel="stylesheet">
		<link type="text/css" href="/LMS/assets/css/footer.css" rel="stylesheet">
	</head>

	<body>
		<jsp:include flush="true" page="nav.jsp"></jsp:include>

		<h1>&nbsp;</h1>
		<div class="out-container">
			<div class="container-lg p-responsive position-relative">
				<div class="d-md-flex flex-items-center gutter-md-spacious">
					<div class="col-md-7 text-center text-md-left">
						<h1>Welcome back!</h1>
					</div>
					<div class="mx-auto col-sm-8 col-md-5 hide-sm out-contain-form">

						<div class="bg-white constrain p-03 shadow-lg">
							<div class="bg-white panel-border p-03">
								<div class="bg-white panel-border py-4 px-4">
									<div class="contain-form">
										<form accept-charset="UTF-8" action="Login" autocomplete="off" method="post">
											<p>&nbsp;</p>
											<dl class="form-group">
												<dt class="input-label">
													<label class="form-label f5" for="input_email">Email</label>
												</dt>
												<dd>
													<input type="email" name="email" id="input_email" required class="form-control form-control-lg input-block js-email-notice-trigger"
													 placeholder="you@example.com">
												</dd>
											</dl>
											<dl class="form-group">
												<dt class="input-label">
													<label class="form-label f5" for="input_pwd">Password</label>
												</dt>
												<dd>
													<input type="password" name="pwd" id="input_pwd" required class="form-control form-control-lg input-block" placeholder="Enter your password">
												</dd>
											</dl>
											<% if(request.getAttribute("warn")!=null && (boolean)request.getAttribute("warn")){%>
												<div class="alert alert-danger" role="alert">Email or Password is wrong.</div>
												<%}else{%>
												<p>&nbsp;</p>
												<%}%>
													<button class="btn btn-primary btn-large btn-block" type="submit">Login In</button>
													<a type="button" class="btn btn-link pull-right" href="signup.jsp">Sign up now</a>
										</form>
										<p>&nbsp;</p>
										<p>&nbsp;</p>
										<p>&nbsp;</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<jsp:include flush="true" page="footer.jsp"></jsp:include>

		<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
		<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function () {

			});                
		</script>
	</body>

	</html>