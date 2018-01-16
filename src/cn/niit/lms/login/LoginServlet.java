package cn.niit.lms.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.domain.User;
import cn.niit.lms.service.UserService;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService uservice = new UserService();

	public LoginServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		// 设置请求的编码格式
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		User u = new User();
		u.setEmail(email);
		u.setPwd(pwd);
		User user = null;
		try {
			// 登陆并返回User类
			user = uservice.login(u);
		} catch (Exception e) {
			RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
			request.setAttribute("warn", true);
			rs.include(request, response);
		}
		if(!user.equals(null)){
		// 登陆成功，保存到session并跳转
		request.getSession().setAttribute("user", user);
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		}else{//为防意外，再来一次
			RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
			request.setAttribute("warn", true);
			rs.include(request, response);
		}
	}
}
