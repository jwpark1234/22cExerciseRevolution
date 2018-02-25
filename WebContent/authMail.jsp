<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 인증 페이지</title>
<link rel="stylesheet" href="../css/main.css"/>
<style type="text/css">
	#reg_form {
		box-shadow: none;
		margin-top: 20px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">

var authNum = 0;
$(document).ready(function(){

		var email = '<%=request.getParameter("to")%>';

		$.ajax({
			type : 'POST',
			url : 'authMail.do',
			data : {email : email},
			dataType:'html',
			success:function(data){
				if(data != "") {
					alert("인증 메일 발송!");
					authNum = data*1;
				}
				else {
					alert("인증 메일 발송 실패! 메일 주소를 다시 확인해주세요.");
					window.close();
				}
		  },
		  error:function(Check){
			  alert("에러");
		  }
	});
});

	function check() {
		var code = document.getElementById("code").value;

		if(!code) {
			alert("인증번호를 입력하세요.");
			return false;
		}
		
		if(authNum == code) {
			alert("인증 성공!");
	         opener.email_Check = true;
	         opener.Check_email();
	         window.close();
		} else {
			alert("인증번호가 틀립니다. 다시 입력해 주세요.");
			return false;
		}
	}
</script>
</head>
<body>
	<form id="reg_form" onsubmit="return check();">
		<label for="code">인증번호</label>
		<input type="text" name="code" id="code" class="textWithBtn"/>
		<input type="submit" class="btn" value="확인"/>
	</form>
</body>
</html>














