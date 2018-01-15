package cn.niit.lms.manage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class BorrowDetail {
	private int ISBN; // 主键
	private String title; // 书名
	private String author; // 作者
	private String category; // 分类
	private String Borrow_Date; //结束日期
	private String Limit_Date; //还书日期
	private int fine; //罚金
	
	private final static String driver="com.mysql.jdbc.Driver";
	private final static String url="jdbc:mysql://localhost:3306/lmsdb";
	static Connection con=null;
	Statement stmt=null;
	//jdbc
	public static boolean creatConnection(){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url,"root","password");
			return true;
		}
		catch(Exception e){
			System.out.println("数据库连接失败"+e.toString());
			return false;
		}
	}	
}
