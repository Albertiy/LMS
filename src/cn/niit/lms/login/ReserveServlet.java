package cn.niit.lms.login;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.domain.Book;
import cn.niit.lms.domain.Rule;
import cn.niit.lms.domain.User;
import cn.niit.lms.service.UserService;

@WebServlet("/Reserve")
public class ReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService uservice = new UserService();

	public ReserveServlet() {
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
		request.setCharacterEncoding("UTF-8");
		request.getSession().setAttribute("reserve", "false");
		// 如果没有session，返回前页面
		if (request.getSession().getAttribute("user") == null || request.getSession().getAttribute("rule") == null) {
			System.out.println("未获取到用户信息，借书失败！");
		} else {

			if (request.getParameter("ISBN") != null) {
				String ISBN = request.getParameter("ISBN");
				System.out.println("ISBN: "+ISBN);
				boolean OK = uservice.reserveBook(((User) request.getSession().getAttribute("user")).getUid(),
						(Rule) request.getSession().getAttribute("rule"), ISBN);
				if (OK){
					System.out.println("预约成功！");
					//更新UserSession内容
					User u = null;
					try {
						u = (User)request.getSession().getAttribute("user");
						u = uservice.login(u);
					} catch (Exception e) {
						RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
						request.setAttribute("warn", true);
						rs.include(request, response);
					}
					if(!u.equals(null)){
					// 登陆成功，保存到session并跳转
						request.getSession().setAttribute("user", u);
					}
					//设置预约成功
					request.getSession().setAttribute("reserve", "true");
				}
				else
					System.out.println("预约失败！");

			} else
				System.out.println("未获取到图书信息，预约失败！");
		}//返回上一页，设置预约失败
		response.sendRedirect(request.getHeader("Referer").toString());
	}
}
