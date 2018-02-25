<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js" charset="utf-8"></script>

<body>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
<script type="text/javascript">
var calorie=new Array();
var day=new Array();
var chart=null;
var exercise=new Array();
var count=new Array();
var totalCount=0;

$(function(){
	
	var c=0;
	//요일별로 칼로리 (합),
	//가로축 날짜
	//세로축 합 하나 만듬?(칼로리)
			//데이터를 받아야함 
			//날짜별로 받아야함
			//운동명,날짜,칼로리
			//중괄호 데이터 타입
			//대괄호 Array
			var calDay=new Array();

			for(var i=0; i<calorie.length;i++){
				
				calDay.push({ x: i+1, y: 0, label: day[i]});
				
				if(i==5)break;
			}
			
			   chart = new CanvasJS.Chart("chartContainer",
					    {
					      title:{
					        text: '${sessionScope.Id}'+ "'s Excercise Output  in recently'"
					      },
					      data: [
					      {  dataPoints:calDay
					      }
					      ]
					    });


			  function updateChart() {
			  	var dps = chart.options.data[0].dataPoints;
			  	for (var i = 0; i < dps.length; i++) {
			  		if(c<calorie[i]){
								dps[i] = {x: (i+1) , y: c++ , label: day[i]};
					}
			  	}
			  	chart.options.data[0].dataPoints = dps; 
			  	chart.render();
			  };
			 // updateChart();

			  setInterval(function() {
				  updateChart()
					  }, 200);
			  
			  
			  // pie chart
		var exerUser=new Array();
			  for(var i=0; i<exercise.length;i++){
				  exerUser.push({y:parseFloat(count[i]/totalCount).toFixed(2)*100,label:exercise[i]});
			  }
			  
			  //파이차트 라벨 :운동명 y:카운트값
			  var options = {
			  	title: {
			  		text: '${sessionScope.Id}'+"'s Fitness count in recently'"
			  	},
			  	subtitles: [{
			  		text: '${sessionScope.Id}'+'s Result by Pie Chart'
			  	}],
			  	animationEnabled: true,
			  	data: [{
			  		type: "pie",
			  		startAngle: 40,
			  		toolTipContent: "<b>{label}</b>: {y}%",
			  		showInLegend: "true",
			  		legendText: "{label}",
			  		indexLabelFontSize: 16,
			  		indexLabel: "{label} - {y}%",
			  		dataPoints:exerUser
			  	}]
			  };
			  //중복시 안 읽힘?
					  var chart1=new CanvasJS.Chart("chartContainer1",
					   			options);
				chart1.render();
				
			//  $("#chartContainer").CanvasJSChart(options);
			
		 
})
   </script>
   <!--  날짜 동안 하루에 소모한 총 칼로리 -->
    <c:forEach items="${myself }" var="re">
    <script type="text/javascript">
    calorie.push('${re.dayCalorie}');  //컬럼 기준이 10분당이므로 1시간당으로 바꿀려면 *6
    day.push('${re.regdate}');
    
    </script>
    </c:forEach>
    
	<!-- 선택한 운동에 대한 운동시간 비율,운동시간 -->
	<c:forEach items="${myself_exercise_name_count }" var="enc">
	<script type="text/javascript">
	exercise.push('${enc.excercise_name}');
	count.push('${enc.exercise_count}');
	totalCount+=parseInt('${enc.exercise_count}');
	</script>
    </c:forEach>

 
<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
 
</body>
</html>