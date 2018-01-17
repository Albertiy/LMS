package cn.niit.lms.dao.impl;

import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import java.sql.*;
import javax.sql.*;

import cn.niit.lms.jdbc.JDBCUtils;
import cn.niit.lms.dao.BookSearchDao;
import cn.niit.lms.domain.Book;

public class BookSearchDaoImpl implements BookSearchDao {

	@Override
	public ArrayList<Book> searchBook(String stype, String sinfo) {
		ArrayList bookList = new ArrayList();
		// 1.获得连接
		Connection conn = JDBCUtils.getConnection();
		// 2.准备sql
		String sql = "select * from ISBN_Books where " + stype + " LIKE '%" + sinfo + "%'";
		java.sql.Statement stmt=null;
		try {
			stmt = conn.createStatement();
			// 5.执行 SQL
			ResultSet rs = stmt.executeQuery(sql);
			Book book = new Book();
			while (rs.next()) {
				book.setISBN(rs.getString("ISBN"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setCategory(rs.getString("category"));
				book.setPrice((int) rs.getFloat("price"));
				book.setAmount(rs.getInt("amounts"));
				book.setRemain_Amount(rs.getInt("remain_amounts"));
				// book.setTimes(rs.getString("dob"));
				bookList.add(book);
				// System.out.println("This guy SQLed by Email:
				// "+user.toString());
			}
			// 6.关闭资源
			JDBCUtils.close(conn, stmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("Failed to connect the DB, or SQL wrong!");
		}
		return bookList;
	}

}
