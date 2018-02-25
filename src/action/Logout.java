package action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandAction;

public class Logout implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("Id");
		session.invalidate();
		
		Cookie[] cookie=request.getCookies();
	      if(cookie !=null){
	         for(Cookie coo :cookie){
	        	 if(coo.getName().equals(id+"&Level") || coo.getName().equals(id+"&Point") || coo.getName().equals(id+"&Exp")) {
		            coo.setValue(null);
		            coo.setMaxAge(0);
		            response.addCookie(coo);
	        	 }
	         }
	               
	      }
			
		return "redirectMain.jsp";
	}

	
	
}
