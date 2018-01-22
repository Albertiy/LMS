package cn.niit.lms.manage;

import java.sql.*;
import cn.niit.lms.jdbc.*;

public class UserManage {
	/*
	public static int UID; // 主键
	public static String uname; //姓名
	public static String role; //类别（student/teacher）
	public static String phone; //手机号
	public static String pwd; //密码
	public static String email; //邮箱
	public static String address; //地址
	public static String dob; // 生日
	public static boolean gender; //性别
	public static int fine; //罚金
	
	public static ResultSet rs; //创建结果集 
*/

	public static String sql="Select * from users ";
	//展开结果集数据库
	public static ResultSet getRS(){
		System.out.println("!进入Usermanage.java!");
		//检测ManageSearchServlet修改sql是否成功；
		//System.out.println(sql);
		
		lms_jdbc jdbc = new lms_jdbc();
		jdbc.creatConnection();
		jdbc.Query(sql);
		//恢复sql值，方便重新刷新页面
		sql="Select * from users ";
		
		//System.out.println(sql);
		System.out.println("!退出Usermanage.java!");
		return jdbc.rs;
		
		/*
		try {
			while(rs.next()){
				//字段检索
				UID = rs.getInt("UID");
				uname = rs.getString("uname");
				role = rs.getString("role");
				phone = rs.getString("phone");
				pwd = rs.getString("pwd");
				email = rs.getString("email");
				address = rs.getString("address");
				dob = rs.getString("dob"); 
				gender =rs.getBoolean("gender");
				
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
		*/
	}
	
/*
	public static void main(String[] arg){
		getRS();

	}
	*/
}
