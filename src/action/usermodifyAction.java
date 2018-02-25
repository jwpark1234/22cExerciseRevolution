package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import controller.CommandAction;
import dao.UserDao;


public class usermodifyAction implements CommandAction{

   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      
      request.setCharacterEncoding("UTF-8");
      String new_nickname=request.getParameter("modi_nickname");
      System.out.println("닉네임"+new_nickname);
      String new_email=request.getParameter("modi_email");
      System.out.println("email"+new_email);
      
      Double new_height=Double.parseDouble(request.getParameter("modi_height"));
      System.out.println("키"+new_height);
      Double new_weight=Double.parseDouble(request.getParameter("modi_weight"));
      System.out.println("몸무게"+new_weight);
         String add_1=request.getParameter("post_code_modify");
         String add_2=request.getParameter("main_addr_modify");
         String add_3=request.getParameter("sub_addr_modify");
      String new_address=add_1+"%"+add_2+"%"+add_3;
      System.out.println(new_address);
      String new_userpic=request.getParameter("Modify_profile_value");
      System.out.println("new_userpic는 "+new_userpic);
      String new_password=request.getParameter("modi_password2");
      System.out.println("new_password는 "+new_password);
            
      HttpSession session=request.getSession();
      String new_id=(String)session.getAttribute("Id");
      
      User dto=new User();
      
      dto.setID(new_id);
      System.out.println(new_id);
      dto.setNickname(new_nickname);
      System.out.println(dto.getNickname());
      dto.setEmail(new_email);
      System.out.println(dto.getEmail());
      dto.setHeight(new_height);
      dto.setWeight(new_weight);
      dto.setAddress(new_address);
      dto.setMember_pic(new_userpic);
      dto.setPassword(new_password);
      
      UserDao dao = new UserDao();
      
      dao.modifyUser(dto);
      
      
      session.setAttribute("Member_pic", new_userpic);
      session.setAttribute("Nickname", new_nickname);
      session.setAttribute("Email", new_email);
      session.setAttribute("Height", new_height);
      session.setAttribute("Weight", new_weight);
      session.setAttribute("Address", new_address);
      
      double Weight__Value=new_weight / new_height / 0.01 / new_height / 0.01 ;
       Weight__Value=(int)(Weight__Value*10);
       Weight__Value/=10;
       session.setAttribute("BMI_Value",Weight__Value);
       
       double Weight__Value_vision;
       if(Weight__Value>40){
          Weight__Value_vision=40;
       }else{
          Weight__Value_vision=Weight__Value;
       }
       session.setAttribute("BMI_Value_vision", Weight__Value_vision);
       
       int Gender_value;
       
       if(session.getAttribute("gender")=="남성"){
          Gender_value=22;
       }else{
          Gender_value=21;
       }
       
       
       double Default__Weight=new_height * new_height * 0.0001 * Gender_value;
       Default__Weight=(int)(Default__Weight*10);
       Default__Weight/=10;
       session.setAttribute("sWeight", Default__Weight);
       
      
      return "index.jsp";
   }
}