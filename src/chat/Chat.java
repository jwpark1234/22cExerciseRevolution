package chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import bean.Chat_room;
import dao.ChatDao;

// jsp페이지에서 /boardcasting라는 접근으로 이 클래스가 동작하게끔 설정. 클라이언트의 HttpSession을 얻어오는 설정
@ServerEndpoint(value="/broadcasting",configurator = GetHttpSessionConfigurator.class)
public class Chat {

	// 객체에서 사용할 수 있게 클라이언트의 HttpSession 변수를 만듬
	private HttpSession hSession;
	// 현재 웹소켓 서버에 접속한 유저들의 세션과 id, 채팅방 인덱스를 저장하기 위한 Map
	private static Map<String,Session> clients = Collections.synchronizedMap(new HashMap<String,Session>());
	
	// 메세지를 보내면 호출됨
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		
		// 한번에 여러 클라이언트의 접속을 막기위한 동기화 블럭
		synchronized (clients) {
			// 현재 메세지를 보낸 클라이언트의 HttpSession에서 그 클라이언트의 아이디, 메세지를 보낼 대상, 소속된 채팅방인덱스, 클라이언트의 레벨을 얻어옴.
			String from_id = (String)hSession.getAttribute("Id");
			String to_id = (String)hSession.getAttribute("to_id");
			int req_idx = (int)hSession.getAttribute("req_idx");
			int from_level = (int)hSession.getAttribute("from_level");
			
			// 채팅방 DB에 메세지를 저장함.
			Chat_room chat = new Chat_room();
			chat.setReq_idx(req_idx);
			chat.setFrom_id(from_id);
			chat.setFrom_level(from_level);
			chat.setTo_id(to_id);
			chat.setMessage(message);
			new ChatDao().insertMessage(chat);

			// 현재 날짜와 시간을 얻어옴
			Date date = new Date(System.currentTimeMillis());
			SimpleDateFormat f = new SimpleDateFormat("yyyy. M. dd a hh:mm:ss");
			
			System.out.println(String.valueOf(req_idx) + "%" + to_id);
			System.out.println(clients.get(String.valueOf(req_idx) + "%" + to_id));
			
			
			// 접속명단에 채팅방 인덱스와 메세지를 받을 클라이언트가 있으면
			if(clients.get(String.valueOf(req_idx) + "%" + to_id) != null) {
				
				// 해당 클라이언트에게 메세지를 보냄.
				clients.get(String.valueOf(req_idx) + "%" + to_id).getBasicRemote()
				.sendText("<div class='receiMessage'><img src='images/level/" + from_level + ".jpg' style='width:22px; height:22px;'><span><b>" + from_id + "</b></span><p>" + message + "</p><span class='date'>" + f.format(date) + "</span></div>");
			}
		}
	}

	// 웹소켓 서버에 접속함. -> 채팅방에 접속함.
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		// 접속한 클라이언트의 HttpSession을 얻어온다.
		hSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		
		// 접속 명단에 '채팅방 인덱스%클라이언트 아이디'라는 키값을 가진 session을 밸류값으로 하는 정보를 등록한다.
		clients.put(String.valueOf((int)hSession.getAttribute("req_idx")) + "%" + (String)hSession.getAttribute("Id"), session);
	
		System.out.println("접속");
		System.out.println(String.valueOf((int)hSession.getAttribute("req_idx")) + "%" + (String)hSession.getAttribute("Id"));
		System.out.println(session);
	}

	// 웹소켓 연결을 해지함. -> 채팅방에서 나감
	@OnClose
	public void onClose(Session session) {
		System.out.println("해제");
		System.out.println(String.valueOf((int)hSession.getAttribute("req_idx")) + "%" + (String)hSession.getAttribute("Id"));
		System.out.println(clients.get(String.valueOf((int)hSession.getAttribute("req_idx")) + "%" + (String)hSession.getAttribute("Id")));
		
		// 접속 명단에서 삭제
		clients.remove(String.valueOf((int)hSession.getAttribute("req_idx")) + "%" + (String)hSession.getAttribute("Id"));
	}
}