<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang='zh-CN'>

    <HEAD>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <TITLE>模态框测试</TITLE>
        <link type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="${pageContext.request.contextPath}/assets/css/index.css" rel="stylesheet">
        <style type="text/css">
            .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
                min-height: 100px;
                background-color: #eee;
            }
        </style>
    </HEAD>

    <BODY>
        <jsp:include flush="true" page="nav.jsp"></jsp:include>
        <div style="margin:0 auto; width:80%;">
            <h1>&nbsp;</h1>
            <h1>模态框测试</h1>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                Launch demo modal
        </button>
        </div>

        <div id="myModal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
            
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                      <h4 class="modal-title" id="myModalLabel">Notification</h4>
                    </div>
                    <div class="modal-body">
                      <h4 id="modal_head">Title in a modal</h4>
                      <p id="modal_text">Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Confirm</button>
                    </div>
            
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div>

        <jsp:include flush="true" page="footer.jsp"></jsp:include>
        <script src="/LMS/jquery/jquery-3.2.1.min.js"></script>
        <script src="/LMS/bootstrap/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function() {
                console.log("已经开始。");
                $("#modal_head").text("This is a modal head.");
                $("#modal_text").text("This is a modal text.");
            });

            
        </script>
    </BODY>
    </HTML>