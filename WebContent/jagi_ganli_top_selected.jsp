<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Introducing Lollipop, a sweet new take on Android.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Android</title>

    <!--  page styles  --> 
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.min.css">
    <link rel="stylesheet" href="styles.css">
    
    
   <meta charset="utf-8">

  <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>


  <style>
  .error-notice {
  margin: 5px 5px; /* Making sure to keep some distance from all side */
}

.oaerror {
  width: 90%; /* Configure it fit in your design  */
  margin: 0 auto; /* Centering Stuff */
  background-color: #FFFFFF; /* Default background */
  padding: 20px;
  border: 1px solid #eee;
  border-left-width: 5px;
  border-radius: 3px;
  margin: 0 auto;
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
}

.danger {
  border-left-color: #d9534f; /* Left side border color */
  background-color: rgba(217, 83, 79, 0.1); /* Same color as the left border with reduced alpha to 0.1 */
}

.danger strong {
  color:  #d9534f;
}

.warning {
  border-left-color: #f0ad4e;
  background-color: rgba(240, 173, 78, 0.1);
}

.warning strong {
  color: #f0ad4e;
}

.info {
  border-left-color: #5bc0de;
  background-color: rgba(91, 192, 222, 0.1);
}

.info strong {
  color: #5bc0de;
}

.success {
  border-left-color: #2b542c;
  background-color: rgba(43, 84, 44, 0.1);
}

.success strong {
  color: #2b542c;
}
  
  
  
         #jagi_ganli_selected_body {
      line-height: 1;
      margin: 50px;
    }
    #jagi_ganli_selected_div {
      background: rgba(0, 0, 0, .1);
      border-radius: 5px;
      box-sizing: border-box;
      padding: 15px;
      width: 430px;
    }
    #jagi_ganli_selected_header {
      overflow: clear;
      position: relative;
    }
    #jagi_ganli_selected_h2 {
      font-family: 'PT Sans Narrow', sans-serif;
      font-size: 18px;
      font-weight: 700;
      margin: 0 0 10px;
      
      text-align: center;
    }
    .jagi_ganli_selected_button {
      position: absolute;
      top: -4px;
      margin-top: 20px;
     
      
    }
    .jagi_ganli_selected_button:first-child {
      left: 0;
    }
    .jagi_ganli_selected_button:last-child {
      right: 0;
    }
    #jagi_ganli_selected_table {
      background: #fff;
      border-collapse: collapse;
      color: #222;
      font-family: 'PT Sans', sans-serif;
      font-size: 13px;
      width:400px;
      height: 350px;
    }
    #jagi_ganli_selected_table td {
      border: 1px solid #ccc;
      color: #444;
      line-height: 22px;
      text-align: center;
    }
    #jagi_ganli_selected_table tr:first-child #jagi_ganli_selected_table td {
      color: #222;
      font-weight: 700;
    }
    .selected {
      background: #f0951d;
      border: 0;
      box-shadow: 0 2px 6px rgba(0, 0, 0, .5) inset;
    }
  </style>

 </head>
    
    
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body id="jagi_ganli_selected_body">
<script type="text/javascript">


$(function(){
	var regdates=new Array();

// 운동 선택 항목 추가하는 기능
  $("input[name='jagi_ganli_selected_select']").click(function(){
	  
	
	  //날짜 제대로 선택 안했을떄 제어
if(regdates.length==0){
  $("#JGTS_modal_Content_img").html("<img src='images/sorry2.png' >");
  $("#JGTS_modal_Content_con").html(" <h3 style='float:left; '>날짜 선택해 주세요</h3>");
	$("#JGTS_modal").modal('show');
	
  
	return false;
}else if($("#user_excercise_plan_specific").val()==null
		|| $("#user_excercise_plan_specific").val()==""
		|| $("#user_excercise_plan_specific").val()==" "){

	$("#JGTS_modal_Content_img").html("<img src='images/sorry2.png' >");
	  $("#JGTS_modal_Content_con").html(" <h3 style='float:left; '>구체적인 계획을 입력하시오</h3>");
		$("#JGTS_modal").modal('show');
		
	return false;
}

	  //운동 정보들 form 형태로 생성
	  var x=$("input[name='my_category_img']").val();
		
	  $("input[name='regdates']").val(regdates);
	var form=$("#ganli_form").serialize();
	form+="&my_category_img="+x;
	form+="&exercise_cate_menu=${theme}";
	




  //user_Excercise_plan 테이블에 기록 추가하기위 한 메서드,
	$.ajax({  
			  type: $("#ganli_form").attr('method'),
	           url: $("#ganli_form").attr('action'),
	           data: form,
	           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	           dataType:'html',
	           async:true,
	           success: function(data)
	           {
	        	//   $("#JGTS_modal_body").html(data);
	        		 
				if(data!=""){   
	        	
	        		   $("#JGTS_modal_Content_img").html("<img src='images/sorry2.png' >");
	        		   $("#JGTS_modal_Content_con").html(" <h3 style='float:left; '>"+data+" 날짜에  더 이상 메뉴를 신청할 수 없습니다.</h3>");
	        		   
						$(function(){
							$.noConflict();
							$("#JGTS_modal").modal('show');
						})		
	        	   }else{  
	        		   alert("신청이 완료되었습니다.");
	        		   $("#jagi_ganli_fieldset2").empty();
	        	   
	        	   }
	           },
	           error:function(data){
	        	   alert("에러");
	           }
	           });
	  
  });
$("input[name='jagi_ganli_selected_cancel']").click(function(){

$("#jagi_ganli_fieldset2").empty();
return false;

});
 
//달력 오른쪽 버튼 눌럿을떄 이벤트
$("#jagi_ganli_selected_button_right").click(function(){
	 var Currentyear=${year};
	  var Currentmonth=${month+1};
	  var id=${ganli_id};
	  var index=${index};
	 	
	  if(Currentmonth>12){
		  Currentmonth=1;
		  Currentyear+=1;
		  
	  }
	  
	 var CurrentDay=new Date().getDate();
	 $.ajax({
		  url:"jagi_ganli_plan_cal_input.do",
		  dataType:'html',
		  data:{
			  year:Currentyear,
			  month:Currentmonth,
			  day:CurrentDay,
			  id:id,
			  index:index
			 },
		  type:'post',
		  success:function(data){
			  $("#jagi_ganli_fieldset2").empty();
			  $("#jagi_ganli_fieldset2").html(data);
			  
		  },
		  error:function(data){
			  alert("에러");
		  }
		  
	  });//end ajax
	  
	  
});//end right button

//왼쪽 버튼 클릭시 해당년도 해당 월보다 값이 작다면 뒤로 값우 업음
$("#jagi_ganli_selected_button_left").click(function(){
	
	var Currentyear=${year};
	  var Currentmonth=${month-1};
	 var realYear=new Date().getFullYear();
	 var realMonth=new Date().getMonth()+1;
	  var id=${ganli_id};
	 	var index=${index};
	 	
	  if(Currentmonth<1){
		 Currentmonth=12;
		 Currentyear-=1;
	}
	 
		if( Currentyear<realYear ){
			$("#JGTS_modal_Content_img").html("<img src='images/sorry2.png' >");
			  $("#JGTS_modal_Content_con").html(" <h3 style='float:left; '>지난 날짜는 선택할수 없습니다.</h3>");
				$("#JGTS_modal").modal('show');
				
			return "";
		}else if(Currentmonth<realMonth){
			$("#JGTS_modal_Content_img").html("<img src='images/sorry2.png' >");
			  $("#JGTS_modal_Content_con").html(" <h3 style='float:left; '>지난 날짜는 선택할수 없습니다.</h3>");
				$("#JGTS_modal").modal('show');
			return "";
		}
	 
	 
	 var CurrentDay=new Date().getDate();
	 $.ajax({
		  url:"jagi_ganli_plan_cal_input.do",
		  dataType:'html',
		  data:{
			  year:Currentyear,
			  month:Currentmonth,
			  day:CurrentDay,
			  id:id,
			  index:index
			 },
		  type:'post',
		  success:function(data){
			  $("#jagi_ganli_fieldset2").empty();
			  $("#jagi_ganli_fieldset2").html(data);
		  },
		  error:function(data){
			  alert("에러");
		  }
		  
	  });//end ajax
	
	
	
	
	
	
});
 
 
 
//달력 갖다대면 색깔 바낌 ,현재날짜보다 작은 날짜는 선택이 안됨
$("#jagi_ganli_selected_table td").click(function(){
	var tdindx=$("#jagi_ganli_selected_table td").index(this);
	var day=$("#jagi_ganli_selected_table td").eq(tdindx).html();
	var Currentyear=${year};   //달력에 표시된년도
	  var Currentmonth=${month}; //달력 클릭된 month
	  var realYear=new Date().getFullYear();//표준 년도
		 var realMonth=new Date().getMonth()+1;//표준 월
		 var realDay=new Date().getDate();//표준 일
		
		 var regd=Currentyear+"-"+Currentmonth+"-"+day;
	if(day!=""){//빈 칸을 클릭하지 않을떄 이벤트 발생
		
		//표시년도 = 지금 년도 ,표시월 = 지금월 같을때 
		//클릭한 일  < 현재 일 일떄 ㅁhover 안시키게함
		if( Currentyear==realYear && Currentmonth==realMonth && day<realDay ){
			
			//여기는 진짜 년도,월 , 요일인데 그거보다 작은값드릉 ㄴ선택안됨
		}else{
			
		if($("#jagi_ganli_selected_table td").eq(tdindx).css("background-color")=='rgba(0, 0, 0, 0)'){	
			
			
			$("#jagi_ganli_selected_table td").eq(tdindx).css("background-color","#E1FDFC");
			$("#jagi_ganli_selected_table td").eq(tdindx).css("color","white");
		 	regdates.push(regd);
		 
		
		}else{
			$("#jagi_ganli_selected_table td").eq(tdindx).css("background-color",'rgba(0, 0, 0, 0)');
			$("#jagi_ganli_selected_table td").eq(tdindx).css("color","black");
			//td가 하얀 화면 됫을때 제거
		 for( var i=0; i<regdates.length; i++){
			 if(regdates[i]==regd){
				 regdates.splice(i,1);
			 }
		}//ㄷend for i 두번 클릭시 날짜 제거
		 
		 
		 	
		}
		
		 
		 }
		
		
	}
	  
	
	
	
});


})

</script>



<div class=""  id="jagi_ganli_selected_fieldset" style=" width: 100%;  margin-top: 30px;">
<div class="row col-centered">

<div class="col-md-1 col-sm-1">
</div>
<div  class="col-md-4  col-sm-4 col-sm-offset-1 col-md-offset-1 alert alert-info" style="width: 20vw;" id="jagi_ganli_selected_div">
  <header id="jagi_ganli_selected_header" style="vertical-align: middle;" >
    <button class="jagi_ganli_selected_button" id="jagi_ganli_selected_button_left">«</button>
    <h2 id="jagi_ganli_selected_h2" > ${year }년 ${month }월</h2>
    <!--  우치 클릭시 해당 달력이랑 ,년 월 변하게 하기 -->
    <button class="jagi_ganli_selected_button"  id="jagi_ganli_selected_button_right">»</button>
  </header>
<table id="jagi_ganli_selected_table" class="table table-responsive" style="width:100%; height:400px;" >
  <tr>
<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
  </tr>
       <c:forEach items="${cal }" var="row" varStatus="status">
				<tr>
				<c:forEach items="${row }" var="re" varStatus="status1">
				<td>${re }</td>
				</c:forEach>
				</tr>
				</c:forEach>
</table>
</div>




<c:forEach items="${list }" var="re" varStatus="status">
<!--  사용자 정보및 그림 정보들 출력 -->
<div class="col-sm-4 col-md-4 col-sm-offset-1 col-md-offset-1 " style="width:30vw; height:400px;">

<table class="table" id="jagi_ganli_plan_table" style="vertical-align: middle; width:30vw; height:400px;">
	
	<tr>
	<td class="card"   style="clear: left; padding: 60px; background-color:#BDBDBD;  width:25vw; height: 400px;"   > 
	<img src="image_jagi/${folder }${re.category_filename }"   
		style="vertical-align: middle; margin-top:-30px;max-height:330px; height:330px;  width: 100%;">
		<input type="hidden" name="my_category_img" value="image_jagi/${folder }${re.category_filename }">
	<b style="font-size:0.8rem;">${re.category_name }<br/>
	${re.time } Time ${re.count+1 } Views<br/>
	</b>
	</td>
	
	</tr>
	
	</table>
 </div>
 </div>
 </div>
 <br/><br/>
 
 <!--	회원 로그인 정보
		 "Id"   
         
         
         "Level"
        "Nickname"
         "Height"
         "Weight"
       -->
 
 <div class="row">
<form role="form" method="post"  id="ganli_form"  action="jagi_ganli_insert.do" >
<div class="col-md-1 col-sm-1"></div>
 <div class="col-md-3 col-md-offset-1 well col-sm-3 col-sm-offset-1"   >

	<div class="error-notice" >
          <div class="oaerror danger" style="height:70px; font-size: 0.8vw;">
            <strong>회원 아디</strong> - ${sessionScope.Id }
            <input type="hidden" name="userId" class="form-control" value='${sessionScope.Id }' />
		
          </div>
          <div class="oaerror warning" style="height:70px;font-size: 0.8vw;">
            <strong>운동명</strong> - ${re.category_name }
            <input type="hidden" name="excercise_name" class="form-control" value='${re.category_name }' />
	
          </div>
          <div class="oaerror info" style="height:70px;font-size: 0.8vw;">
            <strong>소모칼로리(시간)</strong> - ${re.calorie*30 }Kcal
            <input type="hidden" name="calorie" class="form-control" value='${re.calorie }' />
          </div>
          <div class="oaerror success" style="height:70px;font-size: 0.8vw;">
            <strong>키</strong> - ${sessionScope.Height }cm
            <input type="hidden" name="height" class="form-control" value='${sessionScope.Height }' />
          </div>
          <div class="oaerror success" style="height:70px;font-size: 0.8vw;">
            <strong>몸무게</strong> - ${sessionScope.Weight }Kg
           	<input type="hidden" name="weight" class="form-control" value='${sessionScope.Weight }' />
			<input type="hidden" name="regdates" class="form-control"  />
	
          </div>
            <div class="oaerror info" style="height:150px;font-size: 0.8vw;">
            <strong>운동횟수</strong> 
          <select class = "form-control" name="count">
         <option value = "1">1회</option>
         <option value = "2">2회</option>
         <option value = "3">3회</option>
        </select>
      
          </div>
        </div>


	 </div>
	<!--  운동계획 세우기 -->
	<div class="col-md-1"></div>
 <div class="col-md-4 col-sm-4 well">
 <div class="panel-group">
  <div class="panel panel-default">
   <div class="panel-heading text-center" style="font-weight: bolder;">구체적인 운동계획</div>
    <textarea class="form-control" name="exercise_comment"  id="user_excercise_plan_specific" style="height: 400px;">
 </textarea>
  
  </div>
   	<input type="button" class="btn btn-info" name="jagi_ganli_selected_select" value="선택">
	  <input type="button" class="btn btn-info" name="jagi_ganli_selected_cancel" value="취소">
  </div>
  </div>

</form>
</c:forEach>


    
</div>


<div class="row">


	<div class="modal fade" id="JGTS_modal" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog ">
    
      <!-- Modal content-->
   
      			<div class="col-md-12 alert alert-info">
                            <h4>매일 매일 이벤트</h4>
                                
           				</div>
                         
      					<div  class="container-fluid" style="background-color: white;">
      					<div class="col-md-12 content"  align="center" >
             			
                         <div id="JGTS_modal_Content">
                         <div class="col-md-4" id="JGTS_modal_Content_img" >
                         </div>
                         <div class="col-md-8" id="JGTS_modal_Content_con">
                         </div>
                         
                         
                         </div>
                         
         				</div>        
                   
                     
       </div> 		
      </div>
			 	
  
</div>
    





</div>



</body>
</html>