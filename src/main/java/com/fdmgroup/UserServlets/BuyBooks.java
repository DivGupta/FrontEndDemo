package com.fdmgroup.UserServlets;

import java.io.FileInputStream;
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
import com.fdm.users.User;

/**
 * Servlet implementation class BuyBooks
 */
@WebServlet("/buyBooks")
public class BuyBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuyBooks() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<Book> sc = (ArrayList<Book>) session.getAttribute("ShoppingCart");
		PrintWriter out = response.getWriter();

		User user = (User) session.getAttribute("loggedInUser");

		for (Book book : sc) {
			String path = book.getPath().split(":::")[1];

			FileInputStream fileInputStream = new FileInputStream(path);
			int i;
			while ((i = fileInputStream.read()) != -1)
				out.write(i);
			fileInputStream.close();
			out.close();
			FunctionalityFactory.getUser().addBook(user, book);
		}

		request.getRequestDispatcher("/getBooks").forward(request, response);
	}

}
