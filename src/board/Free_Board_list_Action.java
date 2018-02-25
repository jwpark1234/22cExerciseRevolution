package board;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Free;
import bean.BoardDto_Tip;
import controller.CommandAction;
import dao.BoardDao_Free;
import dao.BoardDao_Tip;

public class Free_Board_list_Action implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		
		//검색조건과 검색내용을 가져온다
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		System.out.println("검색조건 검색내용"+keyField+keyWord);
		
		// 검색조건과 내용을 Map에 담는다
		HashMap<String, Object> listOpt = new HashMap<String, Object>();
		listOpt.put("keyField", keyField);
		listOpt.put("keyWord", keyWord);
		
		
		BoardDao_Free dao = new BoardDao_Free();
		ArrayList<BoardDto_Free> list =  dao.getBoardlist(listOpt);
		System.out.println(list.size());
		
		request.setAttribute("dto", list);
		
		return "board/Free_Board_list.jsp";
	}
	
	

}
