package action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import bean.User_diet;
import controller.CommandAction;
import dao.DietDao;

public class DietAnalAction implements CommandAction {

	@SuppressWarnings("unchecked")
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		System.out.println("마이페이지에서 식단확인");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		// 세션에서 아이디와 성별, 나이, 표준체중 가져옴.
		String id = (String) session.getAttribute("Id");
		boolean gender = ((String) session.getAttribute("gender")).equals("남성") ? true : false;
		int age = (int) session.getAttribute("age");
		double sWeight = (double) session.getAttribute("sWeight");

		// jsp페이지로 보낼 JSON객체를 만든다
		JSONObject json = new JSONObject();

		// 차트에 뿌릴 데이터
		JSONArray jsonArr = new JSONArray();
		// 나이, 성별, 표준체중으로 계산한 표준 데이터를 먼저 넣는다.
		jsonArr.addAll(DietAnalysisAction.calculateStandardValues(age, gender, sWeight));
		// DB에 저장된 회원의 칼로리, 영양소 정보를 넣는다.
		jsonArr.addAll(new DietDao().calculateCalorieMyDiet(id));

		// 표준데이터만 있는 경우 => DB에 저장된 회원 칼로리, 영양소 정보가 없는 경우 그냥 리턴
		if (jsonArr.size() == 2) {
			return "no";
		}

		// 차트에 뿌릴 데이터 JSON객체에 저장
		json.put("analList", jsonArr);

		// DB에 저장된 식단을 가져와 JSON형태로 만든다.
		List<User_diet> dietList = new DietDao().getUserDiet(id);
		JSONArray breakList = new JSONArray();
		JSONArray lunchList = new JSONArray();
		JSONArray dinnerList = new JSONArray();
		for (User_diet diet : dietList) {
			Map<String, Object> map = new HashedMap<String, Object>();
			map.put("Menu", diet.getMenu());
			map.put("Count", diet.getCount());

			if (diet.getCategory().equals("아침")) {
				breakList.add(map);
			} else if (diet.getCategory().equals("점심")) {
				lunchList.add(map);
			} else if (diet.getCategory().equals("저녁")) {
				dinnerList.add(map);
			}
		}

		// JSON객체에 저장
		json.put("breakList", breakList);
		json.put("lunchList", lunchList);
		json.put("dinnerList", dinnerList);

		// 분석결과도 저장
		String results = DietAnalysisAction.analysisValues(jsonArr);
		json.put("results", results);

		return json.toJSONString();
	}
}
