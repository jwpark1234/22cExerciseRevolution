package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Food;
import controller.CommandAction;
import dao.DietDao;

public class DietFoodListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("식단관리 페이지~~");
		
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String keyWord = request.getParameter("keyWord");
        System.out.println(keyWord);
        
        // 키워드로 검색
        List<Food> list = new DietDao().searchFoodList(keyWord);
        System.out.println(list.size());
		request.setAttribute("list", list);
		
		return "diet/foodList.jsp";
	}

}
