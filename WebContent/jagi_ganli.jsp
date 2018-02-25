<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!--
  Material Design Lite
  Copyright 2015 Google Inc. All rights reserved.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License
-->

<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>22세기 운동혁명</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
  </head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
  
<body>
<script type="text/javascript">

$(function(){
	 
	  
	
	//광고 띄우기
	$('#myModal1').modal('show');
	$(document.body).on('hidden.bs.modal', function () {

		$('#myModal1').empty();
	});

	
	
		
})


function jagi_ganli_iframe( url,id){
		var index='${index}';
		var id=id;
		
	$("#jagi_ganli_plan_iframe").attr('src',""+url);
	
	
	
	
	//이미지 클릭-> 유투브 영상 바뀜, 조회수 처리
	
	  $.ajax({
		  url:"jagi_ganli_plan_upcount_list.do",
		  dataType:'html',
		  data:{index:index,
			  id:id},
		  type:'post',
		  success:function(data){
			  $("#jagi_ganli_plan_fieldset4").empty();
			  $("#jagi_ganli_plan_fieldset4").html(data);
		  },
		  error:function(data){
			  alert("에러");
		  }
		  
	  });//end ajax
	
   var Currentyear=new Date().getFullYear();
	  var Currentmonth=new Date().getMonth()+1;
	 var CurrentDay=new Date().getDate();
	 
	 
	 //현재 날짜 , 아이디 , 운동 카테고리 받아서
	 //그에 따른 운동 해당 운동메뉴 선택되게함 (top_selected.jsp 구현을 위함)
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
	    
	  
	
	
}//end function







</script>

<jsp:include page="side.jsp">
<jsp:param value="jagi_ganli" name="selectMenu"/>
</jsp:include>
 <div class="main-panel">
            <jsp:include page="top.jsp"></jsp:include>
            <div class="content">

<!--    <div class="container col-sm-12" id="jagi_ganli_top_bar_div">
      <div class="col-md-12">
        <img src="image_jagi/jagi_logo_2.png" alt="placeholder 960" class="img-responsive" style="height: 400px;" />
      </div>
    </div>
 -->


<div class="content">
                <div class="container-fluid">
                    <div class="card">
                    <!--  로고 -->
                        <div class="card-header" data-background-color="orange">
                           <img src="image_jagi/jagi_logo.png" alt="placeholder 960" class="img-responsive" style="height: 400px;" />
     					</div>
                        
                        
                        
                        <div class="card-content">
                            <div class="row">
                                <div class="col-md-12">
                                
							                   <!--  운동 카테고리 선택 -->             
							<div id="jagi_ganli_top_fieldset3"  class="col-md-12" style="margin: 0 auto;">
							<jsp:include page="jagi_ganli_top.jsp"></jsp:include>
							</div>
							                                
                                </div>
                               
                        </div>
                    </div>
                </div>
            </div>
            	





<!--  달력 들어갈것임  jagi_ganli_top_selected-->
			<div class="content">
                <div class="container-fluid">
			 	<div class="card">
				<div id="jagi_ganli_fieldset2"  style="margin: 0 auto;">
				 </div>
			</div>
		
		
		<!--  운동 메뉴들 -->
				<div class="row">
				<div id="jagi_ganli_plan_fieldset4"  style="margin: 0 auto;">
				<jsp:include page="jagi_ganli_plan.jsp"></jsp:include>
				
				</div>
				</div>



</div>





<!--  modal -->




  <!-- Modal -->
  <div class="modal fade" id="myModal1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
              
                        
                        <div class="row">
                         <nav class="navbar navbar-inverse bg-primary"  style="width:94%; margin-left:3%; background-color: #CA3515;">
					  <a class="navbar-brand" href="#"> <h4 class="title">
					  <!-- If you  want to learn other Exercise , Let's choice Our Home menu  -->
					  다른 운동을 원하시면 메뉴를 선택하시오.
					  </h4></a>
						</nav>
					    
                         </div>
                         <div class="row">
                             <fieldset class="col-md-12 " style="margin-top:-2%; background-color: #CCC6C4; position: fixed;">
    
         			<iframe  id="a" class="col-md-12 embed-responsive-item"
					src="https://www.youtube.com/embed/DaANv8I1vAQ?autoplay=1" width="110%" height="500px" frameBorder="0" style="margin-top:-20%; position:absolute; margin: auto 0;">
					
					<!-- https://www.youtube.com/embed/x6VmzcGi6l8?autoplay=1
					 https://www.youtube.com/embed/9-qxas4fb4o?autoplay=1
					 https://www.youtube.com/embed/phS_tGsRO-Y
					 https://www.youtube.com/embed/DaANv8I1vAQ
					 -->
				</iframe>
				</fieldset>
			 		</div>
     			 </div>
    		</div>
    
    
    <div class="modal fade" id="myModal2" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      
        <div class="row">
                         <nav class="navbar navbar-inverse bg-primary"  style="width:94%; margin-left:3%; background-color: #CA3515;">
					  <a class="navbar-brand" href="#"> <h4 class="title">
					  <!-- If you  want to learn other Exercise , Let's choice Our Home menu  -->
					  다른 운동을 원하시면 메뉴를 선택하시오.
					  </h4></a>
						</nav>
					    
                         </div>
              
                        <div class="container">
                     <div id="inner1">
                     
                     </div>
					    
                         </div>
			 	
     			 </div>
    		</div>
    
    
    
    
    
    
    
  </div>
  


</div>





  Core JS Files  
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets	/js/material.min.js" type="text/javascript"></script>
	 Charts Plugin
	<script src="assets/js/chartist.min.js"></script>
	 Dynamic Elements plugin
	<script src="assets/js/arrive.min.js"></script>
	 PerfectScrollbar Library
	<script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
	 Notifications Plugin   
	<script src="assets/js/bootstrap-notify.js"></script>
	 Google Maps Plugin   
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	Material Dashboard javascript methods
	<script src="assets/js/material-dashboard.js?v=1.2.0"></script>
	Material Dashboard DEMO methods, don't include it in your project!
	<script src="assets/js/demo.js"></script>
 
</body>
</html>