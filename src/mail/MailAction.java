package mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import mail.SMTPAuthenticator;

public class MailAction {
	// 인증번호 생성
	public String RandomNum() {

		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	
	// 메일 보내기
	public int sendEmail(String to, String authNum) {

		String smtpHost = "smtp.naver.com"; // 네이버 메일서버를 사용

		// 인증 메일 제목
		String subject = "이메일 인증!!!";
		String content = "인증번호는 [" + authNum + "] 입니다. 입력창에 정확하게 적어주세요.";

		// 인증받을 메일 주소
		String toEmail = to;

		String fromName = "22세기 운동혁명!!";
		String fromEmail = "leonu@naver.com";

		try {
			Properties props = new Properties();
			props.put("mail.smtp.host", smtpHost);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			
			Authenticator myauth = new SMTPAuthenticator();
			Session sess = Session.getInstance(props, myauth);

//			sess.setDebug(true);
			
			InternetAddress addr = new InternetAddress(fromEmail);
			addr.setPersonal(fromName, "UTF-8");
			addr.setAddress(fromEmail);

			MimeMessage msg = new MimeMessage(sess);
			msg.setFrom(addr);
			msg.setSubject(MimeUtility.encodeText(subject, "utf-8", "B"));
			msg.setContent(content, "text/html;charset=utf-8");
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
	
			Transport.send(msg); // 보내기

			return 1; // 성공하면 1 리턴

		} catch (Exception e) {
			e.printStackTrace();

			return 0; // 실패하는 0 리턴

		}
	}
}
