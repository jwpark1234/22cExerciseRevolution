package action;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import bean.BoardDto_Tip;
import bean.User;
import bean.buyDto;
import controller.CommandAction;
import dao.BoardDao_Tip;
import dao.ChatDao;
import dao.DietDao;
import dao.Ex_Dao;
import dao.Jagi_ganli_Dao;
import dao.UserDao;
import dao.buyDao;
import dao.eventEnterDao;

public class DefaultAction implements CommandAction{

	@SuppressWarnings("unchecked")
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		// login 안되어있을때 default page 로그인 되었다면 session받은거 이용하기
		// login .jsp 나 loginAction으로 그냥 들어갈시 requet.getparameter("id") 값 반영
		// 안됫으므로
		// 반영된 상태에서 action으로 한번더 index로 호출하기
		HttpSession session = request.getSession();
		String val = (String) session.getAttribute("Id");
		User user = new UserDao().getUser(val);

		if (val != null) {
			// lsh category
			List<HashMap<String, String>> list2 = new Ex_Dao().user_excercise_plan_id_exercise_cate_menu(user.getID());
			List<HashMap<String, String>> listWeek = new Jagi_ganli_Dao().user_excercise_plan_allcount_regdate(val);
			session.setAttribute("abc", listWeek);
			session.setAttribute("list2", list2);

			// 주민번호를 이용하여 성별 파악하기. true 남자, false 여자
			boolean gender = user.getJumin().charAt(7) % 2 == 1 ? true : false;

			// 메인에 차트를 뿌려주기 위한 data를 JSONArray로 만든다.
			JSONArray calList = new JSONArray();
			String results = "";
			
			// 표준체중을 구한다. 키(m) * 키(m) * 22(남자) or 21(여자)
			double sWeight = Math.round(user.getHeight() * 0.01 * user.getHeight() * 0.01 * (gender ? 22 : 21) * 10.0) / 10.0;
			// 나이, 성별, 표준체중으로 표준권장 칼로리, 권장 탄수화물, 권장 단백질, 권장 지방을 계산하고 JSONArray에 담는다.
			calList.addAll(DietAnalysisAction.calculateStandardValues((int) session.getAttribute("age"), gender, sWeight));
			
			DietDao ddao = new DietDao();
			// id에 해당하는 회원이 이미 분석한 데이터가 있다면
			if (ddao.getDietAnalysis(user.getID()).size() != 0) {
				// 값을 가져와 JSONArray에 담는다.
				calList.addAll(ddao.calculateCalorieMyDiet(user.getID()));

				// 분석했던 시간과 현재 시간의 차이를 가져와서 파싱한다.
				String[] diet_time = ddao.getDietTime(user.getID()).split(":");

				String diet_time2 = "";

				// 각 단위에 따라 시간을 출력한다.
				if (Integer.parseInt(diet_time[0]) != 0)
					diet_time2 += diet_time[0] + "일 " + diet_time[1] + "시간 " + diet_time[2] + "분 ";
				else {
					if (Integer.parseInt(diet_time[1]) != 0)
						diet_time2 += diet_time[1] + "시간 " + diet_time[2] + "분 ";
					else {
						if (Integer.parseInt(diet_time[2]) != 0)
							diet_time2 += diet_time[2] + "분 ";
					}
				}
				session.setAttribute("diet_time", diet_time2 + diet_time[3] + "초 ");
				
				// 가져온 분석데이터로 표준데이터와 비교분석한다.
				results = DietAnalysisAction.analysisValues(calList);
				
			} else { // 처음 분석일 경우
				// 0으로 채운다.
				for (int i = 0; i < 5; i++) {
					JSONObject j = new JSONObject();
					j.put("calorie", 0);
					j.put("tan", 0);
					j.put("dan", 0);
					j.put("ji", 0);
					calList.add(j);
				}
				results = "<br>식단을 만들고 분석합니다.&<br>식단을 만들고 분석합니다.";
			}
			session.setAttribute("sWeight", sWeight); // 표준체중
			session.setAttribute("calList", calList); // 차트데이터
			session.setAttribute("results", results); // 결과 문자열
		}
		// 채팅방에 안읽은 메세지의 갯수를 표시하기 위해 해당 id와 관련된 모든 채팅방의 안읽은 메세지 갯수 배열로 가져오기
		List<Integer> checkMsg_list = new ChatDao().readCheckMsg(val);
		int chatSum = 0;
		for (int i : checkMsg_list) {
			chatSum += i;
		}
		System.out.println(checkMsg_list.toString());
		session.setAttribute("chatSum", chatSum); // 총 안읽은 갯수 넘긴다.
		
		String img = new eventEnterDao().imgMain();
		session.setAttribute("imgMain", img);

		System.out.println("de:" + val);
		
		//Tip게시판
		BoardDao_Tip Dao=new BoardDao_Tip();
		
		List<BoardDto_Tip> dto=Dao.getList();
		
		request.setAttribute("dto", dto);
		
		  //바이 관련
		buyDao bdao=new buyDao();
		
		List<buyDto> v1=bdao.gethot("food");
		List<buyDto> v2=bdao.gethot("exercise");
		
		System.out.println(v1.size());
		System.out.println(v2.size());
		
		session.setAttribute("bv1", v1);
		session.setAttribute("bv2", v2);
		
		return "index.jsp";
	}
}
