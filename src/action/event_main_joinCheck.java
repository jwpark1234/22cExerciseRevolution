package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.eventEnter;
import controller.CommandAction;
import dao.eventEnterDao;

public class event_main_joinCheck implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		
		HashMap<String, String> hash = new HashMap<String,String>();
		
		
		// 참여한 적이 있는지
		hash.put("id", id);
		hash.put("subject", subject);
		
		String ck = new eventEnterDao().joinCheck(hash);
		
		return ck;
	}

	
	
	
	
}
