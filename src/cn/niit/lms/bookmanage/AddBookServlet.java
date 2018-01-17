package cn.niit.lms.bookmanage;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.naming.java.javaURLContextFactory;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import cn.niit.lms.jdbc.*;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ISBN = request.getParameter("ISBN");
		String Title = request.getParameter("Title");
		String Author = request.getParameter("Author");
		String Category = request.getParameter("Category");
		SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd"); //规范时间
		String sPrice = request.getParameter("Price");
		System.out.println("Sprice  "+sPrice);
		Float Price = Float.parseFloat(sPrice);
		int Amount = Integer.parseInt(request.getParameter("Amount"));
		System.out.println("Amount " + Amount);
		int Remain_Amount=0;
		int Times=0;
		//File Cover= new File(request.getParameter("Cover"));
        //System.out.println("This AddBookServlet  Category: "+Category);
		Connection conn = null;  
        PreparedStatement pstmt = null;
        //FileInputStream fis;
        /*
        try {        	
        	DiskFileItemFactory factory=new DiskFileItemFactory();
        	ServletFileUpload fu=new ServletFileUpload(factory);
        	List list = fu.parseRequest(request);
        	Iterator it = list.iterator();
        	while (it.hasNext()) 
        	{
	        	 FileItem item = (FileItem) it.next();
	        	 if (item.isFormField()){
	        		 //formname是name值   fromcontent是value值   
	        	  String formname=item.getFieldName();//获取name属性的值
	        	  System.out.println("name值  "+formname);
	        	  String formcontent=item.getString();//获取value属性的值
	        	 }
        	}
        	
        	
        				
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			System.out.println("Error in ServletFileUpload" + e1);
		}*/
        
        try {
        	conn = JDBCUtils.getConnection();
        	System.out.println("Connection Successfully!");
        	String sql="insert into isbn_books values(?,?,?,?,?,?,?,?,?,?)";
        	pstmt=conn.prepareStatement(sql);
        	
        	pstmt.setString(1, ISBN);
        	pstmt.setString(2, Title);
        	pstmt.setString(3, Author);
        	pstmt.setString(4, Category);
        	pstmt.setString(5, fmt.format(System.currentTimeMillis())); //传入系统当前时间 
        	pstmt.setFloat(6, Price);
        	pstmt.setInt(7, Amount);
        	pstmt.setInt(8, Remain_Amount);
        	pstmt.setInt(9, Times);
        	pstmt.setString(10, null);
        	
        	
        	//fis = new FileInputStream(Cover);
        	//pstmt.setBinaryStream(6, fis);
        	
        	int s = pstmt.executeUpdate();
        	if(s>0){
        		System.out.println("Add Book");
        		System.out.println("successfully !");
        	}else {
    			System.out.println("unsucessfull.");
    		}
        	while(Amount>0){
        		sql="insert into books values(null,?,0)";
            	pstmt=conn.prepareStatement(sql);
            	pstmt.setString(1, ISBN);
            	int m = pstmt.executeUpdate();
        		Amount--;
        	}
        	conn.close();
        	pstmt.close();        		
		} catch (Exception e) {
			request.setAttribute("message", "not done");
			request.getRequestDispatcher("/AddBook.jsp").forward(request, response);
			System.out.println("Error in connection : " + e);
			System.out.println("Error!" + e);
		}
        request.setAttribute("message", "done");
        request.getRequestDispatcher("/AddBook.jsp").forward(request, response);
        //request.getRequestDispatcher("/AddBook.jsp?message='done'").forward(request, response);
        
	}
}
