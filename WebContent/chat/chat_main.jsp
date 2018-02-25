<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <script type="text/javascript">

  $(document).ready(function(){
	  readChatRequest();	// 채팅방 목록을 뿌려줌
	  
	  $('.insertPanel').hide();
  });
  
  // 채팅방 목록 뿌려주기
  function readChatRequest() {
	  $.ajax({  
		  type: "Post",
           url: 'chatReqRead.do',
           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
           dataType:'html',
           success: function(data)
           {
				$('.chatRequestPanel').empty();
				$('.chatRequestPanel').html(data);
           },
           error:function(data){
        	   alert("에러");
           }
      });
  }
  
  // 채팅방을 선택한 경우
  function selectChatRequest(idx, req_id) {
	  $('#message').val('');
	  $('.room').css('background','white');
	  
	  // 선택한 채팅방은 색깔이 변하고 안읽은 메세지 갯수가 없어짐
	  var nowRoom = $('#status'+idx).parents('.room');
	  nowRoom.css('background','#eeeeee');
	  nowRoom.find('.badge').hide();
	  
	  // 이미 웹소켓이 열려있으면 연결을 끊는다
	  onClose();
	  
	  // 선택한 채팅방의 상태를 확인함
		$.ajax({  
			  type: "Post",
	           url: 'chatReqStatus.do',
	           async: false,
	           data: {
	        	   idx : idx
	           },
	           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	           dataType:'html',
	           success: function(data)
	           {
	        	   var status = data*1;
	        	   var resp_level = 1; // 초기화
	        	   
	        	   // 선택한 채팅방이 운영자와의 채팅방이면
	        	   // 입력창을 숨김
	        	   if($('#resp_id'+idx).val() == 'admin') {
	        			  resp_level = 6;
	        			  status = 1;
	        			  $('.chatRoomPanel').show();
	        			  if('${sessionScope.Id}' != 'admin')
	        			  	$('.insertPanel').hide();
	        			  else 
	        				$('.insertPanel').show();
	        			  
	        			 
	        	   }
	        	   
	        	   // 내가 고레벨이면
	        	   else if('${sessionScope.Level}' >= 4) {
	        			  
	        		   // 상담신청 방이면
	        			  if(status == 2) {
	        				  if(!confirm("상담을 시작하시겠습니까?")) return;  
	        				  
	        				  // 내가 상담자가 되고 채팅방을 연다.
	        				  $('#status'+idx).text("상담 중");
	        				  $('#status'+idx).removeClass('label-danger');
	        				  $('#status'+idx).addClass('label-success');
	        				  $('#status'+idx).after(" - <img src='images/level/" + '${sessionScope.Level }.jpg' + "' style='width:22px; height:22px;'><b><span id='resp${list.idx}'>" + '${sessionScope.Id}' + "</span></b>");
	        				  $('.chatRoomPanel').show();
	        				  $('.insertPanel').show();
	        			  }
	        		   // 상담중인 방이면
	        			  else if(status == 1) {
	        				  
	        				  // 내가 상담자가 아닌 채팅방 접근할 수 없게 막고 리턴
	        				  if($('#resp_id'+idx).val() != '${sessionScope.Id}') {
		        				  $('#alertContent').html('이미 상담 중입니다.');
		        				  $('#myModal10').modal('show');
	        					  $('.chatRoomPanel').hide();
	        					  $('.insertPanel').hide();
	        					  nowRoom.css('background','white');
	        					  return;
	        				  }
	        				  
	        				  // 아니면 채팅할 수 있게 입력창 보여줌
	        				  $('.insertPanel').show();
	        			  }
	        		   
	        		   // 상담이 종료된 채팅방이면 접근막고 리턴
	        			  else if(status == 0) {
	        				  $('#alertContent').html('상담이 종료되었습니다.');
	        				  $('#myModal10').modal('show');
	        				  $('.chatRoomPanel').hide();
	        				  $('.insertPanel').hide();
	        				  nowRoom.css('background','white');
	        				  return;
	        			  }
	        			  
	        			  $('#resp_id'+idx).val('${sessionScope.Id }');
	        			  resp_level = '${sessionScope.Level}';
	        		  }
	        	   
	        	   // 내가 저레벨이면
	        		  else {
	        			  
	        			  // 아직 상담자가 없으면 접근 막고 리턴
	        			  if($('#status'+idx).text() == "상담요청") {
	        				  $('#alertContent').html('상담요청 상태입니다.');
	        				  $('#myModal10').modal('show');
	        				  $('.chatRoomPanel').hide();
	        				  $('.insertPanel').hide();
	        				  nowRoom.css('background','white');
	        				  return;
	        			  }
	        			  
	        			  // 상담 종료한 방이면 입력창만 숨기고 보여줌
	        			  else if(status == 0) {
	        				  $('.chatRoomPanel').show();
								$('.insertPanel').hide();
	        			  }
	        			  
	        			  // 상담중인 방이면 다 보여줌
	        			  else {
	        				  $('.chatRoomPanel').show();
	        				  $('.insertPanel').show();
	        			}
	        		  }
	        	   
	        	   // 해당 채팅방의 메세지들을 가져옴
	        		  $.ajax({ 
	        			  type: "Post",
	        	           url: 'chatRead.do',
	        	           data: {
	        	        	   idx : idx,
	        	        	   req_id : req_id,
	        	        	   resp_id : $('#resp_id'+idx).val(),
	        	        	   resp_level : resp_level,
	        	        	   status : status
	        	           },
	        	           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	        	           dataType:'html',
	        	           success: function(data)
	        	           {
	        	        	   // 종료된 채팅방이 아닐 경우 채팅 시작함
	        	        	   if(status != 0) {
	        	        		   startChat();
	        	        	   }
	        					$('.chatRoomPanel').empty();
	        					$('.chatRoomPanel').html(data);
	        					$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
	        	           },
	        	           error:function(data){
	        	        	   alert("에러");
	        	           }
	        	      });
	           },
	           error:function(data){
	        	   alert("에러");
	           }
	      });
  }
  
  // 채팅종료버튼을 누른 경우
  function quit(idx) {
	  event.stopPropagation();
	  $.ajax({  
		  type: "Post",
           url: 'chatQuit.do',
           data: {
        	   idx : idx
           },
           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
           dataType:'html',
           success: function(data)
           {
        	   // 채팅방 목록을 갱신하고 입력창 숨김
				$('.chatRequestPanel').empty();
				$('.chatRequestPanel').html(data);
				$('.insertPanel').hide();
           },
           error:function(data){
        	   alert("에러");
           }
      });
  }
  
  // 채팅방을 삭제한 경우
  function deleteReq(idx) {
	  event.stopPropagation();
	  $.ajax({  
		  type: "Post",
           url: 'chatDelete.do',
           data: {
        	   idx : idx
           },
           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
           dataType:'html',
           success: function(data)
           {
        	   // 채팅방 목록을 갱신하고 선택한 채팅방을 닫음
				$('.chatRequestPanel').empty();
				$('.chatRequestPanel').html(data);
				$('.chatRoomPanel').empty();
           },
           error:function(data){
        	   alert("에러");
           }
      });
  }
  $(function(){
	  
	  // 주제를 입력하고 상담 신청 버튼을 누른 경우
		$('#req_btn').click(function(){
			
			// 내 보유 포인트가 100포인트 보다 작으면 상담 불가
			if('${sessionScope.Point }' < 100) {
				$('#alertContent').html('포인트가 부족합니다.');
				$('#myModal10').modal('show');
			 	return;
			}
			
			// 상담주제를 입력하지 않은 경우도 상담 불가
			if($('#req_subject').val().length == 0) {
				$('#alertContent').html('상담 주제를 입력하세요.');
				$('#myModal10').modal('show');
				return;
			}
			
			if(!confirm("상담을 신청하시겠습니까?")) return;
			
			// 입력한 주제로 상담신청을 하고 채팅방을 만듬
			  $.ajax({  
				  type: "Post",
		           url: 'chatReqInsert.do',
		           data: {
		        	   req_subject : $('#req_subject').val()
		           },
		           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		           dataType:'html',
		           success: function(data)
		           {
		        	   // 채팅방 리스트 갱신하고 상담주제 입력창 초기화
						$('.chatRequestPanel').empty();
						$('.chatRequestPanel').html(data);
						$(".chatRequestPanel").scrollTop($(".chatRequestPanel")[0].scrollHeight);
						$('#req_subject').val('');
		           },
		           error:function(data){
		        	   alert("에러");
		           }
		      });	
		});
  });
  </script>
<style type="text/css">
.insertPanel, .insertPanel2 {
	margin-top:10px;
	margin-bottom:20px;
}
.width6{
	padding:0px;
}
</style>
</head>

<body>
<%
   //치환 변수 선언
    pageContext.setAttribute("cn", "\n"); //Enter
    pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
	<div class="card">
        <div class="card-header" data-background-color="purple">
            <h4 class="title">1:1 상담</h4>
            <p class="category">Lv1~3회원이 Lv4~5회원에게 상담을 신청하고 1:1 상담을 진행합니다.</p>
        </div>
        <div class="card-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6 width6">
						<div class="chatRequestPanel" style="overflow-y:scroll; height:420px;">
						</div>
						<div class="insertPanel2" style="height:50px;">
							<c:if test="${sessionScope.Level < 4}"> <!-- 저레벨만 상담신청 가능 -->
								<table width=100%>
									<tr>
										<td><textarea class="form-control" id="req_subject" cols="60" placeholder="상담신청은 100포인트가 소모됩니다."></textarea></td>
										<td><button class="btn btn-primary" id="req_btn">신청</button></td>
									</tr>
								</table>
							</c:if>	
						</div>
					</div>
					<div class="col-md-6 width6">
						<div class="chatRoomPanel" style="height:420px;">
						</div>
						<div class="insertPanel" style="height:50px;">
							<table width=100%>
								<tr>
									<td>	
										<textarea onkeyUp="chkEnter();" class="form-control" id="message" cols="60" placeholder="메세지를 입력하세요."></textarea>
									</td>
									<td>
										<button class="btn btn-primary" onclick="send();">보내기</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
var webSocket = null;

 // 웹소켓 채팅 처리부분
function startChat() {
	 // broadcasting으로 접근하여 chat.java 클래스와 연동되게 한다.
	webSocket = new WebSocket('ws://' + '${pageContext.request.serverName}' + ':${pageContext.request.serverPort}' + '${pageContext.request.contextPath}' + '/broadcasting');
	 // 콜백함수들
	webSocket.onerror = function(event) {
		onError(event)
	};
	
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	
	webSocket.onmessage = function(event) {
		onMessage(event)
	};
	
	webSocket.onclose = function(event) {
		onClose(event)
	};
}	
 
 // 서버로부터 메세지를 받은 경우 채팅방에 뿌려준다 
function onMessage(event) {
	$("#chatroom").append(event.data);
	$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
}

 // 웹소켓 연결을 한 경우
function onOpen(event) {
//  	$("#chatroom").append("<div class='chatNotice'>상담방에 입장했습니다.</div><br>");
	$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
}

 // 연결 중 에러발생
function onError(event) {
	alert(event.data);
}

 // 연결 종료
function onClose(event) {
	if(webSocket != null) {
		webSocket.close();
	}
// 	$("#chatroom").append("<span>연결 종료</span><br>");
// 	$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
}

 // 내가 메세지를 입력하고 확인버튼을 누르면 동작
function send() {
	 // 현재 시간을 받아옴
	var date = new Date(); 
	var hour = date.getHours();
	var h = "";
	if(hour == 12) {
		h = "오후";
	}
	else if(hour > 12) {
		hour = date.getHours() - 12;
		h = "오후";
	}
	else if(hour < 12) {
		hour = date.getHours();
		h = "오전";
	}
	var now = date.getFullYear() + ". " + (date.getMonth()+1) + ". " + date.getDate() + " " + h + " " + hour + ":" + date.getMinutes() + ":" + date.getSeconds();
	
	// 입력한 메세지가 내가 보는 채팅방에 바로 뿌려지고 webSocket.send()를 통해 chat.java에 onMessage()메서드를 호출하게 됨.
	// onMessage()메서드에서 채팅방 DB에 메세지가 저장되고 상대방에게 메세지가 전달되게 됨
	$("#chatroom").append("<div class='sendMessage'><p>" + $('#message').val().replace(/\n/gi,'<br>') + "</p><span>" + now + "</span></div><div style='clear:both'></div>");
	$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
	webSocket.send($('#message').val());
	$('#message').val('');
}

 // 엔터키를 누를 경우 바로 전송되게 함
function chkEnter() {
    if (event.which || event.keyCode) {
        if ((event.which == 13) || (event.keyCode == 13)) {
            send();
            return false;
        }
    }
    else {       
        return true;
    }
}


</script>
</body>
</html>