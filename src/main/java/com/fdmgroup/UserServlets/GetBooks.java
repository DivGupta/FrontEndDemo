package com.fdmgroup.UserServlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fdm.frontEndFuntionality.FunctionalityFactory;
import com.fdm.library.Book;

/**
 * Servlet implementation class GetBooks
 */
@WebServlet("/getBooks")
public class GetBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetBooks() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int page = (int) session.getAttribute("page");
		List<Book> books = FunctionalityFactory.getUser().getBook();
		int size = books.size() - 1;
		int cur = page;
		int upper = 3;
		int flag = (int) session.getAttribute("clickFlag");
		System.out.println(flag);

		if (request.getParameter("fward") != null || flag == 0) {
			int cntr = 0;
			while (cur < 0)
				cur = (size + 1) + cur;
			for (int i = 0; i < upper; i++) {
				while (cur + cntr > size) {
					cur = (cur + cntr) - (size + 1);
					cntr = 0;
				}

				Book book = books.get(cur + cntr);

				session.setAttribute("book" + i, books.get(cur + cntr));
				session.setAttribute("cover" + i, request.getServletContext().getAttribute("DIR") + "\\"
						+ book.getPath().split(":::")[0].split("UploadDir")[1]);
				cntr++;
			}
			session.setAttribute("page", page + 1);
			session.setAttribute("clickFlag", 1);
			request.getRequestDispatcher("AllBooks.jsp").forward(request, response);
		}
		if (request.getParameter("bkward") != null) {
			cur = cur - 1;
			while (cur < 0)
				cur = (size + 1) + (cur);
			int cntr = 0;

			for (int i = 0; i < upper; i++) {
				while (cur + cntr > size) {
					cur = (cur + cntr) - (size + 1);
					cntr = 0;
				}

				Book book = books.get(cur + cntr);

				session.setAttribute("book" + i, book);
				session.setAttribute("cover" + i, request.getServletContext().getAttribute("DIR") + "\\"
						+ book.getPath().split(":::")[0].split("UploadDir")[1]);
				cntr++;

			}
			session.setAttribute("clickFlag", 2);
			session.setAttribute("page", page - 1);
			request.getRequestDispatcher("AllBooks.jsp").forward(request, response);
		}

	}

}
