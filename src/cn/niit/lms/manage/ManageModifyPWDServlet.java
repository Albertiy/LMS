package cn.niit.lms.manage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.jdbc.lms_jdbc;

/**
 * Servlet implementation class ManageModifyPWDServlet
 */
@WebServlet("/ManageModifyPWDServlet")
public class ManageModifyPWDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageModifyPWDServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("!����ManageModifyPWDServlet.java!");
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		//�������ݿ�
		lms_jdbc jdbc = new lms_jdbc();
		jdbc.creatConnection();
		//ִ�и�����䣬�޸�����
		jdbc.Update("Update users set pwd = "+pwd+" where UID="+uid);
		//����ҳ��
		response.sendRedirect("UserManagement.jsp");
		System.out.println("!�˳�ManageModifyPWDServlet.java!");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
