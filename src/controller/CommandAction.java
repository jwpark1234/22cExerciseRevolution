package controller;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface CommandAction {
//to do implements CommandAction,to Override request pro 
	public String requestPro(HttpServletRequest request,HttpServletResponse response)
throws Throwable;
	
}
