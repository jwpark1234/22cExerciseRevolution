<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<!--  <link rel="stylesheet" href="event/jquery.countdown.css" /> -->
</head>
<body>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">

function joinUser(sub, cate){ // 이벤트에 참여한 유저현황 확인
	$.ajax({
		type:'post',
		url : "event_adminList.do",
		data : {subject : sub,
				cate : cate},
		success:function(data){
		$('#cont12').html(data);			
		},
		error : function(error) {
			alert(error + ", " + error.status);
		}
	});
}
$(function() {	// 이벤트 등록
	
			$.ajax({
				type : "POST",
				url : "event_main_check.do",
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType : 'html',
				success : function(data) { 
					if (data=="no")
						$('#eventM').html('진행중인 이벤트가 없습니다.');
				},
				error : function(data) {
					alert("에러");			
			}
			});
	
	$("#write").click(function(){
		  location.href='event_main_write.do';
	  });
	$("input[id=change]").change(function() {
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
				
				$('#change1').val(JSON.parse(savefile).savefile);
			},
			error : function(error) { // 실패할 경우 에러메세지 출력
				console.log(error);
				console.log(error.status);
				alert(error + ", " + error.status);
			}
		});
	});
});

function mainChange(){	// 메인이벤트 페이지 우측 화면 변경
	if($('#change1').val()==""){ // 이미지 선택 안했을 시 modal띄우고 return
		$('#alertContent').html("변경할 이미지를 선택해주세요.");
		$('#myModal10').modal('show');
		return;
	}
	$.ajax({ // 이미지 변경.
		type : 'post',
		url : 'event_main_change.do',
		data : {img : $('#change1').val()},
		success : function() { 
			$('#alertContent').html("변경완료.");
			$('#myModal10').modal('show');
		},
		error : function(error) { 
			alert('에러');
		}
	});
}
</script>
<jsp:include page="../side.jsp">
	<jsp:param value="event_admin" name="selectMenu"/>
	</jsp:include>
<div class="main-panel">
<jsp:include page="../top.jsp"></jsp:include>
<div class="content">
<div class="container-fluid">
	<div class="col-md-6"></div>
	<div class="col-md-6">
		<div class="card" style="background: #eee;">
			<div class="card-content">
				<div class="col-md-1"></div>
				<div class="col-md-5" >
					메인이벤트 페이지 우측 그림 바꾸기<br>
					사진 규격 : 580X770 <br>
					현재 메인 우측 이미지 : ${mainRight }<br>
				</div>
				<div class="col-md-6">
					<input type="file" id="change"">
					<button onclick="mainChange()" class="btn">변경</button>
					<input type="hidden" id="change1" value="">
				</div>
			</div>
		<div class="card-footer" ></div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			메인 이벤트 등록 &nbsp;&nbsp;
			<input type="button" value="메인 이벤트 등록" id="write">
		</div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-7" id="eventM">		
	
		<c:if test="${fn:length(eventMain) != 0 }">
		<c:forEach items="${eventMain }" var="list">
			<a href="javascript:void(0)" onclick="joinUser('${list.subject}','${list.cate }')"><img src="upload/${list.imgMain }" style="width:48%; height:250px"></a>
		</c:forEach>
		</c:if>
	</div>
	<div id="cont12" style=" background-repeat:no-repeat; border: 1px solid gray; float: left; background-size:100%; height:850px;" class="col-md-5">
		<h1><span id="subject">메인 이미지를 선택하면<br>참여한 유저 현황이<br>표시됩니다.</span></h1>
	</div>
</div>

</div>
</div>
</body>
</html>