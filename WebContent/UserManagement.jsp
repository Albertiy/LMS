<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "cn.niit.lms.manage.UserManage" language="java" %>
<%@ page import = "cn.niit.lms.manage.BorrowDetail" language="java" %>
<%@ page import = "java.sql.*" language="java"  %>
<%@page import="cn.niit.lms.domain.User" language="java"%>
<%  System.out.println("---UserManagement.jsp 开始加载---"); 
	ResultSet rs = UserManage.getRS(); %>
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
<title>LMS-UserManagement</title>
<link type="text/css" href="/LMS/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="/LMS/assets/css/index.css" rel="stylesheet">
<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
<script src="/LMS/assets/js/index.js"></script>
<script type="text/javascript" src="/LMS/assets/js/usermanagement.js"></script>
<script type="text/javascript" src="/LMS/assets/js/ManageSearch.js"></script>
</head>
			<style>
			.div-a{filter:alpha(Opacity=50);-moz-opacity:0.5;opacity:0.5}
			</style>
<body>
	<jsp:include flush="true" page="nav.jsp"></jsp:include>
	<div class="hero-background" style="background:url(${pageContext.request.contextPath}/assets/img/te.jpg);" >
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>&nbsp;</h1>
					<h2 class="text-center" >User Management</h2>
				</div>
			</div>
			<h1>&nbsp;</h1>
			<div class="row">
				<div class="col-md-12">
					<div class="row search-group">
						<div class="col-md-2 col-sm-2 col-xs-12 div-a" >
							<button type="button" class="btn btn-default btn-block dropdown-toggle sbutton"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" id="drop_button"> Name <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" id="search_type">
								<li id="uName"><a >Name</a></li>
								<li id="Email"><a >E-mail</a></li>
								<li id="Phone"><a >Phone</a></li>
							</ul>
						</div>
						<div class="col-md-8 col-sm-7 col-xs-12  div-a" >
							<input type="text" id="search_type1" hidden value="uName">
							<input type="text" id="search_info" class="form-control" aria-label="..." maxlength="50" title="最大长度不要超过50字符">
						<!-- 	<input type="text" class="form-control" aria-label="...">   -->
						</div>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<button type="button" class="btn btn-info btn-block sbutton" onclick="Search()" >Search</button>
						</div>
					</div>
					<h1>&nbsp;</h1><br></br>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="height:315px; overflow:auto">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Name</th>
								<th>Gender</th>
								<th>PWD</th>
								<th>Role</th>
								<th>Phone</th>
								<th>E-mail</th>
								<th>Address</th>
								<th>Birthday</th>
								<th>Fine</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<% int i = 0;
							while(rs.next()){  i++;
						%>
							<tr>
							<%if(!rs.getString("role").equals("l")) {%>
								<td><%=rs.getString("uname") %></td>
								<%if(rs.getInt("gender")==1){ %>
									<td>Man</td>
								<%} else { %>
									<td>Woman</td>
								<%} %>
								<td><%=rs.getString("pwd") %></td>
								<%if(rs.getString("role").equals("s")){ %>
									<td>Student</td>
								<%} else { %>
									<td>Teacher</td>
								<%} %>
								<td><%=rs.getString("phone") %></td>
								<td><%=rs.getString("email") %></td>
								<td><%=rs.getString("address") %></td>
								<td><%=rs.getString("dob") %></td>
								<!-- 每刷出一行数据就要打开对应UID的BorrowDetaill 计算总fine -->
								
								<%  
								String r= rs.getString("UID");
								System.out.println("--计算用户 "+r+" 的罚金Fine--");
								ResultSet rsfine = BorrowDetail.RS(r); 
								int f = 0;
								while(rsfine.next()){
									f += rsfine.getInt("Fine");
								}
								System.out.println("--Fine计算完成--");
								rsfine.close();
								%>		
								<%if (f > 0){ %>
									<td><b><font color = red><%=f %></font></b></td>
								<%} else { %>
									<td><%=f %></td>
								<%} rsfine.close(); %>
								<td><input value=<%=rs.getInt("UID") %> type="radio" name="radioname"/></td>
								
							</tr>
					 	<%} }%> 
					 	<%if(i==0){%>
					 	<script type="text/javascript" language="javascript">
								alert("No search for this user");
								window.document.location.href="UserManagement.jsp";
						</script>
						<%} %>
					 	<% rs.close(); System.out.println("--清理成功--"); %> 
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-xs-3">
					<a href="Manage.jsp" class="btn btn-primary btn-lg " role="button" >Back</a>
				</div>
				<div class="col-md-9 col-xs-9" align="right">
					<a class="btn btn-info " role="button" onclick="ModifyPWD()" >ModifyPWD</a>
					<a class="btn btn-success " role="button" onclick="getRadioValue()">BorrowDetail</a> 
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include flush="true" page="footer.jsp"></jsp:include>
</html>
<% System.out.println("---UserManagement.jsp 加载完成---"); %>
<% System.out.println("--------------------------------------"); %>