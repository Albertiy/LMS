package cn.niit.lms.login;

import java.sql.*;
import javax.sql.*;

import cn.niit.lms.jdbc.JDBCUtils;

import java.util.*;

public class Validate {
	static PreparedStatement pstmt;
	static ResultSet rs;
	static Connection conn;

	public static boolean checkUser(String email, String pwd) {
		if(email==null || pwd==null)
		{
			return false;
		}
		conn = JDBCUtils.getConnection();
		String sql = "SELECT * FROM lmsdb.users WHERE email=? and pwd=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		try {
			rs = pstmt.executeQuery();//这个返回集
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		try {
			if (rs.next()) {
				if (pwd.equals(rs.getString("pwd"))) {
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}

		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			JDBCUtils.close(conn, pstmt, rs);
		}
		return true;
	}

}
