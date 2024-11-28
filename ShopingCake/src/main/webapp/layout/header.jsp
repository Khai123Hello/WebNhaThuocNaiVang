<%@page import="java.util.Map"%>
<%@page import="model.bean.Category"%>
<%@page import="model.bean.Items"%>
<%@page import="model.dao.CartDAO"%>
<%@page import="model.bean.Users"%>
<%@page import="model.bo.CategoryBO"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Map.Entry"%>
<%@ page pageEncoding="utf-8"%>
<%@ page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>NHÀ THUỐC NAI VÀNG</title>
</head>
<body>
	<%
	CategoryBO category = new CategoryBO();
	%>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"><img src="" alt="NHÀ THUỐC NAI VÀNG"></a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
				<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
			</ul>
			<div class="header__cart__price">
				item: <span>$150.00</span>
			</div>
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-bell"></i>Xem hóa đơn</a>
			</div>
			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i>Đăng Nhập/Đăng Ký</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li class="active"><a href="./index.html">Home</a></li>
				<li><a href="./shop-grid.html">Sản phẩm</a></li>
				<li><a href="#">Thuốc</a>
					<ul class="header__menu__dropdown">
						<li><a href="./shop-details.html">Shop Details</a></li>
						<li><a href="./shoping-cart.html">Shoping Cart</a></li>
						<li><a href="./checkout.html">Check Out</a></li>
					</ul></li>
				<!-- Removed Blog and Liên Hệ menu items -->
			</ul>
		</nav>

	</div>
	<!-- Humberger End -->
	<!-- Bắt đầu tiêu đề -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<!-- Removed the Hỗ trợ 24/7 and phone number details -->
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__auth">
								<a href="view-bill.jsp"><i class="fa fa-bell"></i>Xem hóa đơn</a>
							</div>
							<div class="header__top__right__auth">
								<%
								if (session.getAttribute("uslogin") != null) {
									// Giá trị session tồn tại 2 giờ 
									Users us = (Users) session.getAttribute("uslogin");
								%>
								<div class="row">
									<a href="HomeUserProfileServlet?id=<%=us.getId()%>"><i
										class="fa fa-user"></i> <%=us.getTenHienThi()%></a> <a
										href="UsersLogoutServlet"><i class="pe-7s-back"></i> Đăng
										xuất</a>
								</div>
								<%
								} else {
								%>
								<a href="login.jsp"><i class="fa fa-user"></i>Đăng Nhập/Đăng
									ký</a>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="Home"><img src="" alt="NHÀ THUỐC NAI VÀNG"></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="Home">HOME</a></li>
							<li><a href="HomeProductsServlet">SẢN PHẨM</a></li>
							<li><a href="#">THUỐC</a>
								<ul class="header__menu__dropdown">
									<%
									for (Category ds : category.getListCategory()) {
									%>
									<li><a
										href="HomeProductsServlet?id_category=<%=ds.getId()%>"><%=ds.getTenLoaiSanPham()%>
									</a></li>
									<%
									}
									%>
								</ul></li>
							<!-- Removed Blog and Liên Hệ menu items -->
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<%
						CartDAO cart = (CartDAO) session.getAttribute("cart");
						if (cart == null) {
							cart = new CartDAO();
							session.setAttribute("cart", cart);
							session.setMaxInactiveInterval(10 * 60 * 60);
						}
						%>
						<ul>
							<li><a href="#"><i class="fa fa-heart"></i> <span>99</span></a></li>
							<li><a id="cart" href="shoping-cart.jsp"><i
									class="fa fa-shopping-bag"></i> <span id="count"><%=cart.countItems()%></span></a></li>
						</ul>
						<div class="header__cart__price">
							Tổng tiền: <span><%=cart.totalCart()%></span>
						</div>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>

	<!-- Xong tiêu đề -->
	<!-- Cài đặt xem trên thiết bị di động -->
	<!-- Xong cài đặt xem trên thiết bị di động -->

</body>
</html>
