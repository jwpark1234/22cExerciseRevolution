package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;

public class Tip_Board_UpdateForm_Action implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		
	    System.out.println("Dao에 들어왓습니다");
	    
	    int num=Integer.parseInt(request.getParameter("read_num"));
		String subject=request.getParameter("read_subject");
		String content=request.getParameter("read_content");
		
		request.setAttribute("num", num);
		request.setAttribute("subject", subject);
		request.setAttribute("content", content);
		
		return "board/Tip_Board_update.jsp";
	}

}
