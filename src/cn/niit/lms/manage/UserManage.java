package cn.niit.lms.manage;

import java.sql.*;

public class UserManage {
	private int UID; // ����
	private String uname; //����
	private String role; //���student/teacher��
	private String phone; //�ֻ���
	private String pwd; //����
	private String email; //����
	private String address; //��ַ
	private String dob; // ����
	private boolean gender; //�Ա�
	private int fine; //����
	
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
			System.out.println("���ݿ�����ʧ��"+e.toString());
			return false;
		}
	}	
	

}
