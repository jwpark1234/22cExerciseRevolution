package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.buyDto;
import controller.CommandAction;
import dao.buyDao;

public class buy_insertAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		String name=request.getParameter("name");
		String adnum=request.getParameter("adnum2");
		String img=request.getParameter("hidden1");
		int price=Integer.parseInt(request.getParameter("price"));
		System.out.println(price);
		String sexpl=request.getParameter("sexpl");
		String lexpl=request.getParameter("lexpl");
		int stock=Integer.parseInt(request.getParameter("stock"));
		String fexpl=request.getParameter("hidden2");
		System.out.println("insert sboard:::::"+"//"+name+"//"+ img+"//"+ adnum+"//"+ price +"//"+sexpl+"//"+ lexpl+"//"+ stock+"//"+ fexpl);
		buyDto bdto= new buyDto(name, img, adnum, price, sexpl, lexpl, stock, fexpl);
		buyDao bdao= new buyDao();
		bdao.insertsboard(bdto);
		return "";
	}
}