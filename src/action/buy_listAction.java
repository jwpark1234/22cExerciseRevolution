package action;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.buyDto;
import controller.CommandAction;
import dao.buyDao;
import paging.Paging;

public class buy_listAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
		System.out.println("list로 가요");

		if(request.getParameter("adnum")==null&&request.getParameter("Keyword")==null){
			System.out.println("adnum keyword not find!!!!");
			buyDto bdto=new buyDto();
			buyDao bdao=new buyDao();
			List<buyDto> v=bdao.get();
			
			request.setAttribute("v", v);
			System.out.println("adnum not find: vectorsize="+v.size());
			int x=0;
			if(v.size()!=0){
			if(v.size()/6==0){
				x=v.size()/6;
			}{
				x=((int)v.size()/6)+1;
			}
			
		/*	for(int y=0;y<x;y++){
				
				
			}*/
			}
			request.setAttribute("x",	 x);
			
		}else if(request.getParameter("adnum")!=null){
			System.out.println("adnum find!!!");
//			String Adnum=request.getParameter("adnum").toString();
			System.out.println("adnum find!!!");
//			String Adnum=request.getParameter("adnum").toString();
	
			
			
			
			
			String bigtype[]=request.getParameterValues("bigtype")!=null?request.getParameterValues("bigtype"):new String[0];
			String company[]=request.getParameterValues("company")!=null?request.getParameterValues("company"):new String[0];
			//food/execcise all
			String type[]=request.getParameterValues("type")!=null?request.getParameterValues("type"):new String[0];
			
			
			//etc,sports,shake,cutter
			String sex[]=request.getParameterValues("sex")!=null?request.getParameterValues("sex"):new String[0];
			//fe,ma
			int b=bigtype.length;
			int c=company.length;
			int t=type.length;
			int s=sex.length;
			int i=s+t+c+b;
			
		
			
			HashMap<String, Object> map=new HashMap<String,Object>();
			/*List l1=Arrays.asList(company);
			List l2=Arrays.asList(type);
			List l3=Arrays.asList(sex);*/
	/*		System.out.println(l1);*/
			String str="";
			for(int j=0;j<b;j++){
				str+=bigtype[j]+"%";
			}
			for(int j=0;j<c;j++){
				str+=company[j]+"%";
			}
			for(int j=0;j<t;j++){
				str+=type[j]+"%";
			}
			for(int j=0;j<s;j++){
				str+=sex[j]+"%";
			}
			buyDao bdao=new buyDao();
			List<buyDto> v=bdao.get_adnum(str);
			
/*			System.out.println("카테고리 검색결과"+v.size()+"str="+str+v.get(0).getName());*/
			request.setAttribute("v", v);
		/*	for(int j=0;j<i;j++){
				
				
			
				str="a"+j;
				
				System.out.println("str="+str+"");
				if(j<c){//0~1
					System.out.println(j+"//c"+j);
					map.put(str,company[j] );
				}else if(j>=c&&j<c+t){//2
					System.out.println(j-(c)+"//t"+j);
					map.put(str, type[j-(c)]);
				}else if(j>=c+t&&j<i){//3~4
					System.out.println(j-(c+t)+"//s"+j);
					map.put(str, sex[j-(c+t)]);
				}else{
					map.put(str, "");
				}
				
			}
			*/
			
			//in함수 in(company[0],company[1])
			/*buyDto bdto=new buyDto();
			buyDao bdao=new buyDao();
			List<buyDto> v=bdao.get_adnum(Adnum);*/
		
	/*		request.setAttribute("v", v);
			System.out.println("adnum find: vectorsize="+v.size());*/
		}else if(request.getParameter("Keyword")!=null){
			System.out.println("keyword find!!!");
			String Keyword=request.getParameter("Keyword").toString();
			buyDto bdto=new buyDto();
			buyDao bdao=new buyDao();
			List<buyDto> v=bdao.get_key(Keyword);
			System.out.println(Keyword);
			request.setAttribute("v", v);
			
			System.out.println("keword find: vectorsize="+v.size());
			
		}
		
		return "buy/buy_slist.jsp";
	}
}