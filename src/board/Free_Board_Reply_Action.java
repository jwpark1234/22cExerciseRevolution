package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Free;

import controller.CommandAction;
import dao.BoardDao_Free;


public class Free_Board_Reply_Action implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		
	    System.out.println("Free_Board_Reply_Action에 들어왓습니다");
	    
        BoardDto_Free dto = new BoardDto_Free();
		
		String Id = (String)request.getSession().getAttribute("Id");
		String subject = request.getParameter("Subject");
		String content = request.getParameter("Content");
		String password = request.getParameter("Password");
		int num = Integer.parseInt(request.getParameter("num"));//부모 글의 num
		
		dto.setId(Id);
		dto.setSubject("[RE]:"+subject);
		dto.setContent(content);
		dto.setPassword(password);
		
		BoardDao_Free dao = new BoardDao_Free();
		
		BoardDto_Free dto2 = dao.getRead(num);
		//부모 글을 가져옴
		dto.setNum(num);
		dto.setDepth(dto2.getDepth()+1);
        dto.setPos(dto2.getPos()+1);
		
		dao.Free_REwrite(dto);
		
		System.out.println("출력OK?");
		
		return "board_Free.do";
	}

}
