<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% request.setCharacterEncoding("UTF-8"); %>
<script>

//유효성 체크
var check_pw1=true;var check_pw2=true;var check_height=true;var check_weight=true;var check_nickname=true;

//비밀번호 유효성
function Check_pw(num){
   
   if(num==1){
      if($('#modi_password1').val().length != 0){
         if($('#modi_password1').val().length < 4){
            $('#modi_password1_class').removeClass('form-success');
            $('#modi_password1_class').addClass('form-danger');
            check_pw1=false;
         }else{
            $('#modi_password1_class').removeClass('form-danger');
            $('#modi_password1_class').addClass('form-success');
            check_pw1=true;
         }
      }else{
         $('#modi_password1_class').removeClass('form-success');
         $('#modi_password1_class').removeClass('form-danger');
         check_pw1=false;
      }
   }else{
      
      if($('#modi_password2').val().length!=0) {
         if($('#modi_password1').val() != $('#modi_password2').val()) {
            $('#modi_password2_class').removeClass('form-success');
            $('#modi_password2_class').addClass('form-danger');
            
            check_pw2=false;
         }else {
            $('#modi_password2_class').removeClass('form-danger');
            $('#modi_password2_class').addClass('form-success');
            check_pw2=true;
         }
      }else{
         $('#modi_password2_class').removeClass('form-success');
         $('#modi_password2_class').removeClass('form-danger');
         check_pw2=false;
         
      }
   }
}
//비밀번호 유효성 끝

//키, 체중 유효성
function Check_height(num){
   
   if(num==1){
   
      for(var i=0;i<$("#modi_height").val().length;i++){   
         if($("#modi_height").val().charAt(i) >='0' && $("#modi_height").val().charAt(i) <= '9'){
            if($("#modi_height").val().length > 1 && $("#modi_height").val().length < 4 ){
               $('#modi_height_class').removeClass('form-danger');
                  $('#modi_height_class').addClass('form-success');
                  check_height=true;
            }else{
               $('#modi_height_class').removeClass('form-success');
                  $('#modi_height_class').addClass('form-danger');
                  
                  check_height=false;
            }
         }else{
            $('#modi_height_class').removeClass('form-success');
              $('#modi_height_class').addClass('form-danger');
              
              check_height=false;
         }
      }
   
   }else{
   
      for(var i=0;i<$("#modi_weight").val().length;i++){   
         if($("#modi_weight").val().charAt(i) >='0' && $("#modi_weight").val().charAt(i) <= '9'){
            if($("#modi_weight").val().length > 1 && $("#modi_weight").val().length < 4 ){
               $('#modi_weight_class').removeClass('form-danger');
                  $('#modi_weight_class').addClass('form-success');
                  check_weight=true;
            }else{
               $('#modi_weight_class').removeClass('form-success');
                  $('#modi_weight_class').addClass('form-danger');
                  
                  check_weight=false;
            }
         }else{
            $('#modi_weight_class').removeClass('form-success');
              $('#modi_weight_class').addClass('form-danger');
              
              check_weight=false;
         }
      }
   }
}
//키, 체중 유효성 끝

//닉네임 유효성
function Check_nickname(){
   
   var Nickname= $("#modi_nickname").val();
      
   if($("#modi_nickname").val().length==0){
      $('#modi_nickname_class').removeClass('form-danger');
      $('#modi_nickname_class').removeClass('form-success');
      $('#modi_nickname_class').addClass('');
      First_Check=false;
      check_nickname=false;
   }else if($("#modi_nickname").val().length < 3){
      $('#modi_nickname_class').removeClass('form-success');
      $('#modi_nickname_class').addClass('form-danger');
      First_Check=false;
      check_nickname=false;
   }else{
      First_Check=true;
   }   
   if(First_Check){
      $.ajax({
         type : 'POST',
         url : 'userCheck.do',
         data : {Nickname : Nickname, type : "Nickcheck"},
         contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
         dataType: 'html',
         success:function(Check){
            
            if(Check == "1") {
               $('#modi_nickname_class').removeClass('form-success');
               $('#modi_nickname_class').addClass('form-danger');
               //$('#modi_nickname_mark').html('clear');
               check_nickname=false;
            }
            else if(Check == "0"){
               $('#modi_nickname_class').removeClass('form-danger');
               $('#modi_nickname_class').addClass('form-success');
               //$('#modi_nickname_mark').html('check');
               check_nickname=true;
            }
           },
           error:function(Check){
              alert("에러");
           }
      }); 
   }
}
//닉네임 유효성 끝
//유효성 검사 끝

//주소 찾기
   var AddrEsS='${dto.address}'.split("%");
   
   var postcode=AddrEsS[0];
   var mainAddr=AddrEsS[1];
   var subAddr=AddrEsS[2];
   if(subAddr==null){
      subAddr="";
   }
   
   $(function() {
   
      $("#post_code_modify").val(postcode);
      $("#main_addr_modify").val(mainAddr);
      $("#sub_addr_modify").val(subAddr);
   })
   
   
   $(function(){
      $("#Modify_profile_main").change(function(){
         
         if($(this).val() != "") {
            var ext = $(this).val().split(".").pop().toLowerCase();
            if($.inArray(ext, ["gif","jpg","jpeg","png"]) == -1) {
               alert("gif, jpg, jpeg, png 파일만 업로드 해주세요.");
               $(this).val("");
               return;
            }
         }
         
         var fileSize = this.files[0].size;
         var maxSize = 10 * 1024 * 1024;
         if(fileSize > maxSize) {
            alert("파일용량은 10MB까지 업로드 됩니다.");
            $(this).val("");
            return;
         }
         
         var form = $('modify_form')[0];
           var formData = new FormData(form);
           formData.append('file', this.files[0]);
         $.ajax({
               type : 'post',
               url : 'fileUploadAction.do',
               data : formData,
               processData : false,
               contentType : false,
               success : function( data ) { // 업로드 성공하면 파일명을 받아온다.
            	   var data2 = JSON.parse(data);
                   var savefile = data2.savefile;
            	   
                  $("#Modify_default_pic").hide();
                  $('#Modify_profile_pic').after("<img class='img-circle img-raised img-responsive' src='upload/"+savefile+"'style='width:140px; height:150px' id='Modify_default_pic'/>");
                  $('#Modify_profile_value').val(savefile);
                  
   
               },
               error : function(error) { // 실패할 경우 에러메세지 출력
                   console.log(error);
                   console.log(error.status);
                   alert(error + ", " +error.status);
               }
           });   
         
      });
   });
   
   function search_address() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullAddr = ''; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수

                  // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     fullAddr = data.roadAddress;

                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     fullAddr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                  if (data.userSelectedType === 'R') {
                     //법정동명이 있을 경우 추가한다.
                     if (data.bname !== '') {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있을 경우 추가한다.
                     if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                     fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                           + ')' : '');
                  }
                  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  
                  $("#post_code_modify").val(data.zonecode);
                  $("#main_addr_modify").val(fullAddr);

                  // 커서를 상세주소 필드로 이동한다.
                  $("#sub_addr_modify").attr("disabled",false);
                  $("#sub_addr_modify").val("");
                  $("#sub_addr_modify").focus();

               }
            }).open();
   }
//주소 찾기 끝

//처음 큰 자물쇠
function lock_mouse_over(){
   $("#lock_i").html("lock_open");
}
function lock_mouse_leave(){
   $("#lock_i").html("lock_outline");
}
function lock_mouse_click(){
   $("#lock_i").animate({opacity: "0"}, 1000);
   $("#lock_i").css('z-index','-9');
   $("#lock_i").css('display','none');
   $('#Check_PW_input').animate({opacity:"1"},500);
   
}
//처음 큰 자물쇠 끝

//로봇이 아닙니다
 var verifyCallback = function(response) {
    $.ajax({
       type : 'post',
       url : "verify.do",
       async:false,
       data : {
          response : response
       },
       success : function(data) {
          if(data=='true'){
            RodoCheck("true");
          }else{
             RodoCheck("false");
          }
       },
       error : function(data) {
       }
    });
};
var RodotCheck=false;

var onloadCallback = function() {
       grecaptcha.render('test', {
         'sitekey' : '6LdQ7kMUAAAAAIXA0mdWV7j9SQukYbGVcH637yaa',
         'callback' : verifyCallback,
         'theme' : 'light'
       });
 };
//로봇이 아닙니다 끝
 
//비밀번호 입력받기
function RodoCheck(boole){
   if(boole=="true"){
      RodotCheck=true;
   }else{
      RodotCheck=false;
   }
}
function Check_pw_submit(){
   if(RodotCheck==true){
      if($("#Check_pw_input").val()=='${dto.password}'){
         $("#Check_PW_input").animate({opacity: "0.00000000000000001"}, 1000);
         $("#modify_main").animate({opacity: "1"}, 1000);
         $("#Check_PW_input").css('z-index','-10');
         $("#modify_main").css('z-index','10');
      }else if($("#Check_pw_input").val().length==0){
         alert("비밀번호를 입력해주세요");
         $("#Check_pw_input").focus();
         
      }else{
         alert("비밀번호가 틀렸습니다");
         $("#Check_pw_input").focus();
      }
   }else{
      alert("로봇체크를 해주세요");
      $(".recaptcha-checkbox-checkmark").focus();
   }
}
//비밀번호 입력받기 끝

//비밀번호 변경하기버튼
function Password_modify(){
   $("#new_password_input").html("<div class='col-md-4'>"
   +   "<div class='form-group label-floating' id='modi_password1_class'>"
   +   "<label>새 비밀번호</label>"
   +   "<input class='form-control' type='password' id='modi_password1' name='modi_password1' onkeyup='Check_pw(1)'>"
   +   "</div>"
   +   "</div>"
   +   "<div class='col-md-4'>"
   +   "<div class='form-group label-floating' id='modi_password2_class'>"
   +   "<label>비밀번호 확인</label>"
   +   "<input class='form-control' type='password' id='modi_password2' name='modi_password2' onkeyup='Check_pw(2)'>"
   +   "</div>"
   +   "</div>");
}
//비밀번호 변경하기버튼 끝

//Submit버튼
function End_btn_click(){
   if(check_pw1==false || check_pw2==false || check_height==false || check_weight==false || check_nickname==false){
      if(check_pw1==false ){
         $("#modi_password1").focus();
         return;
      }else if(check_pw2==false){
         $("#modi_password2").focus();
         return;
      }else if(check_height==false){
         $("#modi_height").focus();
         return;
      }else if(check_weight==false){
         $("#modi_weight").focus();
         return;
      }else if(check_nickname==false){
         $("#modi_nickname").focus();
         return;
      }else if($("#modi_password1").val().length==0 || $("#modi_password2").val().length==0){
         $("#modi_password1").focus();
         return;
      }
      
   }else{
      $("#modify_form").submit();
   }
}
//Submit버튼 끝

</script>

<style>
   #modify_main{
       opacity:0.000000000000000000000000001; 
   }
   
</style>
<!-- 처음 큰 자물쇠 -->
<div class="" id="modify_sub" style="position:absolute; margin-left:240px; z-index:5;">
   <a onclick="lock_mouse_click()"><i class="material-icons" id="lock_i" style="color: black; font-size:693px;" onmouseover="lock_mouse_over();" onmouseout="lock_mouse_leave();">lock_outline</i></a>
</div>

<!-- 비밀번호 입력받기 -->
<div id="Check_PW_input" style="position: absolute; margin-top: 150px; width: 300px; margin-left: 34%; z-index:6; opacity:0;">
   <div class="form-group label-floating">
      <label class="control-label">비밀번호 입력</label>
      <input type="password" class="form-control" id="Check_pw_input">
   </div>
   <div id="test"></div>
   <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
   <button class="btn btn-info" onclick="Check_pw_submit()" style="margin-left: 200px;">submit</button>
</div>

<!-- 회원정보 수정하는 페이지 -->
<div class="card-content" id="modify_main">
   <form id="modify_form" class="form-control" accept-charset="UTF-8" action="user_modify.do" method="post" style="background-image: none;">
        <div class="row">
            <div class="col-md-3">
                <div class="form-group label-floating">
                    <label>ID</label>
                    <input type="text" class="form-control" id="modi_id" disabled value="${sessionScope.Id }">
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-3">
                <div class="form-group label-floating" id="modi_nickname_class">
                    <label>NickName</label>
                    <input type="text" class="form-control" value="${dto.nickname }" id="modi_nickname" name="modi_nickname" onkeyup="Check_nickname()">
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-4">
                <div class="form-group label-floating">
                    <label>Email</label>
                    <input type="email" class="form-control" value="${dto.email }" id="modi_email" name="modi_email" >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group label-floating" id="modi_height_class">
                    <label>신장</label>
                    <input type="text" class="form-control" value="${dto.height }" id="modi_height" name="modi_height" maxlength="3" onkeyup="Check_height(1)">
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-3">
                <div class="form-group label-floating" id="modi_weight_class">
                    <label>체중</label>
                    <input type="text" class="form-control" value="${dto.weight }" id="modi_weight" name="modi_weight" maxlength="3" onkeyup="Check_height(2)">
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-4">
               <div class="form-group label-floating">
                    <label>휴대폰번호</label>
                    <input type="text" class="form-control" value="${dto.phonenum }" disabled>
                </div>
            </div>
        </div>
        <div class="row">
           <div class="col-md-9">
              <div class="row">
                  <div class="col-md-5">
                      <div class="form-group label-floating">
                          <label>우편번호</label>
                          <input type="text" class="form-control" id="post_code_modify" name="post_code_modify" value="" readonly="readonly">
                      </div>
                  </div>
                  <div class="col-md-5">
                      <div class="form-group label-floating">
                          <label>주소</label>
                          <input type="text" class="form-control" id="main_addr_modify" name="main_addr_modify" readonly="readonly">
                      </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-9">
                      <div class="form-group label-floating">
                          <label>상세주소</label>
                          <input type="text" class="form-control" id="sub_addr_modify" name="sub_addr_modify">
                      </div>
                  </div>
                  <div class="col-md-3">
                      <button class="btn btn-danger" type="button" onclick="search_address()" style="margin-top: 37px;">우편번호 찾기</button>
                  </div>
               </div>
         </div>
             <div class="col-md-3">
               <div class="form-group" id="divPhoto" style="margin-top: 0px;">
                  <div class="col-md-9">
                  <div id="Modify_profile_pic">               </div>
               <img class="img-circle img-raised img-responsive" src="upload/${dto.member_pic }" style="width:140px; height:150px" id="Modify_default_pic"/>
               <input class="form-control" type="text" id="Modify_profile_value" name="Modify_profile_value" value="${dto.member_pic } ">
               </div>
               <div class="col-md-3" style="margin-top: 125px;">
                  <button class="btn btn-warning btn-fab btn-round">
                     <input type="file" name="Modify_profile_main" id="Modify_profile_main">
                     <i class="material-icons">camera_alt</i>
                  </button>
               </div>
               
               </div>
            </div>
      </div>
      <div class="row" id="new_password_input">
            <button class="btn btn-warning" onclick="Password_modify()">비밀번호 변경</button>
            <input type="hidden" value="${dto.password }" id="modi_password2" name="modi_password2">
      </div>
      
      <div class="col-md-12" style="height:30px"></div>
        <button type="button" class="btn btn-primary pull-right btn-lg btn-success" onclick="End_btn_click()">회원정보 수정</button>
    </form>
</div>