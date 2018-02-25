package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;
import dao.eventEnterDao;

public class event_main_check implements CommandAction{

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        
        // 진행중인 메인 이벤트가 있는지 체크. 
        List arry = new eventEnterDao().mainEvent();
        
        String a = "";
        
        if(arry.isEmpty())
            a = "no";
        return a;
    }
    
}
