package cn.niit.lms.manage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class BorrowDetail {
	private int ISBN; // ����
	private String title; // ����
	private String author; // ����
	private String category; // ����
	private String Borrow_Date; //��������
	private String Limit_Date; //��������
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
