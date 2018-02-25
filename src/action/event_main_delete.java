package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;
import dao.eventEnterDao;

public class event_main_delete implements CommandAction{

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        
        String subject = request.getParameter("subject");
        
        // 이벤트 삭제
        new eventEnterDao().eventDelete(subject);
        
        
        return null;
    }

    
    
    
}
