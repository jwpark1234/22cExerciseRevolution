<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#chatroom {
	background: white;
	padding:10px;
}
.sendMessage {
	width:50%;
    float:right;
    margin:10px;
}
.sendMessage span{
	float:right;
}
.sendMessage p {
    background: #7266ba;
    color: #ffffff;
    border-radius: 8px 8px 0 8px;
    padding:5px;
    box-shadow:0px 2px 2px silver;
    min-height: 30px;
    white-space: normal;
	word-break: normal;
	word-wrap: break-word;
}
.receiMessage {
	width:50%;
	margin:10px;
}
.receiMessage p {
    background: #ebebeb;
    color: #333333;
    border-radius: 8px 8px 8px 0;
    padding:5px;
    box-shadow:0px 2px 2px silver;
    min-height: 30px;
    white-space: normal;
	word-break: normal;
	word-wrap: break-word;
}
.chatNotice {
	padding:5px;
	background-color: #eeeeee;
	text-align: center;
}
.date {
	font-size: 12px;
}
</style>
</head>
<body>
<script type="text/javascript">
$(function(){
	if('${sessionScope.chatSum}' == 0) {
		$('.notification').hide();
	}
	else {
		$('.notification').text('${sessionScope.chatSum}');
	}
});

</script>
<!-- DB에 저장된 메세지들을 가져와서 뿌려주는 페이지
	내가 보낸 메세지냐 받은 메세지냐에 따라 디자인을 다르게 하여 뿌려진다.
 -->
<div id="chatroom" style="overflow-y:scroll; height:420px;">
<c:forEach var="l" items="${chatRoom_list}">
	<c:if test="${l.from_id eq sessionScope.Id}"> <!-- 내가 보낸메세지 -->
		<div class="sendMessage">
	</c:if>
	<c:if test="${l.from_id ne sessionScope.Id}">	<!-- 내가 받은메세지 -->
		<div class="receiMessage">
	</c:if>
		<c:if test="${l.from_id ne sessionScope.Id}">
			<img src="images/level/${l.from_level }.jpg" style="width:22px; height:22px;"><span><b>${l.from_id}</b></span>
		</c:if>
		<p>${fn:replace(l.message, cn, br)}</p>
		<span class="date"><fmt:formatDate value="${l.regdate}" type="both" dateStyle="default" timeStyle="default"/></span>
	</div>
	<div style="clear:both"></div>
</c:forEach>
</div>			
</body>
</html>