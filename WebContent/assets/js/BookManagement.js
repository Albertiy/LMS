function goSearch1(){
    //alert("Search");
    var stype=$("#search_type1").val();
    var sinfo=$("#search_info").val();
    window.location.href='SearchInBookManagementServlet?stype='+stype+'&sinfo='+sinfo;
};