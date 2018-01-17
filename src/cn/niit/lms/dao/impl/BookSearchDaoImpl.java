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
            Book book = new Book();
            while(rs.next()){
				book.setISBN(rs.getString("ISBN"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setCategory(rs.getString("category"));
				book.setPrice((int)rs.getFloat("price"));
				book.setAmount(rs.getInt("amounts"));
				book.setRemain_Amount(rs.getInt("remain_amounts"));
				//book.setTimes(rs.getString("dob"));
				bookList.add(book);
				//System.out.println("This guy SQLed by Email: "+user.toString());
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
