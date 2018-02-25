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

Action클래스에서 return한 페이지 주소가 data로 넘어온다 
그걸 다시 jsp페이지의 센터로 바꿔치기 하는거에요.

_board.jsp에 글제목 눌렀을때  해당 글정보를 넘겨준다.
  -->

</head>

<body>
	
	<script type="text/javascript">
		
// 	 /*  
   	
// 	   데이터 값이 넘겨줄때 "num ="+num 이런식으로 
// 	   여러개면 "num="+num &"name="+name ? 콤마 주의 
// 	   	*/
	
	function ex_delete(){
			$.ajax({
				type : "POST",
				url : "ex_delete.do",
				data : {
					num:'${dto.num}'
				},
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType : 'html',
				success:function(data){
					location.href=data;
				},
				error:function(data){
					alert("ex_delete 에러!");
				}
			})
		}

		 function ex_update() {
			$.ajax({
				type : "POST",
				url : "ex_update.do",
				data : {
					num:'${dto.num}',
					subject: $('#form_subject').val(),
					content: $('#form_content').val()
				} ,
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType : 'html',
				success:function(data){
					location.href=data;
				},
				error:function(data){
					alert("ex_update 에러!");
				}
			})
		}
			//뒤로가기 눌렀을때 메인페이지로 이동한다.
		function goBack() {
			location.href='exercise_board.do';
		}
		
	</script>

	<form id="ex_postForm" class="form-horizontal" method="post">
		<div class="container">	
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="form_subject">제목 *</label> 
							<input id="form_subject" type="text" name="subject"
							 class="form-control" placeholder="Please enter your firstname *"
								required="required" data-error="Firstname is required."
								value="${dto.subject }">
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="form_content">운동내용 *</label>
									<textarea id="form_content" name="content" class="form-control"
										placeholder="Message for me *" rows="6" required="required"
										data-error="Please,leave us a message.">${dto.content }</textarea>
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<input type="button" onclick="ex_delete()" value="삭제"  
								   class="btn btn-danger btn-send"	>	&nbsp;&nbsp; 
								<input type="button" onclick="ex_update()" value="수정"
								   class="btn btn-success btn-send" >  &nbsp;&nbsp; 
								<input type="button" value="뒤로" onclick="goBack();"
								 class="btn btn-info btn-send">
							</div>
						</div>
		</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="validator.js"></script>
	<script src="contact.js"></script>


</body>
</html>