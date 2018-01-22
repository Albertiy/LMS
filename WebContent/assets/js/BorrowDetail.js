function BookReturn(bid,uid){
	document.location.href="/LMS/BookReturnServlet?backurl="+window.location.href+"&bid="+bid+"&uid="+uid;
}

function SubmitBook(bid,uid) {
	document.location.href="/LMS/SubmitBookServlet?backurl="+window.location.href+"&bid="+bid+"&uid="+uid;
}