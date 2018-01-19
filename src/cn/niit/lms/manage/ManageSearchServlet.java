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
		String liname = request.getParameter("LiName"); 
		String InputSearch = request.getParameter("InputSearch"); 
		
		
		String SQL="Select * from users where " + "liname = " + "InputSearch";
		
		//检测两个参数传值/获取是否正确。
		System.out.println(SQL);
		
		// 修改UserManage 的sql，达到刷新表格的目的。
		UserManage.sql=SQL;
		
		//跳回页面
		response.sendRedirect("UserManagement.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
