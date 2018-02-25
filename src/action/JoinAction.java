package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bean.Chat_request;
import bean.Chat_room;
import bean.User;
import controller.CommandAction;
import dao.ChatDao;
import dao.UserDao;
import file.JsonFile2;

public class JoinAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("라라라라");

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		User dto = new User();

		String Id = request.getParameter("Join_id_value");
		System.out.println(Id);
		String Password = request.getParameter("Join_pw_value");
		System.out.println(Password);
		String Name = request.getParameter("Join_name_value");
		System.out.println(Name);
		String Jumin = request.getParameter("Join_jumin1_value") + "-" + request.getParameter("Join_jumin2_value");
		System.out.println(Jumin);
		String Nickname = request.getParameter("Join_nickname_value");
		System.out.println(Nickname);
		String Member_pic = request.getParameter("Join_profile_value");
		System.out.println(Member_pic + "사진");
		Double Height = Double.parseDouble(request.getParameter("Join_height_value"));
		System.out.println(Height);
		Double Weight = Double.parseDouble(request.getParameter("Join_weight_value"));
		System.out.println(Weight);
		String postcode = request.getParameter("postcode");
		System.out.println(postcode);
		String address1 = request.getParameter("address1");
		System.out.println(address1);
		String address2 = request.getParameter("address2");
		System.out.println(address2);
		String Email = request.getParameter("Join_email_value");
		System.out.println(Email);
		String Phonenum = request.getParameter("Join_phonenum1_value") + "-"
				+ request.getParameter("Join_phonenum2_value") + "-" + request.getParameter("Join_phonenum3_value");
		System.out.println(Phonenum);

		dto.setID(Id);
		dto.setPassword(Password);
		dto.setName(Name);
		dto.setJumin(Jumin);
		dto.setNickname(Nickname);
		dto.setMember_pic(Member_pic.equals("") ? "Test.jpg" : Member_pic);
		dto.setHeight(Height);
		dto.setWeight(Weight);
		dto.setAddress(postcode + "%" + address1 + "%" + address2);
		dto.setEmail(Email);
		dto.setPhonenum(Phonenum);

		new UserDao().insertUser(dto);

		// 포인트 업데이트 + 레벨 업데이트
		JsonFile2 jf = new JsonFile2();
		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
		new UserDao().updatePointAndLevel(true,Id,"join_point",json);
								// 포인트 부여, 아이디, 포인트명, 기준 포인트의 대한 데이터
								// 포인트를 줄거면 true, 차감할거면 false
								// 포인트명은 pointReadAction.java를 참고!!!
								// id, json은 고정
								// 리턴값이 user객체이기 때문에 변경된 level과 point값을 받아서 세션을 업데이트해주자!!
		
		// 회원가입을 하면 회원과 운영자 간 채팅방이 생긴다.
		Chat_request req = new Chat_request();
		req.setReq_id(Id);
		req.setReq_level(1);
		req.setResp_id("admin");
		req.setResp_level(6);
		req.setStatus(1);
		req.setSubject("[운영자 알림]");
		new ChatDao().insertChatRequest(req);

		/* 요걸로 알림메세지 보내면 됨!!!!!! */
		Chat_room msg = new Chat_room();
		msg.setReq_idx(new ChatDao().getAdminReqIdx(Id)); // 알림메세지를 받을 회원 채팅방 인덱스(고정)
		msg.setFrom_id("admin");	// 운영자 아이디(고정)
		msg.setFrom_level(6);		// 운영자 레벨(고정)
		msg.setTo_id(Id);			// 알림메세지를 받을 회원 아이디(고정)
		msg.setMessage("가입을 환영합니다."); // 회원에게 보낼 메세지
		msg.setCheckMsg(1);			// 안읽은 메세지 표시(고정)
		new ChatDao().insertMessage(msg);

		return "login.do";
	}
}