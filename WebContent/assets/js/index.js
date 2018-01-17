$(document).ready(function () {
    /*     $("#search_type").click(function () {
            var val=$(this).text();
            $("#drop_button").val(val);
            $('.footer').css("background-color", "#336699");
        }); */

    //获取所有li的节点
    var items = document.querySelectorAll("li");
    var dropButton=document.getElementById("drop_button");
    // 可以使用Array.prototype.forEach.call进行遍历
    [].forEach.call(items, function (item) {
        //添加click事件
        item.addEventListener("click", function () {
            //不能用
            //var stype = this.text;
        	console.log(this.id);
            var stype = this.id;
            
            //alert(stype);
            dropButton.innerHTML=stype+" <span class='caret'></span>";
            //dropButton.value=""+stype;
            //$("#drop_button").value("GOODBOY");
            //没用
            //$("#drop_button").innerHtml("GOOD");
        });
    });

});
function goSearch(){
    alert("Search");
}