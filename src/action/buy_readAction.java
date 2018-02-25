package action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bean.Chat_room;
import bean.buyDto;
import bean.datdto;
import controller.CommandAction;
import dao.ChatDao;
import dao.UserDao;
import dao.buyDao;
import file.JsonFile2;

public class buy_readAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("read으로 가요");
		
		String name=(String)request.getParameter("name");
		System.out.println("read으로 가요///"+name+"///값받음 ");
		
		buyDto bdto=new buyDto();
		buyDao bdao=new buyDao();
		bdto=bdao.readArticle(name);
		request.setAttribute("bdto", bdto);
		
		
		
		
		
		Cookie[] cookie=request.getCookies();
		Vector<buyDto> v=new Vector<buyDto>();
		System.out.println("read영역 쿠키값 건드리기 ");
		int i=0;
	/*	Cookie co1=new Cookie(bdto.getName(), bdto.getImg());
		co1.setMaxAge(60);
		co1.setPath("/");*/
		
		
		if(request.getSession().getAttribute("vlist")!=null){//vlist가 있지않으면
			
			System.out.println("vlist 가 있어요");
			v=(Vector<buyDto>)request.getSession().getAttribute("vlist");
			i=0;
			
			for(int j=0;j<v.size();j++){//v가 있을때 
				if(v.get(j).getName().equals(bdao.readArticleByNum(bdto.getNum()).getName())){//같은백터안에이랑 추가할값이 같으면 i++
					i++;
					System.out.println("백터가 있고 벡터안에 들어있는 값"+v.get(j).getName());
				}
			}
			
			System.out.println(i+"//i의 값");
		
			
					
				
			
		}else{//vlist가 비어있으면
			System.out.println("vlist 가 없어요");
			
			for(Cookie co:cookie){//쿠키 비교.
				
				if(!co.getName().equals(bdto.getNum())&&!co.getName().equals("JSESSIONID")){// 쿠키안에 같은값이 없으면  v에 추가 함
					 buyDto bdto2=new buyDto();
					 bdto2.setName(bdao.readArticleByNum(Integer.parseInt(co.getName())).getName());
					 bdto2.setImg(co.getValue());
					 v.add(bdto2);
					 System.out.println(co.getName()+"/////"+co.getValue());
					 System.out.println("쿠키가 있고 쿠키안에 들어있는 값"+co.getName());
				
				}else if(co.getName().equals(bdto.getNum())&&!co.getName().equals("JSESSIONID")){//있으면 그냥 i++
					i++;
					System.out.println();
				
				}
				System.out.println(i+"//i의 값");
			}
			
				
		
			
		}
		if(i==0){
			Cookie co1=new Cookie(bdto.getNum()+"", bdto.getImg());
			co1.setMaxAge(3*60*60);
			co1.setPath("/");
			v.add(bdto);
			System.out.println("쿠키 구워요");
			response.addCookie(co1);
		}
		request.getSession().setAttribute("vlist", v);
		
		datdto datdto1=new datdto();
		List<datdto> dv =bdao.getdatgle(name);
		System.out.println("댓글의 크기는"+dv.size());
		Vector<datdto> dv1=new Vector<>();
		
		if(dv.size()>0&&dv.size()<3){
			
			
			
			if(dv.size()==2){
				request.setAttribute("dv",dv );
				System.out.println("댓글이 완성됨");
			}else if(dv.size()==1){
				dv1.add(dv.get(0));
				datdto1.setId("작성자 없음");
				datdto1.setContent("빨리 후기를 작성해주세요");
				datdto1.setGrade(1);
				dv1.add(datdto1);
				
				request.setAttribute("dv",dv1 );
			}
			
		}else if(dv.size()==0){
			datdto datdto2=new datdto("작성자 없음", "", "빨리 후기를 작성해주세요", 1);
			datdto1.setId("작성자 없음");
			datdto1.setContent("빨리 후기를 작성해주세요");
			datdto1.setGrade(1);
			dv1.add(datdto1);
			dv1.add(datdto2);
			request.setAttribute("dv",dv1 );
			
		}
		
	
		
		
//			buyDto b1=new buyDto();
//			buyDto b2;
//		for(i=0;i<=v.size()-2;i++){
//			b2=v.get(i+1);
//			v.set(i+1, b1);
//			b1=b2; 
//		}
//		v.set(0, bdto);
		
//		for(Cookie co:cookie){
//			
//			if(co.getName()!=bdto.getName()&&!co.getName().equals("JSESSIONID")){
//				 buyDto bdto2=new buyDto();
//				 bdto2.setName(co.getName());
//				 bdto2.setImg(co.getValue());
//				 v.add(bdto2);
//				 System.out.println(co.getName()+"/////"+co.getValue());
//			
//			
//		}

			
			
		
//			if(co.getName()!=bdto.getName()&&!co.getName().equals("JSESSIONID")){
//				 
//				 bdto2=new buyDto();
//				 bdto2.setName(co.getName());
//				 bdto2.setImg(co.getValue());
//				 v.add(bdto2);
//				 System.out.println(co.getName()+"/////"+co.getValue());
//				 		 
//			}else if(!co.getName().equals("JSESSIONID")&&co.getName()==bdto.getName()){
//				buyDto bdto3=new buyDto();
//				
//				bdto3=v.get(0);
//				v.set(0, bdto);
//				v.set(i, bdto3);
//				
//			}
			
	
//		if(i==0){
//			 response.addCookie(co1);
//			 
//			 v.add(bdto);
//		}
//		request.getSession().setAttribute("tlist", v);
		
		/*if(cookie[i].getName().equals("JSESSIONID")){        // 쿠키의 이름이 id 일때

			cookie[i].setMaxAge(0);                    // 쿠키의 유효시간을 0 으로 셋팅한다.

			response.addCookie(cookie[i]);        // 수정한 쿠키를 응답에 추가(수정) 한다.

			}
*/
	
		// 포인트 업데이트 + 레벨 업데이트
		JsonFile2 jf = new JsonFile2();
		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");

		request.setAttribute("buy_point_first", json.get("buy_point_first"));
		request.setAttribute("buy_point", json.get("buy_point"));
		
		return "buy/buy_sread.jsp";
	}
}