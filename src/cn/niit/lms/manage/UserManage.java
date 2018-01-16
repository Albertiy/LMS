package cn.niit.lms.manage;

import java.sql.*;
import cn.niit.lms.jdbc.*;

public class UserManage {
	private static int UID; // 主键
	private static String uname; //姓名
	private static String role; //类别（student/teacher）
	private static String phone; //手机号
	private static String pwd; //密码
	private static String email; //邮箱
	private static String address; //地址
	private static String dob; // 生日
	private static boolean gender; //性别
	private static int fine; //罚金
	
	private static ResultSet rs; //创建结果集

	//展开结果集数据库
	public static void Show(){
		lms_jdbc.creatConnection();
		lms_jdbc.Query("Select * from users");
		try {
			while(lms_jdbc.rs.next()){
				//字段检索
				UID = lms_jdbc.rs.getInt("UID");
				uname = lms_jdbc.rs.getString("uname");
				role = lms_jdbc.rs.getString("role");
				phone = lms_jdbc.rs.getString("phone");
				pwd = lms_jdbc.rs.getString("pwd");
				email = lms_jdbc.rs.getString("email");
				address = lms_jdbc.rs.getString("address");
				dob = lms_jdbc.rs.getString("dob"); 
				gender = lms_jdbc.rs.getBoolean("gender");
				
				//输出数据
				System.out.println("UID:" + UID);
				System.out.println("Name:" + uname);
				if(role=="s")
					System.out.println("Role: Student");
				else if(role=="t")
					System.out.println("Role: Teacher");
				else
					System.out.println("Role: Librarian");
				System.out.println("Phone:" + phone);
				System.out.println("Password:" + pwd);
				System.out.println("E-mail:" + email);
				System.out.println("Address:" + address);
				System.out.println("Brithday:" + dob);
				
				if(gender)
					System.out.println("Gender: man");
				else
					System.out.println("Gender: women");
			}
			//关闭sql
			lms_jdbc.sqlClose();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] arg){
		Show();
	}
}
