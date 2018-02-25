package board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Tip;
import controller.CommandAction;
import dao.BoardDao_Tip;
import paging.Paging;

public class Tip_Board_list implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("Tip_Board_list");
		System.out.println("request.getpa  "+request.getParameter("pageNum"));
		
		int page = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDao_Tip Dao=new BoardDao_Tip();
		
		List<BoardDto_Tip> dto=Dao.getList();
		Paging pg = new Paging();
		pg.paging(page, dto.size(), 10, 5, "board_Tip.do");
		request.setAttribute("sb", pg.getSb());
		dto = Dao.nowPage_Tip(pg.getStartRow()-1);
		
		request.setAttribute("dto", dto);
		
		
		
		return "board/Tip_Board_list.jsp";
	}
}