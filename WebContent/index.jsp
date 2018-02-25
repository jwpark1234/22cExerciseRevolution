<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>
<!-- 	<div class="wrapper" style="opacity: 0" id="index__center"> -->
		<!--  header is in top.jsp-->
		<jsp:include page="side.jsp"></jsp:include>

<!-- 		middle? middle is in center.jsp  -->

<!-- 		<div class="test" style="margin: 0 auto;"> -->
			<jsp:include page="centerMain2.jsp"></jsp:include>
<!-- 		</div> -->
<!-- 	</div> -->


	<!--      Core JS Files   -->
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/material.min.js" type="text/javascript"></script>
	<!--     Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>
	<!--     Dynamic Elements plugin -->
	<script src="assets/js/arrive.min.js"></script>
	<!--     PerfectScrollbar Library -->
<!-- 	<script src="assets/js/perfect-scrollbar.jquery.min.js"></script> -->
	<!--     Notifications Plugin    -->
	<script src="assets/js/bootstrap-notify.js"></script>
	<!--    Material Dashboard javascript methods -->
	<script src="assets/js/material-dashboard.js?v=1.2.0"></script>

</body>
</html>