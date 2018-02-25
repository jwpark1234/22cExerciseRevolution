package board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Free;

import controller.CommandAction;
import dao.BoardDao_Free;
import paging.Paging;


public class Free_Board_list implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("Free_Board_list");
		
		int page = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDao_Free Dao=new BoardDao_Free();
		
		List<BoardDto_Free> dto=Dao.getList();
		Paging pg = new Paging();
		pg.paging(page, dto.size(), 10, 5, "board_Free.do");
		request.setAttribute("sb", pg.getSb());
		dto = Dao.nowPage_Free(pg.getStartRow()-1);
		
		request.setAttribute("dto", dto);
		
		
		return "board/Free_Board_list.jsp";
	}
}