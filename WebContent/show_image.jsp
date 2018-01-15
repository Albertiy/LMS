<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*, javax.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.*"%>
<%
	//Connection con = DriverManager.getConnection(URL,user,password); 

	String ISBN = request.getParameter("ISBN");
	//mysql
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	} catch (ClassNotFoundException e) {
		System.out.println("Can't found Driver!");
		e.printStackTrace();
	}

	String url = "jdbc:mysql://localhost:3306/lmsdb";
	String username = "root";
	String password = "960316";
	Connection con = DriverManager.getConnection(url,username,password);
	//oracle 
	//String URL="jdbc:oracle:thin@localhost:1521:orcl2"; 
	//user="system"; 
	//password="manager"; 
	// 准备语句执行对象 
	Statement stmt = con.createStatement();

	String sql = " SELECT * FROM ISBN_BOOKS WHERE ISBN = " + ISBN;
	ResultSet rs = stmt.executeQuery(sql);
	try {
		if (rs.next()) {
			Blob b = rs.getBlob("cover");
			long size = b.length();
			//out.print(size); 
			byte[] bs = b.getBytes(1, (int) size);
			response.setContentType("image/jpeg");
			OutputStream outs = response.getOutputStream();
			outs.write(bs);
			outs.flush();
			rs.close();
		} else {
			rs.close();
			response.sendRedirect("./assets/img/book_thumb.jpg");
		}
	} catch (SQLException se) {
		System.out.println("Fail to connect to database!");
	} finally {
		if (rs != null) { // 关闭记录集
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) { // 关闭声明
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) { // 关闭连接对象
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
%>
