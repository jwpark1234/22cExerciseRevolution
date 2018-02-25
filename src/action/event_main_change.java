package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;
import dao.eventEnterDao;

public class event_main_change implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        
        String img = request.getParameter("img");
        
        new eventEnterDao().mainChange(img); // 메인이벤트 페이지 우측 그림 변경
        
        return null;
    }

    
    
}
