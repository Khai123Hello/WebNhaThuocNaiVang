package model.helper;

public class MailMessenger {
	public static void sendOtp(String userEmail, int code) {
		String subject = "Mã xác nhận thay đổi mật khẩu";
		String body = "Xin chào, " + "<p>Vui lòng sử dụng mã xác minh bên dưới để đặt lại mật khẩu của bạn!</p>" + "<h3>" + code
				+ "</h3>";
		try {
			Mail.sendMail(userEmail, subject, body);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
