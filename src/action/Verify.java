package action;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import controller.CommandAction;

public class Verify implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		// 클라이언트의 요청데이터를 검증할 recaptcha 검증 url
		final String SITE_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";
	 
        try {
            URL verifyUrl = new URL(SITE_VERIFY_URL);
 
            // 커넥션을 연다. 검증서버와의 연결
            HttpsURLConnection conn = (HttpsURLConnection) verifyUrl.openConnection();
 
            // 커넥션에 각종 정보를 세팅한다.
            conn.setRequestMethod("POST");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            conn.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
 
            // 검증 url로 보낼 비밀키와 클라이언트의 요청데이터를 변수에 저장
            String postParams = "secret=6LdQ7kMUAAAAALQcHCmK6R5QtxJNQoReqxrCIL4r"
                    + "&response=" + request.getParameter("response");
 
            // 출력스트림을 세팅한다.
            conn.setDoOutput(true);
 
            // 커넥션으로부터 출력스트림을 얻어온다.
            // 비밀키와 클라이언트의 요청데이터를 검증서버로 보낸다.
            OutputStream outStream = conn.getOutputStream();
            outStream.write(postParams.getBytes());
 
            outStream.flush();
            outStream.close();
 
            // 검증 서버로 부터의 검증코드를 받는다.
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode=" + responseCode);
 
            // 검증서버가 보낸 검증결과를 json객체로 파싱한다. 
            InputStream is = conn.getInputStream();
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(new InputStreamReader(is));
 
            // ==> {"success": true} 가 성공!!
            System.out.println("Response: " + json.toJSONString());

            return json.get("success").toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }
}
