function getRadioValue(){
//	alert("1");
	var radios = document.getElementsByName("radioname");
//	alert("2");
	var val;
//	alert("3");
	//循环有问题//已解决
	for(var i=0;i<radios.length;i++){
		if(radios[i].checked){
			val = radios[i].value;
			break;
		}
	}
	if(val==null){
		alert("Please check one");
	}
	else{
		//跳转+传参
		window.location.href="BorrowDetail.jsp?backurl="+window.location.href+"&uid="+val;
	}
}

//var value = $('input:radio[name="radioname"]:checked').val();
