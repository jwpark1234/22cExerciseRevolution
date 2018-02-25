package action;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import controller.CommandAction;
import dao.Jagi_ganli_Dao;

public class MyPage_Jagi_Ganli implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		 response.setCharacterEncoding("UTF-8");
		System.out.println("ad");
		String id=request.getParameter("userId");
		Gson son=new Gson();
		//일주일 동안 유저가 날짜별로 운동한 시간    ,   유저가 운동한 날짜 클릭시 해당 운동리스트 추출
		List<HashMap<String, String>> result=new Jagi_ganli_Dao().user_excercise_plan_id_exercise_name_count_cte_reg(id);
		// 유저가 소모한 총 칼로리  , 총 운동시간
		HashMap<String, String> result2=new Jagi_ganli_Dao().user_excercise_plan_id_avgcal_avgcount(id);
		
		return son.toJson(result)+"&"+son.toJson(result2);
	}

}
