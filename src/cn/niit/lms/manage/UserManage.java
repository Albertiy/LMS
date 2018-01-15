package cn.niit.lms.manage;

import java.sql.*;

public class UserManage {
	private int UID; // 主键
	private String uname; //姓名
	private String role; //类别（student/teacher）
	private String phone; //手机号
	private String pwd; //密码
	private String email; //邮箱
	private String address; //地址
	private String dob; // 生日
	private boolean gender; //性别
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
