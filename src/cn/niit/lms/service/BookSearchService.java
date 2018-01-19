package cn.niit.lms.service;

import java.util.ArrayList;

import cn.niit.lms.dao.BookSearchDao;
import cn.niit.lms.dao.UserDao;
import cn.niit.lms.dao.impl.BookSearchDaoImpl;
import cn.niit.lms.dao.impl.UserDaoImpl;
import cn.niit.lms.domain.Book;

public class BookSearchService {
	private BookSearchDao bdao = new BookSearchDaoImpl();
	
	public ArrayList<Book> bookSearch(String stype, String sinfo){
		
		ArrayList<Book> bookList = bdao.searchBook(stype, sinfo);
		if(bookList.equals(null)||bookList.isEmpty())
		{
			throw new RuntimeException("查询结果为空�?");
		}
		return bookList;
	}
}
