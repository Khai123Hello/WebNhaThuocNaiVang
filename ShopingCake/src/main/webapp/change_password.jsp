<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="Components/alert_message.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tạo mật khẩu mới</title>
<%@include file="Components/css_js.jsp"%>
<style>
label {
	font-weight: bold;
}

.btn-outline-primary {
	background-color: white;
	color: #33cccc;
	border: 2px solid #33cccc;
}

.btn-outline-primary:hover {
	background-color: #33cccc;
        border: #33cccc;
	color: white;
}
</style>
</head>
<body>

	<div class="container-fluid ">
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body px-5">

						<div class="container text-center">
							<img src="viewroot/img/logo/forgot-password.png" style="max-width: 100px;"
								class="img-fluid">
						</div>
						<h3 class="text-center mt-3">Cập nhật mật khẩu</h3>

						<form action="ChangePasswordServlet" method="post">
							<div class="mb-3 mt-3">
								<label class="form-label">Mật khẩu mới</label> <input
									type="password" name="password" id="password"
									placeholder="Nhập mật khẩu mới" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mật khẩu xác nhận</label> <input
									type="password" id="confirm_password"
									placeholder="Nhập mật khẩu xác nhận" class="form-control" required>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-primary me-3">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var password = document.getElementById("password");
		var confirm_password = document.getElementById("confirm_password");

		function validatePassword() {
			if (password.value != confirm_password.value) {
				confirm_password.setCustomValidity("Mật khẩu không khớp");
			} else {
				confirm_password.setCustomValidity('');
			}
		}
		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;
	</script>
</body>
</html>