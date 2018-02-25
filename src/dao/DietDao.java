package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import bean.Food;
import bean.User_diet;
import bean.Diet_analysis;
import manager.SQLmanager;

public class DietDao extends SQLmanager{
	
	// 음식명으로 음식에 대한 정보를 조회
	public Food getFoodByName(String name) {
		try {
			return (Food) getSqlMap().queryForObject("IbatisDiet.getFoodByName",name);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 키워드로 음식목록을 검색
	@SuppressWarnings("unchecked")
	public List<Food> searchFoodList(String keyWord) {
		try {
			return getSqlMap().queryForList("IbatisDiet.searchFoodList",keyWord);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
		
	// 아이디로 식단을 삭제
	public void deleteUserDiet(String id) {
		try {
			getSqlMap().delete("IbatisDiet.deleteUserDiet",id);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
		
	// 식단 추가
	public void insertUserDiet(User_diet data) {
		try {
			getSqlMap().insert("IbatisDiet.insertUserDiet",data);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	// 아이디로 식단 조회
	@SuppressWarnings("unchecked")
	public List<User_diet> getUserDiet(String Id) {
		try {
			return getSqlMap().queryForList("IbatisDiet.getUserDiet",Id);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 식단의 칼로리, 영양소 정보를 삽입
	public void insertDietAnalysis(Diet_analysis data) {
		try {
			if(getDietAnalysis(data.getId()).size() < 5) 
				getSqlMap().insert("IbatisDiet.insertDietAnalysis",data);
			else
				getSqlMap().update("IbatisDiet.updateDietAnalysis",data);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	// 아이디로 식단의 칼로리, 영양소 정보를 조회
	@SuppressWarnings("unchecked")
	public List<Diet_analysis> getDietAnalysis(String Id) {
		try {
			return getSqlMap().queryForList("IbatisDiet.getDietAnalysis",Id);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 칼로리와 영양소 정보를 JSON객체로 받기 위해 ArrayList<Map> 형태로 조회
	@SuppressWarnings("unchecked")
	public ArrayList<Map<String,Object>> calculateCalorieMyDiet(String id) {
		try {
			return (ArrayList<Map<String, Object>>) getSqlMap().queryForList("IbatisDiet.calculateCalorieMyDiet",id);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 분석날짜와 현재날짜 차이 계산
	public String getDietTime(String id) {
		try {
			return (String) getSqlMap().queryForObject("IbatisDiet.getDietTime",id);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
