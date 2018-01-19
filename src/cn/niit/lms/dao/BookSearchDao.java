package cn.niit.lms.dao;

import java.util.ArrayList;

import cn.niit.lms.domain.Book;

public interface BookSearchDao {
	ArrayList<Book> searchBook(String stype,String sinfo);
	
	boolean reserveBook(int UID,String role,int ISBN);
}