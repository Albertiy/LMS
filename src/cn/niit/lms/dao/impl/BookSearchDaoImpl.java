package cn.niit.lms.dao.impl;

import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import java.sql.*;
import javax.sql.*;

import cn.niit.lms.jdbc.JDBCUtils;
import cn.niit.lms.dao.BookSearchDao;
import cn.niit.lms.dao.UserDao;
import cn.niit.lms.domain.Book;
import cn.niit.lms.domain.Rule;

public class BookSearchDaoImpl implements BookSearchDao {
	UserDao udao = new UserDaoImpl();

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
			while (rs.next()) {
				//不能写在外面
				Book book = new Book();
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

	@Override
	public boolean reserveBook(int UID,String role,int ISBN) {
		Connection conn = JDBCUtils.getConnection();
		//先search Book表
		String sql = "select BID from Books where ISBN = '"+ISBN+"' and UID = 0";
		java.sql.Statement stmt=null;
		int BID=0;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//获取头一个BID
			if(rs.next()){
				BID=rs.getInt("BID");
			}else{//没有就结束
				JDBCUtils.close(conn, stmt, null);
				return false;
			}
			//获取Role规则
			Rule rule=udao.getRule(role);
			rule.getLimit_month();
			sql="insert into borrowed_books values("+UID+","+BID+",current_date(),current_date(),default,default);";
			JDBCUtils.close(conn, stmt, rs);
		}catch(SQLException se){
			se.printStackTrace();
			throw new RuntimeException("Failed to connect the DB, or SQL wrong!");
		}
		return false;
	}

}
