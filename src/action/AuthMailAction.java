package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;
import mail.MailAction;

public class AuthMailAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		// 인증을 받을 메일주소를 받는다.
		String email = request.getParameter("email");
		MailAction mail = new MailAction();
		String authNum = mail.RandomNum(); // 인증번호 생성
		int result = mail.sendEmail(email, authNum); // 인증받을 메일로 인증번호를 전송한다.
		if(result == 0) { // 오류나면 공백 리턴
			return "";
		}
		return String.valueOf(authNum); // 결과값 리턴 
	}

}
