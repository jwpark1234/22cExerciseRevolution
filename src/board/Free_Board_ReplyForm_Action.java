package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Free;
import bean.BoardDto_Tip;
import controller.CommandAction;
import dao.BoardDao_Free;
import dao.BoardDao_Tip;

public class Free_Board_ReplyForm_Action implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        System.out.println("Free_Board_ReplyForm_Action");
		
	    int num = Integer.parseInt(request.getParameter("num"));
	    
		System.out.println("num는 "+num);
	    
		BoardDao_Free Dao = new BoardDao_Free();
		
	    BoardDto_Free Dto = Dao.getDetail(num);
	    
	    request.setAttribute("dto", Dto);
	    
		
		return "board/Free_Board_ReplyForm.jsp";
	}

}
