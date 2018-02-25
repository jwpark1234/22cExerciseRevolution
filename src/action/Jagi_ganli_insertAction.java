package action;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bean.User;
import bean.User_excercise_plan;
import controller.CommandAction;
import dao.Jagi_ganli_Dao;
import dao.UserDao;
import file.JsonFile2;
import manager.SQLmanager;

public class Jagi_ganli_insertAction extends SQLmanager implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String 	userId=request.getParameter("userId");
		String excercise_name=request.getParameter("excercise_name");
		String calorie=request.getParameter("calorie");
		String height=request.getParameter("height");
		String weight=request.getParameter("weight");
		int	count=Integer.parseInt(request.getParameter("count"));
		String regdates=request.getParameter("regdates");
		String exercise_comment=request.getParameter("exercise_comment");
		String my_category_img=request.getParameter("my_category_img");
		String exercise_cate_menu=request.getParameter("exercise_cate_menu");
		
		//복수의 날짜 값들 받을때
		String[] regary=regdates.split(",");	
	User_excercise_plan uep=new User_excercise_plan();
	uep.setIdx(0);
	uep.setUserId(userId);
	uep.setExcercise_name(excercise_name);
	uep.setCalorie(calorie);
	uep.setWeight(weight);
	uep.setHeight(height);
	uep.setCount(count);
	uep.setExercise_comment(exercise_comment);
	uep.setMy_category_img(my_category_img);
	uep.setExercise_cate_menu(exercise_cate_menu);
	
	
		
		
		return  (String)new Jagi_ganli_Dao().insertUser_Excercise_Plan(uep,regary,request,response);
	}

	
	
}
