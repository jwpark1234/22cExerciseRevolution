package action;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bean.User;
import bean.eventEnter;
import controller.CommandAction;
import dao.UserDao;
import dao.eventEnterDao;
import file.JsonFile2;

public class event_dailyAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        eventEnter dto = new eventEnter();
        
        dto.setId(request.getParameter("id"));
        dto.setSubject(request.getParameter("subject"));
        
        new eventEnterDao().daily(dto); // 매일이벤트 insert
        
        int poin = Integer.parseInt(request.getParameter("point").equals("") ? "0": request.getParameter("point"));
        String id = request.getParameter("id");
        
        // 레벨  셋팅
        JsonFile2 jf = new JsonFile2();
 		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
         User user = new UserDao().updatePointAndLevel(true,id,poin,json);
         request.getSession().setAttribute("Level", user.getLevel());
         request.getSession().setAttribute("Point", user.getPoint());
         request.getSession().setAttribute("Exp", user.getExp());
 		if (user.getLevel() < 4) {
 			request.getSession().setAttribute("nextLevel", json.get("level" + (user.getLevel() + 1)));
			 response.addCookie(new Cookie(id+"&nextLevel", ""+json.get("level" + (user.getLevel() + 1))));
		}
		else if (4 <= user.getLevel() && user.getLevel() <= 5) {
			request.getSession().setAttribute("nextLevel", "Top " + json.get("level5"));
			response.addCookie(new Cookie(id+"&nextLevel", ""+"Top " + json.get("level5")));
		}
		else if (user.getLevel() == 6) {
			request.getSession().setAttribute("nextLevel", "0");
			response.addCookie(new Cookie(id+"&nextLevel", "0"));
		}
		
		response.addCookie(new Cookie(id+"&Level", ""+user.getLevel()));
        response.addCookie(new Cookie(id+"&Point", ""+user.getPoint()));
        response.addCookie(new Cookie(id+"&Exp", ""+user.getExp()));
         
        
        return "event/event_daily.jsp";
    }

}
