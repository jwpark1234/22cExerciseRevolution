<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Lato:300,400,700'
	rel='stylesheet' type='text/css'>

<title>글쓰기</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>

<!-- 
_board.jsp에서 글작성 버튼누르면   사용자가 입력한 값 글작성을 한다. 
-->

</head>

<body>
	<script type="text/javascript">
		function ex_click() {
			// form태그에 사용자가 입력한 모든 값을 직렬화 하여 저장
			// input태그 name값=입력한값&input태그 name값=입력한값& ... 형식의 문자열로 저장됨
			var exData = $('#ex_postForm').serialize();
			// 직렬화한 데이터를 회원가입,수정 서블릿으로 전달한다.
				$.ajax({
						type : "POST",
						url : "ex_postAction.do",
						data : exData,
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType : 'html',
						success : function(data) {
							location.href=data;
						},
						error : function(data) {
							alert("에러");
						}
					});
		}
		function goBack() {
			location.href='exercise_board.do';
		}
	</script>

			<form id="ex_postForm" class="form-horizontal" method="post">
				<div class="container">
							<div class="controls">
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label for="form_subject">제목 *</label> <input
												id="form_subject" type="text" name="subject"
												class="form-control"
												placeholder="Please enter your firstname *"
												required="required" data-error="Firstname is required.">
											<div class="help-block with-errors"></div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label for="form_content">운동내용 *</label>
											<textarea id="form_content" name="content"
												class="form-control" placeholder="Message for me *" rows="6"
												required="required" data-error="Please,leave us a message."></textarea>
											<div class="help-block with-errors"></div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-5">
										<input type="button" onclick="ex_click()" value="등록"
											class="btn btn-success btn-send">&nbsp;&nbsp; 
										
										<input type="button" value="뒤로" onclick="goBack();"
										class="btn btn-success btn-send">
										
									</div>
								</div>
							</div>
						
				</div>
				<!-- /.container-->
		</form>

	<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="validator.js"></script>
	<script src="contact.js"></script>

</body>
</html>