package board;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bean.BoardDto_Tip;
import bean.Chat_room;
import bean.User;
import controller.CommandAction;
import dao.BoardDao_Tip;
import dao.ChatDao;
import dao.UserDao;
import file.JsonFile2;

public class Tip_Board_check implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDao_Tip dao1 = new BoardDao_Tip();
		dao1.check(num);
		BoardDto_Tip dto1 = dao1.getRead(num);
		
		// 포인트 업데이트 + 레벨 업데이트
				JsonFile2 jf = new JsonFile2();
				JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
				new UserDao().updatePointAndLevel(true,dto1.getId(),"tip_board_point",json);
										// 포인트 부여, 아이디, 포인트명, 기준 포인트의 대한 데이터
										// 포인트를 줄거면 true, 차감할거면 false
										// 포인트명은 pointReadAction.java를 참고!!!
										// id, json은 고정
										// 리턴값이 user객체이기 때문에 변경된 level과 point값을 받아서 세션을 업데이트해주자!!
				
				/* 요걸로 알림메세지 보내면 됨!!!!!! */
				
				Chat_room msg = new Chat_room();
				msg.setReq_idx(new ChatDao().getAdminReqIdx(dto1.getId())); // 알림메세지를 받을 회원 채팅방 인덱스(고정)
				msg.setFrom_id("admin");	// 운영자 아이디(고정)
				msg.setFrom_level(6);		// 운영자 레벨(고정)
				msg.setTo_id(dto1.getId());			// 알림메세지를 받을 회원 아이디(고정)
				msg.setMessage("Tip게시판의 글이 채택되었습니다"); // 회원에게 보낼 메세지
				msg.setCheckMsg(1);			// 안읽은 메세지 표시(고정)
				new ChatDao().insertMessage(msg);
				
				
		return null;
	}

}
