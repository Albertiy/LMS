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
		String sql = "select * from ISBN_Books where " + stype + " LIKE '%" + sinfo + "%'"; //Good
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
	public boolean reserveBook(int UID,Rule rule,String ISBN) {
		Connection conn = JDBCUtils.getConnection();
		//先search Book表
		String sql = "select BID from Books where ISBN = '"+ISBN+"' and UID = 0";
		System.out.println("sql stat: "+sql);
		java.sql.Statement stmt=null;
		int BID=0;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//获取头一个BID
			if(rs.next()){
				BID=rs.getInt("BID");
				System.out.println("[DaoImpl]:获取到了BID："+BID);
			}else{//没有就结束
				System.out.println("[DaoImpl]:未获取到合适的BID");
				JDBCUtils.close(conn, stmt, rs);
				return false;
			}
			//获取Role
			//重复代码功能了！我有session的rule
			//Rule rule=udao.getRule(role);
			int month = rule.getLimit_month();
			System.out.println("[DaoImpl]:待增加的月份："+month);
			//计算截止日期，需要当前时间，Rule表中的limit_month.
			sql="insert into borrowed_books values("+UID+","+BID+",current_date(),DATE_ADD(current_date(),INTERVAL "+month+" MONTH),default,default);";
			System.out.println("sql stat: " + sql);
			//不要用execute()！它只有在有rs返回时才是true，执行成功不返回值也是false！
			if(stmt.executeUpdate(sql)>0){
				System.out.println("[DaoImpl]:插入成功！");
				JDBCUtils.close(conn, stmt, rs);
				return true;
			}else{
				System.out.println("[DaoImpl]:插入失败！");
				JDBCUtils.close(conn, stmt, rs);
				return false;
			}
		}catch(SQLException se){
			se.printStackTrace();
			throw new RuntimeException("Failed to connect the DB, or SQL wrong!");
		}
	}

}
