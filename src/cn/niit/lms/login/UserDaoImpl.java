package cn.niit.lms.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.niit.lms.domain.User;
import cn.niit.lms.jdbc.JDBCUtils;

//这是实际的数据库访问
public class UserDaoImpl implements UserDao {

	@Override
	public void save(User u) {
		// TODO Auto-generated method stub

	}

	@Override
	public User findUserByEmail(String email) {
		PreparedStatement pstmt;
		ResultSet rs;
		Connection conn;
		User user=new User();
		if (email == null) {
			return null;
		}
		conn = JDBCUtils.getConnection();
		String sql = "SELECT * FROM lmsdb.users WHERE email=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		try {
			rs = pstmt.executeQuery();// 这个返回集
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		try {
			if (rs.next()) {
				user.setUid(rs.getInt("uid"));
				user.setUname(rs.getString("uname"));
				user.setEmail(rs.getString("email"));
				user.setPwd(rs.getString("pwd"));
				user.setRole(rs.getString("role"));
				user.setGender(rs.getBoolean("gender"));
				user.setAddress(rs.getString("Address"));
				user.setDob(rs.getString("dob"));
				System.out.println("This guy login: "+user.toString());
				return user;
			} else {
				return null;
			}
		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			JDBCUtils.close(conn, pstmt, rs);
		}
		return null;
	}

}
