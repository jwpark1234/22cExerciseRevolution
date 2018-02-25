package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Chat_room;
import controller.CommandAction;
import dao.ChatDao;
import dao.eventEnterDao;

public class event_main_choice implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
	    
	    // 관리자 페이지에서 추첨이벤트 추첨눌렀을 때
		String subject = request.getParameter("subject");
		int give = new eventEnterDao().eventGive(subject);
		
		HashMap map = new HashMap();
		
		map.put("subject", subject);
		map.put("give", give); // 당첨 인원
		map.put("ck", "o");
		
		new eventEnterDao().eventChoice(map);
		new eventEnterDao().eventFail(subject);
		
		new eventEnterDao().eventFinish(subject);
		
		List arry = new ArrayList();
		arry = new eventEnterDao().eventMsg(subject);
		
		// 당첨된 사람들한테 메세지 보내기
		for(int i=0; i<arry.size(); i++){
		String id = (String) arry.get(i);
		Chat_room msg = new Chat_room();
		msg.setReq_idx(new ChatDao().getAdminReqIdx(id)); // 알림메세지를 받을 회원 채팅방 인덱스(고정)
		msg.setFrom_id("admin");	// 운영자 아이디(고정)
		msg.setFrom_level(6);		// 운영자 레벨(고정)
		msg.setTo_id(id);			// 알림메세지를 받을 회원 아이디(고정)
		msg.setMessage(subject+"이벤트에 당첨되셨습니다."); // 회원에게 보낼 메세지
		msg.setCheckMsg(1);			// 안읽은 메세지 표시(고정)
		new ChatDao().insertMessage(msg);
		}
		
		return null;
	}

	
	
}
