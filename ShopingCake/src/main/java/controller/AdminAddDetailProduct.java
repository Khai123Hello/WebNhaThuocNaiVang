package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.imageio.stream.FileCacheImageInputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import model.bean.Products;
import model.bean.ProductsDetail;
import model.bo.ProductDetailBO;
import model.bo.ProductsBO;
import model.dao.ProductDetailDAO;
import model.dao.ProductsDAO;

/**
 * Servlet implementation class AdminAddDetailProduct
 */
@WebServlet(description = "AdminAddDetailProduct", urlPatterns = { "/admin/pages/detailproduct/add" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminAddDetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String description;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public AdminAddDetailProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long id_sanpham = Long.valueOf(request.getParameter("id_sanpham"));
		request.setAttribute("id_sanpham", id_sanpham);
		ProductsBO product = new ProductsBO();
		Products p = product.getProductsByID(id_sanpham);
		request.setAttribute("product", p);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\detailproduct\\add.jsp");
		dispatcher.forward(request, response);
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
		ProductDetailDAO dao = new ProductDetailDAO();
		HttpSession session = request.getSession();
		ProductsDAO dao2 = new ProductsDAO();
		Long id_sanpham = (Long) session.getAttribute("idSanPham");

		if (ServletFileUpload.isMultipartContent(request)) {
			List<FileItem> formItems = new ServletFileUpload(new DiskFileItemFactory())
					.parseRequest(new ServletRequestContext(request));
			if (formItems != null && formItems.size() > 0) {
				for (FileItem item : formItems) {
					if (!item.isFormField()) {
						// Đường dẫn tuyệt đối tới thư mục gốc của web app.
						String appPath = request.getServletContext().getRealPath("");
						appPath = appPath.replace('\\', '/');
						String fullSavePath = null;
						String fileName = new File(item.getName()).getName();

						if (appPath.endsWith("/")) {
							fullSavePath = appPath + "viewroot/img/shop/DetailProduct/"+fileName;
						} else {
							fullSavePath = appPath + "/" + "viewroot/img/shop/DetailProduct/"+fileName;
						}

						String uploadPath = getServletContext().getRealPath("") + "";
						
						String filePath = "C:\\Users\\Luu Pot\\Desktop\\ShopingCake\\ShopingCake\\src\\main\\webapp\\viewroot\\img\\shop\\DetailProduct\\"
								+ fileName;
						File storeFile = new File(fullSavePath);
						try {
							item.write(storeFile);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						ProductsDetail productsDetail = new ProductsDetail();
						productsDetail.setAnhChiTiet(fileName);
						productsDetail.setId_sanPham(id_sanpham);
						dao.addDetailProducts(productsDetail);

					}
				}
				Products p = dao2.getProductsByID(id_sanpham);
				;
				session.removeAttribute("idSanPham");
				ArrayList<ProductsDetail> lstPd = dao.getProductDetailByProductID(id_sanpham);
				request.setAttribute("lstProductDetail", lstPd);
				request.setAttribute("product", p);
				RequestDispatcher rd = request.getRequestDispatcher("admin\\pages\\detailproduct\\list.jsp");
				rd.forward(request, response);
			}
		}

	}
}
