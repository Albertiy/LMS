package cn.niit.lms.manage;

import java.sql.*;
import cn.niit.lms.jdbc.*;

public class UserManage {
	public static int UID; // ����
	public static String uname; //����
	public static String role; //���student/teacher��
	public static String phone; //�ֻ���
	public static String pwd; //����
	public static String email; //����
	public static String address; //��ַ
	public static String dob; // ����
	public static boolean gender; //�Ա�
	public static int fine; //����
	
	public static ResultSet rs; //��������� 

	//չ����������ݿ�
	public static ResultSet getRS(){
		lms_jdbc.creatConnection();
		lms_jdbc.Query("Select * from users ");
		return lms_jdbc.rs;
		
		/*
		try {
			while(rs.next()){
				//�ֶμ���
				UID = rs.getInt("UID");
				uname = rs.getString("uname");
				role = rs.getString("role");
				phone = rs.getString("phone");
				pwd = rs.getString("pwd");
				email = rs.getString("email");
				address = rs.getString("address");
				dob = rs.getString("dob"); 
				gender =rs.getBoolean("gender");
				
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
		*/
	}

	public static void main(String[] arg){
		getRS();

	}
	
}
