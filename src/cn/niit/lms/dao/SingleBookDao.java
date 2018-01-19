package cn.niit.lms.dao;

import java.sql.*;
import java.util.ArrayList;

import cn.niit.lms.domain.SingleBook;
import cn.niit.lms.jdbc.JDBCUtils;

public class SingleBookDao {
	public static ArrayList<SingleBook> readsingleBook(String ISBN){
		Connection conn=null;
		Statement st = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<SingleBook> BookList = new ArrayList<SingleBook>();
		try {    
            conn = JDBCUtils.getConnection();
            st = conn.createStatement();
            System.out.println("ISBN in SingleBookDao: "+ISBN);
            sql="select b.bid, ib.ISBN, ib.title, ib.author, ib.category from Books b left join ISBN_Books ib on b.ISBN = ib.ISBN where B.ISBN='"+ISBN+"'";  
            rs = st.executeQuery(sql);  
           while(rs.next()){
        	   	SingleBook sBook = new SingleBook();
        	   	sBook.setISBN(rs.getString("ISBN"));
				sBook.setTitle(rs.getString("title"));
				sBook.setAuthor(rs.getString("author"));
				sBook.setCategory(rs.getString("category"));
				sBook.setBID(rs.getInt("BID"));
				BookList.add(sBook);
           }
            System.out.println("BookDao通过ISBN查询Book信息成功");  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }    
        return BookList;
		
		
	}
}

