<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.niit.lms.domain.User" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Authority User Code</title>
</head>
<body>
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
</body>
</html>