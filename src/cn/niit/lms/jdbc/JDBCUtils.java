package cn.niit.lms.jdbc;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import javax.sql.*;
import java.util.*;

public class JDBCUtils {
	private static String driver;
	private static String url;
	private static String user;
	private static String password;
	static Connection conn;

	static{
		try {
			//��ȡ�����ļ�
			Properties prop  = new Properties();
			//ʹ��class��ȡ�ļ���ַ
			InputStream is = JDBCUtils.class.getResourceAsStream("db.properties");//�ͷ��ڱ��ļ�����
			prop.load(is);
			is.close();
			driver = prop.getProperty("driver");
			url = prop.getProperty("url");
			user = prop.getProperty("user");
			password = prop.getProperty("password");
			//1 ע������
			Class.forName(driver).newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	//1 �������
	public static Connection getConnection(){
		try {
			//2 �������
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Failed to create a connection!");
		}
		return conn;
	}
	
	//2 �ͷ���Դ
		//1> ��������Ϊ��
		//2> ����close����Ҫ�׳��쳣,ȷ����ʹ�����쳣Ҳ�ܼ����ر�
		//3>�ر�˳��,��Ҫ��С����
	public static void close(Connection conn , Statement st , ResultSet rs){
		try {
			if(rs!=null){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(st!=null){
				st.close();	
				}
			} catch (SQLException e){
				e.printStackTrace();
			}finally{
				try {
					if(conn!=null){
						conn.close();	
						}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		
	}
	
	
	public static void main(String[] args) {
		System.out.println(getConnection());
	}
}