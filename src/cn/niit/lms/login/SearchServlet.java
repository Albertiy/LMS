package cn.niit.lms.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String stype = request.getParameter("stype").toString();
			String sinfo = request.getParameter("sinfo").toString();
			//检查语句：正常
	        //response.setContentType("text/html;charset=UTF-8");
	        //response.getWriter().append("Search Type: "+stype+"; Search Info: "+sinfo);
			
	        
	    }
}
