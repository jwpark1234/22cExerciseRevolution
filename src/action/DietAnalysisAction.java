package action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import bean.Diet_analysis;
import bean.Food;
import bean.User;
import bean.User_diet;
import controller.CommandAction;
import dao.DietDao;
import dao.UserDao;
import file.JsonFile2;

public class DietAnalysisAction implements CommandAction {

	@SuppressWarnings("unchecked")
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		System.out.println("식단 분석 액션");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		
		/***1. 입력 데이터 가져옴***/
		// 회원이 선택한 아침,점심,저녁 음식들과 각 음식마다 몇인분인지 정보를 받는다.
		String[] breakFast = request.getParameterValues("breakFast");
		String[] breakFastCount = request.getParameterValues("breakFastCount");
		String[] lunch = request.getParameterValues("lunch");
		String[] lunchCount = request.getParameterValues("lunchCount");
		String[] dinner = request.getParameterValues("dinner");
		String[] dinnerCount = request.getParameterValues("dinnerCount");

		// jsp페이지에서 계산한 아침,점심,저녁 칼로리를 받는다.
		int totalBreakCal = Integer.parseInt(request.getParameter("totalBreakCal"));
		int totalLunchCal = Integer.parseInt(request.getParameter("totalLunchCal"));
		int totalDinnerCal = Integer.parseInt(request.getParameter("totalDinnerCal"));

		
		/***2. 입력 데이터 계산***/
		// 유저가 선택한 음식들에 대한 영양소를 합산
		List<Double> breakFastValues = sumFoodValues(breakFast, breakFastCount);
		List<Double> lunchValues = sumFoodValues(lunch, lunchCount);
		List<Double> dinnerValues = sumFoodValues(dinner, dinnerCount);

		// 유저 주민번호로 나이와 성별 확인
		String id = (String) request.getSession().getAttribute("Id");
		String jumin = new UserDao().getUser(id).getJumin();

		Date date = new Date(System.currentTimeMillis());
		@SuppressWarnings("deprecation")
		int age = (date.getYear() % 100 + 100) - Integer.parseInt(jumin.substring(0, 2));
		boolean gender = jumin.charAt(7) % 2 == 1 ? true : false;
		double height = (double) request.getSession().getAttribute("Height");
		double standardweight = height * 0.01 * height * 0.01 * (gender ? 22 : 21);

		
		/***3. 식단분석에 대한 포인트 부여와 레벨, 포인트, 경험치 갱신***/
		// 식단분석 포인트 부여
		JsonFile2 jf = new JsonFile2();
		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload") + "/point.json");
		User user = null;
		// 처음 식단을 만드는지 여부 판단하여 포인트 다르게 부여
		if (new DietDao().getUserDiet(id).size() == 0) {
			user = new UserDao().updatePointAndLevel(true, id, "diet_point_first", json);
		} else {
			user = new UserDao().updatePointAndLevel(true, id, "diet_point", json);
			new DietDao().deleteUserDiet(id); // 처음이 아니면 기존의 식단을 삭제
		}
		
		// 레벨, 포인트, 경험치를 갱신
		request.getSession().setAttribute("Level", user.getLevel());
		request.getSession().setAttribute("Point", user.getPoint());
		request.getSession().setAttribute("Exp", user.getExp());
		
		if (user.getLevel() < 4) {
			request.getSession().setAttribute("nextLevel", json.get("level" + (user.getLevel() + 1)));
			response.addCookie(new Cookie(id + "&nextLevel", "" + json.get("level" + (user.getLevel() + 1))));
		} else if (4 <= user.getLevel() && user.getLevel() <= 5) {
			request.getSession().setAttribute("nextLevel", "상위 " + json.get("level5") + "명은 5레벨");
			response.addCookie(new Cookie(id + "&nextLevel", "" + "상위 " + json.get("level5") + "명은 5레벨"));
		} else if (user.getLevel() == 6) {
			request.getSession().setAttribute("nextLevel", "∞");
			response.addCookie(new Cookie(id + "&nextLevel", "∞"));
		}

		response.addCookie(new Cookie(id + "&Level", "" + user.getLevel()));
		response.addCookie(new Cookie(id + "&Point", "" + user.getPoint()));
		response.addCookie(new Cookie(id + "&Exp", "" + user.getExp()));
		// 포인트 부여 끝

		
		/***4. 계산한 데이터 DB에 저장***/
		// DB에 유저 식단 저장
		insertUserDietDB(id, "아침", breakFast, breakFastCount);
		insertUserDietDB(id, "점심", lunch, lunchCount);
		insertUserDietDB(id, "저녁", dinner, dinnerCount);

		// DB에 분석결과 저장(칼로리, 영양소)
		insertAnalysisDB(id, "아침", totalBreakCal, breakFastValues);
		insertAnalysisDB(id, "점심", totalLunchCal, lunchValues);
		insertAnalysisDB(id, "저녁", totalDinnerCal, dinnerValues);

		
		/***5. 분석 데이터를 request영역에 저장***/
		JSONArray jsonArr = new JSONArray();
		// 유저 정보를 기준으로 표준 영양소 계산
		jsonArr.addAll(calculateStandardValues(age, gender, standardweight));
		// 분석결과 DB에서 가져옴
		jsonArr.addAll(new DietDao().calculateCalorieMyDiet(id));

		System.out.println(jsonArr.toString());

		// 분석
		String results = analysisValues(jsonArr);
		request.setAttribute("datas", jsonArr);
		request.setAttribute("results", results);

		return "diet/diet_analysis.jsp";
	}

	// 회원이 선택한 음식들과 몇인분 데이터를 이용하여 영양소를 합산한다.
	public List<Double> sumFoodValues(String[] menu, String[] count) {

		List<Double> values = new ArrayList<Double>();
		// 탄수화물, 단백질, 지방

		double tan = 0, dan = 0, ji = 0;
		for (int i = 0; i < menu.length; i++) {
			String name = menu[i].split("  ")[0];
			Food food = new DietDao().getFoodByName(name);
			tan += food.getTan() * Double.parseDouble(count[i]);
			dan += food.getDan() * Double.parseDouble(count[i]);
			ji += food.getJi() * Double.parseDouble(count[i]);
		}

		values.add((double) Math.round(tan * 10.0) / 10.0);
		values.add((double) Math.round(dan * 10.0) / 10.0);
		values.add((double) Math.round(ji * 10.0) / 10.0);

		return values;
	}

	// 나이, 성별, 표준체중으로 표준데이터(칼로리, 영양소)를 계산한다.
	public static ArrayList<Map<String, Object>> calculateStandardValues(int age, boolean gender,
			double standardweight) {

		ArrayList<Map<String, Object>> Arr = new ArrayList<Map<String, Object>>();
		// 1행 칼로리(보통), 탄수화물(보통), 단백질(보통), 지방(보통)
		// 2행 칼로리(격함), 탄수화물(격함), 단백질(격함), 지방(격함)

		int normal = 30;
		int hard = 40;

		double[] cal = { standardweight * normal, standardweight * hard };

		// 보통, 격함 총 2번
		for (int i = 0; i < 2; i++) {
			Map<String, Object> data = new HashMap<String, Object>();

			// 칼로리
			data.put("calorie", (int) cal[i]);

			// 탄수화물
			data.put("tan", (double) Math.round(cal[i] * 0.6 / 4));

			// 단백질
			switch (Math.floorDiv(age, 10)) {
			case 1:
			case 2:
				data.put("dan", gender ? 65.0 : 55.0);
				break;
			case 3:
			case 4:
			case 5:
				data.put("dan", gender ? 60.0 : 50.0);
				break;
			case 6:
			case 7:
				data.put("dan", gender ? 55.0 : 45.0);
				break;
			}

			// 지방
			data.put("ji", (double) Math.round(cal[i] * 0.2 / 9));
			Arr.add(data);
		}

		return Arr;
	}

	// 표준데이터와 DB에 저장된 회원의 칼로리, 영양소 데이터를 비교하여 분석결과를 만든다.
	@SuppressWarnings("unchecked")
	public static String analysisValues(JSONArray list) {

		String results = "";

		Map<String, Object> normal = (Map<String, Object>) list.get(0);
		Map<String, Object> hard = (Map<String, Object>) list.get(1);
		Map<String, Object> breakfast = (Map<String, Object>) list.get(2);
		Map<String, Object> lunch = (Map<String, Object>) list.get(3);
		Map<String, Object> dinner = (Map<String, Object>) list.get(4);

		String[] key = { "calorie", "tan", "dan", "ji" };
		String[] element = { "탄수화물", "단백질", "지방" };

		for (int i = 0; i < key.length; i++) {
			double normalValue, hardValue, myValue;

			// 칼로리는 int형
			if (i == 0) {
				normalValue = (int) normal.get(key[i]);
				hardValue = (int) hard.get(key[i]);
				myValue = (int) breakfast.get(key[i]) + (int) lunch.get(key[i]) + (int) dinner.get(key[i]);
			}
			// 영양소는 double형
			else {
				normalValue = (double) normal.get(key[i]);
				hardValue = (double) hard.get(key[i]);
				myValue = (double) breakfast.get(key[i]) + (double) lunch.get(key[i]) + (double) dinner.get(key[i]);
			}

			if (hardValue < myValue) {
				if (i == 0)
					results += "내 식단이 <b><font color='red'>표준체중 필요 칼로리보다 높습니다.</font></b> 식단의 칼로리를 좀 더 줄일 필요가 있습니다.&";
				else
					results += "<b>" + element[i - 1] + "</b> 이 <b><font color='red'>과다한 식단</font></b>입니다. ";
			} else if (normalValue <= myValue && myValue <= hardValue) {
				if (i == 0)
					results += "내 식단이 <b><font color='green'>표준체중 필요 칼로리에 해당합니다.</font></b> 운동 강도에 따라 칼로리를 조절하세요.&";
				else
					results += "<b>" + element[i - 1] + "</b> 이 <b><font color='green'>적절한 식단</font></b>입니다. ";
			} else if (myValue < normalValue) {
				if (i == 0)
					results += "내 식단이 <b><font color='blue'>표준체중 필요 칼로리보다 부족합니다.</font></b> 식단의 칼로리를 좀 더 늘릴 필요가 있습니다.&";
				else
					results += "<b>" + element[i - 1] + "</b> 이 <b><font color='blue'>부족한 식단</font></b>입니다. ";
			}
		}

		return results;
	}

	// 회원 식단을 DB에 저장
	public void insertUserDietDB(String id, String category, String[] menu, String[] count) {
		for (int i = 0; i < menu.length; i++) {
			User_diet data = new User_diet();
			data.setId(id);
			data.setCategory(category);
			data.setMenu(menu[i]);
			data.setCount(Double.parseDouble(count[i]));

			new DietDao().insertUserDiet(data);
		}
	}

	// 식단분석 데이터를 DB에 저장
	public void insertAnalysisDB(String id, String category, int cal, List<Double> datas) {

		// 아이디, 카테고리, 칼로리, 탄수화물, 단백질, 지방
		Diet_analysis data = new Diet_analysis();
		data.setId(id);
		data.setCategory(category);
		data.setCalorie(cal);
		data.setTan(datas.get(0));
		data.setDan(datas.get(1));
		data.setJi(datas.get(2));
		new DietDao().insertDietAnalysis(data);
	}
}
