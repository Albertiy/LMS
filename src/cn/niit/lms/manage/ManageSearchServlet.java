package cn.niit.lms.manage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.niit.lms.manage.UserManage;

/**
 * Servlet implementation class ManageSearchServlet
 */
@WebServlet("/ManageSearchServlet")
public class ManageSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("!����ManageSearchServlet.java!");
		String liname = request.getParameter("LiName"); 
		String InputSearch = request.getParameter("InputSearch"); 
		
		
		String SQL="Select * from users where " + liname + " = '" + InputSearch+"'";
		
		//�������������ֵ/��ȡ�Ƿ���ȷ��
		//System.out.println(SQL);
		
		// �޸�UserManage ��sql���ﵽˢ�±���Ŀ�ġ�
		UserManage.sql=SQL;
		
		response.sendRedirect("UserManagement.jsp");
		System.out.println("!�˳�ManageSearchServlet.java!");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
