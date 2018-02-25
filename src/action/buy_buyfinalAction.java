package action;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import bean.Chat_room;
import bean.User;
import bean.buyDto;
import bean.coupon;
import bean.deliver;
import controller.CommandAction;
import dao.ChatDao;
import dao.UserDao;
import dao.buyDao;
import file.JsonFile2;

public class buy_buyfinalAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("Id").toString();
		request.setCharacterEncoding("UTF-8");
		System.out.println("Buy_final ::::intro");
		String destination = request.getParameter("destination");
		String receiver = request.getParameter("receiver");
		String coupon_id = request.getParameter("coupon_id");
		String data = request.getParameter("data"); 
		String pname=request.getParameter("name");
    	String price = request.getParameter("price");
    	String count= request.getParameter("count");
    	String pimg = request.getParameter("img");
    	int pointprice=Integer.parseInt(request.getParameter("pointprice"));
    	int totalprice=Integer.parseInt(request.getParameter("totalprice"));
		JSONParser parse = new JSONParser();
		JSONArray jsonA = (JSONArray) parse.parse(data);
		
		
		
		
		System.out.println(destination); 
		System.out.println(receiver); 
		System.out.println(coupon_id); 
		System.out.println(jsonA.toJSONString()); // json형태면 문자열로 만들어서 반환!!!
		coupon cp=new coupon();
		buyDao bdao=new buyDao();
		buyDto bdto=new buyDto();
		deliver deliver=new deliver();
		System.out.println("coupon -1::: action");
		//coupon id를 이용해서 -1개
		cp.setId(id);
		cp.setCoupon(coupon_id);
		bdao.minuscoupon(cp);
		
		//destination,name 입력
		
		deliver.setId(id);
		deliver.setStat("장바구니");
		List<deliver> L2 =bdao.selectnotbaguni(deliver);
		if(L2==null||L2.size()==0){
			// 포인트 업데이트 + 레벨 업데이트
			JsonFile2 jf = new JsonFile2();
			JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
			new UserDao().updatePointAndLevel(true,id,"buy_point_first",json);
									// 포인트 부여, 아이디, 포인트명, 기준 포인트의 대한 데이터
									// 포인트를 줄거면 true, 차감할거면 false
									// 포인트명은 pointReadAction.java를 참고!!!
									// id, json은 고정
									// 리턴값이 user객체이기 때문에 변경된 level과 point값을 받아서 세션을 업데이트해주자!!
			
			Chat_room msg = new Chat_room();
			msg.setReq_idx(new ChatDao().getAdminReqIdx(id)); // 알림메세지를 받을 회원 채팅방 인덱스(고정)
			msg.setFrom_id("admin");	// 운영자 아이디(고정)
			msg.setFrom_level(6);		// 운영자 레벨(고정)
			msg.setTo_id(id);			// 알림메세지를 받을 회원 아이디(고정)
			msg.setMessage("첫구매를 감사드립니다. "+json.get("buy_point_first")+"포인트를 드립니다."); // 회원에게 보낼 메세지
			msg.setCheckMsg(1);			// 안읽은 메세지 표시(고정)
			new ChatDao().insertMessage(msg);
		}else {
			JsonFile2 jf = new JsonFile2();
			JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
			
			totalprice=totalprice *Integer.parseInt((String)json.get("buy_point"))/100;
			
			
			new UserDao().updatePointAndLevel(true,id,totalprice,json);
									// 포인트 부여, 아이디, 포인트명, 기준 포인트의 대한 데이터
									// 포인트를 줄거면 true, 차감할거면 false
									// 포인트명은 pointReadAction.java를 참고!!!
									// id, json은 고정
									// 리턴값이 user객체이기 때문에 변경된 level과 point값을 받아서 세션을 업데이트해주자!!
			Chat_room msg = new Chat_room();
			msg.setReq_idx(new ChatDao().getAdminReqIdx(id)); // 알림메세지를 받을 회원 채팅방 인덱스(고정)
			msg.setFrom_id("admin");	// 운영자 아이디(고정)
			msg.setFrom_level(6);		// 운영자 레벨(고정)
			msg.setTo_id(id);			// 알림메세지를 받을 회원 아이디(고정)
			msg.setMessage("구매를 감사드립니다. "+totalprice+"포인트를 드립니다."); // 회원에게 보낼 메세지
			msg.setCheckMsg(1);			// 안읽은 메세지 표시(고정)
			new ChatDao().insertMessage(msg);
		}
		
		JsonFile2 jf = new JsonFile2();
		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
		new UserDao().updatePointAndLevel(false,id,pointprice,json);
								// 포인트 부여, 아이디, 포인트명, 기준 포인트의 대한 데이터
								// 포인트를 줄거면 true, 차감할거면 false
								// 포인트명은 pointReadAction.java를 참고!!!
								// id, json은 고정
								// 리턴값이 user객체이기 때문에 변경된 level과 point값을 받아서 세션을 업데이트해주자!!
		User user = new UserDao().getUser(id);
		// 레벨, 포인트, 경험치를 갱신
        request.getSession().setAttribute("Level", user.getLevel());
        request.getSession().setAttribute("Point", user.getPoint());
        request.getSession().setAttribute("Exp", user.getExp());
		
		if (user.getLevel() < 4) {
			session.setAttribute("nextLevel", json.get("level" + (user.getLevel() + 1)));
			 response.addCookie(new Cookie(user.getID()+"&nextLevel", ""+json.get("level" + (user.getLevel() + 1))));
		}
		else if (4 <= user.getLevel() && user.getLevel() <= 5) {
			session.setAttribute("nextLevel", "Top " + json.get("level5"));
			response.addCookie(new Cookie(user.getID()+"&nextLevel", ""+"Top " + json.get("level5")));
		}
		else if (user.getLevel() == 6) {
			session.setAttribute("nextLevel", "0");
			response.addCookie(new Cookie(user.getID()+"&nextLevel", "0"));
		}
		
		response.addCookie(new Cookie(id+"&Level", ""+user.getLevel()));
        response.addCookie(new Cookie(id+"&Point", ""+user.getPoint()));
        response.addCookie(new Cookie(id+"&Exp", ""+user.getExp()));
       
        
        
		for(int i=0;i<jsonA.size();i++){
			
			
			HashMap<String, Object> map=new HashMap<String,Object>();
			map=(HashMap<String, Object>) jsonA.get(i);
			
			if(map.get("stat").equals("배송시작")){
				map.put("dest", destination);
				map.put("name", receiver);
				
				map.put("id",id);
				System.out.println(i+"번째 hash 작업중::deliver/sboard update");
				bdao.changeDeliver(map);//deliver테이블 주소랑 더하기
				
				bdao.changecount(map);
			}
			
			
			
		}
		
		if(request.getParameter("check").equals("true")){
			deliver.setId(id);
			deliver.setName(receiver);
			deliver.setPname(pname);
			deliver.setCount(count);
			deliver.setDest(destination);
			deliver.setStat("배송시작");
			deliver.setPimg(pimg);
			deliver.setPrice(Integer.parseInt(price));
			bdao.insertdeliver2(deliver);
		}
	
		return null;
	}

}
