<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="popover-content-login" class="hide">

		<div class="card-avatar" align="center"
			style="height: 150px; background-image: url('user/background.jpg'); border-radius: 20px;">
			<img class="img" src="upload/${sessionScope.Member_pic}"
				style="width: auto; height: 150px; margin: auto; border-radius: 10px;">
		</div>
		<div class="card-avatar" align="center">
			<font size="25px">${sessionScope.Nickname }</font><br /> <font
				color="gray" style="font-size: 25px;">${sessionScope.Id }</font>
		</div>
		<div class="card-avatar" align="center">
			<img src="images/level/${sessionScope.Level }.jpg"
				style="width: 22px; height: 22px;" /> <a class="category text-gray">${sessionScope.Level}레벨</a>
			<font>( ${sessionScope.Exp} / ${sessionScope.nextLevel} )</font><br />
			<br /> <font>내 포인트 : ${sessionScope.Point} P</font>

		</div>
		<div class="card-avatar" align="center">
			<button class="btn btn-info" onclick="namecard_myinfo()">내
				정보 보기</button>
			<button class="btn btn-danger" onclick="namecard_logout()">로그아웃</button>
		</div>
	</div>
</body>
</html>