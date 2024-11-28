package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Message;
import model.dao.UsersDAO;
import model.helper.MailMessenger;

import java.io.IOException;
import java.util.List;
import java.util.Random;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePasswordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String referrer = request.getHeader("referer");
		UsersDAO userDao = new UsersDAO();
		HttpSession session = request.getSession();

		if (referrer.contains("forgot_password")) {
			String email = request.getParameter("email").trim();
			List<String> list = userDao.getAllEmail();
			if (list.contains(email)) {
				Random rand = new Random();
				int max = 99999, min = 10000;
				int otp = rand.nextInt(max - min + 1) + min;
				session.setAttribute("otp", otp);
				session.setAttribute("email", email);
				MailMessenger.sendOtp(email, otp);

				Message message = new Message("Chúng tôi đã gửi mã đặt lại mật khẩu tới " + email, "success",
						"alert-success");
				session.setAttribute("message", message);
				response.sendRedirect("otp_code.jsp");
			} else {
				Message message = new Message("Email không tồn tại! Thử lại với Email khác!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("forgot_password.jsp");
				return;
			}
		} else if (referrer.contains("otp_code")) {
			int code = Integer.parseInt(request.getParameter("code"));
			int otp = (int) session.getAttribute("otp");
			if (code == otp) {
				session.removeAttribute("otp");
				response.sendRedirect("change_password.jsp");
			} else {
				Message message = new Message("Mã xác minh đã nhập không hợp lệ!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("otp_code.jsp");
				return;
			}
		} else if (referrer.contains("change_password")) {
			String password = request.getParameter("password");
			String email = (String) session.getAttribute("email");
			userDao.updateUserPasswordByEmail(password, email);
			session.removeAttribute("email");

			Message message = new Message("Mật khẩu đã được cập nhật thành công!", "error", "alert-success");
			session.setAttribute("message", message);
			response.sendRedirect("login.jsp");
		}
	}

}
