package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.json.simple.JSONObject;

import bean.User;
import manager.SQLmanager;

public class UserDao extends SQLmanager {

	// 사용할 메서드!!!!!
	// insert문 : getSqlMap().insert();
	// update문 : getSqlMap().update();
	// delete문 : getSqlMap().delete();
	// select문 : getSqlMap().queryForObject(); 1객체 리턴
	// getSqlMap().queryForList(); 객체리스트 리턴

	// 메서드 인자1 : 자기가 가져올 SqlMap파일에 설정한 namespace명.sql쿼리id

	public void insertUser(User user) {
		try {

			// 전달인자 1 : 자자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			// 전달인자 2 : where절에 넘길 데이터!!
			getSqlMap().insert("IbatisUser.insertUser", user);
			System.out.println("회원가입 완료");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public User getUser(String id) {
		try {
			// 리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			// 전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			// 전달인자 2 : where절에 넘길 데이터!!
			return (User) getSqlMap().queryForObject("IbatisUser.getUser", id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int getUser_nickname(String nickname) {
		try {

			return (int) getSqlMap().queryForObject("IbatisUser.getUser_Nickname", nickname);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int login(String Id, String Password) {
		try {

			User user = (User) getSqlMap().queryForObject("IbatisUser.getUser", Id);

			if (user == null)
				return 0; // 아이디 없음
			else {
				if (user.getPassword().equals(Password))
					return 1; // 로그인 성공
				else
					return -1; // 비밀번호 틀림
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public String getPw(String id) {

		System.out.println("getPw입니다");

		try {
			String A = (String) getSqlMap().queryForObject("IbatisUser.getPw", id);
			System.out.println(A);
			return A;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String modifyUser(User user) {
		try {

			getSqlMap().update("IbatisUser.modifyUser", user);

			System.out.println("업데이트 완료");

			return "1";

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			return "0";
		}
	}

	public int getUser_jumin(String jumin) {
		try {

			return (int) getSqlMap().queryForObject("IbatisUser.getUser_Jumin", jumin);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public String deleteUser(String id) {

		try {
			System.out.println("아이디는 : " + id);
			getSqlMap().update("IbatisUser.deleteUser", id);

			System.out.println("탈퇴완료");

			return "1";

		} catch (SQLException e) {
			e.printStackTrace();

			return "0";
		}
	}

	// type : true(누적), false(차감), id : 회원id, value : 포인트명(String) 또는
	// 포인트수치(int), json : 기준 point리스트
	public User updatePointAndLevel(boolean type, String id, Object value, JSONObject json) {

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ID", id);

			// 변수 value가 숫자면 Point라는 키값에 바로 대응되고
			// 숫자가 아니면 포인트 리스트에서 포인트 수치를 얻어와 Point라는 키값에 대응시킴
			if (Pattern.matches("^[0-9]*$", value.toString()))
				map.put("Point", value);
			else
				map.put("Point", Integer.parseInt((String) json.get(value)));

			if (type)
				getSqlMap().update("IbatisUser.earnPoint", map); // 포인트 부여
			else
				getSqlMap().update("IbatisUser.usePoint", map); // 포인트 차감

			// 회원정보 조회
			User user = (User) getSqlMap().queryForObject("IbatisUser.getUser", id);
			// 관리자가 아니면 포인트에 따른 레벨 업데이트 작업 실시
			if (user.getLevel() < 6) {
				// 레벨 업데이트
				map.put("level4", Integer.parseInt((String) json.get("level4")));
				map.put("level3", Integer.parseInt((String) json.get("level3")));
				map.put("level2", Integer.parseInt((String) json.get("level2")));
				getSqlMap().update("IbatisUser.updateLevel", map);

				// 다시 회원정보 조회
				user = (User) getSqlMap().queryForObject("IbatisUser.getUser", id);
				// 4레벨 이상이면 레벨 조정
				if (user.getLevel() >= 4) {
					getSqlMap().update("IbatisUser.updateLevel5to4");
					map.put("level5", Integer.parseInt((String) json.get("level5")));
					getSqlMap().update("IbatisUser.updateLevel4to5", map);
				}
			}
			return (User) getSqlMap().queryForObject("IbatisUser.getUser", id); // 최종 업데이트된 회원정보 리턴

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
