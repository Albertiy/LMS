package cn.niit.lms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.niit.lms.dao.UserDao;
import cn.niit.lms.domain.Rule;
import cn.niit.lms.domain.User;
import cn.niit.lms.jdbc.JDBCUtils;

//这是实际的数据库访问
public class UserDaoImpl implements UserDao {

	@Override
	public void save(User u) {
        //1.获得连接
        Connection conn = JDBCUtils.getConnection();
        //2.准备sql     
        String sql = "insert into users values(0,?,?,?,?,?,?,?,?,0);";
        java.sql.PreparedStatement ps = null;
        //3.准备PreparedStatement对象
        try {
            ps = conn.prepareStatement(sql);
            //4.填写参数
            ps.setString(1, u.getUname());
            ps.setString(2, u.getRole());
            ps.setString(3, u.getPhone());
            ps.setString(4, u.getPwd());
            ps.setString(5, u.getEmail());
            ps.setBoolean(6, u.getGender());
            ps.setString(7, u.getAddress());
            ps.setString(8, u.getDob());
            //新增了一个Amount借了多少本为0
            //ps.setDouble(6, Double.parseDouble(u.getContact_no()));

            //5.执行 SQL
            int result = ps.executeUpdate();
            if (result != 1) {
                throw new RuntimeException("Failed to register user!");
            }
            //6.关闭资源
            JDBCUtils.close(conn, ps, null);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to connect the DB, or SQL wrong!");
        }
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
			rs = pstmt.executeQuery();// 这个返回�?
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		try {
			if (rs.next()) {
				user.setUid(rs.getInt("uid"));
				user.setUname(rs.getString("uname"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setPwd(rs.getString("pwd"));
				user.setRole(rs.getString("role"));
				user.setGender(rs.getBoolean("gender"));
				user.setAddress(rs.getString("Address"));
				user.setDob(rs.getString("dob"));
				user.setAmount(rs.getInt("amount"));
				System.out.println("This guy SQLed by Email: "+user.toString());
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

	@Override
	public User findUserByName(String uname) {
		PreparedStatement pstmt;
		ResultSet rs;
		Connection conn;
		User user=new User();
		if (uname == null) {
			return null;
		}
		conn = JDBCUtils.getConnection();
		String sql = "SELECT * FROM lmsdb.users WHERE uname=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uname);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		try {
			rs = pstmt.executeQuery();// 这个返回�?
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
				user.setPhone(rs.getString("phone"));
				user.setRole(rs.getString("role"));
				user.setGender(rs.getBoolean("gender"));
				user.setAddress(rs.getString("Address"));
				user.setDob(rs.getString("dob"));
				user.setAmount(rs.getInt("amount"));
				System.out.println("This guy SQLed by Uname: "+user.toString());
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

	@Override
	public User findUserByPhone(String phone) {
		PreparedStatement pstmt;
		ResultSet rs;
		Connection conn;
		User user=new User();
		if (phone == null) {
			return null;
		}
		conn = JDBCUtils.getConnection();
		String sql = "SELECT * FROM lmsdb.users WHERE phone=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		try {
			rs = pstmt.executeQuery();// 这个返回�?
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
				user.setPhone(rs.getString("phone"));
				user.setRole(rs.getString("role"));
				user.setGender(rs.getBoolean("gender"));
				user.setAddress(rs.getString("Address"));
				user.setDob(rs.getString("dob"));
				user.setAmount(rs.getInt("amount"));
				System.out.println("This guy SQLed by phone: "+user.toString());
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

	@Override
	public Rule getRule(String role) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Connection conn=null;
		Rule rule=new Rule();
		rule.setRole(role);
		conn = JDBCUtils.getConnection();
		String sql = "SELECT * FROM lmsdb.rules WHERE role=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, role);
			rs = pstmt.executeQuery();// 这个返回�?
			if (rs.next()) {
				rule.setBook_limit(rs.getInt("book_limit"));
				rule.setDay_fine(rs.getInt("day_fine"));
				rule.setLimit_month(rs.getInt("limit_month"));
				return rule;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			JDBCUtils.close(conn, pstmt, rs);
		}
		return null;
	}

}
