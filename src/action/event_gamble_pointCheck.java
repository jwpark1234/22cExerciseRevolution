package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandAction;
import dao.eventEnterDao;

public class event_gamble_pointCheck implements CommandAction{

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        HttpSession session = request.getSession();  
        
        String today = request.getParameter("today");
        String subject = request.getParameter("subject");
        String id = (String)session.getAttribute("Id");
        
        HashMap<String, String> gck = new HashMap<String, String>();
        gck.put("id", id);
        gck.put("dateEnter",today);
        gck.put("subject", subject);
        
        // 현재 포인트 체크
        String point = new eventEnterDao().pointCheck(id);
        int poin = Integer.parseInt(point);
        int ck = new eventEnterDao().gambleCheck(gck);
        request.setAttribute("point", poin);
        request.setAttribute("ck", ck);
        
        List result = new ArrayList();
        
        result = new eventEnterDao().gambleResult1(id);
        
        request.setAttribute("result", result);
        
        
        return "event/event_gamble.jsp";
    }

    
    
}
