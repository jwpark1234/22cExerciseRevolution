package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.event;
import controller.CommandAction;
import dao.eventEnterDao;

public class event_main_updateAction implements CommandAction{

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        int no = Integer.parseInt(request.getParameter("no"));
        String cate = request.getParameter("cate");
        String id = request.getParameter("id");
        String subject = request.getParameter("subject");
        String date = request.getParameter("date");
        String imgMain = request.getParameter("mainImg");
        String imgContent = request.getParameter("contentImg");
        int total = Integer.parseInt(request.getParameter("total"));
        int give = Integer.parseInt(request.getParameter("give"));
        int level = Integer.parseInt(request.getParameter("level"));
        int count = Integer.parseInt(request.getParameter("count"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int finish = Integer.parseInt(request.getParameter("finish"));
        
        // 메인이벤트 수정
        event event = new event();
        event.setNo(no);
        event.setCate(cate);
        event.setId(id);
        event.setSubject(subject);
        event.setDate(date);
        event.setImgMain(imgMain);
        event.setImgContent(imgContent);
        event.setTotal(total);
        event.setGive(give);
        event.setLevel(level);
        event.setCount(count);
        event.setDiscount(discount);
        event.setFinish(finish);
        
        new eventEnterDao().eventUpdateAction(event);
        

        return "event_main.do";
    }
       
    
    
}
