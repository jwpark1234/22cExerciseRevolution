package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import controller.CommandAction;
import dao.UserDao;

public class UserCheckAction implements CommandAction{

   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      System.out.println("중복체크!!");
      
      String id=request.getParameter("ID");
      String type = request.getParameter("type");
      UserDao userDao = new UserDao();
      
      if(type.equals("idcheck")) {
         User user = userDao.getUser(id);
         if(user==null){
            return "0";
         }else{
            return "1";
         }
      }
      else if(type.equals("JuminCheck")){
         
         int JuminbonoCheck=userDao.getUser_jumin(request.getParameter("juminbono")); 
         
         return String.valueOf(JuminbonoCheck);
      }
      
      else {
         int NickCheck=userDao.getUser_nickname(request.getParameter("Nickname")); 
         
         return String.valueOf(NickCheck);
         
         
      }
      
   }
   
   

}