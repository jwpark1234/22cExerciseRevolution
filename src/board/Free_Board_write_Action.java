package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Free;

import controller.CommandAction;
import dao.BoardDao_Free;


public class Free_Board_write_Action implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		BoardDto_Free dto = new BoardDto_Free();
		
		String id = (String)request.getSession().getAttribute("Id");
		String subject = request.getParameter("Subject");
		String content = request.getParameter("Content");
		String password = request.getParameter("Password");
		
		dto.setId(id);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPassword(password);
		
		BoardDao_Free dao = new BoardDao_Free();
		
		dao.Free_write(dto);
		
		System.out.println("출력OK?");
		
		return "board_Free.do";
	}

}
