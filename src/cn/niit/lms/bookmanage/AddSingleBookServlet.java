package cn.niit.lms.bookmanage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.jdbc.JDBCUtils;

/**
 * Servlet implementation class AddSingleBookServlet
 */
@WebServlet("/AddSingleBookServlet")
public class AddSingleBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSingleBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ISBN =request.getParameter("ISBN");
		System.out.println("ISBN in AddSingleBookServlet: "+ISBN);
		int Amount = Integer.parseInt((String)request.getParameter("Amount"));
		Connection conn = null;  
        PreparedStatement pstmt = null;
        int s = 0;
        try {
        	conn = JDBCUtils.getConnection();
        	System.out.println("Connection Successfully!");
        	String sql=null;
        	//先增加ISBN_Books中的Amounts和Remain_Amounts
        	sql="update ISBN_books set Amounts=Amounts+"+Amount+", Remain_Amounts=Remain_Amounts+"+
        			Amount+" where ISBN = "+ISBN;
        	System.out.println(sql);
        	pstmt=conn.prepareStatement(sql);
        	System.out.println("a");
        	s = pstmt.executeUpdate();
			if (s > 0) {
				System.out.println("Add Amount in ISBN_Books successfully !");
			} else {
				System.out.println("Add Amount in ISBN_Books unsucessfull.");
			}
        	//再增加Books书中的每一本
        	sql="insert into books (ISBN) values (?)";
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, ISBN);
        	while(Amount>0){
        		s = pstmt.executeUpdate();
        		Amount--;
        	}
			if (s > 0) {
				System.out.println("Add SingleBook successfully !");
			} else {
				System.out.println("Add SingleBook unsucessfull.");
			}
			conn.close();
			pstmt.close();
			request.setAttribute("message", "Add done");
			request.setAttribute("ISBN", ISBN);
	        request.getRequestDispatcher("/EverySingleBook.jsp").forward(request, response);
        	
		} catch (Exception e) {
			request.setAttribute("message", "Add not done");
			request.setAttribute("ISBN", ISBN);
	        request.getRequestDispatcher("/EverySingleBook.jsp").forward(request, response);
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
