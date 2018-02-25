package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Ex_postDto;
import controller.CommandAction;
import dao.Ex_Dao;

public class Ex_read implements CommandAction {


	//(HttpServletRequest request,HttpServletResponse response) 전달을 주고 받기 위해 servlet으로 처리한다.
	 public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		 	
		 	request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			Ex_Dao dao = new Ex_Dao();				
			
			int num = Integer.parseInt(request.getParameter("num"));  //제목을 눌러서 해당글번호를 ajax으로 넘겨 받아서 글정보를  eX_read에 뿌려준다
			
			Ex_postDto dto = dao.readEx_read(num); // 글읽기한다.
			
			request.setAttribute("dto", dto);    //뿌려주기 위해선 setAttribute를 이용해서 dto에 저장한다
			
			return "ex_rkh/ex_read.jsp";    
				
			
	 }   
	
}
