package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Excercise_plan_menu;
import controller.CommandAction;
import dao.Jagi_ganli_Dao;
import jagi_ganli.Cal;
import jagi_ganli.Jagi_ganli_plan_1;

//Calendar 값이랑 input값 페이지 출력시킴 jagi_ganli_top_seleced.jsp
public class Jagi_ganli_plan_cal_inputAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//달력 결과도 뿌려주고 클릭된 개인 리스트도 뿌려주자
		// TODO Auto-generated method stub
		
		
		Jagi_ganli_Dao jgd=new Jagi_ganli_Dao();
		Jagi_ganli_plan_1 jgp1=new Jagi_ganli_plan_1();
		
		Cal c=new Cal();
		int year=Integer.parseInt(request.getParameter("year"));
		int month=Integer.parseInt(request.getParameter("month"));
		int day=Integer.parseInt(request.getParameter("day"));
		int id=Integer.parseInt(request.getParameter("id"));
		int index=Integer.parseInt(request.getParameter("index"));
		
		//해당 운동 메뉴 폴더명
		String folder=jgp1.jagi_ganli_plan_by_index_theme(index)[0];
		
		//해당 카테고리 주제
		String theme=jgp1.jagi_ganli_plan_by_index_theme(index)[1];
		System.out.println("year:"+year+", month:"+month+", day:"+day+" , id:"+id+" , index:"+index);
		
		
		
		//선택된 이미지에 대한 운동  설명들
		List<Excercise_plan_menu> list=jgd.getExcercise_plan_menu_by_id(id);
		//달력 값 구현
		String[][] calendar=c.getCal(year,month,day);
		
		request.setAttribute("cal", calendar);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("list", list);
		request.setAttribute("folder", folder);
		request.setAttribute("theme", theme);
		request.setAttribute("ganli_id", id);
		request.setAttribute("index", index);
		
		return "jagi_ganli_top_selected.jsp";
	}

	
	
}
