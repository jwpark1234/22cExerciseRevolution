package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Free;

import controller.CommandAction;
import dao.BoardDao_Free;


public class Free_Board_update implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		
	    System.out.println("Dao_Free");
	    
	    int num=Integer.parseInt(request.getParameter("Free_update_num"));
		String subject=request.getParameter("Free_update_subject");
		String content=request.getParameter("Free_update_content");
		
		System.out.println("값은 "+subject+num+content);
		
		BoardDto_Free dto=new BoardDto_Free();
		
		dto.setNum(num);
		dto.setSubject(subject);
		dto.setContent(content);
		
		BoardDao_Free dao=new BoardDao_Free();
		
		dao.Free_update(dto);
		
		request.setAttribute("dto", dto);
		
		return "board/Free_Board_read.jsp";
	}
	
	

}
