package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import bean.Ex_postDto;
import bean.User_excercise_plan;
import manager.SQLmanager;

public class Ex_Dao extends SQLmanager {

	//Ibatis에 작성한 sql문  스프링방식 의존주입하기 .
	
	public void UpdateEx_post(Ex_postDto dto){
		try {
				getSqlMap().update("IbatisEx_dash.ex_update", dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

		//삭제할 글 번호 type지정하여 num값만 받는데. getSQlMap으로 
	public void DeleteEx_post(int num) {
		try {
				getSqlMap().delete("IbatisEx_dash.ex_delete", num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insertEx_post(Ex_postDto dto) {
		try {
			getSqlMap().insert("IbatisEx_dash.ex_postInsert", dto);
			System.out.println("ex_post 글작성넘기기 board에");
		} catch (SQLException e) {
			e.printStackTrace();
			}
	}// inserEx_post 끝

	
	// void라면 dto타입 못받는다 그래서. num으로 한다.  1개만 가져올때는 queryForObject로 한다
	// 그리고 전달인자는 dto가 아니라 num 가 되어야 한다. jsp페이지에서 ajax로 넘길때 num 값 넘겨주기 때문에 가능하다
	public Ex_postDto readEx_read(int num){
	      try {
	        return (Ex_postDto) getSqlMap().queryForObject("IbatisEx_dash.ex_read", num);
	      } catch (SQLException e) {
	          e.printStackTrace();
	      }
	    return null;
	    }
	

	@SuppressWarnings("unchecked")
	public List<Ex_postDto> getEx_listPage(int start , String id) {
//
//		HashMap<String, Integer> map=new HashMap<String, Integer>();
// 
//		map.put("start", start);
//		map.put("end", end);
		
		try {
			
			System.out.println("getBOardListsize:" + getSqlMap().queryForList("IbatisEx_dash.ex_listPage").size());
			return getSqlMap().queryForList("IbatisEx_dash.ex_listPage",id , start, 3);

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	
	

	@SuppressWarnings("unchecked")
	public List<Ex_postDto> getBoardList(String id) {

		try {
			System.out.println("getBOardListsize:" + getSqlMap().queryForList("IbatisEx_dash.ex_listPage").size());
			return getSqlMap().queryForList("IbatisEx_dash.ex_listPage",id);

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	@SuppressWarnings("unchecked")
	public List<User_excercise_plan> getSelfCheck(String id) {

		try {
			System.out.println(
					"getSelfCheck getBoardListSize: " + getSqlMap().queryForList("IbatisEx_dash.ex_selfcheck").size());
			return getSqlMap().queryForList("IbatisEx_dash.ex_selfcheck",id);

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

//user_excercise_plan_id_exercise_cate_menu Progress bar
	@SuppressWarnings("unchecked")
	public List<HashMap<String, String>> user_excercise_plan_id_exercise_cate_menu(String id) {
		// TODO Auto-generated method stub
		try {
			System.out.println(
					"user_excercise_plan_id_exercise_cate_menu : " + getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_exercise_cate_menu",id).size());
			return getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_exercise_cate_menu",id);

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//운동종목, 카운트 수에 따른 등급과 평가
	@SuppressWarnings("unchecked")
	public List<HashMap<String, String>> user_excercise_plan_id_exercise_cate_menu_grade_comment(String id) {
		// TODO Auto-generated method stub
		try {
			System.out.println(
					"user_excercise_plan_id_exercise_cate_menu : " + getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_exercise_cate_menu_grade_comment",id).size());
			return getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_exercise_cate_menu_grade_comment",id);

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}// End of class
