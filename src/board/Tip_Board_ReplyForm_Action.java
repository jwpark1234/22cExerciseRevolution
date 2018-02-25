package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Tip;
import controller.CommandAction;
import dao.BoardDao_Tip;

public class Tip_Board_ReplyForm_Action implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("Tip_Board_ReplyForm_Action");
		
	    int num = Integer.parseInt(request.getParameter("num"));
	    
		System.out.println("num는 "+num);
	    
		BoardDao_Tip Dao = new BoardDao_Tip();
		
	    BoardDto_Tip Dto = Dao.getDetail(num);
	    
	    request.setAttribute("dto", Dto);
	    
		
		return "board/Tip_Board_ReplyForm.jsp";
	}
 
}
