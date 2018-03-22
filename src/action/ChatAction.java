package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Chat_request;
import controller.CommandAction;
import dao.ChatDao;

public class ChatAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		System.out.println("채팅페이지 이동~~~");

		// 해당 세션의 회원레벨을 얻어온다.
		int level = (int) request.getSession().getAttribute("Level");
		// id가져온다.
		String id = (String) request.getSession().getAttribute("Id");

		// 채팅방 리스트를 담을 배열
		List<Chat_request> chatReq_list = null;

		// 레벨이 4 이상이면 고레벨이고 상담을 해주는 역할
		if (level >= 4) {
			// 아직 상담자가 없는 채팅방 또는 자기가 상담자인 채팅방을 가져온다.
			chatReq_list = new ChatDao().readChatRequestList(id);
		}
		// 레벨이 3 이하이면 저레벨이고 상담을 받는 역할
		else {
			// 자기가 신청한 채팅방을 가져온다.
			chatReq_list = new ChatDao().readMyChatRequestList(id);
		}
		request.setAttribute("chatReq_list", chatReq_list);

		return "chat/chat_main.jsp";
	}

}
