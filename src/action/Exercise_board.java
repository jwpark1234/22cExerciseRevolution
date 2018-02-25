package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;

public class Exercise_board implements CommandAction{

	//페이지url만 리턴해준다 
   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      // TODO Auto-generated method stub
      System.out.println("게시판 이동");

      return "ex_rkh/exercise_board.jsp";
      
      
   }   



}