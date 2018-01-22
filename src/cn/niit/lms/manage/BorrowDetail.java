package cn.niit.lms.manage;

import java.sql.ResultSet;
import cn.niit.lms.jdbc.lms_jdbc;

public class BorrowDetail {
	private static int fine;
	public static int getfine(){return fine;}
	public static void setfine(int sfine){
		fine = sfine;
	}
	public static ResultSet RS(String id){
		System.out.println("!½øÈë BorrowDetail.java!");
		String uid = id;
		lms_jdbc jdbc = new lms_jdbc();
		jdbc.creatConnection();
		//ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ï²ï¿½Ñ¯
		jdbc.Query("Select books.BID, books.ISBN, title, author, category, Borrow_Date, Limit_Date, Fine, State from books "
				+ "left join borrowed_books on (books.BID = borrowed_books.BID) "
				+ "left join isbn_books on(books.ISBN=isbn_books.ISBN) "
				+ "where books.UID=" + uid);
		System.out.println("!ÍË³öBorrowDetail.java!");
		return jdbc.rs;
	}
}
