package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Ex_postDto;
import bean.User_excercise_plan;
import controller.CommandAction;
import dao.Ex_Dao;



public class Ex_dashboard implements CommandAction{

	 public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		 	
		 	request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			String id = (String) request.getSession().getAttribute("Id"); //해당 Id값 불러와서 변수id에 저장한다.
			
			Ex_Dao ex_dao = new Ex_Dao();
			
			List<Ex_postDto> list = ex_dao.getBoardList(id);
			List<User_excercise_plan> list1 = ex_dao.getSelfCheck(id);
			
			/*유저 작성한글과  , 
			 * 자기몸무게,키 값 불러오기 */
			request.setAttribute("exercise_board_list", list);
			request.setAttribute("ex_selfcheck_list", list1);
			
			System.out.println("ooooooooooo && Ex_dashboard");
			
			
			
			return "ex_rkh/ex_dashboard.jsp";
			
			
	
	 
	 }
	 
}   
	
	
	