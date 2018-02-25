package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;

public class Ex_post implements CommandAction{

   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      // TODO Auto-generated method stub
      System.out.println("게시판 이동");

      return "ex_rkh/ex_post.jsp";  
   }   
}