package cn.niit.lms.jdbc;

import java.sql.*;
import java.util.*;

public class lms_jdbc {
	private final static String driver="com.mysql.jdbc.Driver";
	private final static String url="jdbc:mysql://localhost:3306/lmsdb";
	static Connection con=null;
	Statement stmt=null;
		
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
	public static void main(String[] arg){
		boolean sta=creatConnection();
		if(sta)
			System.out.println("数据库连接成功");
	}
}
