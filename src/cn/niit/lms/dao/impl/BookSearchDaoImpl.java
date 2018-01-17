package cn.niit.lms.dao.impl;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.niit.lms.jdbc.JDBCUtils;
import cn.niit.lms.dao.BookSearchDao;
import cn.niit.lms.domain.Book;

public class BookSearchDaoImpl implements BookSearchDao {

	@Override
	public ArrayList<Book> searchBook(String stype, String sinfo) {
		//1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql     
        String sql = "select * from ISBN_Books where ? = ?";
        java.sql.PreparedStatement ps = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.填写参数
            ps.setString(1, stype);
            //ISBN也是varchar(13)型！开心O(∩_∩)O~~
            ps.setString(2, sinfo);

            //5.执行 SQL
            ResultSet rs = ps.executeQuery();
            ArrayList bookList = new ArrayList();
            Book tempBook = new Book();
            while(rs.next()){
				user.setUid(rs.getInt("uid"));
				user.setUname(rs.getString("uname"));
				user.setEmail(rs.getString("email"));
				user.setPwd(rs.getString("pwd"));
				user.setRole(rs.getString("role"));
				user.setGender(rs.getBoolean("gender"));
				user.setAddress(rs.getString("Address"));
				user.setDob(rs.getString("dob"));
				System.out.println("This guy SQLed by Email: "+user.toString());
			}
            
            //6.关闭资源
            JDBCUtils.close(conn, ps, null);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to connect the DB, or SQL wrong!");
        }
		return null;
	}

}
