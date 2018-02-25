package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Ex_postDto;
import bean.User;
import bean.User_excercise_plan;
import controller.CommandAction;
import dao.Ex_Dao;
import dao.UserDao;
// CommandAction interface 상속받는다 (HttpServletRequest request,HttpServletResponse response) 전달을 주고 받기 위해 servlet으로 처리한다.
public class Ex_update implements CommandAction {

	//글 수정 Action처리한다.
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		Ex_postDto dto = new Ex_postDto();   //dto 생성한다
		
		Ex_Dao dao = new Ex_Dao();	//dao 생성한다 
		
		System.out.println(request.getParameter("num"));    //num값 받는지 체크한다
		
		int num = Integer.parseInt(request.getParameter("num"));    //request영역에 있는 num값 변수 num에 저장한다 . 밑에 동일
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		
		dto.setNum(num);  			//dto set함수에 num.subject.content. 수정한 글내용들을 저장한다 .
		dto.setSubject(subject);
		dto.setContent(content);
		
		dao.UpdateEx_post(dto);  	//글내용을 수정한다
		
		
		
		HttpSession session = request.getSession();  //Session 객체를 생성해서 session이라는 변수에 저장한다. 
		
		String id = (String)session.getAttribute("Id"); // setAttribute에 저장한 값 Id를 변수 id 저장한다 . 
		
		UserDao userdao = new UserDao();   //dao 생성한다
		
		User user = userdao.getUser(id);   //유저정보 얻는 Dao 실행한다.
		 
		String pic = user.getMember_pic();  //유저의 사진을 얻어서 변수 pic에 저장한다
		
		Ex_Dao ex_dao = new Ex_Dao();    
		
		
		List<Ex_postDto> list = ex_dao.getBoardList(id);     //list에 수정된 글 번호를 다시 뿌려준다. 
		List<User_excercise_plan> list1 = ex_dao.getSelfCheck(id); //  리턴값으로 회원유저의 운동몽록을 다시 뿌려준다, 
		
		request.setAttribute("exercise_board_list", list);  //리턴하기 위해  list에 담아 뒀던 정보를 키값에 저장한다. 밑에 동일
		request.setAttribute("ex_selfcheck_list", list1);
		
		request.setAttribute("pic", pic);
		
		System.out.println("!!!!!! _ex_update"); 
		
		
		
		
		
		
		
		return "exercise_board.do";  // .do로 리턴값 전달한다
	
	}

}
