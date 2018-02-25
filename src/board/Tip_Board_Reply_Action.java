package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Tip;
import controller.CommandAction;
import dao.BoardDao_Tip;

public class Tip_Board_Reply_Action implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		
	    System.out.println("Tip_Board_Reply_Action에 들어왓습니다");
	    
        BoardDto_Tip dto = new BoardDto_Tip();
		
		String Id = (String)request.getSession().getAttribute("Id");
		String subject = request.getParameter("Subject");
		String content = request.getParameter("Content");
		String password = request.getParameter("Password");
		int num = Integer.parseInt(request.getParameter("num"));//부모 글의 num
		
		dto.setId(Id);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPassword(password);
		
		BoardDao_Tip dao = new BoardDao_Tip();
		
		BoardDto_Tip dto2 = dao.getRead(num);
		//부모 글을 가져옴
		dto.setNum(num);
		dto.setDepth(dto2.getDepth()+1);
        dto.setPos(dto2.getPos()+1);
		
		dao.Tip_REwrite(dto);
		
		System.out.println("출력OK?");
		
		return "board_Tip.do";
	    
	    
	    
	    
	}
	
    
}
