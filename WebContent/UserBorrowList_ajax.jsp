<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User's borrowlist page</title>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "cn.niit.lms.domain.*" %>
<%@ page import = "cn.niit.lms.dao.*" %>

<%
	User u = (User)session.getAttribute("user");
	int UID= u.getUid();
	ArrayList<BorrowBooks> test = new ArrayList<BorrowBooks>();
	test = BookDao.readBorrowBooks(UID);
%>

</head>
<body>
		<div class="col-md-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>ISBN</th>
						<th>Title</th>
						<th>Author</th>
						<th>Borrow Date</th>
						<th>Return Date</th>
						<th>Fine</th>
						<th>State</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (BorrowBooks bb : test){
							String State = "Reserved";
							if(bb.getState()==1){
								State="Borrowed";
							}
					%>
					<tr>
						<td><%=bb.getISBN() %></td>
						<td><%=bb.getTitle() %></td>						
						<td><%=bb.getAuthor() %></td>
						<td><%=bb.getBorrow_Date() %></td>	
						<td><%=bb.getRuturn_Date() %></td>
						<td><%=bb.getFine()%></td>
						<td><%=State %></td>
					</tr>
					<%} %>
			</tbody>
			</table>
	</div>
</body>
</html>