package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Ex_postDto;
import controller.CommandAction;
import dao.Ex_Dao;


//create table ex_post(
//num int primary key auto_increment,
//subject varchar(30) not null,
//content varchar(100) not null,
//regdate timestamp null default current_timestamp
//);


public class Ex_postAction implements CommandAction{
	//(HttpServletRequest request,HttpServletResponse response) 전달을 주고 받기 위해 servlet으로 처리한다.
	 public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		 	
		 	request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			Ex_postDto dto = new Ex_postDto();
			
			String id = (String)request.getSession().getAttribute("Id");  //Id 키값이라는 세션값을 변수 id에 저장한다.  해당 유저가 글 쓴걸로 해야해서. 
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
				
			dto.setId(id);
			dto.setSubject(subject);    //유저가 작성한 글정보를 dto에 담는다 .
			dto.setContent(content);
			
			Ex_Dao dao = new Ex_Dao();
			
			dao.insertEx_post(dto);   //글작성 메서드
						
			return "exercise_board.do";
	 
			
	 }   
	
	
	
	
	
	
	
	
}
