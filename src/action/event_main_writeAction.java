package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.event;
import controller.CommandAction;
import dao.eventEnterDao;

public class event_main_writeAction implements CommandAction{

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
 
        
        String cate = request.getParameter("cate");
        String id = request.getParameter("id");
        String subject = request.getParameter("subject");
        String date = request.getParameter("date");
        String imgMain = request.getParameter("mainImg");
        String imgContent = request.getParameter("contentImg");
        int total = Integer.parseInt(request.getParameter("total"));
        int give = Integer.parseInt(request.getParameter("give"));
        int level = Integer.parseInt(request.getParameter("level"));
        int count = 0;
        int discount = Integer.parseInt(request.getParameter("discount"));
        int finish = 0;
        
        // 移댄뀒怨좊━媛� 荑좏룿1�씠�굹 荑좏룿2�씪�븣 荑좏룿�뀒�씠釉붿뿉 DB�옉�뾽 �븯�굹�뜑
        
        event event = new event();
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
        
        new eventEnterDao().mainWrite(event);
        
        return "event_main.do";
    }

    
    
}
