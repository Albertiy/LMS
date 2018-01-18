package cn.niit.lms.bookmanage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.niit.lms.dao.SingleBookDao;
import java.util.ArrayList;

import cn.niit.lms.domain.SingleBook;

/**
 * Servlet implementation class DamonTest
 */
@WebServlet("/DamonTest")
public class DamonTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	SingleBookDao obj = new SingleBookDao();
	ArrayList<SingleBook> test = new ArrayList<SingleBook>();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DamonTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		test = obj.readsingleBook("1234567890123");
		System.out.println("test:"+test.size());
		for (SingleBook singleBook : test) {
			System.out.println(singleBook.toString());
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
