package cn.niit.lms.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.domain.User;
import cn.niit.lms.service.UserService;


@WebServlet("/Signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService uservice = new UserService();
	
    public SignupServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String uname = request.getParameter("userUname");
			String email = request.getParameter("userEmail");
			String pwd = request.getParameter("userPwd");
			String Role = request.getParameter("userRole");
			String role = "s";
			if(Role.equals("Student")){
				role="s";
			}
			else if(Role.equals("Teacher")){
				role="t";
			}
			String Gender = request.getParameter("userGender");
			boolean gender = false;
			if(Gender.equals("Male")){
				gender = true;
			}
			String phone = request.getParameter("userPhone");
			String dob = request.getParameter("userDob");
			String address = request.getParameter("userAddress");
			
			User u = new User();
			u.setUname(uname);
			u.setPwd(pwd);
			u.setEmail(email);
			u.setGender(gender);
			u.setPhone(phone);
			u.setRole(role);
			u.setAddress(address);
			u.setDob(dob);
			response.setContentType("text/html;charset=UTF-8");
			try{
				uservice.regist(u);
			}catch (Exception e) {
		        response.getWriter().append("Error: " + e.getMessage());
		        return;
			}
				response.getWriter().append("OK");
				return;
	    }

}
