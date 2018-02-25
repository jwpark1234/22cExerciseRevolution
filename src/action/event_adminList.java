package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.eventEnter;
import controller.CommandAction;
import dao.eventEnterDao;

public class event_adminList implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String subject = request.getParameter("subject");
		String cate = request.getParameter("cate");
		
		List<eventEnter> array = new ArrayList<eventEnter>();
		
		array = new eventEnterDao().adminList(subject);
		
		request.setAttribute("adminJoin",array); // event테이블의 카테고리가 '쿠폰'인 거 빼고 나머지 select
		request.setAttribute("subject",subject); // 관리자페이지 클릭한 이벤트 명
		request.setAttribute("cate", cate); // 관리자페이지 클릭한 이벤트 카테고리 명
		
		return "event/event_admin_list.jsp";
	}

	
	
}
