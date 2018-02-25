package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator { 
	  
	PasswordAuthentication pa;

	public SMTPAuthenticator() {
		// 보내는 메일 계정 정보
		pa = new PasswordAuthentication("leonu", "knives12");
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}