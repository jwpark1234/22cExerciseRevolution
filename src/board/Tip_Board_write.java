package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;

public class Tip_Board_write implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("Tip_Board 글쓰기로 이동");
		return "board/Tip_Board_write.jsp";
	}
	
	

}
