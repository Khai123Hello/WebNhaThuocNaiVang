<%@page import="model.bean.Users"%>
<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<jsp:include page="layout/head.jsp"></jsp:include>
<body>

	<!-- Page Preloder -->
	<!-- Thêm phần tiêu đề trang -->
	<jsp:include page="layout/header.jsp"></jsp:include>
	<!-- Xong phần tiêu đề trang -->

	<!-- Hero Section Begin -->
	<jsp:include page="layout/hero-nomar.jsp"></jsp:include>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="viewroot/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Thông Tin Tài Khoản</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> <span>Thông Tin Tài Khoản</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<%
						Users us = (Users) session.getAttribute("uslogin");
						if (us != null) {
							// Giá trị session tồn tại 2 giờ
							session.setMaxInactiveInterval(2 * 60 * 60);
						%>
						<div class="col-sm-4">
							<!--left col-->
							<form method="POST" action="UserEditAvata"
								enctype="multipart/form-data">
								<div class="form-group text-center">
									<img src="viewroot/img/testimonial/<%=us.getAnhChinh()%>"
										class="avatar img-circle img-thumbnail" alt="avatar"
										name="link-img">
									<h4><%=us.getTenHienThi()%></h4>
									<input id="file-up-avatar" type="file"
										class="text-center center-block file-upload" name="file">
									<input value="<%=us.getTenTaiKhoan()%>" name="user-name"
										type="hidden">
								</div>
								<div class="form-group text-center">
									<button class="btn btn-info" type="submit">
										<i class="fa fa-edit"></i> Thay hình đại diện
									</button>
								</div>
							</form>
						</div>
						<!--/col-3-->
						<div class="col-sm-8">
							<div class="tab-content" style="margin-top: 60px;">
								<%
								if (session.getAttribute("SingupError") != null) {
								%>
								<div class="alert alert-danger text-center">
									<strong>Lỗi: </strong><%=session.getAttribute("SingupError")%>
								</div>
								<%
								session.removeAttribute("SingupError");
								}
								%>
								<%
								if (session.getAttribute("SussecfulEditAcc") != null) {
								%>
								<div class="alert alert-success text-center">
									<strong>Thông báo!</strong>
									<%=session.getAttribute("SussecfulEditAcc")%>
								</div>
								<%
								session.removeAttribute("SussecfulEditAcc");
								}
								%>

								<form class="form" action="HomeUserProfileServlet" method="post">
									<div class="form-group">
										<label for="username"><h4>Tài khoản</h4></label>
										<input type="text" class="form-control" id="username"
											placeholder="Tài khoản" title="Nhập vào tên tài khoản."
											value="<%=us.getTenTaiKhoan()%>" disabled>
									</div>
									<input value="<%=us.getTenTaiKhoan()%>" name="user-name" hidden="">
									<input value="<%=us.getId()%>" name="id" type="hidden">
									<div class="form-group">
										<label for="email"><h4>Email</h4></label>
										<input type="email" class="form-control" id="email" name="email"
											placeholder="Email" title="Nhập vào email." value="<%=us.getEmail()%>"
											disabled>
									</div>
									<div class="form-group">
										<label for="view-name"><h4>Tên hiển thị</h4></label>
										<input type="text" class="form-control" id="view-name" name="view-name"
											placeholder="Tên hiển thị" title="Nhập vào tên hiển thị."
											value="<%=us.getTenHienThi()%>" required>
									</div>
									<div class="form-group">
										<label for="password"><h4>Mật khẩu</h4></label>
										<input type="password" class="form-control" id="password" name="password"
											placeholder="Mật khẩu" title="Nhập vào mật khẩu." value="" required>
									</div>
									<div class="form-group text-center">
										<button class="btn btn-success" type="submit">
											<i class="fa fa-edit"></i> Lưu lại
										</button>
										<button class="btn btn-secondary" type="reset">
											<i class="fa fa-undo"></i> Nhập lại
										</button>
									</div>
								</form>
							</div>
							<%
							} else {
							%>
							<div class="alert alert-danger text-center">
								<strong>Tài khoản đã được đăng xuất!</strong> Bạn vui lòng đăng nhập để dùng tính năng này.
							</div>
							<%} %>
							<!--/tab-pane-->
						</div>
						<!--/tab-content-->
					</div>
				</div>
			</div>
	</section>
	<!-- Shoping Cart Section End -->

	<!-- Thêm chân trang -->
	<jsp:include page="layout/footer.jsp"></jsp:include>
	<!-- Xong thêm chân trang -->

</body>

</html>
