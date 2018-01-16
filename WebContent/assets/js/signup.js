
$(document).ready(function () {
    console.log("hide helpConfirmPW");
    $("#helpConfirmPW").hide();
});

$("#userPwd").change(function () {
    console.log("user[pwd] changed");

    if ($("#userPwd").val() !== $("#userRePwd").val()) {
        $("#helpConfirmPW").show();
        //$("#inputRepwd").addClass("has-error");
    } else {
        $("#helpConfirmPW").hide();
        //$("#inputRepwd").removeClass("has-error");
    }
});
$("#userRePwd").change(function () {
    console.log("user[re_pwd] changed");
    if ($("#userPwd").val() !== $("#userRePwd").val()) {
        $("#helpConfirmPW").show();
    } else {
        $("#helpConfirmPW").hide();
    }
});
$("#formSignup").submit(function () {//这里可用AJAX
    console.log("表单提交");
    if ($("#userPwd").val() !== $("#userRePwd").val()) {
        $("#helpConfirmPW").show();
        console.log("密码不一致，提交失败");
        return mySubmit(false);
    }
    //需要从js获取绝对路径
    var AjaxURL = getPath()+"/Signup";
    //传统的序列化
    var params=$('#formSignup').serialize();
    //成功了，这里获取的是表单提交的内容的序列化
    //alert("Form: "+$('#formSignup').serialize());
    //JQuery提供了另一种序列化方式，她将返回一个json对象
    //var params=$("#formSignup").serializeArray();
    $.ajax({
        type: "POST",
        data: params,
        //html，JSP可以直接获得，json，JSP需要额外的包解析JSON对象。
        datatype:'html',
        url: AjaxURL,
        async:false,//设为同步
        success: function (data) {
            //成功了！
            //alert(data);
            if(data=="OK")
            {
                alert('Register Success!');
                window.location.href=getPath()+'/login.jsp';
            }else{
                $("#ErrorInfo").html(data);
            }
            console.log("AJAX Success!");
            //alert("AJAX Success!");
        },
        error: function (data) {//主要在于url错误
            console.log("JQuery AJAX Error!");
            alert("JQuery AJAX Error! :"+data.responseText);
        }
    });
    //有用！！！或者JSP中 onSubmit="return false;"
    return mySubmit(false);
});
    //掩体函数
    function mySubmit(flag) {
        return flag;
    }
    //获取相对函数
    function getPath() {
        var pathName = document.location.pathname;
        var index = pathName.substr(1).indexOf("/");
        var result = pathName.substr(0, index + 1);
        return result;
    }