<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" language="java"%>
<%@page import="cn.niit.lms.domain.User" language="java"%>
<%@page import="cn.niit.lms.domain.Book" language="java"%>
<%@page import="cn.niit.lms.domain.Rule" language="java"%>
<%@page import="cn.niit.lms.service.UserService" language="java"%>
<% session.removeAttribute("backUrl");
System.out.println("[search.jsp]: Delete backUrl");
String logined = "false";
String remain = "false";//可借标记
String reserve = "none";
int totalFine = 0;
if (session.getAttribute("user") != null) {
    logined = "true";
    if(session.getAttribute("rule") != null){
        Rule rule = (Rule)session.getAttribute("rule");
        int amount = ((User)session.getAttribute("user")).getAmount();
        int book_limit = rule.getBook_limit();
        System.out.println("剩余可借："+(book_limit-amount)+" 本");
        if((book_limit-amount)>=1)//大于等于1，可借
            remain = "true";
    }else{
    	System.out.println("未获取到rule！");
    }
    UserService uservice = new UserService();
    totalFine = uservice.getFine(((User)session.getAttribute("user")).getUid());
    System.out.println("[search.jsp]: totalFine: " + totalFine);
    }
if(session.getAttribute("reserve") != null) {
	reserve = (String)session.getAttribute("reserve");
	session.removeAttribute("reserve");
}
%>
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
	<jsp:include flush="true" page="nav.jsp"></jsp:include>
	
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
							<input type="text" id="search_type1" hidden="hidden" value="Title">
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
					<% ArrayList<Book> bookList = (ArrayList<Book>) request.getAttribute("bookList");
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
									name="radioname" <%if(b.getRemain_Amount()<=2){%>hidden=hidden<%}%>></td>
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
					<a href="javascript:history.go(-1)" class="btn btn-primary" role="button">Back</a>
				</div>
				<div class="col-md-9 col-xs-9" align="right">
					<a class="btn btn-info" role="button" onclick="getRadioValue()">Reserve</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include flush="true" page="footer.jsp"></jsp:include>
	<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
<script src="/LMS/assets/js/search.js"></script>
<script>
$(document).ready(function(){
	var reserve = "<%=reserve%>";
	if(reserve == "true"){
		reserve = '${sessionScope.user.getAmount()}';
		alert("Reserve Success! \n Already Borrow: "+reserve);
	}else if(reserve == "false"){
		reserve = '${sessionScope.user.getAmount()}%>';
		alert("Reserve failed! \n Already Borrow: "+reserve);
	}
});
function getRadioValue(){
    //alert("Reserve Button Clicked");
    var radios = document.getElementsByName("radioname");
    var val;
    for(var i=0;i<radios.length;i++){
        if(radios[i].checked){
            val = radios[i].value;
            break;
            }
        }
    if(val==null){
        alert("Please choose one");
    }else{/*登录检测, 标记月用的JSP变量一定要在代码最前面*/
       var logined = '<%=logined%>';
            if(logined=='false'){
                window.location.href=getPath()+"/login.jsp";
			}else{
				var remain = '<%=remain%>';
				if(remain=='true'){
		               var total_fine = '<%=totalFine%>';
		                if(total_fine=='0'){
		                    window.location.href=getPath()+"/Reserve?ISBN="+val;
		                }
		                else{
		                    //此用户有罚金未缴纳
		                    alert("Your account has fine: "+total_fine+". Please return fine first, then you can borrow books.");
		                }
				}
				else{
					//可借书不足
					alert("Your remain borrow amount is 0. You can return some books first.");
				}
			}
		}
	 };

</script>
</body>
</html>