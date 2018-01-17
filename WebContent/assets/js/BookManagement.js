/**
 * 
 */
function getRadioValue(){
//	alert("1");
	var radios = document.getElementsByName("radio");
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
		alert("Please select one book!");
	}
	else{
		//跳转+传参
		window.location.href="/LMS/DeleteBookServlet?ISBN="+val;
		
	}
}