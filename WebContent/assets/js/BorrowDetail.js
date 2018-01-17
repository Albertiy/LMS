function BookReturn(bid){
	alert(bid);
	window.location.href="BorrowDetailServlet.java?backurl="+window.location.href+"&bid="+bid;
}