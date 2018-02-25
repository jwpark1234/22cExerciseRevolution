<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>

  </head>
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <!-- Ignite UI Required Combined JavaScript Files -->

    <style type="text/css">
        td { vertical-align: top; }
     
   .timeline {
  list-style: none;
  padding: 20px 0 20px;
  position: relative;
}
.timeline:before {
  top: 0;
  bottom: 0;
  position: absolute;
  content: " ";
  width: 3px;
  background-color: #eeeeee;
  left: 25px;
  margin-right: -1.5px;
}
.timeline > li {
  margin-bottom: 20px;
  position: relative;
}
.timeline > li:before,
.timeline > li:after {
  content: " ";
  display: table;
}
.timeline > li:after {
  clear: both;
}
.timeline > li:before,
.timeline > li:after {
  content: " ";
  display: table;
}
.timeline > li:after {
  clear: both;
}
.timeline > li > .timeline-panel {
  width: calc( 100% - 75px );
  float: right;
  border: 1px solid #d4d4d4;
  border-radius: 2px;
  padding: 20px;
  position: relative;
  -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}
.timeline > li > .timeline-panel:before {
  position: absolute;
  top: 26px;
  left: -15px;
  display: inline-block;
  border-top: 15px solid transparent;
  border-right: 15px solid #ccc;
  border-left: 0 solid #ccc;
  border-bottom: 15px solid transparent;
  content: " ";
}
.timeline > li > .timeline-panel:after {
  position: absolute;
  top: 27px;
  left: -14px;
  display: inline-block;
  border-top: 14px solid transparent;
  border-right: 14px solid #fff;
  border-left: 0 solid #fff;
  border-bottom: 14px solid transparent;
  content: " ";
}
.timeline > li > .timeline-badge {
  color: #fff;
  width: 50px;
  height: 50px;
  line-height: 50px;
  font-size: 1.4em;
  text-align: center;
  position: absolute;
  top: 16px;
  left: 0px;
  margin-right: -25px;
  background-color: #999999;
  z-index: 100;
  border-top-right-radius: 50%;
  border-top-left-radius: 50%;
  border-bottom-right-radius: 50%;
  border-bottom-left-radius: 50%;
}
.timeline > li.timeline-inverted > .timeline-panel {
  float: left;
}
.timeline > li.timeline-inverted > .timeline-panel:before {
  border-right-width: 0;
  border-left-width: 15px;
  right: -15px;
  left: auto;
}
.timeline > li.timeline-inverted > .timeline-panel:after {
  border-right-width: 0;
  border-left-width: 14px;
  right: -14px;
  left: auto;
}
.timeline-badge.primary {
  background-color: #2e6da4 !important;
}
.timeline-badge.success {
  background-color: #3f903f !important;
}
.timeline-badge.warning {
  background-color: #f0ad4e !important;
}
.timeline-badge.danger {
  background-color: #d9534f !important;
}
.timeline-badge.info {
  background-color: #5bc0de !important;
}
.timeline-title {
  margin-top: 0;
  color: inherit;
  cursor:pointer;
}
.timeline-body > p,
.timeline-body > ul {
  margin-bottom: 0;
}
.timeline-body > p + p {
  margin-top: 5px;
}
.timeline-body {
    display: none;
} 
    
    </style>
    
   
<!-- Resources -->
<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
   
   <!-- Resources -->
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
   
   
</head>



<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js" charset="utf-8"></script>
  
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
  
<body>
<!--  Myself_ganli_planAction 을통해 처음엔 값이 들어가는데   여러번 클릭시 안드감,,-->
<script type="text/javascript">
$(function(){
	
	$('#myModal1').modal('show');
	$(document.body).on('hidden.bs.modal', function () {

		$('#myModal1').empty();
	});

	
})

var calorie=new Array();
var count=new Array();
var dayx=new Array();
var exercise=new Array();
var totalCount=0;
var chart=null;
//표준체중
var normalWeight=${(sessionScope.Height-100)*0.9}; //표준 체중
//감량해야할 체중
var varWeight=(parseFloat('${sessionScope.Height}')-normalWeight);   //ex 8kg

//요구 칼로리
var requestCal=parseFloat(varWeight/(0.001),2);

//8kg 빼기까지 총 남은 시간

var wantTime=parseFloat(requestCal/parseFloat('${mean_calorie_count.dayMeanCalorie/mean_calorie_count.dayMeanTime }')).toFixed(2);

//내가 평균 시간만큼 한다면 걸리는 날짜

var meanWantTime=parseFloat(wantTime/parseFloat('${mean_calorie_count.dayMeanTime}')).toFixed(2);



	$(function(){
		$(".normalW").append(normalWeight+"Kg");
		$(".goalW").append(wantTime+"일/(시)");
		$(".goalWW").append(meanWantTime+"일/(시)");
			
		
	})
	

// 7만: x=n시간:1시간
//   9kcal=0.001	
//칼로리에 가중치 3 0부여
//1kcal =0.00
//1루에 176 == 0.00014*176
//1:x=0.00014:8
//x=8/0.00014
//요구칼로리=(감소해야할 체중)/(default체중)
//약 7만칼로리 
//한시간 쓰는 칼로리
</script>
   
   <c:forEach items="${myself }" var="re">
    <script type="text/javascript">
    //값으은 있는데 2번쨰 클릭부터 값이 안드감.
    calorie.push('${re.dayCalorie}');
    dayx.push('${re.regdate}');
    </script>
    </c:forEach>
	
	<c:forEach items="${myself_exercise_name_count }" var="enc">
	<script type="text/javascript">
	
	exercise.push('${enc.excercise_name}');
	count.push('${enc.exercise_count}');
	totalCount+=parseInt('${enc.exercise_count}');
	</script>
    </c:forEach>
   
   
   <script type="text/javascript">
   

 
   	
   	$(".normalW").append(normalWeight+"Kg");
   	$(".goalW").append(wantTime+"일/(시)");
   	$(".goalWW").append(meanWantTime+"일/(시)");
   	
   /// armchart
   
   	var calDay=new Array();
	
	var color=["#FF0F00","#FF6600","#FF9E01","#FCD202","#F8FF01","#B0DE09",
	           "#04D215","#0D8ECF","#0D52D1","#2A0CD0","#8A0CCF","#CD0D74","#754DEB","#DDDDDD","#999999",
	           "#333333", "#000000"];
	
	
		for(var i=0; i<dayx.length;i++){
			calDay.push({"날짜":dayx[i] , "칼로리":parseInt(calorie[i]) , "color" : color[i]});
		}
	
	
	
	///////////////////////////////////////////////

		var chart = AmCharts.makeChart("chartdiv", {
    "theme": "light",
    "type": "serial",
	"startDuration": 2,
    "dataProvider": calDay,
    "valueAxes": [{
        "position": "left",
        "title": "칼로리(Kcal)"
    }],
    "graphs": [{
        "balloonText": "[[category]]: <b>[[value]]</b>",
        "fillColorsField": "color",
        "fillAlphas": 1,
        "lineAlpha": 0.1,
        "type": "column",
        "valueField": "칼로리"
    }],
    "depth3D": 20,
	"angle": 30,
    "chartCursor": {
        "categoryBalloonEnabled": false,
        "cursorAlpha": 0,
        "zoomable": false
    },
    "categoryField": "날짜",
    "categoryAxis": {
        "gridPosition": "start",
        "labelRotation": 0
    },
    "export": {
    	"enabled": true
     }

});
	 
	//////  doughnut chart
	
	/* exercise.push
	count.push
	totalCount;
	 */
	 
	 var calDay2=new Array();

		for(var i=0; i<dayx.length;i++){
			calDay2.push({"운동이름":exercise[i] , "운동시간":parseInt(count[i]) , "color" : color[i]});
		}
	
	
	
	
	
	
	var chart = AmCharts.makeChart( "chartdiv1", {
  "type": "pie",
  "theme": "light",
  "titles": [ {
    "text": "운동시간 및 운동명",
    "size": 16
  } ],
  "dataProvider": calDay2,
  "valueField": "운동시간",
  "titleField": "운동이름",
  "startEffect": "elastic",
  "startDuration": 2,
  "labelRadius": 15,
  "innerRadius": "50%",
  "depth3D": 10,
  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
  "angle": 15,
  "export": {
    "enabled": true
  }
});
	
   
   </script>
   
   <jsp:include page="side.jsp">
   <jsp:param value="myself_ganli" name="selectMenu"/>
   </jsp:include>
 <div class="main-panel">
            <jsp:include page="top.jsp"></jsp:include>
            <div class="content">
   				        <div class="alert alert-info" >
                           <img src="image_jagi/health_logo.png" alt="placeholder 960" class="img-responsive" style="height: 400px;" />
     					</div>
     					
     			        
  
    
    <div class="row ">
    <div class="container-fluid" align="center">
 <div class="col-md-3 well ">
 
 <div class="card well">
   <img class="card-img-top" src="upload/${user1.member_pic }" alt="Card image cap" width="100px" height="100px">
   <div class="card-block">
  <p class="h3 text-center">주 소</p>
    <p class="card-text text-center">
${fn:replace(user1.address,'%',' ') }
</p>
  </div>
  <ul class="list-group list-group-flush " >
   <li class="list-group-item list-group-item-info ">
   <p class="h4 text-center">닉네임</p></li>
    <li class="list-group-item">
    <p class="h4 text-center">
    ${user1.nickname }</p></li>
    <li class="list-group-item list-group-item-info"><p class="h4 text-center">신 장</p></li>
    <li class="list-group-item">
 	<p class="h4 text-center"> ${user1.height }</p></li>
    <li class="list-group-item list-group-item-info"><p class="h4 text-center">체 중</p></li>
    <li class="list-group-item">
 	<p class="h4 text-center">${user1.weight }</p></li>
  </ul>
  <div class="card-block">
   <p class="h4 text-center" style="background-color: #CBE9F3;"> 이메일</p>
 
   <p class="h4 text-center" > 
	${user1.email }</p><br/>

 <p class="h4 text-center" style="background-color: #CBE9F3;">전화번호</p>
 
 <p class="h4 text-center" >
 ${user1.phonenum }</p>
    </div>
</div>
    </div>
    
      <div class="col-md-9	 well" >
      
       <ul class="timeline">
        <li>
          <div class="timeline-badge warning"><i class="material-icons">credit_card</i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">현재 운동 성과</h4>
            </div>
            <div class="timeline-body">
             <p><strong>하루 평균 운동량 : </strong> ${mean_calorie_count.dayMeanCalorie } Kcal</p>
			  <p><strong>평균 운동시간 : </strong> ${mean_calorie_count.dayMeanTime } 시</p>
			  <p><strong>평균 한시간 운동량 : </strong><fmt:formatNumber 
			  value="${mean_calorie_count.dayMeanCalorie/mean_calorie_count.dayMeanTime }" pattern=".0"/> Kcal</p>
			  <p ><strong class="normalW">표준 체중 :</strong></p>
			 	</div>
          </div>
        </li>
        
        <li>
          <div class="timeline-badge "><i class="material-icons">face</i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">목표 체중 감량 기간</h4>
            </div>
            <div class="timeline-body">
              ${sessionScope.Id } 님의 표준 체중: <strong class="normalW"> </strong> 이며 현재 체중은 ${sessionScope.Weight } 입니다.<br/>
              	귀하의  표준 체중까지 감량할 일수 : <strong class="goalW"></strong> 이며<br/>
              	귀하의 평균 운동시간을 감안하여 감량할 일수: <strong class="goalWW"></strong> 입니다.
            
             
            </div>
          </div>
        </li>
        
        
        <li>
          <div class="timeline-badge primary" style="vertical-align: middle;"><i class="material-icons" style="vertical-align: middle;">accessibility</i></div>
         
         
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">${sessionScope.Id }님의 운동  상황</h4>
            </div>
            
            <div class="timeline-body">
           			<table class="table">
                                        <thead class="text-primary">
                                            <th>이름</th>
                                            <th>하루 소모 칼로리</th>
                                            <th>운동 날짜</th>
                                        </thead>
                                        <tbody>
                                           <c:forEach items="${myself }" var="r">
                                           <tr>
                                               <td width="30%">${sessionScope.Id }</td>
                                                <td width="30%">${r.dayCalorie }Kcal</td>
                                                <td width="30%">${r.regdate }</td>
                                           </tr>
                                           </c:forEach>
                                        </tbody>
                         </table>
                         
                         
                         <table class="table">
                                        <thead class="text-primary">
                                            <th>이름</th>
                                            <th>운동 이름</th>
                                            <th>시간</th>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${myself_exercise_name_count }" var="rr">
	 <tr>
                                               <td width="30%">${sessionScope.Id }</td>
                                                <td width="30%">${rr.excercise_name }</td>
                                                <td width="30%">${rr.exercise_count }시간</td>
                                           </tr>
                                           </c:forEach>
                                        </tbody>
                         </table>
            			</div>
            	
            	
            	
            	
            	
          </div>
        </li>
        
        
    </ul>
      
      
      
      
      
      
  	
	<div class="row">
	
          <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="orange">
                                <div id="chartdiv" style="height: 200px; width: 100%;"></div>        
								 </div>
                                <div class="card-content">
                                    <h4 class="title">하루에 소모한 총 칼로리(Kcal)</h4>
                                    <p class="category">
                                        <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase in today kcal</p>
                                </div>
                            </div>
                        </div>
      
	
	</div>
	
	
	<div class="row">
	 
	    <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="red">
                                <div id="chartdiv1" style="height: 200px; width: 100%;"></div> 
	 							 </div>
                                <div class="card-content">
                                    <h4 class="title">최근 운동한 운동 및 운동 시간</h4>
                                    <p class="category">
                                        <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase in today kcal</p>
                                </div>
                            </div>
                        </div>
      
	       
	</div>
	
	
		              
</div>
</div>
</div>
   	</div>
   	
   	
   	

  <!-- Modal -->
  <div class="modal fade" id="myModal1" role="dialog" aria-labelledby="myLargeModalLabel"
>
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
              
                        
                        <div class="row">
                         <nav class="navbar navbar-inverse bg-primary"  style="width:94%; margin-left:3%; background-color: #CA3515;">
					  <a class="navbar-brand" href="#"> <h4 class="title">
					  <!-- If you  want to learn other Exercise , Let's choice Our Home menu  -->
					  자신의 운동한 결과를 확인하세요
					  </h4></a>
						</nav>
					    
                         </div>
                         <div class="row">
                             <fieldset class="col-md-12 " style="margin-top:-2%; background-color: #CCC6C4; position: fixed;">
    
         			<iframe  id="a" class="col-md-12 embed-responsive-item"
					src="https://www.youtube.com/embed/YwBzuHAJFd4?autoplay=1" width="110%" height="500px" frameBorder="0" style="margin-top:-20%; position:absolute; margin: auto 0;">
					
					<!-- https://www.youtube.com/embed/x6VmzcGi6l8?autoplay=1
					 https://www.youtube.com/embed/9-qxas4fb4o?autoplay=1
					 https://www.youtube.com/embed/phS_tGsRO-Y
					 https://www.youtube.com/embed/DaANv8I1vAQ
					 https://www.youtube.com/embed/YwBzuHAJFd4
					 -->
				</iframe>
				</fieldset>
			 		</div>
          
                         
                         
                         
                     
          
      </div>
      
    </div>
    
   	
   	
   	
   	
   	</div>

 <!-- Chart code -->

<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
  <!--  차트 바로 위에있는것 -->
 <script type="text/javascript">
$('.timeline-panel').click(function() {
    $('.timeline-body', this).toggle(); // p00f
});

</script>
 
</body>
 <!--   Core JS Files   -->
	<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/material.min.js" type="text/javascript"></script>
	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>
	<!--  Dynamic Elements plugin -->
	<script src="assets/js/arrive.min.js"></script>
	<!--  PerfectScrollbar Library -->
	<script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="assets/js/bootstrap-notify.js"></script>
	<!-- Material Dashboard javascript methods -->
	<script src="assets/js/material-dashboard.js?v=1.2.0"></script>
</script>
</html>