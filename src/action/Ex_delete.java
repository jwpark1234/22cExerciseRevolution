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

public class Ex_delete implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		Ex_Dao dao = new Ex_Dao();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		dao.DeleteEx_post(num);
		
		
		
		/* 유저 사진얻는 코드 */
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		// 세션을 얻어온다
		HttpSession session = request.getSession();

		// 세션으로부터 id를 가져온다 이부분 Id로 적어야되요
		String id = (String) session.getAttribute("Id");

		// dao객체를 생성한다
		UserDao userdao = new UserDao();

		// id인 user정보를 가져온다
		User user = userdao.getUser(id);

		// 가져온 유저의 사진파일명을 가져온다
		String pic = user.getMember_pic();

		Ex_Dao ex_dao = new Ex_Dao();

		List<Ex_postDto> list = ex_dao.getBoardList(id);
		List<User_excercise_plan> list1 = ex_dao.getSelfCheck(id);

		
		/*
		 * 유저 작성한글과 , 자기몸무게,키 값 불러오기
		 */
		//글삭제하고 다시 글목록 뿌려준다 . 운동목록과 글
		request.setAttribute("exercise_board_list", list);
		request.setAttribute("ex_selfcheck_list", list1);

		// pic으로 넘겨줘야 jsp페이지에서 ${pic}으로 받을 수 있어요
		request.setAttribute("pic", pic);

		System.out.println("ooooooooo _ Ex_list ");
		
		
		
		
		
		
		
		
		return "exercise_board.do";
		
	}

}
