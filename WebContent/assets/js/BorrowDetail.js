
function BookReturn(){
   
	alert(1);
	var uids = document.getElementByName("breturn");
	alert("2");
	var uid;
	alert("3");
	for(var i=0;i<uids.length;i++){
		if(uids[i].clicked){
			uid = uids[i].value;
			break;
		}
	}
	alert(uid);
}