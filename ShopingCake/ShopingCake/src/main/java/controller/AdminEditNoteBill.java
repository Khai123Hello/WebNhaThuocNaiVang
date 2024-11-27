package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Bills;
import model.bo.BillsBO;

/**
 * Servlet implementation class AdminEditNoteBill
 */
public class AdminEditNoteBill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminEditNoteBill() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		try {
			long id = Long.parseLong(request.getParameter("id"));
			Bills bill = new Bills();
			bill = new BillsBO().getBillsById(id);
			request.setAttribute("bill", bill);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\bill\\edit.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		long id = Long.parseLong(request.getParameter("id"));
		String ghichu = request.getParameter("ghichu");

		if (new BillsBO().editNoteBills(ghichu, id)) {
			HttpSession session = request.getSession();
			session.setAttribute("Edit", "Success");
			session.setMaxInactiveInterval(15);
			response.sendRedirect("AdminListBills");
		}
		// RequestDispatcher dispatcher =
		// request.getRequestDispatcher("AdminListBills");
		// dispatcher.forward(request, response);
	}

}
