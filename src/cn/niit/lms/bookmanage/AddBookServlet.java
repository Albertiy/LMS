package cn.niit.lms.bookmanage;

import cn.niit.lms.jdbc.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

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
		int Amounts = Integer.parseInt(request.getParameter("Amount"));
		System.out.println("Amounts " + Amounts);
		int Remain_Amounts=Amounts;
		int Times=0;
		//File Cover= new File(request.getParameter("Cover"));
        //System.out.println("This AddBookServlet  Category: "+Category);
		ResultSet rs = null;
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
        	
        	String sql=null;
        	  	
        	/*        	 
        	 * check ISBN
        	 * 
        	*/
        	sql="select * from isbn_books where ISBN = "+ISBN;
        	pstmt=conn.prepareStatement(sql);
        	rs=pstmt.executeQuery();
        	
        	if(!rs.next()){
        		System.out.println("通过if判断  addbook");
				sql = "insert into isbn_books values(?,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, ISBN);
				pstmt.setString(2, Title);
				pstmt.setString(3, Author);
				pstmt.setString(4, Category);
				pstmt.setString(5, fmt.format(System.currentTimeMillis())); // 传入系统当前时间
				pstmt.setFloat(6, Price);
				pstmt.setInt(7, Amounts);
				pstmt.setInt(8, Remain_Amounts);
				pstmt.setInt(9, Times);
				

				// fis = new FileInputStream(Cover);
				// pstmt.setBinaryStream(6, fis);

				int s = pstmt.executeUpdate();
				if (s > 0) {
					System.out.println("Add Book successfully !");
				} else {
					System.out.println("Add Book unsucessfull.");
				}
				/*while (Amount > 0) {								//通过数据库中trigger实现book同步添加
					sql = "insert into books values(null,?,0)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, ISBN);
					int m = pstmt.executeUpdate();
					Amount--;
				}*/
				conn.close();
				pstmt.close();
				request.setAttribute("message", "done");
		        request.getRequestDispatcher("/AddBook.jsp").forward(request, response);
			}else{
				conn.close();
				pstmt.close();
				request.setAttribute("message", "existed");
				request.getRequestDispatcher("/AddBook.jsp").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("message", "not done");
			request.getRequestDispatcher("/AddBook.jsp").forward(request, response);
			System.out.println("Error in connection : " + e);
			System.out.println("Error!" + e); 
		}      
        //request.getRequestDispatcher("/AddBook.jsp?message='done'").forward(request, response);
        
	}
}
