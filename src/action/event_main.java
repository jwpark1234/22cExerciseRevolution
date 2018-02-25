package action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.event;
import controller.CommandAction;
import dao.eventEnterDao;

public class event_main implements CommandAction{

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        
        
        System.out.println("event_main �씠�룞");

        List<event> arry = new ArrayList<event>();
        
        String img = new eventEnterDao().mainRight();
        
        arry = new eventEnterDao().mainEvent();
        
//        Date today = new Date();
        
        List array = new ArrayList();
        List array1 = new ArrayList();
        List array2 = new ArrayList();
        
        for(int i =0; i<arry.size(); i++){
            array.add(arry.get(i).getDate());
            array1.add(arry.get(i).getSubject());
            array2.add(arry.get(i).getCate());
        }
        
        // 메인이벤트 뿌려주기
        request.setAttribute("eventCate", array2);
        request.setAttribute("eventSelect", arry);
        request.setAttribute("eventDate", array);
        request.setAttribute("eventSubject", array1);
        request.setAttribute("mainRight", img);
        return "event/event_main.jsp";
    }

    
    
}
