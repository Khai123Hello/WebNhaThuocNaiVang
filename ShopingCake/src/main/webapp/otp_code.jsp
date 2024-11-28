<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mã xác nhận</title>
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
							<img src="Images/forgot-password.png" style="max-width: 100px;"
								class="img-fluid">
						</div>
						<h3 class="text-center mt-3">Mã xác nhận</h3>

						<form action="ChangePasswordServlet" method="post">
							<div class="mb-3">
								<label class="form-label">OTP</label> <input type="number"
									name="code" placeholder="Nhập mã xác nhận" class="form-control"
									required>
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
</body>
</html>