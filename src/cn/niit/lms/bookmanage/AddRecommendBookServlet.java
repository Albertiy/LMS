package cn.niit.lms.bookmanage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.jdbc.JDBCUtils;

/**
 * Servlet implementation class AddRecommendBookServlet
 */
@WebServlet("/AddRecommend")
public class AddRecommendBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRecommendBookServlet() {
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
		doGet(request, response);String ISBN = request.getParameter("ISBN");
		String Title = request.getParameter("Title");
		String Author = request.getParameter("Author");	
		
		Connection conn = null;  
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        
        try{
        	conn = JDBCUtils.getConnection();
        	System.out.println("Connection Successfully!");       	
        	String sql=null;
        	//判断是否推荐过
        	sql="select * from recommend_books where title = '"+Title+"' and author='"+Author+"'";
        	pstmt=conn.prepareStatement(sql);
        	rs=pstmt.executeQuery();

        	//没有推荐过
        	if(!rs.next()){
				sql = "insert into recommend_books values(?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, Title);
				pstmt.setString(2, Author);
				pstmt.setInt(3, 1); 
				int s = pstmt.executeUpdate();
				if (s > 0) {
					System.out.println("Add RecommendBook1 successfully !");
				} else {
					System.out.println("Add RecommendBook unsucessfully.");
				}
				rs.close();
				pstmt.close();
				conn.close();
				request.setAttribute("message", "Add done");
			    request.getRequestDispatcher("/Users.jsp").forward(request, response);
        	
        	}else {												
        		sql = "update recommend_books set rTimes=rTimes+1 where Title='"+Title+"' and author='"+Author+"'";
				pstmt = conn.prepareStatement(sql); 
				int s = pstmt.executeUpdate();
				if (s > 0) {
					System.out.println("Add RecommendBook2 successfully !");
				} else {
					System.out.println("Add RecommendBook unsucessfully.");
				}
				rs.close();
				pstmt.close();
				conn.close();
				request.setAttribute("message", "Add done");
			    request.getRequestDispatcher("/Users.jsp").forward(request, response);
			}

		} catch (Exception e) {
			request.setAttribute("message", "not done");
			request.getRequestDispatcher("/Users.jsp").forward(request, response);
			System.out.println("Error in connection : " + e);
			System.out.println("Error!" + e); 
		}
	}

}
