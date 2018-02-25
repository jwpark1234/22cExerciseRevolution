package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Chat_request;
import controller.CommandAction;
import dao.ChatDao;

public class ChatReqReadAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("채팅방 목록을 가져오는 액션");
		request.setCharacterEncoding("UTF-8");
		
		// 레벨에 따라 가져오는 목록이 달라짐
		int level = (int) request.getSession().getAttribute("Level");
		
		List<Chat_request> chatReq_list = null;
		String id = (String)request.getSession().getAttribute("Id");

		if(level == 6) {
			chatReq_list = new ChatDao().readAdminRequestList();	
		}
		// 고레벨은 상담대기 중인 채팅방과 자기가 상담해주고 있는 채팅방을 가져온다.
		else if(level >= 4) {
			chatReq_list = new ChatDao().readChatRequestList(id);	
		}
		// 저레벨은 자기가 신청한 모든 채팅방을 가져온다.
		else {
			chatReq_list = new ChatDao().readMyChatRequestList(id);	
		}
		request.setAttribute("chatReq_list", chatReq_list);

		// 안읽은 메세지 목록을 갱신
		List<Integer> checkMsg_list = new ChatDao().readCheckMsg(id);
		request.setAttribute("checkMsg_list", checkMsg_list);
		
		return "chat/chat_request.jsp";
	}

}
