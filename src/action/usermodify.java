package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.BoardDto_Free;
import bean.BoardDto_Tip;
import bean.User;
import bean.deliver;
import controller.CommandAction;
import dao.BoardDao_Free;
import dao.BoardDao_Tip;
import dao.UserDao;
import dao.buyDao;
import dao.eventEnterDao;

public class usermodify implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("Id");
		UserDao dao=new UserDao();
		User dto= dao.getUser(id);
		
		request.setAttribute("dto", dto);
				
		List<HashMap<String, String>> arry = new ArrayList<HashMap<String, String>>();
		arry = new eventEnterDao().eventMypage(id);
		
		request.setAttribute("eventMypage", arry);
		
		/*내가 쓴 글 가져오기*/

		BoardDao_Tip daoTip = new BoardDao_Tip();
		List<BoardDto_Tip> list =  daoTip.getMyList_Tip(id);
		System.out.println(list.size());
		
		request.getSession().setAttribute("Tipdto", list);
		
		BoardDao_Free daoFree = new BoardDao_Free();
		List<BoardDto_Free> Freelist =  daoFree.getMyList_Free(id);
		System.out.println(Freelist.size());
		
		request.getSession().setAttribute("Freedto", Freelist);
		
		
		deliver deliver=new deliver();
		buyDao bdao=new buyDao();
		
		deliver.setId(id);
		deliver.setStat("장바구니");
		List<deliver> v=bdao.selectbabgni(deliver);
		
		int bvn1=v.size();
		request.setAttribute("bv1", v);
		request.setAttribute("bvn1", bvn1);
		/*System.out.println(bvn1+"bvn//"+v.get(0).getPname()+v.size());*/
		List<deliver> v2=bdao.selectnotbaguni(deliver);
		System.out.println("");
		int bvn2=v2.size();
		request.setAttribute("bv2", v2);
		request.setAttribute("bvn2", bvn2);
		/*System.out.println(bvn2+"bvn//"+v.get(0).getPname()+v.size());*/
		
		
		return "user/modify_1.jsp";
	}
}
