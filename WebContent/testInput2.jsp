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
				<form accept-charset="UTF-8" action="testInput2" method="post"
					enctype="multipart/form-data" class="form-horizontal" id="formImg">
					<div class="form-group">
					   <label for="form_ISBN" class="col-sm-2 control-label">ISBN</label>
					   <div class="col-sm-10">
					       <input class="form-control form-control-lg input-block" type="text" id="form_ISBN" name="ISBN" value="1234567890125">
					   </div>
					</div>
					<div class="form-group">
						<label for="form_file" class="col-sm-2 control-label">更换封面</label>
						<!-- accept="image/*"， accept="image/png, image/jpeg, image/gif, image/jpg"无效 -->
						<div class="col-sm-10" id="up_img">
							<label for="form_file" class="btn btn-primary">选择图片</label>
							<!-- style="display:none"有效, hidden=hidden无效, style="position:absolute;clip:rect(0 0 0 0);"有效 -->
							<input type="file" name="file" id="form_file" accept="image/*"
								class="upfile" style="display: none">
							<div id="imglist">
							<img id="singleImg" class="img-thumbnail img-responsive book_thumb center-block" src="" alt="尚未选择图片或图片无效"/>
							</div>
						</div>

					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="form_path">文件夹名</label>
						<div class="col-sm-10">
							<input type="text" name="cpath" id="form_path"
								class="form-control form-control-lg input-block" value="UserPic">
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
	$(function(){
	       function createfile(){
	       $('#upBtn').append("<input type='file'  name='photos' class='upfile'>");
	       }
	       function showimg(url){
	    	   $("#singleImg").attr('src',url); 
	           //var img='<img class="img-thumbnail img-responsive book_thumb center-block" src="'+url+'"/>';
	           //$('#imglist').append(img);//上传多张图片使用，问题在于重新选择图片无法清除之前的选择
	           //$('#imglist').html(img);    //上传单张图片使用，但没有办法放弃上传，决定使用固定的img标签
	       }
	       function addfile(){
	         var file = this.files[0];//上传的图片的所有信息
	         if(file==null){
                 console.log("没有选择图片，清空img的src");
                 showimg("");
	         }
	         console.log(this.files[0]);
	         //首先判断是否是图片，若文件为空则console会报错
	         if(!/image\/\w+/.test(file.type)){
	         alert('上传的不是图片');
	         return false;
	         }
	         //在此限制图片的大小
	         var imgSize = file.size;
	         console.log(imgSize);
	         //35160  计算机存储数据最为常用的单位是字节(B)
	         //在此处我们限制图片大小为2M
	         if(imgSize>2*1024*1024){
	         alert('上传的图片的大于2M,请重新选择');
	         $(this).val('')
	         return false;
	         }
	         //如果还想限制图片格式也可以通过input的accept属相限制，或者file.name属性值做判断
	         //建议使用accept属性，简单，方便。具体可以查看我的另一片文章
	         //将图片信息通过如下方法获得一个http格式的url路径
	         var objUrl = getObjectURL(this.files[0]);
	         console.log(objUrl+'url');
	         //blob:http://127.0.0.1:8020/6bf47c99-496b-4cc4-ae73-27aa06987036url
	         showimg(objUrl)
	           //showimg($(this).val());
	           //$(this).val()本地上传的图片的绝对路径无法实现Img现实的，要将其转换为http格式的路径方能实现显示
	           $(this).hide();
	           //createfile();//上传多张图片时使用，现在只要一次上传
	           $('.upfile').bind('change',addfile);
	       }
	 /*绑定了事件input file的值的改变*/
	 $('.upfile').bind('change',addfile);
	      
	 function getObjectURL(file) {
	   var url = null;
	   if (window.createObjectURL != undefined) { // 
	       url = window.createObjectURL(file);
	   } else if (window.URL != undefined) {
	   //仅简单的验证仅如下的浏览器支持 webkit or chrome ie11 ie10 firefox oprea
	       url = window.URL.createObjectURL(file);
	   } else if (window.webkitURL != undefined) { // webkit or chrome
	       url = window.webkitURL.createObjectURL(file);
	   }
	   return url;
	};
	/*var objUrl = getObjectURL(this.files[0]) ;
	 if (objUrl) {
	           imgSrc.attr("src", objUrl);//给予jquery也可以如此使用
	 }*/
	// URL对象是硬盘（SD卡等）指向文件的一个路径，如果我们做文件上传的时候，想要在图片没有上传服务器端的情况下
	// 看到上传图片的效果图的时候就可是以通过var url=window.URL.createObjectURL(obj.files[0]);
	// 获得一个http格式的url路径，此时候就可以设置到<img src="+url+">中显示了。window.webkitURL和window.URL是一样的，
	// window.URL标准定义，window.webkitURL是webkit内核的实现（一般手机上就是使用这个）。
	});
	</script>
</body>
</html>


