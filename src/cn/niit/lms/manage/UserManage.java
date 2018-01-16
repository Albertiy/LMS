package cn.niit.lms.manage;

import java.sql.*;
import cn.niit.lms.jdbc.*;

public class UserManage {
	private static int UID; // ����
	private static String uname; //����
	private static String role; //���student/teacher��
	private static String phone; //�ֻ���
	private static String pwd; //����
	private static String email; //����
	private static String address; //��ַ
	private static String dob; // ����
	private static boolean gender; //�Ա�
	private static int fine; //����
	
	private static ResultSet rs; //���������

	//չ����������ݿ�
	public static void Show(){
		lms_jdbc.creatConnection();
		lms_jdbc.Query("Select * from users");
		try {
			while(lms_jdbc.rs.next()){
				//�ֶμ���
				UID = lms_jdbc.rs.getInt("UID");
				uname = lms_jdbc.rs.getString("uname");
				role = lms_jdbc.rs.getString("role");
				phone = lms_jdbc.rs.getString("phone");
				pwd = lms_jdbc.rs.getString("pwd");
				email = lms_jdbc.rs.getString("email");
				address = lms_jdbc.rs.getString("address");
				dob = lms_jdbc.rs.getString("dob"); 
				gender = lms_jdbc.rs.getBoolean("gender");
				
				//�������
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
			//�ر�sql
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
