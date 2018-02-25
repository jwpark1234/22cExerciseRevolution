package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Tip;
import controller.CommandAction;
import dao.BoardDao_Tip;

public class Tip_Board_update implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		
	    System.out.println("Dao에 들어왓습니다");
	    
	    int num=Integer.parseInt(request.getParameter("Tip_update_num"));
		String subject=request.getParameter("Tip_update_subject");
		String content=request.getParameter("Tip_update_content");
		
		System.out.println("값은 "+subject+num+content);
		
		BoardDto_Tip dto=new BoardDto_Tip();
		
		dto.setNum(num);
		dto.setSubject(subject);
		dto.setContent(content);
		
		BoardDao_Tip dao=new BoardDao_Tip();
		
		dao.Tip_update(dto);
		
		request.setAttribute("dto", dto);
		
		return "board/Tip_Board_read.jsp";
	}
	
	

}
