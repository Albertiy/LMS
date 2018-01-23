/**
 * 
 */
function modifyinfo() {
	var rs = document.querySelectorAll("input[readonly='readonly']");
	for (var i = 0; i < rs.length; i++) {
		rs[i].readOnly = false;
	}

};
