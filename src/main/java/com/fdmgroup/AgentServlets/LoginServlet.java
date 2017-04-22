package com.fdmgroup.AgentServlets;

import java.io.IOException;
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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user = request.getParameter("userName");
		String pwd = request.getParameter("password");

		HttpSession session = request.getSession();
		session.setAttribute("loggedInUser", FunctionalityFactory.getAgent().createUser(user, pwd));
		if (FunctionalityFactory.getAgent().createUser(user, pwd).getClass() == User.class) {
			session.setAttribute("page", 0);
			session.setAttribute("ShoppingCart", new ArrayList<Book>());
			session.setAttribute("clickFlag", 0);
			request.getRequestDispatcher("/getBooks").forward(request, response);
		} else if (FunctionalityFactory.getAgent().createUser(user, pwd).getClass() == Publisher.class) {
			session.setAttribute("page", 0);
			session.setAttribute("clickFlag", 0);
			request.getRequestDispatcher("addBook.jsp").forward(request, response);
		}
		// response.sendRedirect("addBook.jsp");
		else
			response.sendRedirect("index.html");

	}
}
