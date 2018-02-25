package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;
import dao.eventEnterDao;

public class event_coupon_check implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("id");
		String coupon = request.getParameter("coupon");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id",id);
		map.put("coupon", coupon); // 클릭한 쿠폰 명
		
		eventEnterDao dao = new eventEnterDao();
		
		String ck = dao.couponCheck(map); // 쿠폰 있는지 확인
		
		return ck;
	}

	
	
}
