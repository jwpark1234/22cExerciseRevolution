package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.event;
import controller.CommandAction;
import dao.eventEnterDao;

public class event_admin implements CommandAction{

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        
        System.out.println("event_admin �씠�룞");
        
        
        String img = new eventEnterDao().mainRight();
        
        
        List<event> arry = new ArrayList<event>();
        arry = new eventEnterDao().admin();
        
        request.setAttribute("mainRight", img); // 메인이벤트 우측 그림
        request.setAttribute("eventMain", arry); // event테이블 select
        
        
        return "event/event_admin.jsp";
    }

    
    
}
