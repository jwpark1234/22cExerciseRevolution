package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandAction;
import dao.UserDao;

public class userDeleteAction implements CommandAction {

   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      
      String user_id=(String)request.getParameter("ID");
      HttpSession session=request.getSession();
      UserDao dao = new UserDao();
      session.invalidate();
      dao.deleteUser(user_id);
      return "redirectMain.jsp";
   }
}