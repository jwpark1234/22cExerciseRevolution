package action;

import java.util.HashMap;
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
import paging.Paging;

public class Ex_list implements CommandAction {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		/*
		 * 
		 * ! 기억하자 팁
		 * 
		 * 다른 테이블의 멤버 사진을 가져온다면 ??
		 * 
		 * 1. dao객체를 생성한다 2. id로 dao객체의 getUser메서드로 user객체를 받아온다 3. user객체의
		 * getMember_pic메서드로 사진파일명을 가져온다 4. 가져온 파일명을 request영역에 저장한다 5. 리턴한다
		 * 
		 * % 참고 jsp페이지에서는 /upload/받아온 파일명
		 * 
		 * 
		 * 
		 * id값의 사진을 들고오는 방법.
		 * 
		 * 1.세션 객체를 생성한다 (기존 로그인했던거)
		 * 
		 * 2. 세션아이디값을 겟으로 받아와서 셋팅한다. 그거를 String 변수명에 저장한다
		 * 
		 * 3.userDao를 생성한다
		 * 
		 * 4. userDao 안에서 id값을 불러오는 메서드를 실행시켜 매개변수에 id값을 넣어서 user Dto에 저장한다
		 * 
		 * 5. user메서드내에 사진을 얻는 메서드를 실행하여 String 변수 pic에 저장한다.
		 * 
		 * 
		 */

		/* 유저 사진얻는 코드 */
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		// 세션을 얻어온다
		HttpSession session = request.getSession();

		// 세션으로부터 id를 가져온다 이부분 Id로 적어야되요
		String id = (String) session.getAttribute("Id");

		// dao객체를 생성한다
		UserDao dao = new UserDao();

		// id인 user정보를 가져온다
		User user = dao.getUser(id);

		// 가져온 유저의 사진파일명을 가져온다
		String pic = user.getMember_pic();

		//
		
		int pageNum = 1;
		if(request.getParameter("pageNum") != null) {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		
		Ex_Dao ex_dao = new Ex_Dao();

		List<Ex_postDto> list = ex_dao.getBoardList(id);
		List<User_excercise_plan> list1 = ex_dao.getSelfCheck(id);

		if(list != null) {
			Paging page = new Paging();
			page.paging(pageNum, list.size(), 3, 3, "exercise_board.do");
			StringBuffer sb = page.getSb();
			List<Ex_postDto> listPage = ex_dao.getEx_listPage(page.getStartRow() - 1 , id);
			request.setAttribute("sb", sb.toString());
			request.setAttribute("listPage", listPage);
		}
		List<HashMap<String, String>> reLi=ex_dao.user_excercise_plan_id_exercise_cate_menu(id);
//		System.out.println(reLi.get(0));
		//결과 운동 메뉴1 - 카운트1
		//결과 운동 메뉴 2- 카운트2
		//결과 운동 메뉴 3- 카운트3
		//결과 운동 메뉴 4- 카운트4
		//이런식 일꺼임....
		
		
		
		
		
		
		
		///저 카운트와 운동 메뉴에 대한 코멘트 날릴것.
		List<HashMap<String, String>> coList=ex_dao.user_excercise_plan_id_exercise_cate_menu_grade_comment(id);
		/*
		 * 유저 작성한글과 , 자기몸무게,키 값 불러오기
		 */
		
		
		System.out.println(list+" , "+list1+" , "+reLi+" , "+coList);
		
		if(list1.size()==0 || reLi.size()==0 ||coList.size()==0   ){
			
			
			return "none";
		}
		
		
		
		
		
		
//		request.setAttribute("exercise_board_list", list);
		request.setAttribute("ex_selfcheck_list", list1);
		request.setAttribute("cate_menu_count", reLi);
		request.setAttribute("cate_menu_count_comment", coList);
		
		
		
		
		
		
		
		
		
		// pic으로 넘겨줘야 jsp페이지에서 ${pic}으로 받을 수 있어요
		request.setAttribute("pic", pic);


		return "ex_rkh/exercise_board.jsp";

	}

}