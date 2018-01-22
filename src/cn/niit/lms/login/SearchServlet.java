package cn.niit.lms.login;

import java.io.IOException;
import java.io.PrintWriter;
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
import cn.niit.lms.service.BookSearchService;
import cn.niit.lms.service.UserService;

@WebServlet("/Search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookSearchService bservice = new BookSearchService();
	private UserService uservice = new UserService();

	public SearchServlet() {
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
		String stype = request.getParameter("stype").toString();
		String sinfo = request.getParameter("sinfo").toString();
		User userSession = (User)request.getSession().getAttribute("user");
		//若userSession非空，保存rule到Session
		if(userSession!=null){
			Rule rule=uservice.getRule(userSession.getRole());
			request.getSession().setAttribute("rule", rule);
		}
		// System.out.println("stype: "+stype+"| sinfo: "+sinfo);
		// 搜索为空直接回页面
		if (sinfo.equals("")) {
			//System.out.println("sinfo is empty: search no results");
			RequestDispatcher rs = request.getRequestDispatcher("search.jsp");
			rs.include(request, response);
			return;
		} else {
			//System.out.println("Ready for search in MySQL");
			ArrayList<Book> bookList = null;
			try {
				bookList = bservice.bookSearch(stype, sinfo);
			} catch (Exception e) {
				System.out.println("[SearchServlet]: Result is empty");
				RequestDispatcher rs = request.getRequestDispatcher("search.jsp");
				rs.include(request, response);
				return;
			}
			if (bookList != null && !bookList.isEmpty()) {
				// 读取成功，进入搜索结果页
				//System.out.println("Here is result: "+((Book)bookList.get(0)).getTitle());
				System.out.println("Search result: "+bookList);
				request.setAttribute("bookList", bookList);
				//这种重定向不传值
				//response.sendRedirect(request.getContextPath() + "/search.jsp");
				//这种就传值
				request.getRequestDispatcher("search.jsp").forward(request, response);
				return;
			} else {// 为防意外，再来一次
				RequestDispatcher rs = request.getRequestDispatcher("search.jsp");
				rs.include(request, response);
				return;
			}

		}
	}
}
