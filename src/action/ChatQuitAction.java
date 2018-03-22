package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Chat_request;
import controller.CommandAction;
import dao.ChatDao;

public class ChatQuitAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		System.out.println("채팅방 상담을 종료하는 액션");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 상담 종료할 인덱스값 얻어옴
		int idx = Integer.parseInt(request.getParameter("idx"));

		// 상담 종료 : 상태값 변경으로 상담자가 조회할 수 없게 만듬
		new ChatDao().quitChatRequest(idx);

		// 다시 목록을 가져옴
		String id = (String) request.getSession().getAttribute("Id");
		List<Chat_request> chatReq_list = new ChatDao().readMyChatRequestList(id);
		request.setAttribute("chatReq_list", chatReq_list);

		return "chat/chat_request.jsp";
	}

}
