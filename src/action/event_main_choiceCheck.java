package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;
import dao.eventEnterDao;

public class event_main_choiceCheck implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String subject = request.getParameter("subject");
		
		// 추첨을 했는지 안했는지.
		int finish = new eventEnterDao().eventChoiceCheck(subject);
		
		return String.valueOf(finish);
	}

	
	
	
	
}
