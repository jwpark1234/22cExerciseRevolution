<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<style>
.oaerror {
  width: 90%; /* Configure it fit in your design  */
  margin: 0 auto; /* Centering Stuff */
  background-color: #FFFFFF; /* Default background */
  padding: 20px;
  border: 1px solid #eee;
  border-left-width: 5px;
  border-radius: 3px;
  margin: 0 auto;
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
}
.danger {
  border-left-color: #d9534f; /* Left side border color */
  background-color: rgba(217, 83, 79, 0.1); /* Same color as the left border with reduced alpha to 0.1 */
}

.danger strong {
  color:  #d9534f;
}

.warning {
  border-left-color: #f0ad4e;
  background-color: rgba(240, 173, 78, 0.1);
}

.warning strong {
  color: #f0ad4e;
}

.info {
  border-left-color: #5bc0de;
  background-color: rgba(91, 192, 222, 0.1);
}

.info strong {
  color: #5bc0de;
}

</style>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	var cate = 0;
	$(function() {
		$("input[id=mImg]").change(function() {
			var form = $("#form");
			var formData = new FormData(form);
			
			formData.append('file', this.files[0]);
			$.ajax({
				type : 'post',
				url : 'fileUploadAction.do',
				data : formData,
				processData : false,
				contentType : false,
				success : function(savefile) { // 업로드 성공하면 파일명을 받아온다.
					$('#mainImg').val(JSON.parse(savefile).savefile);
				},
				error : function(error) { // 실패할 경우 에러메세지 출력
					console.log(error);
					console.log(error.status);
					alert(error + ", " + error.status);
				}
			});
		});
	});
	$(function() {
		$("input[id=cImg1]").change(function() {
			var form = $("#form");
			var formData = new FormData(form);
			formData.append('file', this.files[0]);
			$.ajax({
				type : 'post',
				url : 'fileUploadAction.do',
				data : formData,
				processData : false,
				contentType : false,
	            success : function( data ) { // 업로드 성공하면 파일명을 받아온다.
	            	var data2 = JSON.parse(data);
	                var savefile = data2.savefile;
	                   
					$('#contentImg').val(savefile);
				},
				error : function(error) { // 실패할 경우 에러메세지 출력
					console.log(error);
					console.log(error.status);
					alert(error + ", " + error.status);
				}
			});
		});
	});

	$(function() {
		$("#ck")
				.click(
						function() {
							var regExp = /^[0-9]*$/;
							if (cate == 0) {
								$('#alertContent').html("이벤트 종류를 선택해주세요.");
								$('#myModal10').modal('show');
								return;
							} else if ($("#subject").val() == "") {
								$('#alertContent').html("제목을 입력해주세요.");
								$('#myModal10').modal('show');
								$("#subject").focus();
								return;
							} else if ($("#date1").val() == "") {
								$('#alertContent').html("일정을 입력해주세요.");
								$('#myModal10').modal('show');
								$("#date").focus();
								return;
							} else if ($("#cate2").val() == "") {
								$('#alertContent').html("인원을 입력해주세요.");
								$('#myModal10').modal('show');
								$("#cate2").focus();
								return;
							} else if ($("#cate3").val() == "") {
								$('#alertContent').html("인원을 입력해주세요.");
								$('#myModal10').modal('show');
								$("#cate3").focus();
								return;
							}
							else if ($("#discount1").val() == "") {
								$('#alertContent').html("할인율을 입력해주세요.");
								$('#myModal10').modal('show');
								$("#discount1").focus();
								return;
							}
							else if ($("#form #level").val() == "") {
								$('#alertContent').html("제한레벨을 입력해주세요.");
								$('#myModal10').modal('show');
								$("#level").focus();
								return;
							} 
							else if ($("#mainImg").val() == "") {
								$('#alertContent').html("메인이지미를 선택해주세요.");
								$('#myModal10').modal('show');
								$("#mImg").focus();
								return;
							} else if ($("#contentImg").val() == "") {
								$('#alertContent').html("내용이지미를 선택해주세요.");
								$('#myModal10').modal('show');
								$("#cImg").focus();
								return;
							}
							if (!regExp.test($("#level").val())) {
								$('#alertContent').html("숫자만 입력해주세요(정수 값).");
								$('#myModal10').modal('show');
								$("#level").val("");
								$("#level").focus();
								return;
							} else if (!regExp.test($("#cate2").val())) {
								$('#alertContent').html("숫자만 입력해주세요(정수 값).");
								$('#myModal10').modal('show');
								$("#cate2").val("");
								$("#cate2").focus();
								return;
							} else if (!regExp.test($("#cate3").val())) {
								$('#alertContent').html("숫자만 입력해주세요(정수 값).");
								$('#myModal10').modal('show');
								$("#cate3").val("");
								$("#cate3").focus();
								return;
							}
							else if (!regExp.test($("#discount1").val())) {
								$('#alertContent').html("숫자만 입력해주세요(정수 값).");
								$('#myModal10').modal('show');
								$("#discount1").val("");
								$("#discount1").focus();
								return;
							}
							var add = $("#form").serialize();
							
							
							$
									.ajax({
										type : "POST",
										url : "event_main_writeAction.do",
										data : add,
										contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
										dataType : 'html',
										success : function(data) { // Action클래스에서 리턴하면 여기로 돌아옴!!!

											location.href = data;
										},
										error : function(data) {
											alert("에러");

										}
									});

						});
	});
	$(function() {
		$("select[id=cate]").change(function() {
			$('#cent').show();
			if ($("#cate").val() == "선착순") {
				cate = 1;
				$('#cImg').show();
				$('#discount').hide();
				$("#cate1").html("선착순 인원");
				$("#sub").html("이벤트 명");
				$('#dcate1').show();
				$("#discount1").attr('value',0);
				$("#cate2").prop('type', 'text');
				$("#cate2").attr('name', 'total');
				$("#cate3").attr('name', 'give');
				$("#date").hide();
			} else if ($("#cate").val() == "추첨") {
				cate = 2;
				$('#cImg').show();
				$('#dcate1').show();
				$('#discount').hide();
				$("#cate1").html("추첨 인원");
				$("#sub").html("이벤트 명");
				$("#cate2").prop('type', 'text');
				$("#cate2").attr('name', 'give');
				$("#cate3").attr('name', 'total');
				$("#discount1").attr('value',0);
				$("#date").show();
				
			} else if ($('#cate').val() == "쿠폰") {

				cate = 3;
				$('#cImg').hide();
				$('#discount').show();
				$("#sub").html("쿠폰 명");
				$('#dcate1').hide();
				$("#cate2").attr('name', 'total');
				$("#cate2").attr('value', 0);
				$("#cate3").attr('name', 'give');
				$("#discount1").attr('value',"");
				$("#date").show();
				$("#contentImg").attr('value', 'XX');
				
			} 
		});
	});
</script>
<body>
	<jsp:include page="../side.jsp">
	<jsp:param value="event_admin" name="selectMenu"/>
	</jsp:include>
	<div class="main-panel">
		<jsp:include page="../top.jsp"></jsp:include>
		<div class="container">
			<div class="col-lg-a"></div>
			<div class="col-lg-a">
				<div class="jumbotron" style="padding-top: 20px;" >
				
					<form method="post" id="form" action="event_main_writeAction.do">
						<h3 style="text-align: center;">메인이벤트</h3>
						<input type="hidden" name="id" value="${sessionScope.Id }">
						
						<div align="center">
						<div class="form-group" style="width:500px;">
							<select id="cate" name="cate" size="1" class="form-control">
								<option selected="selected" value="종류">종류
								<option value="선착순">선착순
								<option value="추첨">추첨
								<option value="쿠폰">쿠폰
							</select>
						</div>
						</div>
						<div class="oaerror danger">
							작성자 : ${sessionScope.Id }
						</div>
						<div id="cent" style="display: none;">
						
							<div class="oaerror warning">
								<span id="sub"></span>
								<input type="text" id="subject" name="subject">
							</div>
						
							<div id="discount" class="oaerror info">
								할인율 <input type="text" name="discount" id="discount1" placeholder="정수 값">
							</div>
							
							<div id="dcate1" class="oaerror danger" >
								<span id="cate1"></span>
								<input type="hidden" id="cate2"	placeholder="정수 값" />
								<input type="hidden" id="cate3" value=0>
							</div>
							
							<div class="oaerror warning">
								제한 레벨
								<input type="text" id="level" name="level" placeholder="정수 값">
							</div>
						
							<div class="oaerror info">
								메인 이미지 선택 : <input type="file"  name="mImg" id="mImg" style="display:inline;" />
								<input type="hidden" id="mainImg" name="mainImg">
							</div>
							<div id="cImg" class="oaerror danger"> 
								내용 이미지 선택 : <input type="file"  name="cImg" id="cImg1" style="display:inline;">
								<input type="hidden" id="contentImg" name="contentImg">
							</div>
							<div id="date" class="oaerror warning">
								기한 : <input	type="date"  name="date" id="date1" value="2018-01-01">
							</div>
								<input type="button"class="btn btn-primary form-control" value="등록" name="ck" id="ck" >
								<input type="reset"	class="btn btn-primary form-control" value="다시쓰기">
						</div>	
					</form>
				</div>
			</div>
		</div>

	</div>

</body>
</html>