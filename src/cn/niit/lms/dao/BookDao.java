package cn.niit.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import cn.niit.lms.domain.BorrowBooks;
import cn.niit.lms.domain.SingleBook;
import cn.niit.lms.jdbc.JDBCUtils;

public class BookDao {
	private	static Connection conn=null;
	private	static PreparedStatement pstmt = null;
	public static ResultSet rs;
	
    public static ResultSet readbook(){
    	//从数据库查询书籍信息
        try {    
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement("select * from ISBN_Books");  
            rs = pstmt.executeQuery();  
            System.out.println("BookDao查询Book信息成功");  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }    
         return rs;
     }
    public static ResultSet readbook(String ISBN){
    	//从数据库查询书籍信息
        try {    
            conn = JDBCUtils.getConnection();
            pstmt = conn.prepareStatement("select * from ISBN_Books where ISBN="+ISBN);  
            rs = pstmt.executeQuery();  
            System.out.println("BookDao通过ISBN查询Book信息成功");  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }    
         return rs;
     }
    
    public static ArrayList<BorrowBooks> readBorrowBooks(int UID){
    	
    	ArrayList<BorrowBooks> BorrowBook= new ArrayList<BorrowBooks>();
    	String sql=null;
    	//从数据库查询书籍信息
        try {    
            conn = JDBCUtils.getConnection();
            sql=("select bb.Borrow_Date, bb.Limit_Date, bb.Fine,bb.State, "
            		+ "ib.isbn,ib.title, ib.author from borrowed_books bb left join Books b on bb.BID = b.BID "
            		+ "left join ISBN_Books ib on b.ISBN = ib.ISBN"
            				+" where bb.UID="+UID);           
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql); 
            rs = pstmt.executeQuery(); 
            
            while (rs.next()) {
				BorrowBooks bBook = new BorrowBooks();
				bBook.setISBN(rs.getString("ISBN"));
				bBook.setTitle(rs.getString("title"));
				bBook.setAuthor(rs.getString("author"));
				bBook.setBorrow_Date(rs.getString("Borrow_date"));
				bBook.setReturn_Date(rs.getString("Limit_Date"));
				bBook.setFine(rs.getFloat("Fine"));
				bBook.setState(rs.getInt("State"));
				BorrowBook.add(bBook);
			}
            
            System.out.println("BookDao通过ISBN查询BorrowBook信息成功");  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }    
         return BorrowBook;
     }

    
    public static void close(){
		try {
			rs.close();
			pstmt.close();
			conn.close();
			System.out.println("清理成功");
		} catch (SQLException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		} finally{
			try{
				if(pstmt != null) pstmt.close();
			} catch(SQLException se2){
			}
			try{
				if(conn != null) conn.close();
			} catch(SQLException se){
				se.printStackTrace();
			}
		}
    }
}
