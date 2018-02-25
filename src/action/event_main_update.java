package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.event;
import controller.CommandAction;
import dao.eventEnterDao;

public class event_main_update implements CommandAction{

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
    	
        String subject = request.getParameter("subject");

        // 이벤트 수정
        event dto = new eventEnterDao().eventUpdate(subject);
        
        request.setAttribute("a", dto);
        
        
        return "event/event_main_update.jsp";
    }

    
    
}
