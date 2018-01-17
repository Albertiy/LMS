package cn.niit.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import cn.niit.lms.jdbc.JDBCUtils;

public class BookDao {
	private	static Connection conn=null;
	private	static PreparedStatement ps = null;
	public static ResultSet rs;
	
    public static ResultSet readbook(){
    	//从数据库查询书籍信息
        try {    
            conn = JDBCUtils.getConnection();
            ps = conn.prepareStatement("select ISBN,Title,Author,Category,Amount,Remain_amount,Price from ISBN_Books");  
            rs = ps.executeQuery();  
            System.out.println("BookDao查询Book信息成功");  
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
