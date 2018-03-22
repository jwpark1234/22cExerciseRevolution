package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.CommandAction;
import dao.ChatDao;

public class ChatReqStatusAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		System.out.println("채팅방 상태를 가져오는 액션");
		request.setCharacterEncoding("UTF-8");

		// 인덱스에 해당하는 채팅방의 상태를 가져와 넘겨준다.
		int idx = Integer.parseInt(request.getParameter("idx"));
		return String.valueOf(new ChatDao().getChatRequestStatus(idx));
	}

}
