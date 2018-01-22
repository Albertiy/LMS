package cn.niit.lms.bookmanage;

import java.io.IOException;
import cn.niit.lms.domain.*;
import cn.niit.lms.jdbc.*;

import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class BookListServlet
 */
@WebServlet("/BookListServlet")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;  
        PreparedStatement ps = null;  
        ResultSet rs = null;  
        try {  
            ArrayList<Book> bookList = new ArrayList<>();  
            conn = JDBCUtils.getConnection();  
            ps = conn.prepareStatement("select ISBN,title,author,category,amounts,remain_amounts,price from ISBN_Books");  
            rs = ps.executeQuery();  
            while(rs.next()){  
            	String ISBN = rs.getString("ISBN");
            	String Title=rs.getString("title");
            	String Author=rs.getString("author");
            	String Category=rs.getString("category");
            	int Amount=rs.getInt("amounts");
            	int Remain_Amount=rs.getInt("remain_amounts");
            	int Price=rs.getInt("price"); 
             
                Book book = new Book(ISBN,Title,Author,Category,Amount,Remain_Amount,Price);
                
                bookList.add(book);  
            }  
            request.setAttribute("bookList", bookList);  
            request.getRequestDispatcher("BookManagement.jsp").forward(request, response);  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }finally {  
            try {  
                if(rs != null){  
                    rs.close();  
                }  
                if(ps!=null){  
                    ps.close();  
                }  
                if(conn!=null){  
                    conn.close();  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
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
