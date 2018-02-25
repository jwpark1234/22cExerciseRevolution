package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import controller.CommandAction;
import file.JsonFile2;

public class pointReadAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		// point.json이라는 파일을 읽어와서 request객체로 전달한다
		JsonFile2 jf = new JsonFile2();
		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
		System.out.println(json.toJSONString());
		
		/**
		 * {
		 * "level5":"20",
		 * "level4":"5000",
		 * "level3":"2500",
		 * "level2":"1000",
		 * "level1":"0",
		 * "join_point":"500",				회원가입
		 * "exer_point_first":"100",		첫 운동계획 등록
		 * "exer_point":"30",				운동계획 등록
		 * "diet_point_first":"100",		첫 식단 등록
		 * "diet_point":"30",				식단 등록
		 * "tip_board_point":"300",			팁게시판 관리자 채택 글
		 * "free_board_point":"200",		자유게시판 관리자 채택 글
		 * "chat_point":"100",				1:1 상담 신청 소모 포인트
		 * "buy_point_first":"500",			첫 상품 구매
		 * "buy_point":"5",					상품 구매(상품가격의 %)
		 * "buy_point_discount":"5"			구매 시 사용가능 포인트(상품가격의 %)
		 * }
		 */
	
		request.setAttribute("json", json);
		
		return "admin.jsp";
	}

}
