package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Excercise_plan_menu;
import controller.CommandAction;
import dao.Jagi_ganli_Dao;
import jagi_ganli.Jagi_ganli_plan_1;

public class Jagi_ganli_plan_upcount_listAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//운동 항목 선택하면 view 올라가고 화면 다시 갱신
		Jagi_ganli_Dao jgd=new Jagi_ganli_Dao();
		Jagi_ganli_plan_1 jgp1=new Jagi_ganli_plan_1();
		int index=Integer.parseInt(request.getParameter("index"));
		int id=Integer.parseInt(request.getParameter("id"));
		String[] result=jgp1.jagi_ganli_plan_by_index_theme(index);
		String folder=result[0];
		String theme=result[1];
		
		System.out.println("관리 리스트중  하나 클릭시:  , id:"+id+" , index:"+index);
		
		
		
		jgd.updateCount(id);
		
		List<Excercise_plan_menu> list=jgd.getExcercise_plan_menu(index);
		request.setAttribute("folder", folder);
		request.setAttribute("list", list);
		request.setAttribute("ganli_id", id);
		
		request.setAttribute("index", index);
		request.setAttribute("theme", theme);
		return "jagi_ganli_plan.jsp";
	}

	
	
}
