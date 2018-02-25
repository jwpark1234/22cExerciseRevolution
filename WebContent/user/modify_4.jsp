<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
   function Taltae_btn(){
      $("#Taltae_btn").animate({opacity:0},1000,function(){
         $("#Taltae_btn").css("display","none");
         $("#Taltae_ment").css("display","");
         $("#Taltae_ment").animate({opacity:1},1000,function(){
            $("#Taltae_input").css("display","");   
            $("#Taltae_input").animate({opacity:1},500);
         });
      });
   }
   
   function Taltae_input(){
      if($("#Taltae_input").val().length == 10){
         if($("#Taltae_input").val() =="지금 탈퇴하겠습니다"){
            location.href="user_delete.do?ID=${sessionScope.Id}";
         }
      }   
   }

</script>
<div id="Taltae_div">
   <button class="btn btn-lg btn-danger" style="margin-left: 37%;margin-bottom: -18px;font-size: 30px" onclick="Taltae_btn()" id="Taltae_btn">회 원 탈 퇴</button>
   <h3 id="Taltae_ment" style="display:none; opacity:0;">정말 탈퇴하시겠습니까? 탈퇴하시려면 '지금 탈퇴하겠습니다' 라고 입력하세요</h3>
   <input type="text" id="Taltae_input" class="form-control" style="width: 27%; font-size: 30px;display:none; opacity:0;" onkeyup="Taltae_input()">
</div>