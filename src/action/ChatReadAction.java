package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Chat_request;
import bean.Chat_room;
import controller.CommandAction;
import dao.ChatDao;

public class ChatReadAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		System.out.println("채팅방에 대화내용을 가져오는 액션");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 채팅방 인덱스, 상담신청자, 상담자, 상담자 레벨, 상담방 상태 정보를 받아옴
		int req_idx = Integer.parseInt(request.getParameter("idx"));
		String req_id = request.getParameter("req_id");
		String resp_id = request.getParameter("resp_id");
		int resp_level = Integer.parseInt(request.getParameter("resp_level"));
		int status = Integer.parseInt(request.getParameter("status"));

		// 채팅방 상태가 '신청대기'이면 해당 채팅방에 상담자, 상담자레벨 정보를 더해준다.
		if (status == 2) {
			Chat_request req = new Chat_request();
			req.setIdx(req_idx);
			req.setResp_id(resp_id);
			req.setResp_level(resp_level);

			new ChatDao().updateChatRequestStatus(req);
		}
		// 대화내용을 가져온다.
		Chat_room chat = new Chat_room();
		chat.setReq_idx(req_idx);
		chat.setFrom_id(req_id);
		chat.setTo_id(resp_id);
		List<Chat_room> chatRoom_list = new ChatDao().readChatRoom(chat);

		// 채팅방에 정보를 뿌려주기 위해 채팅방 인덱스, 메세지를 보낸 id, 보낸 사람의 레벨을 request에 담을
		String my_id = (String) request.getSession().getAttribute("Id");
		request.getSession().setAttribute("req_idx", req_idx);
		request.getSession().setAttribute("to_id", my_id.equals(req_id) ? resp_id : req_id);
		request.getSession().setAttribute("from_level", (int) request.getSession().getAttribute("Level"));

		request.setAttribute("chatRoom_list", chatRoom_list);

		// 안읽은 메세지 정보를 갱신하기 위해 다시 조회해서 넘겨줌
		List<Integer> checkMsg_list = new ChatDao().readCheckMsg(my_id);
		request.setAttribute("checkMsg_list", checkMsg_list);
		int chatSum = 0;
		for (int i : checkMsg_list) {
			chatSum += i;
		}
		request.getSession().setAttribute("chatSum", chatSum);

		return "chat/chat_room.jsp";
	}

}
