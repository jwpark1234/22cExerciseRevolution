<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
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
<script
  src="https://code.jquery.com/jquery-3.2.1.js"></script>
 <link href="https://canvasjs.com/assets/css/jquery-ui.1.11.2.min.css" rel="stylesheet" />
</head>
<script type="text/javascript">
	function send() {
		// 확인 버튼을 누르면 입력한 값들을 하나로 모아서 JSON형식으로 만든다.
		var data = $('form').serialize();
		var data2 = data.split("&");
		
		var json = new Array();
		
		for(var i in data2) {
			var d = data2[i].split("=");
			json[i] = "\"" + d[0] + "\":\"" + d[1] + "\"";
		}
		json = "{"+json+"}";
		
		// 한번에 전달
		  $.ajax({  
			  type: "Post",
	           url: 'pointWrite.do',
	           data: {
	        	   json:json
	           },
	           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	           dataType:'html',
	           success: function(data)
	           {
	        	   $('form').submit();
	           },
	           error:function(data){
	        	   alert("에러");
	           }
	      });

	}

</script>
<body>
<!-- 

1레벨 0~999
2레벨 1000~2499
3레벨 2500~4999
4레벨 5000~
5레벨 상위 20명, 순위가 바뀌는 경우 강등

회원가입 500
첫 운동계획 100 이후 30
첫 식단계획 100 이후 30
첫 상품구매 500 이후 5%, 구매시 구매금액 5% 사용 가능(적립x)
팁게시판 관리자 채택 시 300
자유게시판 관리자 채택 시 200
전문가와의 상담 1회 -100 소모 

 -->
	<jsp:include page="side.jsp">
	<jsp:param value="admin" name="selectMenu"/>
	</jsp:include>
	<div class="main-panel">
		<jsp:include page="top.jsp"></jsp:include>	
		<!--  본내용 -->
        <div class="content">
			<div class="container-fluid">
				<div class="row">
			    	<div class="col-md-12">
						<div class="card card-nav-tabs">
	                        <div class="card-header" data-background-color="purple">
	                            <h4 class="card-title">관리페이지</h4>
	                        </div>
	                        <div class="card-content" style="height:760px;">
		                        <form method="post">
		                        	<div class="col-md-6">
		                        		<h4 class="title">회원 레벨 설정</h4>
										<table class="table table-striped text-center">
										   <thead>
										      <tr>
										         <td>아이콘</td>
										         <td>레벨</td>
										         <td>기준</td>
										      </tr>
										   </thead>
										   <tbody>
										      <tr>
										         <td><img src="images/level/6.jpg" style="width:24px; height:22px;"></td>
										         <td>관리자</td>
										         <td>-</td>
										      </tr>
										      <tr>
										         <td><img src="images/level/5.jpg" style="width:22px; height:22px;"></td>
										         <td>Level 5</td>
										         <td>상위&nbsp;&nbsp;<input type="text" id="level5" name="level5" value="${json.level5}"> 명</td>
										      </tr>
										      <tr>
										         <td><img src="images/level/4.jpg" style="width:22px; height:22px;"></td>
										         <td>Level 4</td>
										         <td><input type="text" id="level4" name="level4" value="${json.level4}">  point</td>
										      </tr>
										      <tr>
										         <td><img src="images/level/3.jpg" style="width:22px; height:22px;"></td>
										         <td>Level 3</td>
										         <td><input type="text" id="level3" name="level3" value="${json.level3}">  point</td>
										      </tr>
										      <tr>
										         <td><img src="images/level/2.jpg" style="width:22px; height:22px;"></td>
										         <td>Level 2</td>
										         <td><input type="text" id="level2" name="level2" value="${json.level2}">  point</td>
										      </tr>
										      <tr>
										         <td><img src="images/level/1.jpg" style="width:22px; height:22px;"></td>
										         <td>Level 1</td>
										         <td><input type="text" id="level1" name="level1" value="${json.level1}">  point</td>
										      </tr>
										   </tbody>
										</table>
		                        	</div>
		                        	<div class="col-md-6">
		                        		<h4 class="title">포인트 설정</h4>
		                        		<div class="form-group">
											<div class="col-md-6">
												[회원가입]
											</div>
											<div class="col-md-6">
												<input type="text" id="join_point" name="join_point" value="${json.join_point}">  point
											</div>
										</div>
		                        		<div class="form-group">
											<div class="col-md-6">
												[운동계획] 첫 등록
											</div>
											<div class="col-md-6">
												<input type="text" id="exer_point_first" name="exer_point_first" value="${json.exer_point_first}">  point
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">
												[운동계획] 등록
											</div>
											<div class="col-md-6">
												<input type="text" id="exer_point" name="exer_point" value="${json.exer_point}">  point
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">
												[식단계획] 첫 등록
											</div>
											<div class="col-md-6">
												<input type="text" id="diet_point_first" name="diet_point_first" value="${json.diet_point_first}">  point
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">
												[식단계획] 등록
											</div>
											<div class="col-md-6">
												<input type="text" id="diet_point" name="diet_point" value="${json.diet_point}">  point
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">
												[팁게시판] 관리자 채택 글
											</div>
											<div class="col-md-6">
												<input type="text" id="tip_board_point" name="tip_board_point" value="${json.tip_board_point}">  point
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">
												[자유게시판] 관리자 채택 글 
											</div>
											<div class="col-md-6">
												최대  <input type="text" id="free_board_point" name="free_board_point" value="${json.free_board_point}">  point
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">
												[1:1 상담] 상담신청 시 소모 포인트
											</div>
											<div class="col-md-6">
												<input type="text" id="chat_point" name="chat_point" value="${json.chat_point}">  point
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">
												[쇼핑] 첫 상품 구매
											</div>
											<div class="col-md-6">
												<input type="text" id="buy_point_first" name="buy_point_first" value="${json.buy_point_first}">  point
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">
												[쇼핑] 상품 구매
											</div>
											<div class="col-md-6">
												구매금액의  <input type="text" id="buy_point" name="buy_point" value="${json.buy_point}">  %
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">
												[쇼핑] 상품 구매 시 사용 가능 포인트
											</div>
											<div class="col-md-6">
												구매금액의  <input type="text" id="buy_point_discount" name="buy_point_discount" value="${json.buy_point_discount}">  %
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 text-center">
											<input type="button" class="btn btn-success" onclick="send();" value="확인">
										</div>
									</div>   
								</form>          		
	                        	<div class="row">
	                        		<h4 class="title"></h4>
	                        	</div>
	                        </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<!--   Core JS Files   -->
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/material.min.js" type="text/javascript"></script>
<!--  Dynamic Elements plugin -->
<script src="assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="assets/js/material-dashboard.js?v=1.2.0"></script>
</html>