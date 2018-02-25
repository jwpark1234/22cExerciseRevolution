package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandAction;
import dao.eventEnterDao;

public class event_gamble implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        System.out.println("event_gamble 이동");
        HttpSession session = request.getSession();  
        String id = (String)session.getAttribute("Id");
        
        List result = new ArrayList();
        
        result = new eventEnterDao().gambleResult1(id); // 유저 gamble 현황
        
        request.setAttribute("result", result);
        
        
        return "event/event_gamble.jsp";
    }

    
}
