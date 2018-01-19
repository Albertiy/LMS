package cn.niit.lms.dao;

import java.util.ArrayList;

import cn.niit.lms.domain.Book;
import cn.niit.lms.domain.Rule;

public interface BookSearchDao {
	ArrayList<Book> searchBook(String stype,String sinfo);
	
	boolean reserveBook(int UID,Rule rule,String ISBN);
}