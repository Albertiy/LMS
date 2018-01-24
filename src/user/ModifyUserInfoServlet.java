package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.domain.User;
import cn.niit.lms.jdbc.JDBCUtils;

/**
 * Servlet implementation class ModifyUserInfoServlet
 */
@WebServlet("/ModifyInfo")
public class ModifyUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyUserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sql = null;
		Connection conn = null;  
        PreparedStatement pstmt = null;
		
		String Name = request.getParameter("Name");
		String Gender = request.getParameter("Gender");
		String Email = request.getParameter("Email");
		boolean gender = false;
		if(Gender.equals("Male")){
			gender = true;
		}
		String Phone = request.getParameter("Phone");
		String Dob = request.getParameter("Dob");
		String Address = request.getParameter("Address");
		//修改session中user的内容
		User u = (User)request.getSession().getAttribute("user");
		u.setUname(Name);
		u.setGender(gender);
		u.setPhone(Phone);
		u.setAddress(Address);
		u.setDob(Dob);
		request.getSession().setAttribute("user", u);
		
		try {
			conn = JDBCUtils.getConnection();
			
			sql = ("update users set uname='"+Name+"', gender="+gender+", phone='"+Phone+"', address='"+
					Address+"', dob='"+Dob+"' where email='"+Email+"'");
			
			pstmt=conn.prepareStatement(sql);
			int s = pstmt.executeUpdate();
			if (s > 0) {
				System.out.println("Modify info successfully !");
			} else {
				System.out.println("Modify info unsucessfull.");
			}
			conn.close();
			pstmt.close();
			request.setAttribute("message", "modify successfully");
	        request.getRequestDispatcher("/Users.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("message", "modify failed");
			request.getRequestDispatcher("/Users.jsp").forward(request, response);
			System.out.println("Error in connection : " + e);
			System.out.println("Error!" + e); 
		}
		
		
	}
}
