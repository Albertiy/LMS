
	function singlegetRadioValue() {
		//	alert("1");
		var radios = document.getElementsByName("radio");
		//	alert("2");
		var val;
		//	alert("3");
		//循环有问题//已解决	
		for (var i = 0; i < radios.length; i++) {
			if (radios[i].checked) {
				val = radios[i].value;
				break;
			}
		}
		if (val == null) {
			alert("Please select one book!");
		} else {
			//跳转+传参
			console.log("ISBN in SingleBook.js: " + val);
			window.location.href = "/LMS/EverySingleBook.jsp?ISBN=" + val;

		}
	};

	function prom() {
		console.log("in prom()");
		var ISBN= $("#ISBN").val();
		var Amount = prompt("How many books you want to add? ", ""); //将输入的内容赋给变量 amount，
		console.log(Amount);
						//这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值
		if (Amount) { //如果返回的有内容
		//跳转+传参
		console.log("ISBN in SingleBook.js-prom: " + ISBN);
		window.location.href = "/LMS/AddSingleBookServlet?ISBN=" + ISBN + "&Amount=" + Amount;

		} else {
			alert("Please enter number");
		}
	};

function deletesingle() {
	//	alert("1");
	var radios = document.getElementsByName("radio");
	//	alert("2");
	var val;
	//	alert("3");
	//循环有问题//已解决	
	for (var i = 0; i < radios.length; i++) {
		if (radios[i].checked) {
			val = radios[i].value;
			break;
		}
	}
	if (val == null) {
		alert("Please select one book!");
	} else {
		//跳转+传参
		console.log("BID in SingleBook.js: " + val);
		window.location.href = "/LMS/DeleteSingleBookServlet?BID=" + val;

	}
};

