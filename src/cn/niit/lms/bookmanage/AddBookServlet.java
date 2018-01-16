package cn.niit.lms.bookmanage;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.jdbc.*;
import jdk.nashorn.internal.ir.Flags;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookServlet() {
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
		File Cover= new File(request.getParameter("Cover"));
		Connection conn = null;  
        PreparedStatement ps = null;
        FileInputStream fis;
        System.out.println("This AddBookServlet  Category: "+Category);
        try {
        	conn = JDBCUtils.getConnection();
        	System.out.println("Connection Successfully!");
        	String sql="insert into isbn_books(ISBN,title,author,category,price,cover) values(?,?,?,?,?,?)";
        	ps=conn.prepareStatement(sql);
        	ps.setString(1, ISBN);
        	ps.setString(2, Title);
        	ps.setString(3, Author);
        	ps.setString(4, Category);
        	ps.setFloat(5, Price);
        	fis = new FileInputStream(Cover);
        	ps.setBinaryStream(6, fis);
        	
        	int s = ps.executeUpdate();
        	if(s>0){
        		System.out.println("Image Uploaded successfully !");
        	}else {
    			System.out.println("unsucessfull to upload image.");
    			System.out.println("Uploaded");

    		}
        	conn.close();
        	ps.close();
        		
		} catch (Exception e) {
			System.out.println("Error in connection : " + e);
			System.out.println("Error!" + e);
		}
	}

}
