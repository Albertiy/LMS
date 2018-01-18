function BookReturn(bid,uid){
	//alert(bid);
	document.location.href="/LMS/BookReturnServlet?backurl="+window.location.href+"&bid="+bid+"&uid="+uid;
}