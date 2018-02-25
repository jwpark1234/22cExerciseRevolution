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
<body>

<script type="text/javascript">
</script>
<jsp:include page="side.jsp">
<jsp:param value="developers" name="selectMenu"/>
</jsp:include>
<div class="main-panel">
            <jsp:include page="top.jsp"></jsp:include>
            <!--  본내용 -->
            <div class="content">
                <div class="container-fluid">
                	<div class="row">
                		<div class="col-md-3">
							<div class="card">
                                <div class="card-header" data-background-color="purple">
                                    <h4 class="card-title">22세기 운동혁명!!</h4>
                                </div>
                                <div class="card-content">
                                	<h4 class="title"><b>『22세기 운동혁명!!』은?</b></h4>
                                </div>
                              		<ul>
                                	<li>회원의 운동계획과 식단을 관리, 분석결과 제공</li>
                                	<li>운동정보를 공유하는 게시판, 상담방 기능</li>
                                	<li>운동계획에 맞는 상품을 구매할 수 있는 쇼핑몰 기능</li>
                                	<li>각종 이벤트로 회원들에게 동기 및 혜택 부여</li>
                              		</ul>
                               	<div class="card-content">
                                	<h4 class="title"><b>개발기술</b></h4>
                                </div>
                               	<ul>
                               		<li>사용언어 : JSP, Javascript, EL, JSTL, Java, Mysql(DB)</li>
                               		<li>사용기술 : MVC2 Model, Ajax, JSON, Websocket</li>
                               		<li>디자인 : Bootstrap기반 Material Dashboard UI</li> 
                               	</ul>
                            </div>
						</div>
						<div class="col-md-3">
							<div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="assets/img/faces/marc.jpg" />
                                    </a>
                                </div>
                                <div class="content">
                                    <h6 class="category text-gray">조장, 유저페이지</h6>
                                    <h4 class="card-title">조휘제</h4>
                                    <p class="card-content">
                                        Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                                    </p>
                                    <a href="#pablo" class="btn btn-primary btn-round">Follow</a>
                                </div>
                            </div>
						</div>
						<div class="col-md-3">
							<div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="assets/img/faces/marc.jpg" />
                                    </a>
                                </div>
                                <div class="content">
                                    <h6 class="category text-gray">쇼핑</h6>
                                    <h4 class="card-title">김락현</h4>
                                    <p class="card-content">
                                        Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                                    </p>
                                    <a href="#pablo" class="btn btn-primary btn-round">Follow</a>
                                </div>
                            </div>
						</div>
						<div class="col-md-3">
							<div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="assets/img/faces/marc.jpg" />
                                    </a>
                                </div>
                                <div class="content">
                                    <h6 class="category text-gray">운동관리</h6>
                                    <h4 class="card-title">류경훈</h4>
                                    <p class="card-content">
                                        Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                                    </p>
                                    <a href="#pablo" class="btn btn-primary btn-round">Follow</a>
                                </div>
                            </div>
						</div>
					</div>
					<div class="row">
						<br><br>
					</div>
					<div class="row">
						<div class="col-md-3">
							<div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="assets/img/faces/marc.jpg" />
                                    </a>
                                </div>
                                <div class="content">
                                    <h6 class="category text-gray">게시판</h6>
                                    <h4 class="card-title">박수정</h4>
                                    <p class="card-content">
                                        Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                                    </p>
                                    <a href="#pablo" class="btn btn-primary btn-round">Follow</a>
                                </div>
                            </div>
						</div>
						<div class="col-md-3">
							<div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="assets/img/faces/marc.jpg" />
                                    </a>
                                </div>
                                <div class="content">
                                    <h6 class="category text-gray">식단관리</h6>
                                    <h4 class="card-title">박지웅</h4>
                                    <p class="card-content">
                                        Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                                    </p>
                                    <a href="#pablo" class="btn btn-primary btn-round">Follow</a>
                                </div>
                            </div>
						</div>
						<div class="col-md-3">
							<div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="assets/img/faces/marc.jpg" />
                                    </a>
                                </div>
                                <div class="content">
                                    <h6 class="category text-gray">운동관리</h6>
                                    <h4 class="card-title">임상호</h4>
                                    <p class="card-content">
                                        Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                                    </p>
                                    <a href="#pablo" class="btn btn-primary btn-round">Follow</a>
                                </div>
                            </div>
						</div>
						<div class="col-md-3">
							<div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="assets/img/faces/marc.jpg" />
                                    </a>
                                </div>
                                <div class="content">
                                    <h6 class="category text-gray">이벤트</h6>
                                    <h4 class="card-title">임승환</h4>
                                    <p class="card-content">
                                        Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                                    </p>
                                    <a href="#pablo" class="btn btn-primary btn-round">Follow</a>
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