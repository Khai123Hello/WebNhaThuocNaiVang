package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Category;
import model.bo.CategoryBO;

/**
 * Servlet implementation class AdminAddCategory
 */
public class AdminAddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\category\\add.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    Category category = new Category();
	    category.setTenLoaiSanPham(request.getParameter("tenloai"));
	    CategoryBO categoryControl = new CategoryBO();
	    boolean check = categoryControl.addCategory(category);

	    // Điều hướng dựa trên kết quả, sử dụng sendRedirect hoặc forward, không cả hai.
	    if (check) {
	        HttpSession session = request.getSession();
	        session.setAttribute("Add", "Success");
	        session.setMaxInactiveInterval(15);
	        response.sendRedirect("AdminListCategory");  // Dùng sendRedirect nếu muốn chuyển hướng qua URL mới
	        return; // Dừng lại sau khi gửi redirect
	    }

	    // Nếu không thành công, thông báo lỗi và chuyển tiếp
	    request.setAttribute("error", "Thêm loại sản phẩm không thành công.");
	    RequestDispatcher dispatcher = request.getRequestDispatcher("admin/pages/category/add.jsp");
	    dispatcher.forward(request, response);  // Dùng forward nếu muốn giữ nguyên URL hiện tại
	}


}
