<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">

	 $(document).ready(function(){
	 	var url = "user/Modal_Join_1.jsp";
	 	
	 	$('#SignUpBtn').click(function(e) {
	 	$('.modal-content').empty();
	    $('.modal-content').load(url,function(){
	 	$('#myModal').modal({show:true});
	 });
	 });
	 });
	 	 
	 $('[data-toggle="popover"]').popover();
	 var check_id = false, check_pw = false;
	 function login_id() {
		 var ID= $("#Id").val();	//입력받은 ID
		 
			if(ID.length==0){
				$('#login_id_class').removeClass('form-danger');
				$('#login_id_class').removeClass('form-success');
				$('#login_id_class').addClass('');
				$('#login_id_mark').html(' ');
				check_id=false;
				
			}else if(ID.length < 4){
				$('#login_id_class').removeClass('form-success');
				$('#login_id_class').addClass('form-danger');
				$('#login_id_mark').html('clear');
				check_id=false;
				
			}else{
				for(var i=0;i<ID.length;i++){	
					
					if(ID.charAt(i) >='a' && ID.charAt(i) <= 'z') {
						check_id=true;
					}else if(ID.charAt(i) >= 'A' && ID.charAt(i) <= 'Z') {
						check_id=true;
					}else if(ID.charAt(i) >= '0' && ID.charAt(i) <= '9') {
						check_id=true;					
					}else{
						check_id=false;
						break;
					}
				}								//쓰면 되는지 안되는지 판별. 특수문자같은거면 First_Check==false;

				if(check_id) {
					$('#login_id_class').removeClass('form-danger');
					$('#login_id_class').addClass('form-success');
					$('#login_id_mark').html('check');
					check_id=true;
				}				
				else {
					$('#login_id_class').removeClass('form-success');
					$('#login_id_class').addClass('form-danger');
					$('#login_id_mark').html('clear');
					
					check_id=false;
					return;
				}
			}									//비어있으면 보라색
			if(check_id==true &&check_pw==true){
				$("#loginBtn").removeClass("btn-default");
				$("#loginBtn").addClass("btn-warning");
			}else{
				$("#loginBtn").removeClass("btn-warning");
				$("#loginBtn").addClass("btn-defalut");
			}
	 }
	 
	 function login_pw() {
		 var pw= $("#Password").val();	//입력받은 ID
		 
			if(pw.length==0){
				$('#login_pw_class').removeClass('form-danger');
				$('#login_pw_class').removeClass('form-success');
				$('#login_pw_class').addClass('');
				$('#login_pw_mark').html(' ');
				check_pw=false;
				
			}else if(pw.length < 4){
				$('#login_pw_class').removeClass('form-success');
				$('#login_pw_class').addClass('form-danger');
				$('#login_pw_mark').html('clear');
				check_pw=false;
				
			}else{
				for(var i=0;i<pw.length;i++){	
					
					if(pw.charAt(i) >='a' && pw.charAt(i) <= 'z') {
						check_pw=true;
					}else if(pw.charAt(i) >= 'A' && pw.charAt(i) <= 'Z') {
						check_pw=true;
					}else if(pw.charAt(i) >= '0' && pw.charAt(i) <= '9') {
						check_pw=true;					
					}else{
						check_pw=false;
						break;
					}
				}								//쓰면 되는지 안되는지 판별. 특수문자같은거면 First_Check==false;

				if(check_pw) {
					$('#login_pw_class').removeClass('form-danger');
					$('#login_pw_class').addClass('form-success');
					$('#login_pw_mark').html('check');
					check_pw=true;
				}				
				else {
					$('#login_pw_class').removeClass('form-success');
					$('#login_pw_class').addClass('form-danger');
					$('#login_pw_mark').html('clear');
					
					check_pw=false;
					return;
				}
			}									//비어있으면 보라색
			if(check_id && check_pw){
				$("#loginBtn").removeClass("btn-default");
				$("#loginBtn").addClass("btn-warning");
			}else{
				$("#loginBtn").removeClass("btn-warning");
				$("#loginBtn").addClass("btn-defalut");
			}
	 }
	 
	 function login_submit() {
	      var Login_place=sessionStorage.getItem('Login_place');
	      if(!check_id){
	         $("#loginBtn").attr('data-content','아이디를 정확히 입력해주세요');
	         $("#Id").focus();
	         return;
	      }else if(!check_pw){
	         $("#loginBtn").attr('data-content','비밀번호를 정확히 입력해주세요');
	         $("#Password").focus();
	         return;
	      }else{
	         var loginData = $('#loginForm').serialize();
	         // 직렬화한 데이터를 login 서블릿으로 전달한다.
	         $.ajax({
	               type : "POST",
	               url : "loginAction.do",
	               data : loginData,
	               contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	               dataType: 'html',
	               success:function(data){
	                  if(data == '0'){
	                     $('#alertContent').html('존재하지 않는 아이디입니다.');
	                     $('#myModal10').modal('show');
	                  }else if(data == '-1'){
	                     $('#alertContent').html('비밀번호가 틀렸습니다.');
	                     $('#myModal10').modal('show');
	                  }
	                  else if(Login_place=='First_page'){
	                     $('#myModal').modal('hide');
	                     YeYeCheck=false;
//	                      $("#black_face_bg").css("display","none");
	                     $(".slide__text").css('display','none');
	                     $("#First_slide__4").css('left', '100%').css('transition','700ms');
	                     $("#First_slide__3").css('left', '100%').css('transition','700ms 500ms');
	                     $("#First_slide__2").css('left', '100%').css('transition','700ms 1000ms');
	                     $("#First_slide__1").css('transition','700ms 1500ms').css('width','100%').css('height','100%').css('top','0px').css('bottom','0px').css('left','430px').css('opacity','0');
	                     $("#dongdong").animate({opacity:1},2200,function(){
	                        location.href="index.jsp";
	                     });
	                     if (window.sessionStorage) {
	                        sessionStorage.setItem('Login_place', '');
	                     }
	                     
	                     
	                  }else if(Login_place==""){
	                     location.href="index.jsp";
	                  }
	              },
	              error:function(data){
	                 alert("로그인 실패! 뭔가 잘못됐음");
	              }
	         });   
	       }
	    }
	</script>
</head>
<body>
	<div class="modal-header">
         <div align="center" style="
               margin-top: -50px; 
               padding-left: 5px; 
               margin-left: 5px; 
               background: linear-gradient(60deg, #50AFBF, #002848); 
               border-radius:5px; 
               box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
               height:90px;">
           <h4 id="myModalLabel" style="padding-top:20px; font-size: 30px; font-weight: bold;"><font color="white">Log In</font></h4>
        </div>
	</div>
		<div class="modal-body">
			<form id="loginForm" onsubmit="return false;">
				<div class="container-fluid">
            		<div class="col-lg-12 col-md-12 col-xs-12 text-center" style="min-height: 0px; ">
               			<div class="jumbotran" style="padding-top:20px">
                  			<div class="form-group label-floating" id="login_id_class">
                  				<label class="control-label" style="font-size:20px; left:0px; margin-top: 5px;">아이디</label>
                     			<input type="text" class="form-control " name="Id" id="Id" maxlength="20" style="font-size:20px; margin-bottom: 20px; " onkeyup="login_id();">
                  				<div class="col-md-11 col-sm-11 col-xs-11"></div>
		                    	<i class="material-icons" id="login_id_mark"></i>			
		                		<span class="material-input"></span>
                  			</div>
                  			<div class="form-group label-floating" id="login_pw_class">
                  				<label class="control-label" style="font-size:20px; left:0px; margin-top: 5px;">비밀번호</label>
                     			<input type="password" class="form-control" name="Password" id="Password" maxlength="20" style="font-size:20px;" onkeyup="login_pw();">
     			            	<div class="col-md-11 col-sm-11 col-xs-11"></div>
		                    	<i class="material-icons" id="login_pw_mark"></i>			
		                		<span class="material-input"></span>
                  			</div>
                  			<div style="text-align:center;">
                  			<button class="btn btn-default" id="loginBtn" data-toggle="popover" data-placement="top" data-content="" onclick="login_submit();">로그인</button>
                  			<button type="button" class="btn btn-info" id="SignUpBtn">회원가입</button>
                  			</div>
               			</div>
            		</div>
         		</div>
      		</form>
      	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</body>
</html>