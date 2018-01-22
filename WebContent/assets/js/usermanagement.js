function getRadioValue(){
	var radios = document.getElementsByName("radioname");
	var val;
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
};
//var value = $('input:radio[name="radioname"]:checked').val();


function ModifyPWD(){
	var radios = document.getElementsByName("radioname");
	var val;
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
	else {
		var PWD = prompt("New PassWord: ");
		// 如果新密码不为空
		if(PWD!=null&&PWD != ""){
			alert("This is A Test"+PWD);
		}
		if(PWD!=null&&PWD == "")
		{
			alert("New password can not be empty!");
		}
	}
};