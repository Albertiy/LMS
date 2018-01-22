$(document).ready(function () {

	console.log("Add Click Event...");

    var items = document.querySelectorAll("li");
    var dropButton=document.getElementById("drop_button");
    // 可以使用Array.prototype.forEach.call进行遍历
    [].forEach.call(items, function (item) {
        //添加click事件
        item.addEventListener("click", function () {

        	console.log(this.id);
            var stype = this.id;
            //alert(stype);
            dropButton.innerHTML=stype+" <span class='caret'></span>";
            //修改隐藏的input的value
            $("#search_type1").val(stype);
            //dropButton.value=""+stype;
            //$("#drop_button").value("GOODBOY");
            //没用
            //$("#drop_button").innerHtml("GOOD");
        });
    });

});
function goSearch(){
    //alert("Search");
    var stype=$("#search_type1").val();
    var sinfo=$("#search_info").val();
    window.location.href=getPath()+'/Search?stype='+stype+'&sinfo='+sinfo;
};
//获取相对路径函数
function getPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0, index + 1);
    return result;
};