<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.bo.CategoryBO"%>
    <%@page import="model.bean.Category"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
		CategoryBO category = new CategoryBO();
	%>
 <section class="hero hero-normal">
 		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>Danh Mục Sản Phẩm</span>
						</div>
						<ul>
							<%
													for (Category ds : category.getListCategory()) {
												%>
							<li><a
								href="HomeProductsServlet?id_category=<%=ds.getId()%>"><%=ds.getTenLoaiSanPham()%>
							</a></li>
							<%
													}
												%>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="HomeSearchProduct" method="get">
								
								<input name="key" type="text" placeholder="Bạn muốn tìm gì?">
								<button type="submit" class="site-btn">TÌM KIẾM</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
 
    </section>
</body>
</html>