package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandAction;
import dao.UserDao;

public class userCheckPwAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		dao.UserDao dao=new UserDao();
		HttpSession session=request.getSession();
		String Id=(String)session.getAttribute("Id");
		String real_pw=dao.getPw(Id);							//DB에서 뽑아온 PW
		String writing_pw=request.getParameter("writing_pw");	//입력받은 PW
		
		System.out.println("실제 비밀번호: "+real_pw);
		System.out.println("입력받은 비밀번호 : "+writing_pw);
		
		if(real_pw.equals(writing_pw)){
			return "1";
		}else{
			return "0";
			
		}
	}
}
