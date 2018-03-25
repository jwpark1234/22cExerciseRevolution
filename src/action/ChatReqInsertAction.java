package action;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bean.Chat_request;
import bean.User;
import controller.CommandAction;
import dao.ChatDao;
import dao.UserDao;
import file.JsonFile2;

public class ChatReqInsertAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		System.out.println("상담을 신청하는 액션");
		request.setCharacterEncoding("UTF-8");

		// 회원id, 레벨, 상담주제를 가져옴
		String id = (String) request.getSession().getAttribute("Id");
		int level = (int) request.getSession().getAttribute("Level");
		String subject = request.getParameter("req_subject");

		Chat_request req = new Chat_request();
		req.setReq_id(id);
		req.setReq_level(level);
		req.setResp_id(""); // 상담자는 아직 없음
		req.setResp_level(0); // 상담자 레벨 0
		req.setSubject(subject);
		req.setStatus(2); // 상담대기는 2
		// 채팅방 생성
		new ChatDao().insertChatRequest(req);

		// 채팅방 갱신
		List<Chat_request> chatReq_list = new ChatDao().readMyChatRequestList(id);
		request.setAttribute("chatReq_list", chatReq_list);

		// 상담을 신청하면 신청자의 포인트를 차감한다.
		JsonFile2 jf = new JsonFile2(); 
		
		// point.json에 포인트 시스템에 대한 정보가 있음
		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload") + "/point.json");
		User user = new UserDao().updatePointAndLevel(false, id, "chat_point", json);
							     // 차감,대상자,채팅 포인트,모든 포인트 정보
		// 포인트 갱신
		request.getSession().setAttribute("Level", user.getLevel());
		request.getSession().setAttribute("Point", user.getPoint());
		request.getSession().setAttribute("Exp", user.getExp());
		if (user.getLevel() < 4) {
			request.getSession().setAttribute("nextLevel", json.get("level" + (user.getLevel() + 1)));
			response.addCookie(new Cookie(id + "&nextLevel", "" + json.get("level" + (user.getLevel() + 1))));
		} else if (4 <= user.getLevel() && user.getLevel() <= 5) {
			request.getSession().setAttribute("nextLevel", "상위 " + json.get("level5") + "명은 5레벨");
			response.addCookie(new Cookie(id + "&nextLevel", "" + "상위 " + json.get("level5") + "명은 5레벨"));
		} else if (user.getLevel() == 6) {
			request.getSession().setAttribute("nextLevel", "∞");
			response.addCookie(new Cookie(id + "&nextLevel", "∞"));
		}

		response.addCookie(new Cookie(id + "&Level", "" + user.getLevel()));
		response.addCookie(new Cookie(id + "&Point", "" + user.getPoint()));
		response.addCookie(new Cookie(id + "&Exp", "" + user.getExp()));

		return "chat/chat_request.jsp";
	}

}
