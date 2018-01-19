//未使用
$(document).ready(function(){
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
				alert("Please choose one");
			}
			else{
					window.location.href=getPath()+"login.jsp";
					//alert("ISBN: "+val);
				}
		};
		
		function getPath() {
			var pathName = document.location.pathname;
			var index = pathName.substr(1).indexOf("/");
			var result = pathName.substr(0, index + 1);
			return result;
		};
});
