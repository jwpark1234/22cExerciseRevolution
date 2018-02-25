package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandAction;
import dao.eventEnterDao;

public class event_dailyCheckAction implements CommandAction {
    

    
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        HashMap<String, String> check = new HashMap<String, String>();

        HttpSession session = request.getSession();  

        String id = (String)session.getAttribute("Id");
        String today = request.getParameter("today");
        String subject = request.getParameter("subject");
        check.put("id", id);
        check.put("subject", subject);
        check.put("dateEnter", today);
        eventEnterDao ck = new eventEnterDao(); // 매일이벤트 참여 했는지 확인
        int result = ck.dailyCheck(check);
        
        
        return String.valueOf(result);
    }


}
