package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.eventEnter;
import controller.CommandAction;
import dao.eventEnterDao;

public class event_main_join implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		String dateEnter = request.getParameter("dateEnter");
		String ck = request.getParameter("ck");
		
		// 이벤트 참여
		eventEnter dto = new eventEnter();
		
		dto.setId(id);
		dto.setSubject(subject);
		dto.setDateEnter(dateEnter);
		dto.setCk(ck);
		
		eventEnterDao dao = new eventEnterDao();
		dao.eventCount(subject);
		
		dao.eventJoin(dto);
		
		return null;
	}

	
	
	
}
