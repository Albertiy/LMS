package cn.niit.lms.manage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.jdbc.lms_jdbc;

/**
 * Servlet implementation class SubmitBookServlet
 */
@WebServlet("/SubmitBookServlet")
public class SubmitBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitBookServlet() {
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
		
		//�������ݿ�
		lms_jdbc jdbc = new lms_jdbc();
		jdbc.creatConnection();
		//ִ���޸���� ���״̬��ԤԼ��ɽ��
		jdbc.Update("update borrowed_books set State = 1 where BID="+bid);
		
		//����ҳ��
		response.sendRedirect("BorrowDetail.jsp?uid="+uid);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
