package action;


import java.util.HashMap;
import java.util.List;
import java.util.Vector;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.buyDto;
import bean.deliver;
import controller.CommandAction;
import dao.buyDao;

public class buy_mainAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("buy_main으로 가요");
		buyDao bdao=new buyDao();
		List<buyDto> v=bdao.getevent("food");
		List<buyDto> v1=bdao.gethot("food");
		
		request.setAttribute("v", v);
		request.setAttribute("v1", v1);
	/*	System.out.println(":::"+v.get(0).getName()+"///"+v1.get(0).getName());
		*/
		
		List<buyDto> v2=bdao.getevent("exercise");
		List<buyDto> v3=bdao.gethot("exercise");
		
		request.setAttribute("v2", v2);
		request.setAttribute("v3", v3);
		
		/*HttpSession session= request.getSession();
		String level= session.getAttribute("Level").toString();
		request.setAttribute("level", arg1);*/
		
		System.out.println("masterUpdate 로들어왔으요");
		deliver deliver=new deliver();
		 
				
		//배송날짜 업데이트
		bdao.upadatebasong();
		bdao.upadatebasong1();
		
		////////////////
		Cookie[] cookie=request.getCookies();
		Vector<buyDto> v0=new Vector<buyDto>();
		System.out.println("read영역 쿠키값 건드리기 ");
		int i=0;
	/*	Cookie co1=new Cookie(bdto.getName(), bdto.getImg());
		co1.setMaxAge(60);
		co1.setPath("/");*/
		
		
		if(request.getSession().getAttribute("vlist")!=null){//vlist가 있으면
			
			System.out.println("vlist 가 있어요");
			v0=(Vector<buyDto>)request.getSession().getAttribute("vlist");
			i=0;
		
		}else{//vlist가 비어있으면
			System.out.println("vlist 가 없어요");
			
			for(Cookie co:cookie){//쿠키 비교.
				
				if(!co.getName().equals("JSESSIONID") && Pattern.matches("^[0-9]*$", co.getName())){// 쿠키안에 같은값이 없으면  v에 추가 함
					 buyDto bdto2=new buyDto();
					 bdto2.setName(bdao.readArticleByNum(Integer.parseInt(co.getName())).getName());
					 bdto2.setImg(co.getValue());
					 v0.add(bdto2);
					 System.out.println(co.getName()+"/////"+co.getValue());
					 System.out.println("쿠키가 있고 쿠키안에 들어있는 값"+co.getName());
				
				}
				System.out.println("바르지 못한값"+co.getName());
			}
			
				
		
			
		}
	
		request.getSession().setAttribute("vlist", v0);
		
		/////
		return "buy/main.jsp";
	}
}