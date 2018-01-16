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
	alert(val);
}

//var value = $('input:radio[name="radioname"]:checked').val();
