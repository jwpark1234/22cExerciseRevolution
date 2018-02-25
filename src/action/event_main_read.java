package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;

public class event_main_read implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        System.out.println("event_main_read 이동");
        
        return "event/event_main_read.jsp";
    }

    
    
}
