package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bean.Excercise_plan_menu;
import bean.User;
import bean.User_Exercise_plan_mean_calorie_count;
import bean.User_dayCalorie;
import bean.User_excercise_exercise_name_count;
import bean.User_excercise_plan;
import file.JsonFile2;
import manager.SQLmanager;

public class Jagi_ganli_Dao extends SQLmanager{
	
	
	
	
	@SuppressWarnings("unchecked")
	public List<Excercise_plan_menu> getExcercise_plan_menu(int category_num){
		
		try {
			return getSqlMap().queryForList("IbatisUser.getExcercise_plan_menu", category_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	//id 媛믪쑝濡� �븯�굹�쓽 寃곌낵留� 異쒕젰
	@SuppressWarnings("unchecked")
	public List<Excercise_plan_menu> getExcercise_plan_menu_by_id(int id){
		
		try {
			return getSqlMap().queryForList("IbatisUser.getExcercise_plan_menu_by_id",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	public Object updateCount(int id){
		try {
			return getSqlMap().update("IbatisUser.updateCount",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public Object insertUser_Excercise_Plan(User_excercise_plan uep , String[] regary,HttpServletRequest request,HttpServletResponse response){
		
		try{
			getSqlMap().startTransaction();
			getSqlMap().startBatch();
			JsonFile2 jf = new JsonFile2();
			JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
	       User user = null;
	       if(new Jagi_ganli_Dao().user_excercise_plan_allcount_regdate(uep.getUserId()).size() == 0) {
	        	user = new UserDao().updatePointAndLevel(true,uep.getUserId(),"exer_point_first",json);
	        }else {
	        	user = new UserDao().updatePointAndLevel(true,uep.getUserId(),"exer_point",json);
	        }
		for(int i=0; i<regary.length;i++){
			uep.setRegdate(regary[i]);
			HashMap<String, String> input=new HashMap<>();
			input.put("userId", uep.getUserId());
			input.put("regdate", regary[i]);
			HashMap<String, String> abcd=user_excercise_plan_id_regdate(input);
			if(abcd==null)abcd=new HashMap<>();

			int dbCount=(abcd.get("cte")==null)? 0:Integer.parseInt(String.valueOf(abcd.get("cte")));
			
			if( dbCount>5){
				//그냥 cte가 5보다 클때
				getSqlMap().endTransaction();
				return abcd.get("regdate");
				
			}else if( dbCount+uep.getCount()>5){
				//cte 5보다 작은데 추가 카운트 떄문에 숫자가 더 커질떄
				getSqlMap().endTransaction();
				return abcd.get("regdate");
				
			}else{
		        
		    	getSqlMap().insert("IbatisUser.insertUser1_Excercise_Plan",uep);
				
			}
			
			
		}
        // 처음 운동계획을 만드는지 여부 판단하여 포인트 다르게 부여
       
  		if(user.getLevel() < 4)	request.getSession().setAttribute("nextLevel", json.get("level"+(user.getLevel()+1)));
  		else if(user.getLevel() < 6) request.getSession().setAttribute("nextLevel", "상위 " + json.get("level5") + "명");
  		else request.getSession().setAttribute("nextLevel", "∞");
  		
        request.getSession().setAttribute("Level", user.getLevel());
        request.getSession().setAttribute("Point", user.getPoint());
        request.getSession().setAttribute("Exp", user.getExp());
        request.getSession().setAttribute("Exp", user.getExp());
		if (user.getLevel() < 4) {
			request.getSession().setAttribute("nextLevel", json.get("level" + (user.getLevel() + 1)));
			 response.addCookie(new Cookie(user.getID()+"&nextLevel", ""+json.get("level" + (user.getLevel() + 1))));
		}
		else if (4 <= user.getLevel() && user.getLevel() <= 5) {
			request.getSession().setAttribute("nextLevel", "Top " + json.get("level5"));
			response.addCookie(new Cookie(user.getID()+"&nextLevel", ""+"Top " + json.get("level5")));
		}
		else if (user.getLevel() == 6) {
			request.getSession().setAttribute("nextLevel", "0");
			response.addCookie(new Cookie(user.getID()+"&nextLevel", "0"));
		}
		
		response.addCookie(new Cookie(user.getID()+"&Level", ""+user.getLevel()));
        response.addCookie(new Cookie(user.getID()+"&Point", ""+user.getPoint()));
        response.addCookie(new Cookie(user.getID()+"&Exp", ""+user.getExp()));
		
		getSqlMap().executeBatch();
		getSqlMap().commitTransaction();
			
		
			return null;
			
		}catch(SQLException e){
			e.printStackTrace();
			
		}finally{
			
			try {
				getSqlMap().endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return null;
	}

	
	
	//以묐났�맂 �궇吏쒕쭔 諛쏄린
	
	@SuppressWarnings("unchecked")
	public List<User_dayCalorie> user_excercise_plan_distinct_reg(String userId){
		
		try{
			
			return getSqlMap().queryForList("IbatisUser.user_excercise_plan_distinct_reg", userId,0,7);
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return null;
	}
	
	//�쑀��媛� �슫�룞�븳寃껋쨷 媛��옣 留롮��닚�쑝濡� 戮묎린
	@SuppressWarnings("unchecked")
	public List<User_excercise_exercise_name_count> user_excercise_plan_excercise_name_count(String userId){
	try{
			
			return getSqlMap().queryForList("IbatisUser.user_excercise_plan_excercise_name_count", userId);
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return null;
	
	}
	//�쑀���쓽 珥앹슫�룞�븳 �궇吏쒖뿉 ���븳 �룊洹� 移쇰줈由� ,�룊洹� count (�떆媛�)
	public User_Exercise_plan_mean_calorie_count user_excercise_plan_mean_calorie_count(String userId){
			try{
			
			return
					(User_Exercise_plan_mean_calorie_count)getSqlMap().
					queryForObject("IbatisUser.user_excercise_plan_mean_calorie_count", userId);
			}catch(Exception e){
			e.printStackTrace();
			}
	
		return null;
	
		
	}
	
	
	//�궇吏� �닚�쑝濡� 7媛� 戮묎린 
	@SuppressWarnings("unchecked")
	public List<User_excercise_plan> user_excercise_plan_id_regdate_desc(String userId){
		try{
				return getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_regdate_desc", userId,0,7);
			}catch(Exception e){
				e.printStackTrace();
			}
		
			return null;
		
		}
	
	
	//�궇吏쒖닚 珥� 移댁슫�듃
	@SuppressWarnings("unchecked")
	public HashMap<String, String> user_excercise_plan_id_regdate(HashMap<String, String> input){
		try{
			System.out.println("ads:"+getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_regdate", input).size());
				return (HashMap<String, String>)getSqlMap().queryForObject("IbatisUser.user_excercise_plan_id_regdate", input);
			}catch(Exception e){
				e.printStackTrace();
			}
		
			return null;
		
		}
	
	
	//MyPage tab jagi ganli
	@SuppressWarnings("unchecked")
	public List<HashMap<String, String>> user_excercise_plan_id_exercise_name_count_cte_reg(String input){
		try{
			System.out.println("ads:"+getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_exercise_name_count_cte_reg", input).size());
				return getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_exercise_name_count_cte_reg", input);
			}catch(Exception e){
				e.printStackTrace();
			}
			return null;
		}
	
	

	//user_excercise_plan_id_avgcal_avgcount �룊洹� 移댁슫�듃 , �룊洹� 移쇰줈由�
	@SuppressWarnings("unchecked")
	public HashMap<String, String> user_excercise_plan_id_avgcal_avgcount(String input){
		try{
			System.out.println("ads:"+getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_avgcal_avgcount", input).size());
				return (HashMap<String, String>)getSqlMap().queryForObject("IbatisUser.user_excercise_plan_id_avgcal_avgcount", input);
			}catch(Exception e){
				e.printStackTrace();
			}
		
			return null;
		
		}
	//centerMain2  user_excercise_plan_allcount_regdate
	@SuppressWarnings("unchecked")
	public List<HashMap<String, String>> user_excercise_plan_allcount_regdate(String input){
		try{
			System.out.println("user_excercise_plan_allcount_regdate:"+getSqlMap().queryForList("IbatisUser.user_excercise_plan_allcount_regdate", input).size());
				return getSqlMap().queryForList("IbatisUser.user_excercise_plan_allcount_regdate", input,0,7);
			}catch(Exception e){
				e.printStackTrace();
			}
			return null;
		}
	
	
	
	
}
