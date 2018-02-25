package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.datdto;
import controller.CommandAction;
import dao.buyDao;

public class buy_datgleAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("Id").toString();/*  request.getParameter("id")*/;
		
		String pname=request.getParameter("name");
		String content=request.getParameter("content");
		String str=request.getParameter("grade");
		
		int grade=(int)str.charAt(4)-48;
		buyDao bdao=new buyDao();
		datdto datdto=new datdto(id, pname, content, grade);
		bdao.insertdatgle(datdto);
		System.out.println("///////////"+id+"///////////"+pname+"///////////"+content+"///////////"+grade);
		
		
		
		return "";
	}

	
	
}
