package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import bean.User_Exercise_plan_mean_calorie_count;
import bean.User_dayCalorie;
import bean.User_excercise_exercise_name_count;
import controller.CommandAction;
import dao.Jagi_ganli_Dao;
import dao.UserDao;

public class Myself_ganli_planAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String userId=request.getParameter("userId");
			// 날짜 당 소모한 총 칼로리*count한 값들 
		System.out.println("userId:"+userId);
		
			
		//유저가 날짜당 소모한 총 칼로리
		List<User_dayCalorie> list2=new Jagi_ganli_Dao().user_excercise_plan_distinct_reg(userId);
		//유저가 운동명- 총 운동 시간
		List<User_excercise_exercise_name_count> list3=
				new Jagi_ganli_Dao().user_excercise_plan_excercise_name_count(userId);
		User user=new UserDao().getUser(userId);
		
		User_Exercise_plan_mean_calorie_count UEPMCC=new Jagi_ganli_Dao().user_excercise_plan_mean_calorie_count(userId);
		request.setAttribute("myself", list2);
		request.setAttribute("myself_exercise_name_count", list3);
		request.setAttribute("mean_calorie_count", UEPMCC);
		request.setAttribute("user1", user);
		System.out.println(list2);
	
		if(list2.size()==0){
			
			return "none";
		}
		
			
		
		//System.out.println("User_dayCalorie:"+list2.get(0).getDayCalorie());
		//System.out.println("User_excercise_exercise_name_count:"+list3.size());
		//System.out.println("user:"+user.getMember_pic());
		//System.out.println("UEPMCC:"+UEPMCC.getDayMeanCalorie()+", "+UEPMCC.getDayMeanTime());

			

			return "myself_ganli.jsp";			
	
	}

	
	
}
