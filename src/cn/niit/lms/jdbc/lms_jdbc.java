package cn.niit.lms.jdbc;

import java.sql.*;
import java.util.*;

public class lms_jdbc {
	private String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/lmsdb";
	private	Connection conn=null;
	private	Statement stmt=null;
	private	String sql;	
	public ResultSet rs; 
	
	//jdbc
	public boolean creatConnection(){
		try{
			Class.forName(driver); //注册JDBC驱动
			conn=DriverManager.getConnection(url,"root","password"); //连接数据库
			stmt = conn.createStatement(); // 实例化Statement对
			System.out.println("数据库连接成功");
			return true;
		}
		catch(Exception e){
			System.out.println("数据库连接失败"+e.toString());
			return false;
		}
	}	
	
	//执行函数
	public void Query(String mysql){
		sql = mysql;//修改查询语句
		try {
			rs = stmt.executeQuery(sql);//执行
			System.out.println("执行成功");
		} catch (SQLException e) {
			System.out.println("执行失败");
			e.printStackTrace();
		}
	}
	
	//清理函数
	public void sqlClose(){
		try {
			rs.close();
			stmt.close();
			conn.close();
			System.out.println("清理成功");
		} catch (SQLException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		} finally{
			try{
				if(stmt != null) stmt.close();
			} catch(SQLException se2){
			}
			try{
				if(conn != null) conn.close();
			} catch(SQLException se){
				se.printStackTrace();
			}
		}
	}
	

}
