function BookReturn(bid){
	alert(bid);
	document.location.href="/LMS/BookReturnServlet?backurl="+window.location.href+"&bid="+bid;
}