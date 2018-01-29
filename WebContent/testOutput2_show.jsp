<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.niit.lms.image.testJDBCUtils" language="java" %>
    <%@ page import="java.io.*"%> 
    <%@ page import = "java.sql.*, javax.sql.*" language="java"  %>
    <%
    out.clear();
    out = pageContext.pushBody();

    String ISBN = "";
    Connection con = null;
    ResultSet rs = null;
    PreparedStatement psmt = null;
if(request.getParameter("ISBN")!=null){
	OutputStream outs = null;
	try{
	ISBN = request.getParameter("ISBN");
	con = testJDBCUtils.getConnection();
	psmt = con.prepareStatement("select * from testimage.bookcover where ISBN = ?");
	psmt.setString(1, ISBN);
	rs = psmt.executeQuery();
	if (rs.next()) {
		Blob b = rs.getBlob("cover");
		long size = b.length();
		//out.print(size); 
		byte[] bs = b.getBytes(1, (int)size); 
		response.setContentType("image/jpeg"); 
		outs = response.getOutputStream();
		//输出流
		outs.write(bs); 
		outs.flush();
	    System.out.println("图片获取成功！");
		}else{
			System.out.println("图片不存在！");
		}
	}catch(Exception e){
		System.out.println(e);
	}finally{
		testJDBCUtils.close(con,psmt,rs);
		    outs.flush();
	}
}else{
	System.out.println("没有获取到ISBN！");
}

%>
