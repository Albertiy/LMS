package cn.niit.lms.bookmanage;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.jdbc.*;

/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ISBN = request.getParameter("ISBN");
		System.out.println("ISBN = "+ISBN);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			conn = JDBCUtils.getConnection();
        	System.out.println("Delete Book Connection Successfully!");

        	//check ISBN
        	sql="select * from isbn_books where ISBN = "+ISBN;
        	pstmt=conn.prepareStatement(sql);
        	rs=pstmt.executeQuery();
        	if(rs.next()){								//判断数据库中有没有ISBN号
        		System.out.println("通过if判断  deletebook");//如果有就先删除books表中数据  再删除isbn_books
        		
        		//判断Remain_Amounts是否等于Amounts
        		//等于才能删除
        		int Amount = rs.getInt("Amount");
        		int Remain_Amount = rs.getInt("Remain_Amount");
        		if(Amount==Remain_Amount){
		        	sql = "delete from Books where ISBN = "+ISBN;
		        	pstmt = conn.prepareStatement(sql);
		        	int s = pstmt.executeUpdate();
					if (s > 0) {
						System.out.println("Delete Book in books successfully !");
					} else {
						System.out.println("Delete Book in books unsucessfull.");
					}
					sql = "delete from ISBN_Books where ISBN = "+ISBN;
		        	pstmt = conn.prepareStatement(sql);
		        	s = pstmt.executeUpdate();
					if (s > 0) {
						System.out.println("Delete Book in ISBN_books successfully !");
					} else {
						System.out.println("Delete Book in ISBN_books unsucessfull.");
					}
					conn.close();
					pstmt.close();
					request.setAttribute("message", "done");
					request.getRequestDispatcher("/BookManagement.jsp").forward(request, response);
        		}else {
        			conn.close();
					pstmt.close();
					request.setAttribute("message", "notequal");
					request.getRequestDispatcher("/BookManagement.jsp").forward(request, response);
				}
        	}else {										//没有返回不存在参数 js中做提示 同addBook.jsp中一样
        		conn.close();
				pstmt.close();
				request.setAttribute("message", "unexist");
				request.getRequestDispatcher("/BookManagement.jsp").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("message", "not done");
			request.getRequestDispatcher("/BookManagement.jsp").forward(request, response);
			System.out.println("Error in connection : " + e);
			System.out.println("Error!" + e);
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
