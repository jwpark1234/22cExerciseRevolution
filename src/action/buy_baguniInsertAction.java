package action;




import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.buyDto;
import bean.deliver;
import controller.CommandAction;
import dao.buyDao;

public class buy_baguniInsertAction implements CommandAction{
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("baguni insert로 가요:::");
		
//		?id="+id+"&name="+name+"&img="+img+"&price="+price;
		
		HttpSession session=request.getSession();
		buyDao dao=new buyDao();
		String id=(String)session.getAttribute("Id");
		String pname=request.getParameter("name");
		
		String pimg=request.getParameter("img");
		int price=Integer.parseInt(request.getParameter("price").toString());
		
		String send="";
		System.out.println("중복 체크:::"+id+"////"+pname);
		deliver deliver2=new deliver();
		deliver2.setId(id);
		deliver2.setPname(pname);
		deliver2.setPimg(pimg);
		deliver2.setPrice(price);
		deliver2.setStat("장바구니");
		deliver2.setDest("");
		System.out.println("pimg:::::::::"+pimg);
		
		
		List<deliver> v = dao.overlapfind(deliver2);
		System.out.println("vsize::::::장바구니 체크"+v.size());
		if(v.size()>0){
			System.out.println("장바구니 :::중복됩니다?");
			return "overlap";
		}else{
			System.out.println("장바구니:::중복 안됨 ");
//			deliver deliver=new deliver(id, pname, pimg, price);
//			dao=new buyDao();
			System.out.println("baguni insert start:::");
		
			dao.insertdeliver1(deliver2);
			
//			deliver2.setId(id);
//			deliver2.setPname(pname);
			return "gogo";
		}
		
		
		
		
		
	}

}
