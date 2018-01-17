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
import cn.niit.lms.service.BookService;
import cn.niit.lms.service.UserService;

@WebServlet("/Search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookService bservice = new BookService();

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
		// System.out.println("stype: "+stype+"| sinfo: "+sinfo);
		// 搜索为空直接回页面
		if (sinfo.equals("")) {
			//System.out.println("sinfo is empty: search no results");
			RequestDispatcher rs = request.getRequestDispatcher("search.jsp");
			rs.include(request, response);
		} else {
			//System.out.println("Ready for search in MySQL");
			ArrayList bookList = null;
			try {
				bookList = bservice.bookSearch(stype, sinfo);
			} catch (Exception e) {
				System.out.println("Result is Empty!");
				RequestDispatcher rs = request.getRequestDispatcher("search.jsp");
				rs.include(request, response);
			}
			if (bookList != null && !bookList.isEmpty()) {
				// 读取成功，进入搜索结果页
				//System.out.println("Here is result: "+((Book)bookList.get(0)).getTitle());
				System.out.println("Search result: "+bookList);
				request.setAttribute("bookList", bookList);
				response.sendRedirect(request.getContextPath() + "/search.jsp");
			} else {// 为防意外，再来一次
				RequestDispatcher rs = request.getRequestDispatcher("search.jsp");
				rs.include(request, response);
			}

		}
	}
}
