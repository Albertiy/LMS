<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/assets/css/index.css"
	rel="stylesheet">
<script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
<script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
<script>
$(document).ready(function () {
console.log("modal");
$('#myModal').modal('show');
});
</script>
</head>
<body>
	<jsp:include flush="true" page="nav.jsp"></jsp:include>
	<div class="hero-background"
		style="background-image:url(${pageContext.request.contextPath}/assets/img/te.jpg)">
		<div class="container" style="padding-top: 70px">
			<div class="bs-example">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target=".bs-example-modal-sm">Small modal</button>

				<div class="modal fade bs-example-modal-sm in" id="myModal" tabindex="-1"
					role="dialog" aria-labelledby="mySmallModalLabel" style="top: 50px">
					<div class="modal-dialog modal-sm" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">...</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>