package com.fdmgroup.UserServlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fdm.frontEndFuntionality.FunctionalityFactory;
import com.fdm.library.Book;
import com.fdm.users.User;

/**
 * Servlet implementation class Books
 */
@WebServlet("/books")
public class Books extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Books() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		session.setAttribute("book", (session.getAttribute("book" + request.getParameter("cur"))));
		session.setAttribute("cover", (session.getAttribute("cover" + request.getParameter("cur"))));

		System.out.println(session.getAttribute("book" + request.getParameter("cur")));

		request.getRequestDispatcher("book.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		if (request.getParameter("comment") != null) {
			String text = request.getParameter("text");
			String rating = request.getParameter("star");
			System.out.println(text);
			System.out.println(rating);

			FunctionalityFactory.getUser().comment((Book) session.getAttribute("book"),
					(User) session.getAttribute("loggedInUser"), text, rating);
			System.out.println();

		}
		if (request.getParameter("cart") != null) {
			List<Book> array = (ArrayList<Book>) session.getAttribute("ShoppingCart");
			if (array == null)
				array = new ArrayList<Book>();
			if (!array.contains(session.getAttribute("book")))
				array.add((Book) session.getAttribute("book"));
			session.setAttribute("ShoppingCart", array);

			System.out.println(array);
		}

		request.getRequestDispatcher("book.jsp").forward(request, response);

	}

}
