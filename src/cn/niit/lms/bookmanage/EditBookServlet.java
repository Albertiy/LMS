package cn.niit.lms.bookmanage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.jdbc.*;
import jdk.nashorn.internal.objects.annotations.Where;

/**
 * Servlet implementation class EditBookServlet
 */
@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ISBN = request.getParameter("ISBN");
		String Title = request.getParameter("Title");
		String Author = request.getParameter("Author");
		String Category = request.getParameter("Category");
		String sPrice = request.getParameter("Price");
		Float Price = Float.parseFloat(sPrice);
		System.out.println(Title+ISBN);
		Connection conn = null;  
        PreparedStatement pstmt = null;
        
        
        try {
        	conn = JDBCUtils.getConnection();
        	System.out.println("Connection Successfully!");
        	
        	String sql=null;
        	
        	sql="update ISBN_Books set title='"+Title+"' ,author='"+Author+"' ,category='"+Category+
        			"' ,Price='"+Price+"' Where ISBN="+ISBN;
        	System.out.println(sql);
        	pstmt=conn.prepareStatement(sql);
        	int s = pstmt.executeUpdate();
			if (s > 0) {
				System.out.println("Edit Book successfully !");
			} else {
				System.out.println("Edit Book unsucessfull.");
			}
			conn.close();
			pstmt.close();
			request.setAttribute("message", "done");
	        request.getRequestDispatcher("/EditBook.jsp").forward(request, response);			
		} catch (Exception e) {
			request.setAttribute("message", "not done");
			request.getRequestDispatcher("/EditBook.jsp").forward(request, response);
			System.out.println("Error in connection at EditBookServlet : " + e);
			System.out.println("Error!" + e); 
		}      
	}

}
