<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='zh-CN'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Input File Test</title>
<link type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/assets/css/index.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/assets/css/testInput.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include flush="true" page="nav.jsp"></jsp:include>
	<div class="hero-background"
		style="background-image:url(${pageContext.request.contextPath}/assets/img/te.jpg)">
		<div class="container" style="padding-top: 70px">
			<div class="bs-example">
				<form accept-charset="UTF-8" action="testInput" method="post"
					enctype="multipart/form-data" class="form-horizontal" id="formImg">
					<div class="form-group">
						<label for="form_file" class="col-sm-2 control-label">更换封面</label>
						<!-- accept="image/*"， accept="image/png, image/jpeg, image/gif, image/jpg"无效 -->
						<div class="col-sm-10">
							<label for="form_file" class="btn btn-primary">选择图片</label>
							<!-- style="display:none"有效, hidden=hidden无效, style="position:absolute;clip:rect(0 0 0 0);"有效 -->
							<input type="file" name="file" id="form_file" accept="image/*"
								style="display: none">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="form_path">文件夹名</label>
						<div class="col-sm-10">
							<input type="text" name="cpath" id="form_path"
								class="form-control form-control-lg input-block"
								value="UserPic">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-10">
							<input type="submit" class="btn btn-success" value="确认">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
	<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
	<script>
	$("#formImg").submit(function () {
		var filePath = $("#form_file").val();
		var fileSize = document.getElementById("fomr_file").files[0].size / 1024;
		if(fileSize > 2048){  
            alert("图片大小不能超过2MB");
            return false;
        }  
	});
	</script>
</body>
</html>


