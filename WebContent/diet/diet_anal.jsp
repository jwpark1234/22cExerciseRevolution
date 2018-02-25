<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
	#diet_panel2 {
		margin:15px;
	}
	.menuItem {
		min-height:300px;
		margin:10px;
	}
	li {
		list-style-type: none;
	}
       	
</style>
<script type="text/javascript">
// 마이페이지에서 보여줄 식단분석 결과
$(function(){

	  $.ajax({
		  url:"dietAnal.do",
		  type:'post',
		  success:function(data){
			  
			  // 분석결과가 없으면 그냥 리턴
			  if(data == 'no') {
				  return;
			  }
			  
			  // 분석결과가 문자열로 전달되기 때문에 json형태로 파싱한다.
			  var parsed = JSON.parse(data);
			  
			  // 식단 부분
			  var breakStr = "";
			  for(var i in parsed.breakList) {
				  breakStr += "<li class='list-group-item'>" + parsed.breakList[i].Menu + "   *   " + parsed.breakList[i].Count + " 인분<li>";
			  }
			  $('#break').html(breakStr);
			  $('#breakCal').html("총  " + parsed.analList[2].calorie  + " Kcal");
			  
			  var lunchStr = "";
			  for(var i in parsed.lunchList) {
				  lunchStr += "<li class='list-group-item'>" + parsed.lunchList[i].Menu + "   *   " + parsed.lunchList[i].Count + " 인분<li>";
			  }
			  $('#lunch').html(lunchStr);
			  $('#lunchCal').html("총  " + parsed.analList[3].calorie  + " Kcal");
			  
			  var dinnerStr = "";
			  for(var i in parsed.dinnerList) {
				  dinnerStr += "<li class='list-group-item'>" + parsed.dinnerList[i].Menu + "   *   " + parsed.dinnerList[i].Count + " 인분<li>";
			  }
			  $('#dinner').html(dinnerStr);
			  $('#dinnerCal').html("총  " + parsed.analList[4].calorie  + " Kcal");
			  
			  $('#totalCal').html("하루  " + (parsed.analList[2].calorie*1 + parsed.analList[3].calorie*1 + parsed.analList[4].calorie*1) + " Kcal");
			  
			  // 분석결과
			  $('#typography').html(parsed.results.split('&')[0] + "<br>" + parsed.results.split('&')[1]);
			  
			  // 나머지 데이터로 칼로리, 영양소 챠트 만들기
				  var chart = AmCharts.makeChart("chartContainer", {
					    "type": "serial",
						"theme": "light",
						"color": "#FFFFFF",
						"startDuration": 2,
						"titles": [{
					        "text": "식단 칼로리 분석",
					        "size": 15
					    }],
					    "legend": {
					    	"color": "#FFFFFF",
					        "autoMargins": false,
					        "equalWidths": false,
					        "horizontalGap": 5,
					        "markerSize": 10,
					        "useGraphSettings": true,
							"align": "center",
					        "valueWidth": 0
					    },
					    "dataProvider": [{
					        "xlabel": '표준체중 필요칼로리',
					        "운동강도 보통": parsed.analList[0].calorie,
					        "운동강도 격함": parsed.analList[1].calorie,
					    }, {
					        "xlabel": '내 식단 칼로리',
					        "아침": parsed.analList[2].calorie,
					        "점심": parsed.analList[3].calorie,
					        "저녁": parsed.analList[4].calorie
					    }],
					    "valueAxes": [{
					    	"title":"칼로리(Kcal)",
							"axisColor": "#FFFFFF",
					        "stackType": "regular",
					        "axisAlpha": 0.3,
					        "gridAlpha": 0.2,
					        "gridColor": "#FFFFFF"
					    }],
					    "graphs": [{
					        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
					        "fillAlphas": 0.8,
					        "labelText": "[[value]]",
					        "lineAlpha": 0.3,
					        "title": "운동강도 보통",
					        "type": "column",
					        "color": "#FFFFFF",
					        "valueField": "운동강도 보통"
					    }, {
					        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
					        "fillAlphas": 0.8,
					        "labelText": "[[value]]",
					        "lineAlpha": 0.3,
					        "title": "운동강도 격함",
					        "newStack": true,
					        "type": "column",
					        "color": "#FFFFFF",
					        "valueField": "운동강도 격함"
					    }, {
					        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
					        "fillAlphas": 0.8,
					        "labelText": "[[value]]",
					        "lineAlpha": 0.3,
					        "title": "아침",
							"clustered": false,
							"columnWidth": 0.4,
					        "type": "column",
					        "color": "#FFFFFF",
					        "valueField": "아침"
					    }, {
					        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
					        "fillAlphas": 0.8,
					        "labelText": "[[value]]",
					        "lineAlpha": 0.3,
					        "title": "점심",
							"clustered": false,
							"columnWidth": 0.4,
					        "type": "column",
					        "color": "#FFFFFF",
					        "valueField": "점심"
					    }, {
					        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
					        "fillAlphas": 0.8,
					        "labelText": "[[value]]",
					        "lineAlpha": 0.3,
					        "title": "저녁",
							"clustered": false,
							"columnWidth": 0.4,
					        "type": "column",
					        "color": "#FFFFFF",
					        "valueField": "저녁"
					    }],
					    "categoryField": "xlabel",
					    "categoryAxis": {
					        "gridPosition": "start",
					        "axisAlpha": 0,
					        "gridAlpha": 0,
					        "position": "left"
					    }});
					
					var chart = AmCharts.makeChart("chartContainer2", {
					    "type": "serial",
						"theme": "light",
						"color": "#FFFFFF",
						"startDuration": 2,
						"titles": [{
					        "text": "식단 3대 영양소 분석",
					        "size": 15
					    }],
					    "dataProvider": [{
					        "xlabel": '표준체중 탄수화물',
					        "운동강도 보통": parsed.analList[0].tan,
					        "운동강도 격함": parsed.analList[1].tan,
					    }, {
					        "xlabel": '내 식단 탄수화물',
					        "아침": parsed.analList[2].tan,
					        "점심": parsed.analList[3].tan,
					        "저녁": parsed.analList[4].tan
					    }, {
					        "xlabel": '표준체중 단백질',
					        "운동강도 보통": parsed.analList[0].dan,
					        "운동강도 격함": parsed.analList[1].dan,
					    }, {
					        "xlabel": '내 식단 단백질',
					        "아침": parsed.analList[2].dan,
					        "점심": parsed.analList[3].dan,
					        "저녁": parsed.analList[4].dan
					    }, {
					        "xlabel": '표준체중 지방',
					        "운동강도 보통": parsed.analList[0].ji,
					        "운동강도 격함": parsed.analList[1].ji,
					    }, {
					        "xlabel": '내 식단 지방',
					        "아침": parsed.analList[2].ji,
					        "점심": parsed.analList[3].ji,
					        "저녁": parsed.analList[4].ji
					    }],
					    "valueAxes": [{
					    	"title":"무게(g)",
							"axisColor": "#FFFFFF",
					        "stackType": "regular",
					        "axisAlpha": 0.3,
					        "gridAlpha": 0.2,
					        "gridColor": "#FFFFFF"
					    }],
					    "graphs": [{
					        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
					        "fillAlphas": 0.8,
					        "labelText": "[[value]]",
					        "lineAlpha": 0.3,
					        "title": "운동강도 보통",
					        "type": "column",
					        "color": "#FFFFFF",
					        "valueField": "운동강도 보통"
					    }, {
					        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
					        "fillAlphas": 0.8,
					        "labelText": "[[value]]",
					        "lineAlpha": 0.3,
					        "title": "운동강도 격함",
					        "newStack": true,
					        "type": "column",
					        "color": "#FFFFFF",
					        "valueField": "운동강도 격함"
					    }, {
					        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
					        "fillAlphas": 0.8,
					        "labelText": "[[value]]",
					        "lineAlpha": 0.3,
					        "title": "아침",
					        "clustered": false,
					        "columnWidth": 0.4,
					        "type": "column",
							"color": "#FFFFFF",
					        "valueField": "아침"
					    }, {
					        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
					        "fillAlphas": 0.8,
					        "labelText": "[[value]]",
					        "lineAlpha": 0.3,
					        "title": "점심",
					        "clustered": false,
					        "columnWidth": 0.4,
					        "type": "column",
					        "color": "#FFFFFF",
					        "valueField": "점심"
					    }, {
					        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
					        "fillAlphas": 0.8,
					        "labelText": "[[value]]",
					        "lineAlpha": 0.3,
					        "title": "저녁",
					        "clustered": false,
					        "columnWidth": 0.4,
					        "type": "column",
					        "color": "#FFFFFF",
					        "valueField": "저녁"
					    }],
					    "categoryField": "xlabel",
					    "categoryAxis": {
					        "gridPosition": "start",
					        "axisAlpha": 0,
					        "gridAlpha": 0,
					        "position": "left"
					    }});
			
		  },
		  error:function(data){
// 			  alert(data);
		  }
	});

});

</script>
</head>
<body>
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
			                <div class="card-header" data-background-color="red">
			                	<h4 class="title">하루 식단표</h4>
			                </div>
			               	<div class="card-content">
			               		<div id="diet_panel2">
									<div class="row" >
										<div class="well col-md-12">
											<div class="row" style="min-height: 300px;">
												<div class="col-md-4">
													<div class='list-group-item menuItem'>
														<b>아침</b><br><br>
														<div id="break"></div>
														<br>
														<b id="breakCal">총  Kcal</b>
													</div>														
												</div>
												<div class="col-md-4">
													<div class='list-group-item menuItem'>
														<b>점심</b><br><br>
														<div id="lunch"></div>
														<br>
														<b id="lunchCal">총  Kcal</b>
													</div>	
												</div>
												<div class="col-md-4">
													<div class='list-group-item menuItem'>
														<b>저녁</b><br><br>
														<div id="dinner"></div>
														<br>
														<b id="dinnerCal">총  Kcal</b>
													</div>	
												</div>
											</div>
											<h4><b id="totalCal">하루  Kcal</b></h4>
										</div>
									</div>
								</div>
			                </div>
			            </div>
		            </div>
	            </div>
	            <div class="row">
					<div class="col-md-12">
						<div class="card">
					        <div class="card-header" data-background-color="red">
						        <div class="row">
						          	<div class="col-md-5">
										<div id="chartContainer" style="height: 415px;"></div>
									</div>
									<div class="col-md-7">
										<div id="chartContainer2" style="height: 415px; "></div>
									</div>
								</div>
					        </div>
					        <div class="card-content">
								<div id="typography">
				                </div>
							</div>
							<div class="card-footer">
								<div class="stats">표준체중에 대한 분석입니다. 운동방식, 체중조절에 따라 식단을 조절하세요.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>