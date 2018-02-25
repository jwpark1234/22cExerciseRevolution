<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
<style>
.menu a {
	cursor: pointer;
}

.submenu {
	display: none;
	margin-left: 30px;
}

.vertical-align {
	display: flex;
	align-items: center;
	line-height: 30px;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	
	 var now = new Date();
	 day = now.getDate();
	 year = now.getFullYear();
	 month = now.getMonth()+1;
	 today = year +"-"+month+"-"+day;
	 
	$(function(){
		
		// 각 페이지에서 side.jsp를 include할때 selectMenu라는 변수에 값을 전달해주는데 이 값에 해당하는 메뉴를 active하는 부분
		var menuId = '<%=request.getParameter("selectMenu")%>'
		$('.menu').removeClass('active');
		$('.submenu>li').removeClass('active');
		$('#' + menuId).parent().addClass('active');
		var target = $('#' + menuId).parents('.submenu');
		if (target != null) {
			target.show();
		}

		// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".menu>a").click(function() {
			var submenu = $(this).next("ul");
			// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});

		$("#logout").click(function() {
			location.href = "logout.do";

		});//end click

		////////////자기관리 

		$("#jagi_ganli").click(function() {
			//처음 누른다면 default page를 1번으로 한다.	
			//dispatcher 가능길 jagi_ganli.jsp로 이동
			var Id = '${sessionScope.Id }';
			if (Id == null || Id == "") {
				$('#alertContent').html('로그인 먼저 해주세요.');
				$('#myModal10').modal('show');
				return;
			}
			var index = 1;

			location.href = "jagi_ganli_plan.do?index=1#jagi";

		});//end click

		//나의 관리계획 클릭시 나의 테이블 정보 뽑기 떄문에 일단 action클래스 만들어야함

		$("#myself_ganli").click(function() {
			var Id = '${sessionScope.Id }';
			if (Id == null || Id == "") {
				$('#alertContent').html('로그인 먼저 해주세요.');
				$('#myModal10').modal('show');
				return;
			}

			$.ajax({
				type : 'get',
				url : "myself_ganli_plan.do?",
				data : {
					userId : Id
				},
				dataType : 'text',
				success : function(data) {

					if (data.toString() == "none") {
						$('#alertContent').html(Id + '님의 <b>선택한 운동메뉴</b>가 존재하지 않습니다.</br> <b>운동 메뉴부터 신청</b>해 주세요!');
						$('#myModal10').modal('show');

						return false;
					} else {
						location.href = "myself_ganli_plan.do?userId=" + Id;

					}

				},
				error : function(data) {
					alert("error");
				}
			});

			//location.href="myself_ganli_plan.do?userId="+Id;

		});

		//류경훈 exercise

		$("#exercise").click(function() {
			var Id = '${sessionScope.Id }';
			if (Id == null || Id == "") {
				$('#alertContent').html('로그인 먼저 해주세요.');
				$('#myModal10').modal('show');
				return;
			}
			$.ajax({
				type : 'get',
				url : "exercise_board.do?",

				dataType : 'text',
				success : function(data) {

					if (data.toString() == "none") {
						$('#alertContent').html(Id + '님의 <b>선택한 운동메뉴</b>가 존재하지 않습니다.</br> <b>운동 메뉴부터 신청</b>해 주세요!');
						$('#myModal10').modal('show');

						return false;
					} else {
						location.href = "exercise_board.do";

					}

				},
				error : function(data) {
					alert(data);
				}
			});

		});//end click

		$("#diet").click(function() {
			var Id = '${sessionScope.Id }';
			if (Id == null || Id == "") {
				$('#alertContent').html('로그인 먼저 해주세요.');
				$('#myModal10').modal('show');
				return false;
			}

			location.href = "diet.do";

		});//end click

		//가위바위보
		$("#event_gamble").click(
				function() {
					if ('${sessionScope.Id}' == "") {
						$('#alertContent').html('로그인 먼저 해주세요.');
						$('#myModal10').modal('show');
						return;
					} else {

						location.href = "event_gamble_pointCheck.do?today="
								+ today + "&subject=gamble";
					}

				});//end click

		$("#event_admin").click(function() {

			location.href = "event_admin.do";

		});//end click

		$("#event_main").click(function() {
	         if ('${sessionScope.Id}' == "") {
	            $('#alertContent').html('로그인 먼저 해주세요.');
	            $('#myModal10').modal('show');
	            return;
	         } else {
	            $.ajax({
	               type : "POST",
	               url : "event_main_check.do",
	               contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
	               dataType : 'html',
	               success : function(data) { 
	                  if (data =="no"){
	                     $('#alertContent').html('진행중인 이벤트가 없습니다.');
	                     $('#myModal10').modal('show');
	                  }
	                  else location.href = "event_main.do";
	               },
	               error : function(data) {
	                  alert("에러");         
	            }
	            });
	            
	         }

	      });//end click

		$("#daily").click(function() {
			if ('${sessionScope.Id}' == "") {
				$('#alertContent').html('로그인 먼저 해주세요.');
				$('#myModal10').modal('show');
				return;
			} else {

				location.href = "event_daily.do";
			}

		});//end click

		$("#buy_ex2").click(function() {

			location.href = "buy_smain.do";

		});//end click

		//Board
		$("#board_Tip").click(function(){
			location.href="board_Tip.do?pageNum=1";
		});
		
		$("#board_Free").click(function(){
			location.href="board_Free.do?pageNum=1";
		});
		//endBoard

		$("#developers").click(function() {

			location.href = "developers.jsp";

		});//end click
		
		$("#admin").click(function() {

			location.href = "pointRead.do";

		});//end click

	});
	function login() {
		var url = "user/Modal_LogIn.jsp";

		$('.modal-content').load(url, function(result) {

			$('#myModal').modal({
				show : true
			});

		});
	};

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('address2').value = "";
						document.getElementById('address2').focus();

					}
				}).open();
	}
</script>
</head>
<body>

	<div class="sidebar" data-color="red"
		data-image="assets/img/sidebar-1.jpg">
		<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
		<div class="logo">
			<a href="defaultIndex.do" class="simple-text"><b>22세기 운동혁명</b></a>
		</div>
		<div class="sidebar-wrapper">
			<ul class="nav">
				<c:if test="${sessionScope.Id ne null}">
					<li><a href="javascript:void(0);" id="logout"> <i
							class="material-icons">dashboard</i>
							<p>로그아웃</p>
					</a></li>
				</c:if>
				<c:if test="${sessionScope.Id eq null}">
					<li><a href="javascript:void(0);" onclick="login();"> <i
							class="material-icons">dashboard</i>
							<p>로그인</p>
					</a></li>
				</c:if>
				<li class="menu"><a> <i class="material-icons">fitness_center</i>
						<p>운동관리</p>
				</a>
					<ul class="nav submenu">
						<li><a href="javascript:void(0);" id="jagi_ganli">
								<p>자기관리계획</p>
						</a></li>
						<li><a href="javascript:void(0);" id="myself_ganli">
								<p>관리계획성과</p>
						</a></li>
						<li><a href="javascript:void(0);" id="exercise">
								<p>운동기록</p>
						</a></li>
					</ul></li>
				<li class="menu"><a href="javascript:void(0);" id="diet"> <i class="material-icons">restaurant</i>
						<p>식단작성</p>
				</a></li>
				<li class="menu"><a> <i class="material-icons">stars</i>
						<p>이벤트</p>
				</a>
					<ul class="nav submenu">
						<li><a href="javascript:void(0);" id="daily">
								<p>매일매일 이벤트</p>
						</a></li>
						<li><a href="javascript:void(0);" id="event_gamble">
								<p>가위바위보</p>
						</a></li>
						<li><a href="javascript:void(0);" id="event_main">
								<p>메인 이벤트</p>
						</a></li>
						<c:if test="${sessionScope.Id ne null}">
							<c:if test="${sessionScope.Level eq 6}">
								<li><a href="javascript:void(0);" id="event_admin">
										<p>이벤트 관리</p>
								</a></li>
							</c:if>
						</c:if>
					</ul></li>
				<li class="menu"><a href="javascript:void(0);" id="buy_ex2"> <i class="material-icons">shopping_cart</i>
						<p>쇼핑</p>
				</a></li>
				<li class="menu"><a> <i class="material-icons">dashboard</i>
						<p>게시판</p>
				</a>
					<ul class="nav submenu">
						<li><a href="javascript:void(0);" id="board_Tip">
								<p>Tip게시판</p>
						</a></li>
						<li><a href="javascript:void(0);" id="board_Free">
								<p>자유게시판</p>
						</a></li>
					</ul></li>
				<li class="menu"><a href="javascript:void(0);" id="developers">
						<i class="material-icons">weekend</i>
						<p>About us</p>
				</a></li>
				<c:if test="${sessionScope.Level eq 6}">
					<li class="menu"><a href="javascript:void(0);" id="admin">
							<i class="material-icons">weekend</i>
							<p>포인트 설정</p>
					</a></li>
				</c:if>
			</ul>
		</div>
	</div>

	<!-- 로그인 모달창 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" style="z-index:12000000"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	<div id="chatFrame"
		style="z-index: 1000; position: absolute; top: 60px; right: 20px; width: 800px;"></div>

	<!-- alertModal -->

	<div class="modal fade" id="myModal10" tabindex="-1" role="dialog" style="z-index:120000000"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="card">
				<div class="card-content">
					<div class="row vertical-align">
						<div class="col-md-4">
							<img src="images/sorry.png">
						</div>
						<div class="col-md-7"
							style="vertical-align: middle; font-size: 17px;">
							<p class="category" id="alertContent">
							</p>
						</div>
						<div class="col-md-1">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--   Core JS Files   -->

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
</body>





</html>