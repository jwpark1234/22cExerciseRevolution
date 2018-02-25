<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


  <script src="https://code.jquery.com/jquery-3.2.1.js"></script> 
<script type="text/javascript">
// 챠트 데이터들과 분석결과 받아옴
var datas = ${datas}

$(function(){
	// 칼로리 챠트
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
	        "운동강도 보통": datas[0].calorie,
	        "운동강도 격함": datas[1].calorie
	    }, {
	        "xlabel": '내 식단 칼로리',
	        "아침": datas[2].calorie,
	        "점심": datas[3].calorie,
	        "저녁": datas[4].calorie
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
	
	// 영양소 챠트
	var chart = AmCharts.makeChart("chartContainer2", {
	    "type": "serial",
		"theme": "light",
		"color": "#FFFFFF",
		"startDuration": 2,
		"titles": [{
	        "text": "식단 3대 영양소 분석",
	        "size": 15
	    }],
// 	    "legend": {
// 	    	"color": "#FFFFFF",
// 	        "horizontalGap": 10,
// 	        "maxColumns": 1,
// 	        "position": "right",
// 			"useGraphSettings": true,
// 			"markerSize": 10
// 	    },
	    "dataProvider": [{
	        "xlabel": '표준체중 탄수화물',
	        "운동강도 보통": datas[0].tan,
	        "운동강도 격함": datas[1].tan
	    }, {
	        "xlabel": '내 식단 탄수화물',
	        "아침": datas[2].tan,
	        "점심": datas[3].tan,
	        "저녁": datas[4].tan
	    }, {
	        "xlabel": '표준체중 단백질',
	        "운동강도 보통": datas[0].dan,
	        "운동강도 격함": datas[1].dan
	    }, {
	        "xlabel": '내 식단 단백질',
	        "아침": datas[2].dan,
	        "점심": datas[3].dan,
	        "저녁": datas[4].dan
	    }, {
	        "xlabel": '표준체중 지방',
	        "운동강도 보통": datas[0].ji,
	        "운동강도 격함": datas[1].ji
	    }, {
	        "xlabel": '내 식단 지방',
	        "아침": datas[2].ji,
	        "점심": datas[3].ji,
	        "저녁": datas[4].ji
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
});

</script>
</head>
<body>
<div class="card">
	<div class="card-header" data-background-color="red">
		<div class="row">
          	<div class="col-md-5">
				<div id="chartContainer" style="height: 415px;"></div> <!-- 칼로리 챠트 -->
			</div>
			<div class="col-md-7">
				<div id="chartContainer2" style="height: 415px; "></div> <!-- 영양소 챠트 -->
			</div>
		</div>
	</div>
	<!-- 분석결과 -->
	<div class="card-content">
		<div id="typography">
			${fn:split(results,'&')[0]}<br>
			${fn:split(results,'&')[1]}
		</div>
	</div>
	<div class="card-footer">
		<div class="stats">표준체중에 대한 분석입니다. 운동방식, 체중조절에 따라 식단을 조절하세요.</div>
	</div>
</div>
</body>
</html>