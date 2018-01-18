package cn.niit.lms.manage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.niit.lms.jdbc.lms_jdbc;
/**
 * Servlet implementation class BookReturnServlet
 */
@WebServlet("/BookReturnServlet")
public class BookReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookReturnServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("GBK");
		String bid = request.getParameter("bid");
		String uid = request.getParameter("uid");
		System.out.println(bid);
		System.out.println(uid);
		//�������ݿ�
		//lms_jdbc jdbc = new lms_jdbc();
		//jdbc.creatConnection();
		//ִ��ɾ�����
		//jdbc.Query("delete from borrowed_books where BID="+bid);
		
		//����ҳ��
		response.sendRedirect("BorrowDetail.jsp?uid="+uid);

		//RequestDispatcher dispatcher = request.getRequestDispatcher("BorrowDetail.jsp");
		//dispatcher .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
