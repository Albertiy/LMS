package cn.niit.lms.bookmanage;

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
import cn.niit.lms.service.BookSearchService;
import cn.niit.lms.service.UserService;

/**
 * Servlet implementation class SearchInBookManagementServlet
 */
@WebServlet("/SearchInBookManagementServlet")
public class SearchInBookManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookSearchService bservice = new BookSearchService();
	private UserService uservice = new UserService();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchInBookManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
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
			request.setAttribute("message", "No Book");
			RequestDispatcher rs = request.getRequestDispatcher("BookManagement.jsp");
			rs.include(request, response);
			return;
		} else {
			//System.out.println("Ready for search in MySQL");
			ArrayList<Book> bookList = null;
			try {
				bookList = bservice.bookSearch(stype, sinfo);
			} catch (Exception e) {
				System.out.println("Result is Empty!");
				request.setAttribute("message", "No Book");
				RequestDispatcher rs = request.getRequestDispatcher("BookManagement.jsp");
				rs.include(request, response);
				return;
			}
			if (bookList != null && !bookList.isEmpty()) {
				// 读取成功，进入搜索结果页
				//System.out.println("Here is result: "+((Book)bookList.get(0)).getTitle());
				System.out.println("Search result: "+bookList);
				request.setAttribute("BookList", bookList);
				//这种重定向不传值
				//response.sendRedirect(request.getContextPath() + "/search.jsp");
				//这种就传值
				request.getRequestDispatcher("BookManagement.jsp").forward(request, response);
				return;
			} else {// 为防意外，再来一次
				RequestDispatcher rs = request.getRequestDispatcher("BookManagement.jsp");
				rs.include(request, response);
				return;
			}

		}
	}

}
