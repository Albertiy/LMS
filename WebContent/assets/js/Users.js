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

};
