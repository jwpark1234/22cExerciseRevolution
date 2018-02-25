package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;

public class event_daily implements CommandAction{

        @Override
        public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        	System.out.println("daily 이동");

           return "event/event_daily.jsp";
        }   
     }