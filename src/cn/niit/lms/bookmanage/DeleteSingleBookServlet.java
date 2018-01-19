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
import sun.text.resources.cldr.om.FormatData_om;

/**
 * Servlet implementation class DeleteSingleBookServlet
 */
@WebServlet("/DeleteSingleBookServlet")
public class DeleteSingleBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSingleBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int BID = Integer.parseInt(request.getParameter("BID"));
		System.out.println("BID = "+BID);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		String ISBN=null;
		int UID = -1;
		

		try {
			conn = JDBCUtils.getConnection();
        	System.out.println("Delete SingleBook Connection Successfully!");
        	//判断此本书是否归还 归还才能删除        	
        	sql=("select * from books where BID="+BID);
        	pstmt=conn.prepareStatement(sql);
        	rs=pstmt.executeQuery();
        	
        	if(rs.next()){
	        	ISBN = rs.getString("ISBN");
	        	UID=rs.getInt("UID");
	        	
	        	System.out.println("UID "+UID);
	        	System.out.println("ISBN in DeleteSingleBookServlet "+ISBN);
	        }
        	if(UID==0){						//UID默认为0 如果为0 则未借出 从books表删除 ISBN_books表数量减一
        		//books表中删除此本书
        		System.out.println("通过IF语句");
        		sql=("delete from books where BID="+BID);
        		pstmt=conn.prepareStatement(sql);
        		int m=pstmt.executeUpdate();
        		//ISBN_books表数量减一
        		sql=("update ISBN_Books set Amounts=Amounts-1, Remain_Amounts = Remain_Amounts-1 where ISBN="+ISBN);
        		pstmt=conn.prepareStatement(sql);
        		int n = pstmt.executeUpdate();
				if (m > 0 && n > 0) {
					System.out.println("Delete SingleBook in books successfully !");
				} else {
					System.out.println("Delete SingleBook in books unsucessfull.");
				}
        		conn.close();
				pstmt.close();
        		request.setAttribute("message", "done");
        		request.setAttribute("ISBN", ISBN);
    			request.getRequestDispatcher("/EverySingleBook.jsp").forward(request, response);
        	}else{
        		conn.close();
				pstmt.close();
        		request.setAttribute("message", "borrowed");
        		request.setAttribute("ISBN", ISBN);
    			request.getRequestDispatcher("/EverySingleBook.jsp").forward(request, response);
        	}

        		
		} catch (Exception e) {
			request.setAttribute("message", "not done");
			request.setAttribute("ISBN", ISBN);
			request.getRequestDispatcher("/EverySingleBook.jsp").forward(request, response);
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
