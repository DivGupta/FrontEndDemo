package com.fdmgroup.AgentServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fdm.frontEndFuntionality.FunctionalityFactory;
import com.fdm.library.Book;
import com.fdm.users.Publisher;
import com.fdm.users.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		String userName = request.getParameter("userName");
		String pwd = request.getParameter("password");
		String email = request.getParameter("email");
		String userType = request.getParameter("optradio");

		if (userType == null)
			userType = "reader";

		User user;
		Publisher author;

		if (userType.equals("reader")) {
			user = FunctionalityFactory.getAgent().createUser(userName, pwd, email, 1);

			if (user == null) {

				out.println("<script type=\"text/javascript\">");
				out.println("alert('Enter a unique username');");
				out.println("</script>");

			}

			HttpSession session = request.getSession();
			session.setAttribute("loggedInUser", user);
			session.setAttribute("page", 0);
			session.setAttribute("ShoppingCart", new ArrayList<Book>());
			session.setAttribute("clickFlag", 0);
			request.getRequestDispatcher("/getBooks").forward(request, response);
		} else {
			author = FunctionalityFactory.getAgent().createUser(userName, pwd, email, 2);

			if (author == null) {

				out.println("<script type=\"text/javascript\">");
				out.println("alert('Enter a unique username');");
				out.println("</script>");

			}

			HttpSession session = request.getSession();
			session.setAttribute("page", 0);
			session.setAttribute("clickFlag", 0);
			session.setAttribute("loggedInUser", author);
			request.getRequestDispatcher("addBook.jsp").forward(request, response);

		}

	}

}
