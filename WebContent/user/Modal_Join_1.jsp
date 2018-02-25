<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<style type="text/css">
	a:focus {
	outline: 0;
	}
</style>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script type="text/javascript">

$('[data-toggle="popover"]').popover();
$('#tabs').tabs({ hide:'fade', show: 'fade'});

//확인할 때 사용할 변수 설정
var check_name=false, check_jumin1=false, check_jumin2=false, check_phone1=false, email_Check=false, check_phone2=false, check_phone3=false, check_address=false, check_email=false, check_id=false, check_pw1=false, check_pw2=false, check_nickname=false, check_height=false, check_weight=false;

function Click_infoBtn(){
	if($("#menu_1").hasClass('active')){
		
		if(check_name==false){
			$("#nextBtn").attr('data-content','이름을 정확히 입력해주세요');
			$("#Join_name_value").focus();
			return;
		}else if(check_jumin2==false){
			$("#nextBtn").attr('data-content','주민번호를 정확히 입력해주세요');
			$("#Join_jumin1_value").focus();
			return;
		}else if(check_phone1==false || check_phone2==false || check_phone3==false){
			$("#nextBtn").attr('data-content','휴대폰번호를 정확히 입력해주세요');
			$("#Join_phonenum1_value").focus();
			return;
		}else{
			$("#nextBtn").removeClass("btn-warning");
			$("#nextBtn").addClass("btn-defalut");
			$("#nextBtn").attr('data-content','');
			$("#info_2_a").click();
		}
	}else if($("#menu_2").hasClass('active')){
		if(check_address==false){
			$("#nextBtn").attr('data-content','주소를 정확히 입력해주세요');
			$("#address2").focus();
			return;
		}else if(check_email==false){
			$("#nextBtn").attr('data-content','이메일 인증을 진행해주세요');
			$("#Join_email_value").focus();
			return;
		}else{
			$("#nextBtn").removeClass("btn-warning");
			$("#nextBtn").addClass("btn-defalut");
			$("#info_3_a").click();
		}
	}else if($("#menu_3").hasClass('active')){
		if(check_id==false){
			$("#nextBtn").attr('data-content','아이디를 정확히 입력해주세요');
			$("#Join_id_value").focus();
			return;
		}else if(check_pw1==false){
			$("#nextBtn").attr('data-content','비밀번호를 정확히 입력해주세요');
			$("#Join_pw1_value").focus();
			return;
		}else if(check_pw2==false){
			$("#nextBtn").attr('data-content','비밀번호가 일치하지 않습니다');
			$("#Join_pw2_value").focus();
			return;
		}else{
			$("#nextBtn").removeClass("btn-warning");
			$("#nextBtn").addClass("btn-defalut");
			$("#nextBtn").attr('data-content','');
			$("#info_4_a").click();
		}
	}else if($("#menu_4").hasClass('active')){
		if(check_nickname==false){
			$("#nextBtn").attr('data-content','닉네임을 정확히 입력해주세요');
			$("#Join_nickname_value").focus();
			return;
		}else if(check_height==false){
			$("#nextBtn").attr('data-content','키를 정확히 입력해주세요');
			$("#Join_height_value").focus();
			return;
		}else if(check_weight==false){
			$("#nextBtn").attr('data-content','몸무게를 정확히 입력해주세요');
			$("#Join_weight_value").focus();
			return;
		}else{
			$("#nextBtn").removeClass("btn-warning");
			$("#nextBtn").html('회원가입');
			$("#nextBtn").addClass("btn-success");
			$("#nextBtn").attr('data-content','');
			$("#info_5_a").click();
		}
	}else if($("#menu_5").hasClass('active')){
		if(check_name==false || check_jumin1==false || check_jumin2==false || check_phone1==false ||check_phone2==false || check_phone3==false){
			$("#info_1_a").click();
		}else if(check_address==false || check_email==false){
			$("#info_2_a").click();
		}else if(check_id==false || check_pw1==false || check_pw2==false){
			$("#info_3_a").click();
		}else if(check_nickname==false || check_height==false || check_weight==false){
			$("#info_4_a").click();
		}else{
			var joinData = $('#Join_form').serialize();
			// 직렬화한 데이터를 회원가입,수정 서블릿으로 전달한다.
			$.ajax({
					type : "POST",
					url : "joinAction.do",
					data : joinData,
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType: 'html',
					success:function(data){
						
						login();
				  },
				  error:function(data){
					  alert("회원가입 실패! 뭔가 잘못됐음");
				  }
			});	
		}
	}
}
//이름----------------------------------------------------------------------------------------------------
function Check_name(){
	
	for(var i=0;i<$("#Join_name_value").val().length;i++){	
		if($("#Join_name_value").val().length > 1) {
			if($("#Join_name_value").val().charAt(i) >='가' && $("#Join_name_value").val().charAt(i) <= '힣') {
				$('#Join_name_class').removeClass('form-danger');
				$('#Join_name_class').addClass('form-success');
				$('#Join_name_mark').html('check');
				
							
				check_name=true;
				
			}else {
				$('#Join_name_class').removeClass('form-success');
				$('#Join_name_class').addClass('form-danger');
				$('#Join_name_mark').html('clear');
				
				
				check_name=false;
			}
		}else {
			$('#Join_name_class').removeClass('form-danger');
			$('#Join_name_class').removeClass('form-success');
			$('#Join_name_class').addClass('');
			$('#Join_name_mark').html(' ');
			
			check_name=false;
		} 
	}
	if(check_name==true &&check_jumin1==true &&check_jumin2==true &&check_phone1==true &&check_phone2==true &&check_phone3==true){
		$("#nextBtn").removeClass("btn-default");
		$("#nextBtn").addClass("btn-warning");
	}else{
		$("#nextBtn").removeClass("btn-warning");
		$("#nextBtn").addClass("btn-defalut");
	}
}

//주민번호-------------------------------------------------------------------------------------------------------
function Check_jumin(num){
	
    var result;
    if(num==1){
    	for(var i=0;i<$("#Join_jumin1_value").val().length;i++){	
    	
    		if($("#Join_jumin1_value").val().charAt(i) >='0' && $("#Join_jumin1_value").val().charAt(i) <= '9'){
	    		if($("#Join_jumin1_value").val().length==6){
		    		$('#Join_jumin1_class').removeClass('form-danger');
	            	$('#Join_jumin1_class').addClass('form-success');
	            	$('#Join_jumin1_mark').html('check');
	            	
	            	check_jumin1=true;
	            	
	    		}else{
	    			$('#Join_jumin1_class').removeClass('form-success');
	            	$('#Join_jumin1_class').addClass('form-danger');
	            	$('#Join_jumin1_mark').html('clear');
	            	
	            	check_jumin1=false;
	    		}
    		}else{
    			$('#Join_jumin1_class').removeClass('form-success');
            	$('#Join_jumin1_class').addClass('form-danger');
            	$('#Join_jumin1_mark').html('clear');
            	check_jumin2=false;
    		}
    	}
    }else{	
	    for(var i=0;i<$("#Join_jumin2_value").val().length;i++){
		    if($("#Join_jumin2_value").val().charAt(i) >='0' && $("#Join_jumin2_value").val().charAt(i) <= '9') {
		    	
			    if($("#Join_jumin1_value").val().length == 6 && $("#Join_jumin2_value").val().length == 7){
			    
			    	
			       var JuminNum1=$("#Join_jumin1_value").val();   //주민 앞자리
			       var JuminNum2=$("#Join_jumin2_value").val();   //주민 뒷자리
			
			       var gender;
			        
			       var sum=0;
			       
			       if(JuminNum2.charAt(0)==1 || JuminNum2.charAt(0)==3){
			          gender="남성";
			       }else if(JuminNum2.charAt(0)==2 || JuminNum2.charAt(0)==4){
			          gender="여성";
			       }
			            
			        for(var i=0;i<6;i++){ 
			           sum+=JuminNum1.charAt(i)*(i+2);
			        }
			        
			        sum+= JuminNum2.charAt(0)*8+
			              JuminNum2.charAt(1)*9+
			              JuminNum2.charAt(2)*2+
			              JuminNum2.charAt(3)*3+
			              JuminNum2.charAt(4)*4+
			              JuminNum2.charAt(5)*5;
			        
			        sum = 11-(sum%11);
			          
			       if(sum == 11 ){
			          sum = 1;
			          
			       }else if( sum == 10 ){
			          sum = 0;
			       }
			             
			       if(JuminNum2.charAt(6) == sum ){ 
			         
			    	   var juminbono = $("#Join_jumin1_value").val()+"-"+$("#Join_jumin2_value").val();
			          
			          $.ajax({
			             type : 'POST',
			             url : 'userCheck.do',
			             data : {juminbono : juminbono, type : "JuminCheck"},
			             contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			             dataType: 'html',
			             success:function(Check){
			                if(Check == "1") {
			                	$('#Join_jumin1_class').removeClass('form-success');
			                	$('#Join_jumin2_class').removeClass('form-success');
			                	$('#Join_jumin1_class').addClass('form-danger');
			                	$('#Join_jumin2_class').addClass('form-danger');
			                	$('#Join_jumin2_mark').html('clear');
			                	
			                	check_jumin2=false;
			                }
			                else if(Check == "0"){
			                	$('#Join_jumin1_class').removeClass('form-danger');
			                	$('#Join_jumin2_class').removeClass('form-danger');
			                	$('#Join_jumin1_class').addClass('form-success');
			                	$('#Join_jumin2_class').addClass('form-success');
			                	$('#Join_jumin2_mark').html('check');
			                	check_jumin2=true;
			                }
			            },
			            error:function(Check){
			               alert("에러");
			            }
			       }); 
			          
			          jumin_Check=true;
			          
			       }else{
						$('#Join_jumin1_class').removeClass('form-success');
						$('#Join_jumin2_class').removeClass('form-success');
						$('#Join_jumin1_class').addClass('form-danger');
						$('#Join_jumin2_class').addClass('form-danger');
						$('#Join_jumin2_mark').html('clear');
						
						check_jumin2=false;
						
			        } 
			    }else if($("#Join_jumin1_value").val().length==6){
			    	$('#Join_jumin2_class').removeClass('form-success');
			    	$('#Join_jumin2_class').addClass('form-danger');
			    	$('#Join_jumin2_mark').html('clear');
			    	
			    	check_jumin2=false;
			    	
			    }else{
			    	$('#Join_jumin1_class').removeClass('form-success');
			    	$('#Join_jumin1_class').addClass('form-danger');
			    	$('#Join_jumin1_mark').html('clear');
			    	
			    	check_jumin2=false;
			    }
	    
		    }else {
				$('#Join_jumin2_class').removeClass('form-success');
				$('#Join_jumin2_class').addClass('form-danger');
				$('#Join_jumin2_mark').html('clear');
				
				check_jumin2=false;
			}
	 	} 
    }
    if(check_name==true &&check_jumin1==true &&check_jumin2==true &&check_phone1==true &&check_phone2==true &&check_phone3==true){
		$("#nextBtn").removeClass("btn-default");
		$("#nextBtn").addClass("btn-warning");
	}else{
		$("#nextBtn").removeClass("btn-warning");
		$("#nextBtn").addClass("btn-defalut");
	}
}

//폰번호---------------------------------------------------------------------------------------------------------
function Check_phonenum(num){
	
	if(num==1){
		for(var i=0;i<$("#Join_phonenum1_value").val().length;i++){	
			if($("#Join_phonenum1_value").val().charAt(i) >='0' && $("#Join_phonenum1_value").val().charAt(i) <= '9'){
				if($("#Join_phonenum1_value").val().length == 3){
					$('#Join_phonenum1_class').removeClass('form-danger');
                	$('#Join_phonenum1_class').addClass('form-success');
                	$('#Join_phonenum1_mark').html('check');
                	check_phone1=true;
                	
				}else{
					$('#Join_phonenum1_class').removeClass('form-success');
	            	$('#Join_phonenum1_class').addClass('form-danger');
	            	$('#Join_phonenum1_mark').html('clear');
	            	
	            	check_phone1=false;
				}
			}else{
				$('#Join_phonenum1_class').removeClass('form-success');
            	$('#Join_phonenum1_class').addClass('form-danger');
            	$('#Join_phonenum1_mark').html('clear');
            	
            	check_phone1=false;
			}
		}
	}else if(num==2){
		for(var i=0;i<$("#Join_phonenum2_value").val().length;i++){	
			if($("#Join_phonenum2_value").val().charAt(i) >='0' && $("#Join_phonenum2_value").val().charAt(i) <= '9'){
				if($("#Join_phonenum2_value").val().length == 4){
					$('#Join_phonenum2_class').removeClass('form-danger');
                	$('#Join_phonenum2_class').addClass('form-success');
                	$('#Join_phonenum2_mark').html('check');
                	check_phone2=true;
				}else{
					$('#Join_phonenum2_class').removeClass('form-success');
	            	$('#Join_phonenum2_class').addClass('form-danger');
	            	$('#Join_phonenum2_mark').html('clear');
	            	
	            	check_phone2=false;
				}
			}else{
				$('#Join_phonenum2_class').removeClass('form-success');
            	$('#Join_phonenum2_class').addClass('form-danger');
            	$('#Join_phonenum2_mark').html('clear');
            	
            	check_phone2=false;
			}
		}
	}else if(num==3){
		for(var i=0;i<$("#Join_phonenum3_value").val().length;i++){	
			if($("#Join_phonenum3_value").val().charAt(i) >='0' && $("#Join_phonenum3_value").val().charAt(i) <= '9'){
				if($("#Join_phonenum3_value").val().length == 4){
					$('#Join_phonenum3_class').removeClass('form-danger');
                	$('#Join_phonenum3_class').addClass('form-success');
                	$('#Join_phonenum3_mark').html('check');
                	check_phone3=true;
				}else{
					$('#Join_phonenum3_class').removeClass('form-success');
	            	$('#Join_phonenum3_class').addClass('form-danger');
	            	$('#Join_phonenum3_mark').html('clear');
	            	
	            	check_phone3=false;
				}
			}else{
				$('#Join_phonenum3_class').removeClass('form-success');
            	$('#Join_phonenum3_class').addClass('form-danger');
            	$('#Join_phonenum3_mark').html('clear');
            	
            	check_phone3=false;
			}
		}
	}
	if(check_name==true &&check_jumin1==true &&check_jumin2==true &&check_phone1==true &&check_phone2==true &&check_phone3==true){
		$("#nextBtn").removeClass("btn-default");
		$("#nextBtn").addClass("btn-warning");
	}else{
		$("#nextBtn").removeClass("btn-warning");
		$("#nextBtn").addClass("btn-defalut");
	}
}

//주소------------------------------------------------------------------------------------------------------------
function Check_address(){
	if($("#postcode").val().length != 0 && $("#address1").val().length != 0 && $("#address2").val().length){
		$("#Join_address_btn").val('입력완료');
		$("#Join_address_btn").removeClass('btn-danger');
		$("#Join_address_btn").addClass('btn-info');
		check_address=true;
		
	}else{
		$("#Join_address_btn").val('우편번호 찾기');
		$("#Join_address_btn").removeClass('btn-info');
		$("#Join_address_btn").addClass('btn-danger');
		
		check_address=false;
	}
	if(check_address==true && check_email==true){
		$("#nextBtn").removeClass("btn-default");
		$("#nextBtn").addClass("btn-warning");
	}else{
		$("#nextBtn").removeClass("btn-warning");
		$("#nextBtn").addClass("btn-defalut");
	}
}

//이메일------------------------------------------------------------------------------------------------------------
var amugumna=0;
function Check_email_1(){
   
   if(amugumna==0){
      var width = 430;
      var height = 200;
      var winL = (screen.width - width) / 2;
      var winT = (screen.height - height) / 2;
      var property = "width=" + width + "," + "height=" + height + "," 
      + "left=" + winL + "," + "top=" + winT + " menubar=no";
      window.open("authMail.jsp?to=" + $("#Join_email_value").val(), "인증 페이지", property);
      amugumna+=1;
   }
   amugumna=0;
}
function Check_email(){
      if(email_Check==true){
         $("#Join_email_btn").attr('onclick','');
         $("#Join_email_btn").attr('value','인증완료');
         $("#Join_email_btn").removeClass('btn-danger');
         $("#Join_email_btn").addClass('btn-info');
         $("#Join_email_value").removeClass('form-danger');
         $("#Join_email_value").addClass('form-success');
         check_email=true;
      }else{
         $("#Join_email_btn").val('이메일 인증');
         $("#Join_email_btn").removeClass('btn-info');
         $("#Join_email_btn").addClass('btn-danger');
         $("#Join_email_value").removeClass('form-success');
         $("#Join_email_value").addClass('form-danger');
         amugumna=0;
         check_email=false;
      }
      
      if(check_address==true && check_email==true){
         $("#nextBtn").removeClass("btn-default");
         $("#nextBtn").addClass("btn-warning");
      }else{
         $("#nextBtn").removeClass("btn-warning");
         $("#nextBtn").addClass("btn-defalut");
      }
}      

//아이디----------------------------------------------------------------------------------------------------------
function Check_id(){
	
	var ID= $("#Join_id_value").val();	//입력받은 ID
	var First_Check=false;				//쓰면 안되는 글자 쓰면 false로 DB 안들어감
	
	if($("#Join_id_value").val().length==0){
		$('#Join_id_class').removeClass('form-danger');
		$('#Join_id_class').removeClass('form-success');
		$('#Join_id_class').addClass('');
		$('#Join_id_mark').html(' ');
		
		First_Check=false;
		
	}else if($("#Join_id_value").val().length < 4){
		$('#Join_id_class').removeClass('form-success');
		$('#Join_id_class').addClass('form-danger');
		$('#Join_id_mark').html('clear');
		
		check_id=false;
	}else{
	for(var i=0;i<$("#Join_id_value").val().length;i++){	
		
		if($("#Join_id_value").val().charAt(i) >='a' && $("#Join_id_value").val().charAt(i) <= 'z') {
			First_Check=true;
		}else if($("#Join_id_value").val().charAt(i) >= 'A' && $("#Join_id_value").val().charAt(i) <= 'Z') {
			First_Check=true;
		}else if($("#Join_id_value").val().charAt(i) >= '0' && $("#Join_id_value").val().charAt(i) <= '9') {
			First_Check=true;					
		}else{
			First_Check=false;
			break;
		}
	}								//쓰면 되는지 안되는지 판별. 특수문자같은거면 First_Check==false;
			if(First_Check==true){		//true면 DB로 false면 빨간색으로
				$.ajax({
					type : 'POST',
					url : 'userCheck.do',
					data : {ID : ID, type : "idcheck"},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType: 'html',
					success:function(Check){
						
						if(Check == "1") {
							$('#Join_id_class').removeClass('form-success');
							$('#Join_id_class').addClass('form-danger');
							$('#Join_id_mark').html('clear');
							
							check_id=false;
							return;
						}				
						else if(Check == "0"){
							$('#Join_id_class').removeClass('form-danger');
							$('#Join_id_class').addClass('form-success');
							$('#Join_id_mark').html('check');
							check_id=true;
						}
				  },
				  error:function(Check){
					  alert("에러");
				  }
				}); 
			}else{
				$('#Join_id_class').removeClass('form-success');
				$('#Join_id_class').addClass('form-danger');
				$('#Join_id_mark').html('clear');
				
				check_id=false;
			}
	}									//비어있으면 보라색
			if(check_id==true &&check_pw1==true &&check_pw2==true){
				$("#nextBtn").removeClass("btn-default");
				$("#nextBtn").addClass("btn-warning");
			}else{
				$("#nextBtn").removeClass("btn-warning");
				$("#nextBtn").addClass("btn-defalut");
			}
}


//비밀번호--------------------------------------------------------------------------------------------------------
function Check_pw(num){
	
	check_4=true; check_5=true;
	$('.popover-content').show();
	
	if(num==1){
		if($('#Join_pw_value').val().length != 0){
			if($('#Join_pw_value').val().length < 4){
				$('#Join_pw_class').removeClass('form-success');
				$('#Join_pw_class').addClass('form-danger');
				$('#Join_pw_mark').html('clear');
				
				check_pw1=false;
			}else{
				$('#Join_pw_class').removeClass('form-danger');
				$('#Join_pw_class').addClass('form-success');
				$('#Join_pw_mark').html('check');
				check_pw1=true;
			}
		}else{
			$('#Join_pw_class').removeClass('form-success');
			$('#Join_pw_class').removeClass('form-danger');
			$('#Join_pw_mark').html('clear');
			
			check_pw1=false;
		}
	}else{
		
		if($('#Join_pw2_value').val().length!=0) {
			if($('#Join_pw_value').val() != $('#Join_pw2_value').val()) {
				$('#Join_pw2_class').removeClass('form-success');
				$('#Join_pw2_class').addClass('form-danger');
				$('#Join_pw2_mark').html('clear');
				
				check_pw2=false;
			}else {
				$('#Join_pw2_class').removeClass('form-danger');
				$('#Join_pw2_class').addClass('form-success');
				$('#Join_pw2_mark').html('check');
				check_pw2=true;
			}
		}else{
			$('#Join_pw2_class').removeClass('form-success');
			$('#Join_pw2_class').removeClass('form-danger');
			$('#Join_pw2_mark').html('clear');
			
			check_pw2=false;
			
		}
	}
	
	if(check_id==true &&check_pw1==true &&check_pw2==true){
		$("#nextBtn").removeClass("btn-default");
		$("#nextBtn").addClass("btn-warning");
	}else{
		$("#nextBtn").removeClass("btn-warning");
		$("#nextBtn").addClass("btn-defalut");
	}
}

//닉네임------------------------------------------------------------------------------------------------------------------------
function Check_nickname(){
	
	var Nickname= $("#Join_nickname_value").val();
		
	if($("#Join_nickname_value").val().length==0){
		$('#Join_nickname_class').removeClass('form-danger');
		$('#Join_nickname_class').removeClass('form-success');
		$('#Join_nickname_class').addClass('');
		$('#Join_nickname_mark').html(' ');
		First_Check=false;
		check_nickname=false;
	}else if($("#Join_nickname_value").val().length < 3){
		$('#Join_nickname_class').removeClass('form-success');
		$('#Join_nickname_class').addClass('form-danger');
		$('#Join_nickname_mark').html('clear');
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
					$('#Join_nickname_class').removeClass('form-success');
					$('#Join_nickname_class').addClass('form-danger');
					$('#Join_nickname_mark').html('clear');
					check_nickname=false;
				}
				else if(Check == "0"){
					$('#Join_nickname_class').removeClass('form-danger');
					$('#Join_nickname_class').addClass('form-success');
					$('#Join_nickname_mark').html('check');
					check_nickname=true;
				}
			  },
			  error:function(Check){
				  alert("에러");
			  }
		}); 
	}
	
	if(check_nickname==true &&check_height==true &&check_weight==true){
		$("#nextBtn").removeClass("btn-default");
		$("#nextBtn").addClass("btn-warning");
	}else{
		$("#nextBtn").removeClass("btn-warning");
		$("#nextBtn").addClass("btn-defalut");
	}
}

//키, 체중-----------------------------------------------------------------------------------------------------------------------------------
function Check_height(num){
	
	if(num==1){
	
		for(var i=0;i<$("#Join_height_value").val().length;i++){	
			if($("#Join_height_value").val().charAt(i) >='0' && $("#Join_height_value").val().charAt(i) <= '9'){
				if($("#Join_height_value").val().length > 1 && $("#Join_height_value").val().length < 4 ){
					$('#Join_height_class').removeClass('form-danger');
	            	$('#Join_height_class').addClass('form-success');
	            	$('#Join_height_mark').html('check');
	            	check_height=true;
				}else{
					$('#Join_height_class').removeClass('form-success');
	            	$('#Join_height_class').addClass('form-danger');
	            	$('#Join_height_mark').html('clear');
	            	
	            	check_height=false;
				}
			}else{
				$('#Join_height_class').removeClass('form-success');
	        	$('#Join_height_class').addClass('form-danger');
	        	$('#Join_height_mark').html('clear');
	        	
	        	check_height=false;
			}
		}
	
	}else{
	
		for(var i=0;i<$("#Join_weight_value").val().length;i++){	
			if($("#Join_weight_value").val().charAt(i) >='0' && $("#Join_weight_value").val().charAt(i) <= '9'){
				if($("#Join_weight_value").val().length > 1 && $("#Join_weight_value").val().length < 4 ){
					$('#Join_weight_class').removeClass('form-danger');
	            	$('#Join_weight_class').addClass('form-success');
	            	$('#Join_weight_mark').html('check');
	            	check_weight=true;
				}else{
					$('#Join_weight_class').removeClass('form-success');
	            	$('#Join_weight_class').addClass('form-danger');
	            	$('#Join_weight_mark').html('clear');
	            	
	            	check_weight=false;
				}
			}else{
				$('#Join_weight_class').removeClass('form-success');
	        	$('#Join_weight_class').addClass('form-danger');
	        	$('#Join_weight_mark').html('clear');
	        	
	        	check_weight=false;
			}
		}
	}
	
	if(check_nickname==true && check_height==true && check_weight==true){
		$("#nextBtn").removeClass("btn-default");
		$("#nextBtn").addClass("btn-warning");
	}else{
		$("#nextBtn").removeClass("btn-warning");
		$("#nextBtn").addClass("btn-defalut");
	}
}

//프로필 사진------------------------------------------------------------------------------------------------------------------------------------
$(function(){
	$("#Join_profile_main").change(function(){
		
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
		
		var form = $('joinForm')[0];
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
                
            	$("#Join_default_pic").hide();
            	$('#Join_profile_pic').after("<img class='img-circle img-raised img-responsive' src='upload/"+savefile+"' style='width:280px; height:300px' id='Join_default_pic'/>");
            	$('#Join_profile_value').val(savefile);

            },
            error : function(error) { // 실패할 경우 에러메세지 출력
                console.log(error);
                console.log(error.status);
                alert(error + ", " +error.status);
            }
        });	
		
	});
});
function info_1_menu_click(){
	$("#nextBtn").removeClass("btn-success");
	$("#nextBtn").removeClass("btn-warning");
	$("#nextBtn").removeClass("btn-default");
	$("#nextBtn").addClass("btn-default");
	$("#nextBtn").html('NEXT');
	Check_name();
	Check_jumin(1);
	Check_jumin(2);
	Check_phonenum(1);
	Check_phonenum(2);
	Check_phonenum(3);
}function info_2_menu_click(){
	$("#nextBtn").removeClass("btn-success");
	$("#nextBtn").removeClass("btn-warning");
	$("#nextBtn").removeClass("btn-default");
	$("#nextBtn").addClass("btn-default");
	$("#nextBtn").html('NEXT');
	Check_address();
}function info_3_menu_click(){
	$("#nextBtn").removeClass("btn-success");
	$("#nextBtn").removeClass("btn-warning");
	$("#nextBtn").removeClass("btn-default");
	$("#nextBtn").addClass("btn-default");
	$("#nextBtn").html('NEXT');
	Check_id();
	Check_pw(1);
	Check_pw(0);
}function info_4_menu_click(){
	$("#nextBtn").removeClass("btn-success");
	$("#nextBtn").removeClass("btn-warning");
	$("#nextBtn").removeClass("btn-default");
	$("#nextBtn").addClass("btn-default");	
	$("#nextBtn").html('NEXT');
	Check_nickname();
	Check_height(1);
	Check_height(2);
}
function info_5_menu_click(){
	$("#nextBtn").removeClass("btn-warning");
	$("#nextBtn").removeClass("btn-default");
	$("#nextBtn").addClass("btn-success");
	$("#nextBtn").html('회원가입');
}
</script>
</head>

<body>
	<div class="modal-header">
         <div align="center" style="
               margin-top: -50px; 
               padding-left: 5px; 
               margin-left: 5px; 
               background: linear-gradient(60deg, #00bcd4, #3A7598); 
               border-radius:5px; 
               box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
               height:90px;">
           <h4 id="myModalLabel" style="padding-top:20px; font-size: 30px; font-weight: bold;"><font color="white">Sign Up</font></h4>
        </div>
	</div>
	<div class="modal-body" style="height: 550px; padding-bottom: 3px">
		<div class="container">
		<div id="tabs" style="height: 480px;">
			<div class="card card-nav-tabs" style="max-width: 530px;height: 430px;">
				<div class="card-header" data-background-color="red">
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs" >
								<li class="active" id="menu_1">
									<a href="#info_1" data-toggle="tab" id="info_1_a" onclick="info_1_menu_click()">
										<i class="material-icons">fingerprint</i>
									</a>
								</li>
								<li class="" id="menu_2">
									<a href="#info_2" data-toggle="tab" id="info_2_a" onclick="info_2_menu_click()">
										<i class="material-icons">account_balance_wallet</i>
									</a>
								</li>
								<li class="" id=menu_3>
									<a href="#info_3" data-toggle="tab" id="info_3_a" onclick="info_3_menu_click()">
										<i class="material-icons">lock_open</i>
									</a>
								</li>
								<li class="" id="menu_4">
									<a href="#info_4" data-toggle="tab" id="info_4_a" onclick="info_4_menu_click()">
										<i class="material-icons">face</i>
									</a>
								</li>
								<li class="" id="menu_5">
									<a href="#info_5" data-toggle="tab" id="info_5_a" onclick="info_5_menu_click()">
										<i class="material-icons">account_circle</i>
									</a>
								</li>
							</ul>	
						</div>
					</div>
				</div>			
				<!-- 드롭다운 메뉴 -->
			
				<!-- 내용물 -->
				<form id="Join_form" onsubmit="return false;" >
					<div class="card-content">
						<div class="tab-content">
							<div class="tab-pane active" id="info_1">
								<!-- 이름 입력 -->
								<div class="form-group label-floating" id="Join_name_class">					
									<label class="control-label">이름</label>
			                    	<input class="form-control" type="text" id="Join_name_value" name="Join_name_value" onkeyup="Check_name();">
			                    	<div class="col-md-11 col-sm-11 col-xs-11"></div>
			                    	<i class="material-icons" id="Join_name_mark"></i>			
			                		<span class="material-input"></span>
			                	</div>
			                	<!-- 주민등록번호 -->
			                	<div class="col-md-5 col-sm-5 col-xs-5">
				                	<div class="form-group label-floating" id="Join_jumin1_class">					
										<label class="control-label">주민번호 앞자리</label>
				                    	<input class="form-control" type="text" id="Join_jumin1_value" name="Join_jumin1_value" maxlength="6" onkeyup="Check_jumin(1);">
				                		<span class="material-input"></span>
				                	</div>
			                	</div>
			                	<div class="col-md-1 col-sm-1 col-xs-1">
			                	<h2>-</h2>
			                	</div>
			                	<div class="col-md-6 col-sm-6 col-xs-6">
				                	<div class="form-group label-floating" id="Join_jumin2_class">					
										<label class="control-label">주민번호 뒷자리</label>
				                    	<input class="form-control" type="password" id="Join_jumin2_value" name="Join_jumin2_value" maxlength="7" onkeyup="Check_jumin(2);">
				                    	<div class="col-md-10 col-sm-10 col-xs-10"></div>
				                    	<i class="material-icons" id="Join_jumin2_mark"></i>			
				                		<span class="material-input"></span>
				                	</div>
			                	</div>
			                	
			                	<!-- 폰번호 -->
			                	<div class="col-md-12">
				                	<div class="col-md-3 col-sm-3 col-xs-3">
					                	<div class="form-group label-floating" id="Join_phonenum1_class">					
											<label class="control-label">휴대폰 번호</label>
					                    	<input class="form-control" type="text" id="Join_phonenum1_value" name="Join_phonenum1_value" maxlength="3" onkeyup="Check_phonenum(1);">
					                    	<div class="col-md-10 col-sm-10 col-xs-10"></div>
					                    	<i class="material-icons" id="Join_phonenum1_mark"></i>			
					                		<span class="material-input"></span>
					                	</div>
				                	</div>
				                	<div class="col-md-1 col-sm-1 col-xs-1">
				                	<h2>-</h2>
				                	</div>
				                	<div class="col-md-3 col-sm-3 col-xs-3">
					                	<div class="form-group label-floating" id="Join_phonenum2_class">					
											<label class="control-label"></label>
					                    	<input class="form-control" type="text" id="Join_phonenum2_value" name="Join_phonenum2_value"maxlength="4" onkeyup="Check_phonenum(2);">
					                    	<div class="col-md-10 col-sm-10 col-xs-10"></div>
					                    	<i class="material-icons" id="Join_phonenum2_mark"></i>			
					                		<span class="material-input"></span>
					                	</div>
				                	</div>
				                	<div class="col-md-1 col-sm-1 col-xs-1">
				                	<h2>-</h2>
				                	</div>
				                	<div class="col-md-4 col-sm-4 col-xs-4">
					                	<div class="form-group label-floating" id="Join_phonenum3_class">					
											<label class="control-label"></label>
					                    	<input class="form-control" type="text" id="Join_phonenum3_value" name="Join_phonenum3_value" maxlength="4" onkeyup="Check_phonenum(3);">
					                    	<div class="col-md-10 col-sm-10 col-xs-10"></div>
					                    	<i class="material-icons" id="Join_phonenum3_mark"></i>			
					                		<span class="material-input"></span>
					                	</div>
				                	</div>
			                	</div>
			                	
							</div>
							
							<div class="tab-pane" id="info_2">
							<!-- 주소 -->
								<div class="col-md-3 col-sm-3 col-xs-3">
									<div class="form-group" id="Join_address1_class">					
										<label class="control-label">우편번호</label>
				                    	<input class="form-control" type="text" id="postcode" name="postcode" readonly="readonly">
				                    	<div class="col-md-10 col-sm-10 col-xs-10"></div>
				                    	<i class="material-icons" id="Join_address1_mark"></i>			
				                		<span class="material-input"></span>
				                	</div>
								</div>
								<div class="col-md-9 col-sm-9 col-xs-9">
									<div class="form-group" id="Join_address2_class">					
										<label class="control-label">주소</label>
				                    	<input class="form-control" type="text" id="address1" name="address1" readonly="readonly">
				                    	<div class="col-md-10 col-sm-10 col-xs-10"></div>
				                    	<i class="material-icons" id="Join_address2_mark"></i>			
				                		<span class="material-input"></span>
				                	</div>
								</div>
								<div class="col-md-8 col-sm-8 col-xs-8">
									<div class="form-group label-floating" id="Join_address3_class">					
										<label class="control-label">상세주소!!</label>
				                    	<input class="form-control" type="text" id="address2" name="address2" onkeyup="Check_address();">
				                    	<div class="col-md-10 col-sm-10 col-xs-10"></div>
				                    	<i class="material-icons" id="Join_address3_mark"></i>			
				                		<span class="material-input"></span>
				                	</div>
								</div>
								<div class="col-md-4 col-sm-4 col-xs-4">
									<input type="button" class="btn btn-danger" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-top: 12px;" id="Join_address_btn">
								</div>
								
							<!-- 이메일 -->	
								<div class="col-md-8 col-sm-8 col-xs-8">
									<div class="form-group label-floating" id="Join_email_class">
						                <label class="control-label">E-mail</label>
						                <input type="email" name="Join_email_value" id="Join_email_value"  class="form-control" />
						            </div>
						        </div>
						        <div class="col-md-4 col-sm-4 col-xs-4" style="margin-top: 10px;">
										<input type="button" class="btn btn-danger" id="Join_email_btn"value="인증 요청" onclick="Check_email_1();"/>
					            </div>
							</div>
							<div class="tab-pane" id="info_3">
								<div class="form-group label-floating" id="Join_id_class">					
									<label class="control-label">아이디</label>
			                    	<input class="form-control" type="text" id="Join_id_value" name="Join_id_value" onkeyup="Check_id();">
			                    	<div class="col-md-11 col-sm-11 col-xs-11"></div>
			                    	<i class="material-icons" id="Join_id_mark"></i>			
			                		<span class="material-input"></span>
			                	</div>
			                	<div class="form-group label-floating" id="Join_pw_class">					
									<label class="control-label">비밀번호</label>
			                    	<input class="form-control" type="password" id="Join_pw_value" name="Join_pw_value" onkeyup="Check_pw(1);">
			                    	<div class="col-md-11 col-sm-11 col-xs-11"></div>
			                    	<i class="material-icons" id="Join_pw_mark"></i>		
			                		<span class="material-input"></span>
			                	</div>
			                	<div class="form-group label-floating" id="Join_pw2_class">					
									<label class="control-label ">비밀번호 확인</label>
			                    	<input class="form-control" type="password" id="Join_pw2_value" name="Join_pw2_value" onkeyup="Check_pw(0);">
			                    	<div class="col-md-11 col-sm-11 col-xs-11"></div>
			                    	<i class="material-icons" id="Join_pw2_mark"></i>			
			                		<span class="material-input"></span>
			                	</div>
							</div>
							<!-- 4번째 창 -->
							<div class="tab-pane" id="info_4">
								<!-- 닉네임 -->
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="form-group label-floating" id="Join_nickname_class">					
										<label class="control-label">NICKNAME</label>
				                    	<input class="form-control" type="text" id="Join_nickname_value" name="Join_nickname_value" onkeyup="Check_nickname();">
				                    	<div class="col-md-11 col-sm-11 col-xs-11"></div>
				                    	<i class="material-icons" id="Join_nickname_mark"></i>
				                    	<span class="material-input"></span>
				                	</div>
			                	</div>
			                	<!-- 신장 -->
			                	<div class="col-md-5 col-sm-5 col-xs-5">
				                	<div class="form-group label-floating" id="Join_height_class">					
										<label class="control-label">키!!</label>
				                    	<input class="form-control" type="text" id="Join_height_value" name="Join_height_value" onkeyup="Check_height(1);">
				                    	<div class="col-md-11 col-sm-11 col-xs-11"></div>
				                    	<i class="material-icons" id="Join_height_mark"></i>			
				                		<span class="material-input"></span>
				                	</div>
			                	</div>
			                	<div class="col-md-1 col-sm-1 col-xs-1" style="margin-top: 40px;">
			                	cm
			                	</div>
			                	
			                	<!-- 체중 -->
				                <div class="col-md-5 col-sm-5 col-xs-5">
				                	<div class="form-group label-floating" id="Join_weight_class">					
										<label class="control-label">몸무게</label>
				                    	<input class="form-control" type="text" id="Join_weight_value" name="Join_weight_value" onkeyup="Check_height(2);">
				                    	<div class="col-md-11 col-sm-11 col-xs-11"></div>
				                    	<i class="material-icons" id="Join_weight_mark"></i>			
				                		<span class="material-input"></span>
				                	</div>
			                	</div>
			                	<div class="col-md-1 col-sm-1 col-xs-1" style="margin-top: 40px;">
			                	kg
			                	</div>
			                	
			                </div>
							<div class="tab-pane" id="info_5">
								<div class="form-group" id="divPhoto">
									<div class="col-md-5 col-sm-5 col-xs-5" style= "padding-top: 115px;">
										<input class="form-control" type="text" id="Join_profile_value" name="Join_profile_value" readonly="readonly" placeholder="사진을 선택하세요.">
										<button class="btn btn-info">
											<input type="file"  name="Join_profile_main" id="Join_profile_main">
											찾아보기
										</button>
										<div id="Join_delete_pic"></div>
									</div>
									
									<div class="col-md-7 col-sm-7 col-xs-7" style="height:295px;">
										<div id="Join_profile_pic">
										</div>
										<img class="img-circle img-raised img-responsive" src="upload/Test.jpg" style="width:280px; height:300px" id="Join_default_pic"/>
									</div>
					            </div>
							</div>
						</div>
					</div>
					
			</form>
			
				
			</div>
		</div>
		</div>
		<div class="modal-footer" style="margin-top: -15px;">
			<button class="btn btn-default" id="nextBtn" data-toggle="popover" data-placement="top" data-content="" onclick="Click_infoBtn();">NEXT</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>
</body>
</html>