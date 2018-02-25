package action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Chat_request;
import controller.CommandAction;
import dao.ChatDao;

public class ChatDeleteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("채팅방을 삭제하는 액션");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 삭제할 채팅방의 인덱스값을 받아옴
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		// 해당 채팅방 삭제 : db에서 삭제가 아닌 상태값을 바꿔줘서 조회할 수 없게 함.
		new ChatDao().deleteChatRequest(idx);
		
		// 다시 리스트를 가져옴.
		String id = (String) request.getSession().getAttribute("Id");
		List<Chat_request>chatReq_list = new ChatDao().readMyChatRequestList(id);	
		request.setAttribute("chatReq_list", chatReq_list);
		
		//안읽은 메세지 정보를 갱신하기 위해 다시 조회해서 넘겨줌
      	List<Integer> checkMsg_list = new ChatDao().readCheckMsg(id);
      	request.setAttribute("checkMsg_list", checkMsg_list);
		
		return "chat/chat_request.jsp";
	}

}
