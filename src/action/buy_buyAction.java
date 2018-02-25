package action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import bean.User;
import bean.coupon;
import bean.deliver;
import controller.CommandAction;
import dao.UserDao;
import dao.buyDao;
import file.JsonFile2;

public class buy_buyAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		System.out.println("buy으로 가요");
		String bnum=request.getParameter("bnum");
		if(request.getParameter("name")!=null){
		/*	System.out.println("buy:::하나 선택했고 바구니도 불러올거야");*/
			String name=request.getParameter("name");
			String price=request.getParameter("price");
			String pimg=request.getParameter("pimg");
			String count=request.getParameter("count");
			
			request.setAttribute("name", name);
			request.setAttribute("price", price);
			request.setAttribute("img", pimg);
			request.setAttribute("count",count);
			request.setAttribute("bnum",bnum);
		}
	/*	System.out.println("buy::: 장바구니만 쓸거야.");*/
		deliver deliver=new deliver();
		buyDao bdao=new buyDao();
		String id=(String)(session.getAttribute("Id"));
		System.out.println("ID///"+id);
		User udto=new UserDao().getUser(id);
				
		udto.setAddress(udto.getAddress().replaceAll("%", " "));
		request.setAttribute("uv", udto);
/*		System.out.println("::"+uv.get(0).getAddress()+"::::"+uv.get(0).getID()+".////"+uv.get(0).getName());*/
		String stat="장바구니";
		deliver.setId(id);
		deliver.setStat(stat);
		
		List<deliver> v=bdao.selectbabgni(deliver);
		System.out.println("baguni크기에 대하여::::"+v.size());
		request.setAttribute("baguni", v);
		
		
		JSONArray jlist=new JSONArray();//json배열객체 생성
		
		
		jlist.addAll(bdao.selectbabgni2(deliver));//v-> json,list 객체로 변환
		
		request.setAttribute("baguni2", jlist);
		
		System.out.println(jlist.toString());
		
		
		
		coupon cp=new coupon();
		cp.setId(id);
		
/*		System.out.println("쿠폰 가져오기");*/
		List<coupon> v1=bdao.getcoupon(cp);
/*		System.out.println("쿠폰 가져왔당::::::"+v1.size());*/
		request.setAttribute("cp", v1);
		System.out.println("bnum입니다:::"+bnum);
		
		// 포인트 업데이트 + 레벨 업데이트
		JsonFile2 jf = new JsonFile2();
		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");

		request.setAttribute("buy_point_discount", json.get("buy_point_discount"));
		
		
		return "buy/buy_buy.jsp";
	}
}