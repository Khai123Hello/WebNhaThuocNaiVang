<%@page import="model.bean.Users"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.DBConnect"%>
<%@page import="model.dao.BillsDAO"%>
<%@page import="model.bean.Bills"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Danh sách hóa đơn</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.table-head {
	color: white;
	background-color: #0ceb9c !important;
}

h2 {
	color: #007bff;
}

.back-button {
	position: fixed;
	bottom: 20px;
	right: 20px;
	background-color: #0ceb9c;
}

.back-button:hover {
	background-color: #0cebb0;
}
</style>
</head>
<body>
	<div class="container my-5">
		<!-- Nút quay lại -->
		<a href="Home" class="btn btn-secondary back-button">Quay lại</a>

		<%
		// Khởi tạo kết nối và lấy email người dùng từ session
		DBConnect cs = new DBConnect();
		cs.KetNoi();

		Users user = (Users) session.getAttribute("uslogin");
		if (user == null) {
		%>
		<div class="alert alert-warning text-center" role="alert">
			<h4>Vui lòng đăng nhập để xem đơn hàng!</h4>
		</div>
		<%
		return;
		}

		String email = user.getEmail();

		BillsDAO orderDao = new BillsDAO();
		List<Bills> orderList = orderDao.getToanBoBillDuaEmail(email);
		%>

		<%
		if (orderList == null || orderList.isEmpty()) {
		%>
		<div class="alert alert-info text-center" role="alert">
			<h4>Không tìm thấy đơn hàng nào</h4>
			<p>Có vẻ như bạn chưa đặt đơn hàng nào!</p>
		</div>
		<%
		} else {
		%>
		<h2 class="text-center mb-4">Danh sách đơn hàng của bạn</h2>
		<div class="table-responsive">
			<table class="table table-striped table-bordered text-center">
				<thead class="table-head">
					<tr>
						<th>ID</th>
						<th>Họ tên</th>
						<th>Số nhà</th>
						<th>Địa chỉ</th>
						<th>Điện thoại</th>
						<th>Email</th>
						<th>Ghi chú</th>
						<th>Tình trạng</th>
						<th>Ngày đặt</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Bills order : orderList) {
					%>
					<tr>
						<td><%=order.getId()%></td>
						<td><%=order.getHoTen()%></td>
						<td><%=order.getSoNha()%></td>
						<td><%=order.getDiaChi()%></td>
						<td><%=order.getSoDienThoai()%></td>
						<td><%=order.getEmail()%></td>
						<td><%=order.getGhiChu()%></td>
						<td>
							<%
							if (order.getTrangThai() == 0) {
							%> Đã đặt hàng <%
							} else if (order.getTrangThai() == 1) {
							%> Đã vận chuyển <%
							} else if (order.getTrangThai() == 2) {
							%> Đã giao hàng <%
							} else if (order.getTrangThai() == 3) {
							%> Đã hủy đơn hàng <%
							} else {
							%> Trạng thái không xác định <%
							}
							%>
						</td>
						<td><%=order.getNgayDat()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<%
		}
		%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
