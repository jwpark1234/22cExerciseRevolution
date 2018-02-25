package controller;
import java.util.*;
import java.io.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;


@WebServlet("*.do")
public class ControllerAction extends HttpServlet{
private Map commandMap=new HashMap();

public void init(ServletConfig config) throws ServletException{
	//command properties
	
	loadProperties("controller/properties/Command");
	
}
	private void loadProperties(String path){
		ResourceBundle rbHome=ResourceBundle.getBundle(path);
		//�쓽�룄 rbHome �씠由�=>�냽�꽦媛�.. 寃쎈줈媛� 異붿텧�씠 紐⑹쟻.		
		Enumeration<String> actionEnumHome=rbHome.getKeys();
		
		while(actionEnumHome.hasMoreElements()){
			String command=actionEnumHome.nextElement();
			String className=rbHome.getString(command);
			//�냽�꽦媛믪씠 �씠由꾧컪�쑝濡�
			try{
				Class commandClass=Class.forName(className);
				//寃쎈줈媛믪쓣 �겢�옒�뒪�솕
				Object commandInstance=commandClass.newInstance();
				//媛앹껜 �깮�꽦.
				
				commandMap.put(command, commandInstance);
				
			}catch(ClassNotFoundException e){
				continue;
				
			}catch(InstantiationException e){
				e.printStackTrace();
			}catch(IllegalAccessException e){
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		requestPro(request,response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		requestPro(request,response);
	}
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response)
	throws ServletException,IOException{
		String view=null;
		CommandAction com=null;
		
		try{
			String command=request.getRequestURI();
			System.out.println("command by URI :"+request.getRequestURI());
			
			System.out.println("command index:"+command.indexOf(request.getContextPath()));
			System.out.println("request.getContextPath():"+request.getContextPath());
			
			if(command.indexOf(request.getContextPath())==0){
				 command = command.substring(request.getContextPath().length());

				 System.out.println("command:"+command);
			}
			
			com=(CommandAction)commandMap.get(command);
			
			if(com==null){
				System.out.println("not found:"+command);
				return;
			}
			
			view=com.requestPro(request, response);
					System.out.println("view:"+view);
			
					if(view==null){
						return;
					}
		}catch(Throwable e){
			throw new ServletException(e);
			
		}
		if(view==null) {
			return;
		}
		
		int lastIdx = view.lastIndexOf(".");
		// requestPro의 리턴값이 주소값이면 center페이지 변경
		if(view.substring(lastIdx + 1).equals("jsp")) {
			RequestDispatcher dispatcher=request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
		// 아니면 response객체에 쓰기
		else {
			response.getWriter().write(view);
		}
	}
	
}
