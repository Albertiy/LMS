package cn.niit.lms.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PrintWriter out=response.getWriter();
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		if(Validate.checkUser(email,pwd))
		{
			RequestDispatcher rs;
			rs=request.getRequestDispatcher("index.jsp");
			rs.forward(request,response);
		}
		else
		{
			//out.println("Username or Password incorrect");
			RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
			request.setAttribute("warn", true);	
			rs.include(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
