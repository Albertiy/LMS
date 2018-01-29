/**
 * 
 */
function modifyinfo() {
	var rs = document.querySelectorAll("input[readonly='readonly']");
	for (var i = 0; i < rs.length; i++) {
		rs[i].readOnly = false;
	}
	var rs1 = document.querySelectorAll("input[disabled='disabled']");
	for (var i = 0; i < rs1.length; i++) {
		rs1[i].disabled = false;
	}
	var btn =document.getElementById("modify");  
    btn.style.display="none"; 
    var btn1 =document.getElementById("confirm");  
    btn1.style.display="block"; 
};
