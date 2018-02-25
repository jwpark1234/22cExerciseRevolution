package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Excercise_plan_menu;
import controller.CommandAction;
import dao.Jagi_ganli_Dao;
import jagi_ganli.Jagi_ganli_plan_1;

public class Jagi_ganli_planAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//jagi_ganli.jsp 페이지로 이동하되
		//index에  기본 들어오는 건 1번으로 하고
		//index-> 운동을 메뉴 들어갔을떄 화면 설정
		Jagi_ganli_Dao jgd=new Jagi_ganli_Dao();
		Jagi_ganli_plan_1 jgp1=new Jagi_ganli_plan_1();
		int index=Integer.parseInt(request.getParameter("index"));
		String[] result=jgp1.jagi_ganli_plan_by_index_theme(index);
		String folder=result[0];
		System.out.println("파일경로:"+folder+" , "+index);
		String theme=result[1];
		//index 값에 따른 폴더 경로 짜주기
		
		
		
		
		List<Excercise_plan_menu> list=jgd.getExcercise_plan_menu(index);
		//폴더 경로 , 값 전체 리스트, 인덱스 값, 제목 값ㅅ들을 jagi_ganli.jsp부분에 뿌려줌 
		request.setAttribute("folder", folder);
		request.setAttribute("list", list);
		request.setAttribute("index", index);
		request.setAttribute("theme", theme);
		System.out.println("Jagi_ganli_planAction size:"+list.size());
		
		return "jagi_ganli.jsp";
	}

	
	
}
