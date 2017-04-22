package com.fdmgroup.PublisherServlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fdm.frontEndFuntionality.FunctionalityFactory;
import com.fdm.library.Book;
import com.fdm.users.Publisher;

/**
 * Servlet implementation class removeBook
 */
@WebServlet("/removeBook")
public class removeBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public removeBook() {
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

		request.getRequestDispatcher("booksAuthor.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Book book = (Book) session.getAttribute("book");
		Publisher pub = (Publisher) session.getAttribute("loggedInUser");

		FunctionalityFactory.getPublisher().removeBook(pub, book);

		request.getRequestDispatcher("AuthorBib.jsp").forward(request, response);
	}

}
