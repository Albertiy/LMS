<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ISBN = "";
if(request.getParameter("ISBN")!=null){
	ISBN = request.getParameter("ISBN");
}

%>
        <!DOCTYPE html>
        <html lang='zh-CN'>

        <HEAD>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <TITLE> 图像测试:DB</TITLE>
            <link type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link type="text/css" href="${pageContext.request.contextPath}/assets/css/testOutput.css" rel="stylesheet">
        </HEAD>

        <BODY>
            <h1>图像测试:DB —— ISBN=<%=ISBN %></h1>
            <img id="book_thumb" class="img-thumbnail img-responsive book_thumb center-block" src="testOutput2_show.jsp?ISBN=<%=ISBN %>"
                alt="图片无效">
            <div id="div_img">
                <img id="book_cover" class="book_cover hide_img" src="testOutput2_show.jsp?ISBN=<%=ISBN %>" alt="图片无效">
            </div>
            <script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
            <script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
            <script>
                $("#book_thumb").hover(function () {
                    $("#book_cover").removeClass("hide_img");
                }, function () {
                    $("#book_cover").addClass("hide_img");
                });

                function mousePosition(ev) {
                    if (ev.pageX || ev.pageY) {
                        return { x: ev.pageX, y: ev.pageY };
                    }
                    return {
                        'x': ev.clientX + document.body.scrollLeft - document.body.clientLeft,
                        'y': ev.clientY + document.body.scrollTop - document.body.clientTop
                    };
                }

                document.onmousemove = moveImage;

                function moveImage(ev) {
                    ev = ev || window.event;
                    var mousePos = mousePosition(ev);
                    document.getElementById("div_img").style.left = mousePos.x + 10 + "px";
                    document.getElementById("div_img").style.top = mousePos.y + 20 + "px";
                    //console.log("x:"+mousePos.x+" y:"+mousePos.y);    //成功获取到了鼠标位置
                }

                //var t1 = window.setInterval("moveImage(ev)",100);
            </script>
        </BODY>

        </HTML>