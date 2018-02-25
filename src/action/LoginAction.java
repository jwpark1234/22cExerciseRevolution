package action;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import bean.BoardDto_Tip;
import bean.User;
import bean.buyDto;
import bean.deliver;
import controller.CommandAction;
import dao.BoardDao_Tip;
import dao.ChatDao;
import dao.DietDao;
import dao.Ex_Dao;
import dao.Jagi_ganli_Dao;
import dao.UserDao;
import dao.buyDao;
import dao.eventEnterDao;
import file.JsonFile2;

public class LoginAction implements CommandAction {

	@SuppressWarnings("unchecked")
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String Id = request.getParameter("Id");
		String Password = request.getParameter("Password");

		int result = new UserDao().login(Id, Password);
		
		// 로그인 성공!!
		if (result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("Id", Id);

			User user = new UserDao().getUser(Id);

			List<HashMap<String, String>> list2 = new Ex_Dao().user_excercise_plan_id_exercise_cate_menu(user.getID());
			List<HashMap<String, String>> listWeek = new Jagi_ganli_Dao().user_excercise_plan_allcount_regdate(Id);
			System.out.print("list2 size:" + list2.size());
			if (list2.size() != 0)
				System.out.println("," + list2.get(0));

			// 주민번호로 성별과 나이를 얻어옴.
			boolean gender = user.getJumin().charAt(7) % 2 == 1 ? true : false;
			Date date = new Date(System.currentTimeMillis());
			@SuppressWarnings("deprecation")
			int age = (date.getYear() % 100 + 100) - Integer.parseInt(user.getJumin().substring(0, 2));
			session.setAttribute("age", age);

			
			// 차트에 뿌려줄 데이터를 저장하기 위한 JSON배열
			JSONArray calList = new JSONArray();

			String results = "";
			double sWeight = Math.round(user.getHeight() * 0.01 * user.getHeight() * 0.01 * (gender ? 22 : 21) * 10.0) / 10.0;
			// 나이, 성별, 표준체중으로 표준데이터를 json에 저장
			calList.addAll(DietAnalysisAction.calculateStandardValues(age, gender, sWeight));
			
			DietDao ddao = new DietDao();
			// 식단분석한 데이터가 DB에 있으면
			if (ddao.getDietAnalysis(user.getID()).size() != 0) {
				// DB에 저장된 분석데이터 json에 저장
				calList.addAll(ddao.calculateCalorieMyDiet(user.getID()));

				// 현재시간과 분석시간의 차이를 계산하여 request에 저장
				String[] diet_time = ddao.getDietTime(user.getID()).split(":");
				String diet_time2 = "";
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
				// 표준데이터와 분석데이터로 분석결과 얻어옴.
				results = DietAnalysisAction.analysisValues(calList);
				
			} else { // 식단분석한 정보가 DB에 없으면
				// 분석데이터는 0으로 채운다.
				for (int i = 0; i < 3; i++) {
					JSONObject j = new JSONObject();
					j.put("calorie", 0);
					j.put("tan", 0);
					j.put("dan", 0);
					j.put("ji", 0);
					calList.add(j);
				}
				results = "<br>식단을 만들고 분석합니다.&<br>식단을 만들고 분석합니다.";
			}
			// 각종 정보 세션에 저장
			session.setAttribute("sWeight", sWeight);
			session.setAttribute("calList", calList);
			session.setAttribute("results", results);

			session.setAttribute("list2", list2);

			session.setAttribute("Level", user.getLevel());
			session.setAttribute("Point", user.getPoint());
			session.setAttribute("Member_pic", user.getMember_pic());
			session.setAttribute("Nickname", user.getNickname());
			session.setAttribute("Height", user.getHeight());
			session.setAttribute("Weight", user.getWeight());
			session.setAttribute("abc", listWeek);
			session.setAttribute("Exp", user.getExp());
			String img = new eventEnterDao().imgMain();
			session.setAttribute("imgMain", img);

			String Jumin = user.getJumin();
			String gender1;
			if (Jumin.charAt(7) == '1') {
				gender1 = "남성";
			} else {
				gender1 = "여성";
			}
			session.setAttribute("gender", gender1);

			double Weight__Value_vision;
			double Weight__Value = user.getWeight() / user.getHeight() / 0.01 / user.getHeight() / 0.01;
			Weight__Value = (int) (Weight__Value * 10);
			Weight__Value /= 10;

			if (Weight__Value > 40) {
				Weight__Value_vision = 40;
			} else {
				Weight__Value_vision = Weight__Value;
			}
			session.setAttribute("BMI_Value", Weight__Value);
			session.setAttribute("BMI_Value_vision", Weight__Value_vision);

			
			// 회원의 레벨,경험치에 대한 정보도 세션에 저장
			JsonFile2 jf = new JsonFile2();
			JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload") + "/point.json");
			if (user.getLevel() < 4) {
				session.setAttribute("nextLevel", json.get("level" + (user.getLevel() + 1)));
				 response.addCookie(new Cookie(user.getID()+"&nextLevel", ""+json.get("level" + (user.getLevel() + 1))));
			}
			else if (4 <= user.getLevel() && user.getLevel() <= 5) {
				session.setAttribute("nextLevel", "Top " + json.get("level5"));
				response.addCookie(new Cookie(user.getID()+"&nextLevel", ""+"Top " + json.get("level5")));
			}
			else if (user.getLevel() == 6) {
				session.setAttribute("nextLevel", "0");
				response.addCookie(new Cookie(user.getID()+"&nextLevel", "0"));
			}
			
			response.addCookie(new Cookie(user.getID()+"&Level", ""+user.getLevel()));
	        response.addCookie(new Cookie(user.getID()+"&Point", ""+user.getPoint()));
	        response.addCookie(new Cookie(user.getID()+"&Exp", ""+user.getExp()));
			
			
			

			// 안읽은 상담메세지가 있으면 합쳐서 세션에 저장
			List<Integer> checkMsg_list = new ChatDao().readCheckMsg(Id);
			int chatSum = 0;
			for (int i : checkMsg_list) {
				chatSum += i;
			}
			System.out.println(checkMsg_list.toString());
			session.setAttribute("chatSum", chatSum);

			//Tip게시판
			BoardDao_Tip Dao=new BoardDao_Tip();
			
			List<BoardDto_Tip> dto=Dao.getList();
			
		    session.setAttribute("dto", dto);
			
		    
		  //바이 관련
			buyDao bdao=new buyDao();
			
			List<buyDto> v1=bdao.gethot("food");
			List<buyDto> v2=bdao.gethot("exercise");
			
			System.out.println(v1.size());
			System.out.println(v2.size());
			
			session.setAttribute("bv1", v1);
			session.setAttribute("bv2", v2);
		    
			return "index.jsp"; // index페이지로 이동
		} else // 로그인 실패
			return String.valueOf(result); // 실패결과를 리턴
	}
}