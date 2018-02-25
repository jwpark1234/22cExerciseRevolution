package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import controller.CommandAction;
import dao.eventEnterDao;
import mail.MailAction;

public class event_coupon_get implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	    HttpSession session = request.getSession();
	    
		String id = request.getParameter("id");
		String coupon = request.getParameter("coupon");
		int discount = Integer.parseInt(request.getParameter("discount"));
		String date = request.getParameter("date");
		String buy = "xx"; // 쿠폰 사용한 물품
		int useCk = 0;  // 쿠폰 사용유무
		
		
		HashMap map = new HashMap();
		
		map.put("id", id);
		map.put("coupon", coupon);
		map.put("discount", discount);
		map.put("date", date);
		map.put("buy", buy);
		map.put("useCk", useCk);
		
		eventEnterDao dao = new eventEnterDao();
		dao.couponGet(map); // 쿠폰 얻음
		dao.eventCount(coupon); // 뿌린 쿠폰 갯수
		
		return null;
	}

	
	
}
