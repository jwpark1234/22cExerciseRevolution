<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
 <link rel="stylesheet" href="ex_rkh/ex.css">
 <!-- Resources -->
<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/gauge.js"></script>

<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
 <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
 
 
 <style type="text/css">
.toggle.ios .toggle-handle{
  border-radius: 20px;
	  background:#e03f33;
}
 #mydiet_toggle_btn {
 	height:100px;
 	padding-right:120px;
 }
 #chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}	
.toggle-on{
   padding-left: 0px;
   padding-right:0px; 
}
.toggle-off{
   padding-left: 0px;
   padding-right:0px; 
}				
 </style>
  <!--  pie chart another series -->
 
</head>
<body>
<script type="text/javascript">
var regdatea=new Array();
var counta=new Array();
var datapoints=new Array();

var regdate2=new Array();
var daycalorie=new Array();
var datapoints2=new Array();

</script>

<c:forEach items="${sessionScope.abc }" var="l">
<script type="text/javascript">
regdatea.push('${l.regdate}');
counta.push('${l.count}');
</script>
</c:forEach>



<script type="text/javascript">
function read(name){
	

	location.href="./buy_sread.do?name="+name;
}
	
	
	var color=["#FF0F00","#FF6600","#FF9E01","#FCD202","#F8FF01","#B0DE09",
	           "#04D215","#0D8ECF","#0D52D1","#2A0CD0","#8A0CCF","#CD0D74","#754DEB","#DDDDDD","#999999",
	           "#333333", "#000000"];

		for(var i=0; i<counta.length;i++){
			datapoints.push({"날짜":regdatea[i] , "시간":parseInt(counta[i]) , "color" : color[i]});
		}
		var chart = AmCharts.makeChart("chartdiv1", {
			  "type": "serial",
			  "theme": "light",
			  "marginRight": 70,
			  "dataProvider": datapoints,
			  "valueAxes": [{
			    "axisAlpha": 0,
			    "position": "left",
			    "title": "운동 시간(시)"
			  }],
			  "startDuration": 1,
			  "graphs": [{
			    "balloonText": "<b>[[category]]: [[value]]</b>",
			    "fillColorsField": "color",
			    "fillAlphas": 0.9,
			    "lineAlpha": 0.2,
			    "type": "column",
			    "valueField": "시간"
			  }],
			  "chartCursor": {
			    "categoryBalloonEnabled": false,
			    "cursorAlpha": 0,
			    "zoomable": false
			  },
			  "categoryField": "날짜",
			  "categoryAxis": {
			    "gridPosition": "start",
			    "labelRotation": 45
			  }

			});
	
	
	
	///////////////////////////////////////////////
	
	// 표준 칼로리, 영양소 + 내 식단 칼로리, 영양소를 받아온다
	var calList = ${calList}

	// 칼로리 챠트 세팅값
	var dietData1 = {
		    "type": "serial",
			"theme": "light",
			"color": "#FFFFFF",
			"startDuration": 2,
			"dataProvider": [{
		        "xlabel": '표준체중 필요칼로리',
		        "운동강도 보통": calList[0].calorie,
		        "운동강도 격함": calList[1].calorie,
		    }, {
		        "xlabel": '내 식단 칼로리',
		        "아침": calList[2].calorie,
		        "점심": calList[3].calorie,
		        "저녁": calList[4].calorie
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
		    }
		 };
	
	// 영양소 챠트 세팅 정보
	var dietData2 = {
		    "type": "serial",
			"theme": "light",
			"color": "#FFFFFF",
			"startDuration": 2,
		    "dataProvider": [{
		    	"xlabel": '표준 탄수화물',
		        "운동강도 보통": calList[0].tan,
		        "운동강도 격함": calList[1].tan,
		    }, {
		    	"xlabel": '내 탄수화물',
		        "아침": calList[2].tan,
		        "점심": calList[3].tan,
		        "저녁": calList[4].tan,
		    }, {
		    	"xlabel": '표준 단백질',
		        "운동강도 보통": calList[0].dan,
		        "운동강도 격함": calList[1].dan,
		    }, {
		    	"xlabel": '내 단백질',
		        "아침": calList[2].dan,
		        "점심": calList[3].dan,
		        "저녁": calList[4].dan,
		    }, {
		    	"xlabel": '표준 지방',
		        "운동강도 보통": calList[0].ji,
		        "운동강도 격함": calList[1].ji,
		    }, {
		    	"xlabel": '내 지방',
		        "아침": calList[2].ji,
		        "점심": calList[3].ji,
		        "저녁": calList[4].ji,
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
		    "categoryField":"xlabel",
		    "categoryAxis": {
		        "gridPosition": "start",
		        "axisAlpha": 0,
		        "gridAlpha": 0,
		        "position": "left"
		    }};
	
	// 처음은 칼로리 챠트만 보여준다.
	var dietchart1 = AmCharts.makeChart("dietChart", dietData1);
	var dietchart2 = null;
	
		chart =   AmCharts.makeChart("chartdiv2",
	            {
	               "type": "gauge",
	               "theme":"light",
	               "adjustSize": false,
	               "marginBottom": 0,
	               "marginLeft": 0,
	               "marginRight": 0,
	               "marginTop": 0,
	               "accessible": false,
	               "autoResize": false,
	               "creditsPosition": "bottom-right",
	               "fontSize": 20,
	               "arrows": [
	                  {
	                     "id": "GaugeArrow-1",
	                     "nailRadius": 1,
	                     "value":"${sessionScope.BMI_Value_vision}",
	                     "radius": "85%",
	                     "startWidth": 5
	                  }
	               ],
	               "axes": [
	                  {
	                     "bottomTextColor": "#FFFFFF",
	                     "bottomText": "왱알앵알",
	                     "bottomTextYOffset": -112,
	                     "axisThickness": 0,
	                     "bottomText": "",
	                     "bottomTextYOffset": -20,
	                     "endValue": 40,
	                     "fontSize": 2,
	                     "id": "GaugeAxis-1",
	                     "labelFrequency": 0,
	                     "minorTickLength": 0,
	                     "tickThickness": 0,
	                     "unitPosition": "left",
	                     "valueInterval": 10,
	                     "bands": [
	                        {
	                           "balloonText": "저체중",
	                           "color": "#FFFF00",
	                           "endValue": 18.5,
	                           "id": "GaugeBand-1",
	                           "innerRadius": "40%",
	                           "startValue": 0
	                        },
	                        {
	                           "alpha": 0.67,
	                           "balloonText": "정상 체중",
	                           "color": "#04F230",
	                           "endValue": 23,
	                           "id": "GaugeBand-2",
	                           "innerRadius": "40%",
	                           "startValue": 18.5
	                        },
	                        {
	                           "balloonText": "과체중",
	                           "color": "#FF8000",
	                           "endValue": 25,
	                           "id": "GaugeBand-4",
	                           "innerRadius": "40%",
	                           "startValue": 23
	                        },
	                        {
	                           "balloonText": "비만",
	                           "color": "#FF0000",
	                           "endValue": 30,
	                           "id": "GaugeBand-5",
	                           "innerRadius": "40%",
	                           "startValue": 25
	                        },
	                        {
	                           "balloonText": "고도비만",
	                           "color": "#9400D3",
	                           "endValue": 40,
	                           "id": "GaugeBand-6",
	                           "innerRadius": "40%",
	                           "startValue": 30
	                        }
	                     ]
	                  }
	               ],
	               "allLabels": [],
	               "balloon": {},
	               "titles": [
	                  {
	                     "id": "Title-1",
	                     "size": 15,
	                     "text": "BMI",
	                     "color": "#FFFFFF"
	                  }
	               ]
	            }
	         );
	   
	   $(function(){
	      if("${sessionScope.BMI_Value_vision}"<18.5){
	    	 $("#toggle_content_2_bg").css("background","linear-gradient(60deg,#e966ff8c,  #ffec0ca6)");
	    	 $("#weight__color").css("color","yellow");
	         $("#alert_label_color").removeClass("alert-success");
	         $("#alert_label_color").addClass("alert-warning");
	         $("#alert_label_icon").html("sentiment_neutral");
	         $("#alert_label_contents_bmi").html("표준체중에 미달합니다. 근육량을 늘리거나 기초적인 체중을 어느정도 늘리는 편이 좋습니다.");
	      }else if("${sessionScope.BMI_Value_vision}">=18.5 && "${sessionScope.BMI_Value_vision}"<23){
	    	 $("#toggle_content_2_bg").css("background","linear-gradient(60deg,#00bcd4,  #00eafd47)");
	    	 $("#weight__color").css("color","green");
	         $("#alert_label_color").removeClass("alert-success");
	         $("#alert_label_color").addClass("alert-success");
	         $("#alert_label_icon").html("mood");
	         $("#alert_label_contents_bmi").html("가장 보기좋고 건강한, 이상적인 체중으로써 현재 체중을 유지하는 게 가장 좋습니다.");
	      }else if("${sessionScope.BMI_Value_vision}">=23 && "${sessionScope.BMI_Value_vision}"<25){
	    	 $("#toggle_content_2_bg").css("background","linear-gradient(60deg,#ff9800b8,  #ea04047d)");
	    	 $("#weight__color").css("color","red");
	         $("#alert_label_color").removeClass("alert-success");
	         $("#alert_label_color").addClass("alert-info");
	         $("#alert_label_icon").html("sentiment_satisfied");
	         $("#alert_label_contents_bmi").html("BMI표준보다는 조금 높은 값입니다. 일일 섭취 칼로리량을 조절하여 체중을 줄이는 노력이 필요합니다.");
	      }else if("${sessionScope.BMI_Value_vision}">=25 && "${sessionScope.BMI_Value_vision}"<30){
	    	 $("#toggle_content_2_bg").css("background","linear-gradient(60deg,#ff3829db,  #dc1da378)");
	    	 $("#weight__color").css("color","red");
	         $("#alert_label_color").removeClass("alert-success");
	         $("#alert_label_color").addClass("alert-warning");
	         $("#alert_label_icon").html("sentiment_dissatisfied");
	         $("#alert_label_contents_bmi").html("BMI지수가 비만을 가리키고 있습니다. 성인병 예방을 위해 꾸준한 운동과 식이요법을 병행할 필요가 있습니다.");
	      }else{
			 $("#toggle_content_2_bg").css("background","linear-gradient(60deg,#bf54d2,  #f44336)");
	    	 $("#weight__color").css("color","purple");
	         $("#alert_label_color").removeClass("alert-success");
	         $("#alert_label_color").addClass("alert-danger");
	         $("#alert_label_icon").html("sentiment_very_dissatisfied");
	         $("#alert_label_contents_bmi").html("고혈압, 고지혈증 등의 성인병에 노출되어 있습니다. 기본적인 운동을 생활화하여 기초대사량을 올리는 노력이 필수입니다.");
	      }
	   });
	   
	   $(function(){
	      $('#myprofile_toggle_btn').click(function(){
	         if($("#myprofile_toggle_btn_boolean").prop('checked')==true){
	            //표준체중일때
// 	            $(".toggle-handle").css("background","#e03f33");
	            $("#toggle_content_1").css("display","none");
	            $("#toggle_content_2").css("display","");
	            
	         }else{
	            //BMI일때
// 	            $(".toggle-handle").css("background","#02a1b5");
	            $("#toggle_content_2").css("display","none");
	            $("#toggle_content_1").css("display","");
	         }
	      });  
	      
	      
		// 식단쪽 토글버튼을 누르면
		$('#mydiet_toggle_btn').click(function() {

			// 영양소 챠트와 영양소 분석결과를 보여줌
			if ($("#mydiet_toggle_btn_boolean").prop('checked') == true) {
				$("#toggle_content_3").css("display", "none");
				$("#toggle_content_4").css("display", "");
				dietchart1.clear();
				dietchart2 = AmCharts.makeChart("dietChart", dietData2);
			} else { // 칼로리 챠트와 칼로리 분석결과를 보여줌
				$("#toggle_content_4").css("display", "none");
				$("#toggle_content_3").css("display", "");
				dietchart2.clear();
				dietchart1 = AmCharts.makeChart("dietChart", dietData1);
			}
		});
	});
</script>
<div class="main-panel">
            <jsp:include page="top.jsp"></jsp:include>
            
            <!--  본내용 -->
            <div class="content">
                <div class="container-fluid">
               
                    <div class="row">
                    	
                     
                        <div class="col-lg-6 col-md-12">
                        <!--  user_exercis_plan 이용해서 -->
                        <div class="card">
                                <div class="card-header card-chart" data-background-color="green">
		               <div id="chartdiv1" style="height: 200px; width: 100%;"></div>        
		                </div>
                                <div class="card-content">
                                    <h4 class="title">운동 계획</h4>
                                    <p class="category">
                                        <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase in today sales.</p>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">자료</i> 최근 1주일
                                    </div>
                                </div>
                            </div>
                		</div>   
                		
                		
                		   <div class="col-lg-6">
                            <div class="card"  style="height:300px;">
                                <div class="card-header card-chart" style="height:200px; background: linear-gradient(60deg, #777, #002848);" data-background-color="black"  >
                           <div class="row">
                           <div class="col-lg-3 col-md-3 col-sm-3" style="height:200px;" align="center" >
                                 <h3>BMI</h3>
                                 <h1>${sessionScope.BMI_Value}</h1>
                           </div>
                           <div class="col-lg-5 col-md-5 col-sm-5" style="height:200px;">
                              <div id="chartdiv2" class="ct-chart" style="width: 100%; height:200px;" >40</div>                           
                           </div>
                           <div class="col-lg-4 col-md-4 col-sm-4" style="padding-top: 14px;">
                              <h4>${sessionScope.Height }cm ${sessionScope.gender }의 표준 체중
                              </h4>
                              <h1>${sessionScope.sWeight } kg
                              </h1>
                           </div> 
                           </div>  
                        </div>
                        <div class="card-content">
                           <div class="col-md-2">
                               <h4 class="title" id="myprofile_toggle_btn"><input id="myprofile_toggle_btn_boolean" type="checkbox" data-toggle="toggle" data-width="100" data-height="75" data-onstyle="info" data-offstyle="danger"  data-on="BMI" data-off="표준체중" data-style="ios"></h4>
                           </div>
                           <div class="col-md-10" id="toggle_content_1" style="display:none;">
                              <div class="alert alert-success" id="alert_label_color">
                                 <div class="container-fluid" style="padding-left: 0px;">
                                    <div class="col-md-1" style="padding-left: 0px;">
                                       <i class="material-icons" id="alert_label_icon" style="font-size:41px">mood</i>
                                    </div>
                                    <div class="col-md-11">
                                       <div id="alert_label_contents_bmi">
                                          가장 보기좋고 건강한, 이상적인 체중으로써 현재 체중을 유지하는 것이    가장 좋습니다.
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-md-10" id="toggle_content_2" style="display:;" >
                              <div class="alert info" style="background: "id="toggle_content_2_bg">
                                 <div class="container-fluid" style="padding-left: 0px;">
                                    <div class="col-md-1" style="padding-left: 0px;">
                                       <div class="alert-icon">
                                          <i class="material-icons" id="alert_label_icon" style="font-size:41px">school</i>
                                       </div>
                                    </div>
                                    <div class="col-md-11">
                                       <div id="alert_label_contents_bmi" style="color:white;">
                                          ${sessionScope.Height } cm ${sessionScope.gender } 의 표준체중은 <font color="blue" style="font-size:21px;">${sessionScope.sWeight }kg</font>입니다.
                                          <font style="font-size:25px;color: #333;font-weight: bold;">${sessionScope.Nickname }</font>님의 현재 체중은 <font color="red"style="font-size:25px;" id="weight__color">${sessionScope.Weight }kg</font>
                                          으로 표준체중의
                                          <font style="font-size: 30px;color:green; "><fmt:formatNumber value="${sessionScope.Weight / sessionScope.sWeight *100}" type="percent" pattern=".0"/>%</font>입니다.
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-4 col-md-12">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="red">
                                    <div class="ct-chart" id="dietChart" style="height: 200px; width: 100%; background: linear-gradient(60deg, #ff0000, #5f5f5f);"></div>
                                </div>
                                <div class="card-content">
									<div class="col-md-3 col-sm-3 col-xs-3" id="mydiet_toggle_btn">
											<input id="mydiet_toggle_btn_boolean" type="checkbox"
												data-toggle="toggle" data-width="100" data-height="75"
												data-onstyle="info" data-offstyle="danger" data-on="칼로리"
												data-off="영양소" data-style="ios" checked="checked">
									</div>
									<p class="category" class="col-md-9 col-sm-9 col-xs-9" id="toggle_content_3" style="display:;">
										<br>
										${fn:split(results,'&')[0]}
										<br><br>
									</p>
									<p class="category" class="col-md-9 col-sm-9 col-xs-9" id="toggle_content_4" style="display: none;">
										<br>
										${fn:split(results,'&')[1]}
										<br><br>
									</p>
								</div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> 
                                        <c:if test="${sessionScope.diet_time eq null}">분석 전</c:if>
                                        <c:if test="${sessionScope.diet_time ne null}">
                                        	${sessionScope.diet_time} 전 분석완료
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-4 col-md-12">
                            <div class="card">
                                <div class="card-header" data-background-color="red">
                                   <a href="event_main.do"><img alt="" src="upload/${sessionScope.imgMain }" style=" width:100%; height:200px;"></a>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">진행중인 이벤트(centerMain2.jsp)</h4>
                                    <p class="category">Last Campaign Performance</p>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> campaign sent 2 days ago
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <!--  운동기록 넣기  progressbar-->
					<div class="col-lg-4 col-md-12">
                            <div class="card">
                                <div class="card-header " data-background-color="orange">
                                
                               <h4 class="title">개인 운동결과</h4>
                                    <p class="category">운동 기록 ,평가,체중,조언</p>
                                    
                                </div>
                              <div class="card-content">
                                   
                                    
                                    <div class="bs-callout bs-callout-danger">
								
								<ul class="list-group">
									<a class="list-group-item inactive-link" href="#">
									<script type="text/javascript">
									var color=[".progress-bar-info",
									           ".progress-bar-warning",
									           ".progress-bar-danger"];
									</script>
										<c:forEach items="${sessionScope.list2 }" var="ca">
										
										<c:if test="${ca.cate_count >= 10 }">
									
										<div class="progress"  >
											<div data-placement="top" style="width: 100%;"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="${ca.cate_count*10}"
												role="progressbar" class="progress-bar progress-bar-success " >
												<span class="sr-only">${ca.cate_count*10}%</span>
												 <span class="progress-type">${ca.exercise_cate_menu }
												</span>
											</div>
										</div>
										
										</c:if>
										
										<c:if test="${ 8 <=ca.cate_count  and ca.cate_count < 10 }">
										<div class="progress">
											<div data-placement="top" style="width: ${ca.cate_count*10}%;"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="${ca.cate_count*10}"
												role="progressbar" class="progress-bar progress-bar-warning progress-bar-info">
												<span class="sr-only">${ca.cate_count*10}%</span>
												 <span class="progress-type">${ca.exercise_cate_menu }
												</span>
											</div>
										</div>
										</c:if>
										<c:if test="${6 <=ca.cate_count  and ca.cate_count < 8 }">
										<div class="progress">
											<div data-placement="top" style="width: ${ca.cate_count*10}%;"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="${ca.cate_count*10}"
												role="progressbar" class="progress-bar  progress-bar-warning ">
												<span class="sr-only">${ca.cate_count*10}%</span>
												 <span class="progress-type">${ca.exercise_cate_menu }
												</span>
											</div>
										</div>
										</c:if>
										
										<c:if test="${ ca.cate_count < 6 }">
										<div class="progress">
											<div data-placement="top" style="width: ${ca.cate_count*10}%;"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="${ca.cate_count*10}"
												role="progressbar" class="progress-bar progress-bar-danger">
												<span class="sr-only">${ca.cate_count*10}%</span>
												 <span class="progress-type">${ca.exercise_cate_menu }
												</span>
											</div>
										</div>
										</c:if>
										
										
										</c:forEach>
										

										<div class="progress-meter">
											<div style="width: 25%;" class="meter meter-left">
												<span class="meter-text">I suck</span>
											</div>
											<div style="width: 25%;" class="meter meter-left">
												<span class="meter-text">I know little</span>
											</div>
											<div style="width: 30%;" class="meter meter-right">
												<span class="meter-text">I'm a guru</span>
											</div>
											<div style="width: 20%;" class="meter meter-right">
												<span class="meter-text">I''m good</span>
											</div>
										</div>

									</a>

								</ul>



							</div>
									
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                </div>
                                
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> 운
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                    
                    
                    <div class="row"><!--바이  -->
                        <div class="col-lg-6 col-md-12">
                            <div class="card card-nav-tabs">
                                <div class="card-header" data-background-color="purple">
                                    <div class="nav-tabs-navigation">
                                        <div class="nav-tabs-wrapper">
                                            <span class="nav-tabs-title">쇼핑 :</span>
                                            <ul class="nav nav-tabs" data-tabs="tabs">
                                                <li class="active">
                                                    <a href="#profile" data-toggle="tab">
                                                        <i class="material-icons">restaurant</i>FOOD
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="#messages" data-toggle="tab">
                                                        <i class="material-icons">transfer_within_a_station</i> EXERCISE
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                                
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="profile">
                                           <div class="container-fluid">
                                            <c:forEach var="j" items="${bv1}" varStatus="status">	
        <c:if test="${status.count%3==1 }">
        <div class="row" >
        </c:if>
			<div class="col-lg-4" >
				<div class="card">
					<div class="card-header card-chart" data-background-color="orange">
						<div class="ct-chart" id="dailySalesChart">
							<a href="#" onclick="read('${j.name}')">
    	  					<img src="./upload/${j.img }" style="height:200px;">
    	  					</a>
						</div>
					</div>
					<div class="card-content" align="center">
						<h4 class="title" >${j.name}</h4>
						<p class="category text-center">
						<span class="text-success">￦${j.price }   </span> </p>
					</div>
					<div class="card-footer">
						<div class="stats" align="center">
							${j.sexpl }
						</div>
					</div>
				</div>
			</div>
		<c:if test="${status.count%3==0||status.last }">
    	</div>
		</c:if>
		</c:forEach>
                                           </div>
                                        </div>
                                        <div class="tab-pane" id="messages">
                                                <c:forEach var="j" items="${bv2}" varStatus="status">	
        <c:if test="${status.count%3==1 }">
        <div class="row" >
        </c:if>
			<div class="col-lg-4" >
				<div class="card">
					<div class="card-header card-chart" data-background-color="orange">
						<div class="ct-chart" id="dailySalesChart">
							<a href="#" onclick="read('${j.name}')">
    	  					<img src="./upload/${j.img }" style="height:200px;">
    	  					</a>
						</div>
					</div>
					<div class="card-content" align="center">
						<h4 class="title" >${j.name}</h4>
						<p class="category text-center">
						<span class="text-success" >￦${j.price }</span> 	</p>
					</div>
					<div class="card-footer">
						<div class="stats">
							${j.sexpl }
						</div>
					</div>
				</div>
			</div>
		<c:if test="${status.count%3==0||status.last }">
    	</div>
		</c:if>
		</c:forEach>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="card-footer">
	                            	<div class="stats">판매순으로 노출됩니다.</div>
	                            </div>
                            </div>
                            
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-header" data-background-color="red">
                                    <h4 class="title">Tip게시판입니다</h4>
<!--                                     <p class="category">New employees on 15th September, 2016</p> -->
                                </div>
                                <div class="card-content table-responsive">
                                    <table class="table table-hover text-center" width=100%>
			                <thead>
			                	<tr class="danger">
			                    <td width=5%>Num</td>
			                    <td width=20%>Id</td>
			                    <td width=50%>Subject</td>
			                    <td width=20%>Date</td>
			                    <td width=5%>Readcount</td>
			                    </tr>
			                </thead>
			                <tbody>
			                
			                <c:forEach items="${dto}" var="d" end="3"> 
			                    <tr>
			                        <td>${d.num }</td>
			                        <td>${d.id }</td>
			                        <td align=left>
			                        <c:if test="${d.depth > 0}"> 
 						              <c:forEach begin="1" end="${d.depth}"> 
  							             &nbsp;&nbsp;   
 						              </c:forEach> 
 						                
 					                 </c:if>
 					                <a href="tip_board_read.do?num=${d.num}">
			                        <c:if test="${d.re_step == 1 }"><b><font color="red"></c:if> 
			                           ${d.subject }
			                         <c:if test="${d.re_step == 1 }"></font></b></c:if></a></td> 
			                        <td><fmt:formatDate value="${d.date }" pattern="yyyy-MM-dd"/></td>
			                        <td>${d.readcount }</td>
			                    </tr>
			                </c:forEach>
			                </tbody>
			            </table>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
        
        <!--  session으로 호출한 값들을 반납하기 (id같이 로그아웃할떄까지 쓰이는것 뺴고 -->
        <c:remove var="listWeek" scope="session"/>
        <c:remove var="dayCal" scope="session"/>
</body>
</html>