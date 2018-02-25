package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandAction;
import dao.BoardDao_Tip;

public class Tip_Board_delete implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		BoardDao_Tip dao = new BoardDao_Tip();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		dao.Tip_delete(num);
		
		
		
		return "";
	}

}
