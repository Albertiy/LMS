<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.input_span{

  width: 95%;
  height: 34px;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
       -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
          transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
</style>
<script>
	console.log('<%=request.getAttribute("message")%>');
	<% String message=(String)request.getAttribute("message");
		if(message=="Add done"){
	%>
		alert("Recommend book has been added!");
	<%
		}else if(message=="not done"){
	%>
		alert("add failed");
	<%	
		};
	%>
</script>
</head>
<body>
<form id="Recommend"role="form" action="AddRecommend" method="post">
	<div class="form-group">
		<label for="title" class="col-sm-2 control-label">Title:</label>
		<div class="col-sm-10">
			<input type="text" name="Title" id="Title" required="required" pattern="([0-9a-zA-Z]){1,50}" title="maxlength is 50" 
			oninvalid="setCustomValidity('maxlength is 50')" class="input_span" 
			placeholder="Please enter Title"><span style="color:red">*</span>
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="form-group">
		<label for="author" class="col-sm-2 control-label">Author:</label>
		<div class="col-sm-10">
			<input type="text" name="Author" id="Author"  pattern="^[a-zA-Z]{1,50}$" title="only character maxlength is 50"
				oninvalid="setCustomValidity('only character maxlength is 50')" class="input_span" 
				placeholder="Please enter Author"><span style="color:red">*</span>
		</div>
	</div>
	<h5>&nbsp;</h5>
	<div class="col-md-12 col-xs-12" align="right">
		<button type="submit" class="btn btn-success">Confirm</button>
	</div>
	</form>
</body>
</html>