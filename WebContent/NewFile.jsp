<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<style>
.cont {
	position: relative;
	height: 100vh;
	overflow: hidden;
}
.slide {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	will-change: transform;
	overflow: hidden;
}
.slide__img {
	position: relative; 
	height: 100%;
}
.slide__img-wrapper {
	position: absolute;
	top: -10%;
	left: -10%;
	width: 125%;
	height: 120%;
	transform: translate3d(0, 0, 0);
	transition: 950ms;
	will-change: transform;
}

.slide__text {
	position: absolute;
	top: 50%;
	left: 5%;
	width: 23%;
	text-transform: uppercase;
	word-wrap: break-word;
	color: #fff;
	font-size: 45px;
	font-weight: 800;
	transform: translate3d(0, -50%, 0) rotate(0.01deg);
	will-change: transform, opacity;
	transition: 750ms;
	opacity: 0;
	z-index: 1;
}
.slide__text--1 {
	left: 8%;
}

.slide {
	left: 100%;
}

.slide--1 {
	z-index: 0;
}
.slide--1 .slide__img-wrapper {
	background: url("assets/img/First_img1.jpg") center center no-repeat;
	background-size: cover;
}

.slide--2 {
	z-index: 1;
}
.slide--2 .slide__img-wrapper {
	background: url("assets/img/First_img2.jpg") center center no-repeat;
	background-size: cover;
}

.slide--3 {
	z-index: 2;
}
.slide--3 .slide__img-wrapper {
	background: url("assets/img/First_img3.jpg") center center no-repeat;
	background-size: cover;
}

.slide--4 {
	z-index: 3;
}
.slide--4 .slide__img-wrapper {
	background: url("assets/img/First_img5.jpg") center center no-repeat;
	background-size: cover;
}
.active .slide--1 .slide__img-wrapper {
	transform: translate3d(-150px, 0, 0);
	transition: 400ms;
}
.active .slide--1 {
	transform: translate3d(-100%, 0, 0);
	transition: transform 950ms 0ms;
}
.active .slide--1 .slide__img-wrapper {
	transform: translate3d(-150px, 0, 0);
	transition: 400ms 0ms;
}
.active .slide--2 {
	transform: translate3d(-75%, 0, 0);
	transition: transform 950ms 400ms;
}
.active .slide--2 .slide__img-wrapper {
	transform: translate3d(-150px, 0, 0);
	transition: 400ms 400ms;
}
.active .slide--3 {
	transform: translate3d(-50%, 0, 0);
	transition: transform 950ms 800ms;
}
.active .slide--3 .slide__img-wrapper {
	transform: translate3d(-150px, 0, 0);
	transition: 400ms 800ms;
}
.active .slide--4 {
	transform: translate3d(-25%, 0, 0);
	transition: transform 950ms 1200ms;
}
.active .slide--4 .slide__img-wrapper {
	transform: translate3d(-150px, 0, 0);
	transition: 400ms 1200ms;
}

html {
	box-sizing: border-box;
	font-family: 'Open-Sans', sans-serif;
}
*,
*:before,
*:after {
	box-sizing: inherit;
	margin: 0;
	padding: 0;
}
	.content{
		margin-left:1920px;
		transition: 1000ms;
	}
	#center_main_divdiv{
		transition:1s;
	}
	.side_bar{
		left:-14%;
		transition:3s;
	}
</style>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
var YeYeCheck=true;
function Click__(){
	if (window.sessionStorage) {
		sessionStorage.setItem('Login_place', 'First_page');
	}
	$('.modal-content').load("user/Modal_LogIn.jsp",function(result){
	    $('#myModal').modal({show:true});	
	});
}

function Click__1(){
	YeYeCheck=false;
	
	$("#First_slide__4").css('left', '100%').css('transition','700ms');
	$("#First_slide__3").css('left', '100%').css('transition','700ms 500ms');
	$("#First_slide__2").css('left', '100%').css('transition','700ms 1000ms');
	$("#First_slide__1").css('transition','700ms 1500ms').css('width','100%').css('height','100%').css('top','0px').css('bottom','0px').css('left','430px').css('opacity','0');
	$("#dongdong").animate({opacity:1},2200,function(){
 		$("#dongdong").css('transition','100ms').css('z-index','-20');
 		$(".content").css('margin-left','0px');
 		$("#center_main_divdiv").css('opacity','1');
 		$("#dongdong").animate({opacity:1},500,function(){
 			$(".sidebar").css('left','0');
 	 		$("#side_bar_divdiv").css('opacity','1');
 	 		$("#dongdong").animate({opacity:1},500,function(){
 	 			$("#top_menu_navnav").css('top','0');
 	 			$("#dongdong").animate({opacity:1},500,function(){
 	 				
 	 	     	});
 	 		});
 		});
	});
}
</script>
</head>

<body>
	<div id="dongdong" style="position: fixed;z-index: 10000;width: 1920px;">	
		<div class="cont" onclick="Click__();">
			<div data-target='1' class="slide slide--1" >
				<div class="slide__text slide__text--1">계획적인 운동</div>
				<div class="slide__img">
					<div class="slide__img-wrapper" id="First_slide__1">
					</div>
				</div>
			</div>
			<div data-target='2' class="slide slide--2">
				<div class="slide__text">맞춤형 상품 구성</div>
				<div class="slide__img">
					<div class="slide__img-wrapper"  id="First_slide__2">
					</div>
				</div>
			</div>
			<div data-target='3' class="slide slide--3">
				<div class="slide__text">체계적인 식단</div>
				<div class="slide__img" >
					<div class="slide__img-wrapper"id="First_slide__3">
					</div>
				</div>
			</div>
			<div data-target='4' class="slide slide--4">
				<div class="slide__text">그리고 꾸준한 상담</div>
				<div class="slide__img" >
					<div class="slide__img-wrapper" id="First_slide__4">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="background:black; z-index:200;width:1920px; height:2000px; position:fixed;" id="black_face_bg"></div>
		<div id="side_bar_divdiv">
			<jsp:include page="side.jsp"></jsp:include>
		</div>
		<div style="opacity:1" id="center_main_divdiv">
<%-- 			<jsp:include page="centerMain2.jsp"></jsp:include> --%>
		</div>
	
	
</body>
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script>
	$(document).ready(function () {
	var $cont = $('.cont');
	var $slide = $('.slide');
	var $text = $('.slide__text');
	var numSlides = 4;
	var initialAnimDur = 2000;
	var animDelay = 1000;
	var initialAnim = true;
	var clickAnim = false;
		$(document).on('mousemove', '.slide', function mouse_over_controller() {
			if(YeYeCheck==true){
				
			if (initialAnim || clickAnim) return;
			var _this = $(this);
			var target = +_this.attr('data-target');
	
			_this.css({
				'transform': 'translate3d(-' + (100 / numSlides * (numSlides - (target - 1)) + 5) + '%, 0, 0)',
				'transition': '750ms'
			});
	
			_this.find('.slide__text').css({
				'transform': 'translate3d(0, -40%, 0) rotate(0.01deg)',
				'opacity': '1',
				'transition': '750ms',
			});
			for (var i = target, length = $slide.length; i < length; i++) {if (window.CP.shouldStopExecution(3)){break;}if (window.CP.shouldStopExecution(3)){break;}
				$('.slide--' + (i + 1)).css({
					'transform': 'translate3d(-' + (100 / numSlides * (numSlides - (i + 1 - 1)) - 5) + '%, 0, 0)',
					'transition': '750ms'
				});
			}
	window.CP.exitedLoop(3);
	window.CP.exitedLoop(3);
			for (var _i2 = target; _i2 > 1; _i2--) {if (window.CP.shouldStopExecution(4)){break;}if (window.CP.shouldStopExecution(4)){break;}
				$('.slide--' + (_i2 - 1)).css({
					'transform': 'translate3d(-' + (100 / numSlides * (numSlides - (_i2 - 1 - 1)) + 5) + '%, 0, 0)',
					'transition': '750ms'
				});
			}
	window.CP.exitedLoop(4);
	window.CP.exitedLoop(4);
			_this.find('.slide__img-wrapper').css({
				'transform': 'translate3d(-200px, 0, 0) scale(.85, .85)',
				'transition': '750ms'
			});
	
			$slide.not(_this).find('.slide__img-wrapper').css({
				'transform': 'translate3d(-200px, 0, 0) scale(.90, .90)',
				'transition': '1000ms'
			});
	
			$slide.not(_this).find('.slide__bg-dark').css({
				'opacity': '.75'
			});
			}
		});
	
		$(document).on('mouseleave', '.slide', function (){
			
			if(YeYeCheck==true){
				
			if (initialAnim || clickAnim) return;
			var _this = $(this);
			var target = +_this.attr('data-target');
	
			for (var i = 1, length = $slide.length; i <= length; i++) {if (window.CP.shouldStopExecution(5)){break;}if (window.CP.shouldStopExecution(5)){break;}
				$('.slide--' + i).css({
					'transform': 'translate3d(-' + 100 / numSlides * (numSlides - (i - 1)) + '%, 0, 0)',
					'transition': '1000ms'
				});
			}
	window.CP.exitedLoop(5);
	
	window.CP.exitedLoop(5);
	
	
			$slide.find('.slide__img-wrapper').css({
				'transform': 'translate3d(-200px, 0, 0) scale(1, 1)',
				'transition': '750ms'
			});
	
			$slide.find('.slide__bg-dark').css({
				'opacity': '0'
			});
	
			$text.css({
				'transform': 'translate3d(0, -50%, 0) rotate(0.01deg)',
				'opacity': '0',
				'transition': '200ms',
			});
			}
		}); 
		
	setTimeout(function () {
		$cont.addClass('active');
	}, animDelay);

	setTimeout(function () {
		initialAnim = false;
	}, initialAnimDur + animDelay);
});
</script>

<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-ui.1.11.2.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
        
 	
<!--      Core JS Files   -->
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets	/js/material.min.js" type="text/javascript"></script>
<!-- 	 Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>
<!-- 	 Dynamic Elements plugin -->
	<script src="assets/js/arrive.min.js"></script>
<!-- 	 PerfectScrollbar Library -->
	<script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
<!-- 	 Notifications Plugin    -->
	<script src="assets/js/bootstrap-notify.js"></script>
<!-- 	Material Dashboard javascript methods -->
	<script src="assets/js/material-dashboard.js?v=1.2.0"></script>
</html>