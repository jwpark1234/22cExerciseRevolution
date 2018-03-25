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
		//변수 rbHome에 가상주소와 실제 액션클래스 이름을 매핑시켜놓은 파일을 읽어와 저장한다.
		Enumeration<String> actionEnumHome=rbHome.getKeys();
		
		while(actionEnumHome.hasMoreElements()){
			String command=actionEnumHome.nextElement();
			String className=rbHome.getString(command);
			
			try{
				Class commandClass=Class.forName(className);
				//액션클래스를 얻어온다.
				Object commandInstance=commandClass.newInstance();
				//객체를 만들고 가상주소와 가상주소에 해당하는 객체 Map에 담는다.
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
			
		 	// 액션객체를 하나씩 꺼내 
			com=(CommandAction)commandMap.get(command);
			
			if(com==null){
				System.out.println("not found:"+command);
				return;
			}
			// 요청에 따른 액션객체의 requestPro() 메소드를 수행한 후 페이지 전환될 jsp 페이지명을 리턴받는다.
			view=com.requestPro(request, response);
			System.out.println("view:"+view);
			
			if(view==null)
				return;
			}
		}catch(Throwable e){
			throw new ServletException(e);
		}
		if(view==null) {
			return;
		}
		
		int lastIdx = view.lastIndexOf(".");
		// requestPro의 리턴값이 주소값이면 forward()메소드를 통해 사용자의 요청에 대한 페이지 전환을 한다.
		if(view.substring(lastIdx + 1).equals("jsp")) {
			RequestDispatcher dispatcher=request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
		// 아니면 response객체에 쓴 후 사용자에게 응답한다.
		else {
			response.getWriter().write(view);
		}
	}
	
}
