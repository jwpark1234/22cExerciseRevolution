<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png" />
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
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="ex_rkh/ex.css">
<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet" />

<style type="text/css">
.card .card-content {
    padding: 15px 20px;
}
.card .card-content2 {
    padding: 15px 20px;
}
.notice {
    padding: 15px;
    background-color: #fafafa;
    border-left: 6px solid #7f7f84;
    margin-bottom: 10px;
    -webkit-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
       -moz-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
            box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
}
.notice-sm {
    padding: 10px;
    font-size: 80%;
}
.notice-lg {
    padding: 35px;
    font-size: large;
}
.notice-success {
    border-color: #80D651;
}
.notice-success>strong {
    color: #80D651;
}
.notice-info {
    border-color: #45ABCD;
}
.notice-info>strong {
    color: #45ABCD;
}
.notice-warning {
    border-color: #FEAF20;
}
.notice-warning>strong {
    color: #FEAF20;
}
.notice-danger {
    border-color: #d73814;
}
.notice-danger>strong {
    color: #d73814;
}
</style>

</head>

<body>
	<script type="text/javascript">
		//Ajax으로 데이터를 넘긴다.
		function ex_post() {
			$.ajax({
				url : "ex_post.do",
				dataType : 'html',
				type : 'post',
				success : function(data) {
					$(".board").empty();
					$(".board").html(data);
				},
				error : function(data) {
					alert("ex_post 안됨");
				}
			});//end ajax
		}
		/*  	   
		데이터 값이 넘겨줄때 "num ="+num 이런식으로 
		여러개면 "num="+num &"name="+name ? 콤마 주의 
		 */
			function ex_read(num) {
				$.ajax({
				type : "POST",
				url : "ex_read.do",
				data : "num=" + num,
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType : 'html',
				success : function(data) {
					
					$(".board").empty();
					$(".board").html(data);
				},
				error : function(data) {
					alert("ex_read 오류가...");
				}
			});
		}
	</script>
<!--  리퀘스트 영역에 있는 exercise에 저장된 값을 가져온다  -->
	<jsp:include page="../side.jsp">
	<jsp:param name="selectMenu" value="exercise" /> 
	</jsp:include>
	
	<div class="main-panel">
		<jsp:include page="../top.jsp"></jsp:include>
		<div class="content">
			<div class="container-fluid">
				<!--  #1 운동기록 캐러셀 _carousel slide   -->
				<div class="row">
					<div class="col-md-6" >
						<div class="card" >
						<div class="card-header" data-background-color="green">
						<h4 class="title">운동기록</h4>
						</div>
							<div class="card-content">
								<!-- 캐러셀 메인 div -->
									<div id="carousel-example-generic" class="carousel slide"
										data-ride="carousel">
										<div class="carousel-inner">
											<ol class="carousel-indicators">
												<li data-target="#carousel-example-generic"
													data-slide-to="0" class="active"></li>
												<li data-target="#carousel-example-generic"
													data-slide-to="1"></li>
												<li data-target="#carousel-example-generic"
													data-slide-to="2"></li>
											</ol>
												<!-- ##내가 선택했던 운동글과 유저정보를 뿌려준다 . 변수는 la로 시작한다  ,아이디,이름.칼로리,키.몸무게-->
												<c:forEach items="${ex_selfcheck_list}" var="la"
												varStatus="status">
												<c:if test="${status.index eq 0 }">
													<div class="item active">
												</c:if>
												<c:if test="${status.index ne 0 }">
													<div class="item ">
												</c:if>
												<div class="panel-heading resume-heading">
													<div class="row">
														<div class="col-xs-12 col-sm-4">
															<figure> <!-- 밑에는 forEach 블록이 동작을 안해서 아예 img태그가 안나와요. forEach 잘 동작하면 넣어봐요 -->
															<!--  jsp페이지에서는 /upload/받아온 파일명 --> <!-- upload 앞에는 / 필요없어요 -->
															<img class="img-circle img-responsive" alt=""
																src="upload/${pic}" width="175" height="250"
																float="left" /> </figure>
														</div>
														<!--  잘나옴-->
														<div class="col-xs-12 col-sm-8" style="">
															<!-- 밑에는 forEach 블록이 동작을 안해서 아예 img태그가 안나와요. forEach 잘 동작하면 넣어봐요 -->
															<!--  jsp페이지에서는 /upload/받아온 파일명 -->
															<!-- upload 앞에는 / 필요없어요 -->
															<ul class="list-group">
																<li class="list-group-item text-danger"><span
																	class="label label-success">아이디</span> ${la.userId }</li>
																<li class="list-group-item text-danger"><span
																	class="label label-success">이름</span>
																	${la.excercise_name }</li>
																<li class="list-group-item text-danger"><span
																	class="label label-success">칼로리</span> ${la.calorie*30 }
																</li>
																<li class="list-group-item text-danger"><span
																	class="label label-success">키</span> ${la.height }</li>
																<li class="list-group-item text-danger"><span
																	class="label label-success">몸무게</span> ${la.weight}</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="bs-callout bs-callout-danger">
													<h4 class="title">운동 목표</h4>
													<p class="category">${la.exercise_comment}</p>
												</div>
											</div>
										</c:forEach>
									</div>
									<a class="left carousel-control"
										href="#carousel-example-generic" data-slide="prev"> <i
										class="material-icons" style="padding-top: 170px;">fast_rewind</i>
									</a> <a class="right carousel-control"
										href="#carousel-example-generic" data-slide="next"> <i
										class="material-icons" style="padding-top: 170px;">fast_forward</i>
									</a>
							</div>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons">access_time</i> updated 4 minutes ago
							</div>
						</div>
					</div>
				</div>
	
				<!--  #2 운동   -->
				
				<div class="col-md-6">

					<div class="card" style="height:460px;"  >
						<div class="card-header" data-background-color="green">
						<h4 class="title">운동일지</h4>
						</div>
						<div class="card-content board" >
							<div class="bs-callout bs-callout-danger">
								<table class="table table-striped" style=TABLE-layout:fixed	>
									<thead class="text-danger">
										<tr>
											<th width="50">num</th>
											<th>subject</th>
											<th>content</th>
											<th>regdate</th>
										</tr>
									</thead>
									<tbody>		<!-- 게시판 글을 뿌려준다.변수는 b로 시작한다.  -->
										<c:forEach items="${listPage }" var="b">
											<tr>
							   					<td>${b.num}</td> <!--글번호 --> <!-- 제목 눌렀을때 해당 글번호를넘겨줘서 글읽기 가능하게 한다.  -->
												<td style="text-overflow : ellipsis;overflow : hidden;">
												<a href="javascript:void(0);" onclick="ex_read(${b.num});">
														<nobr>${b.subject }</nobr> </a></td> 
												<td style="text-overflow : ellipsis;overflow : hidden;">
												 <nobr>${b.content }</nobr>  </td>
												<td>									<!-- jstl format이용해서 보기쉽게 날짜표현해준다 -->
												 <fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd hh:mm"/></td> 
											</tr>
										</c:forEach>
									</tbody>
								</table>							<!-- onclick으로 글작성버튼 처리 -->
								<button class="btn btn-success" onclick="ex_post();"> post </button>
								<!-- 페이지네이션  -->
								<nav aria-label="Page navigation example" >
									<ul class="pagination">${sb}</ul>
								</nav>
							</div>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons">access_time</i> updated 4 minutes ago
							</div>
						</div>
					</div>
				</div>
			</div><!--  content 끝  -->
			
			<!--  #3 운동  해당운동을 얼만큼 했는디 progressBar로 표현한다 -->
			
			<div class="row">
			<div class="col-md-6">
					<div class="card">
						<div class="card-header" data-background-color="green">
						<h4>운동 진행 상태</h4>
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
										<c:forEach items="${cate_menu_count }" var="ca">
										
										<c:if test="${ca.cate_count >= 10 }">
									
										<div class="progress">
											<div data-placement="top" style="width: 100%;"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="${ca.cate_count*10}"
												role="progressbar" class="progress-bar progress-bar-success">
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
												role="progressbar" class="progress-bar  progress-bar-info">
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
								<i class="material-icons">access_time</i> updated 4 minutes ago
							</div>
						</div>
					</div>
				</div>

				<!--  #4 해당 운동을 얼만큼 했는지 평가해서 등급을 표현해준다.-->
				<div class="col-md-6">
					<div class="card">
						<div class="card-header" data-background-color="green">
						<h4>운동 평가</h4>
						</div>
						<div class="card-content2">
							<c:forEach items="${cate_menu_count_comment }" var="a">  
									<c:if test="${a.cate_count ge 10 and a.grade eq 'A' }">
									 <div class="notice notice-success">
        							<strong>선택한 ${a.cate}메뉴의 등급 ${a.grade } 입니다.</strong><br/> ${a.comment }
    									</div>
									</c:if>
										<c:if test="${8 <=a.cate_count  and a.cate_count < 10 and a.grade eq 'B' }">
									
									    <div class="notice notice-info">
        								<strong>선택한 ${a.cate}메뉴의 등급 ${a.grade } 입니다.</strong><br/> ${a.comment }
    									</div>
									</c:if>
										<c:if test="${6 <=a.cate_count  and a.cate_count < 8 and a.grade eq 'C' }">
									<div class="notice notice-warning">
   				 					<strong>선택한 ${a.cate}메뉴의 등급 ${a.grade } 입니다.</strong><br/> ${a.comment }
   									 </div>
    								</c:if>
    								<c:if test="${  a.cate_count < 6 and a.grade eq 'D' }">
									<div class="notice notice-danger">
									 <strong>선택한 ${a.cate}메뉴의 등급 ${a.grade } 입니다.</strong><br/> ${a.comment }
   									</div>
									</c:if>
									</c:forEach>
   							</div>
							<div class="card-footer">
								<div class="stats">
									<i class="material-icons">access_time</i> updated 4 minutes ago
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<!--   Core JS Files   -->
<!-- <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script> -->
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<!-- <script src="assets/js/bootstrap-checkbox-radio.js"></script> -->

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<!-- <script src="assets/js/paper-dashboard.js"></script> -->


</html>
