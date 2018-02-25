package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import bean.BoardDto_Tip;
import controller.CommandAction;

import dao.BoardDao_Tip;


public class Tip_Board_write_Action implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		BoardDto_Tip dto = new BoardDto_Tip();
		
		String Id = (String)request.getSession().getAttribute("Id");
		String subject = request.getParameter("Subject");
		String content = request.getParameter("Content");
		String password = request.getParameter("Password");
		
		dto.setId(Id);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPassword(password);
		
		BoardDao_Tip dao = new BoardDao_Tip();
		
		dao.Tip_write(dto);
		
		System.out.println("출력OK?");
		
		return "board_Tip.do";
	}

}
