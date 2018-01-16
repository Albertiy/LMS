package cn.niit.lms.dao;

import java.sql.*;

import cn.niit.lms.jdbc.JDBCUtils;


public class UserInfo_ajaxDao {
	private	static Connection conn=null;
	private	static PreparedStatement ps = null;
	public static ResultSet rs;
	
	public static ResultSet readuser(){
		try {    
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement("");
            //登录后提交email进入数据库查询
            rs = ps.executeQuery();  
            System.out.println("UserDao查询User信息成功");  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }    
         return rs;
     }
	public static void close(){
		try {
			rs.close();
			ps.close();
			conn.close();
			System.out.println("清理成功");
		} catch (SQLException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		} finally{
			try{
				if(ps != null) ps.close();
			} catch(SQLException se2){
			}
			try{
				if(conn != null) conn.close();
			} catch(SQLException se){
				se.printStackTrace();
			}
		}
    }
}
