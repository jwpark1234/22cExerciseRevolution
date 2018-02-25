<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.room {
	height: 80px;
	background:white;
	border:1px solid #eeeeee;
	padding:10px;
}
a {
	cursor:pointer;
}

.reqtime {
	font-size: 5px;
}
</style>
</head>
<body>
<!-- 상담요청 리스트(채팅방)를 뿌려주는 페이지
	나의 레벨에 따라 보여지는 목록이 달라진다
	가져온 채팅방에 따라 상담자가 누구인지가 보여진다.
 -->
	<c:if test="${fn:length(chatReq_list) eq 0}">
		<div class="text-center" style="margin-top:200px;"><b>상담 신청이 없습니다.</b></div>
	</c:if>
		<c:if test="${fn:length(chatReq_list) ne 0}">
			<c:forEach var="list" items="${chatReq_list}" varStatus="i">
				<div class="room" onclick="selectChatRequest('${list.idx}','${list.req_id}');">
					<input type="hidden" id="resp_id${list.idx}" value="${list.resp_id}">
					<table width=100%>
						<tr>
							<td>
								<!-- 운영자와의 채팅방 -->
								<c:if test="${list.resp_level eq 6 }">
									<!-- 일반 회원의 경우 -->
									<c:if test="${sessionScope.Id ne 'admin'}">
										<img src="images/level/${list.resp_level }.jpg" style="width:22px; height:22px;"><b><span id="resp${list.idx}">${list.resp_id}</span></b>
										<span id="status${list.idx}"></span>
									</c:if>
									<!-- 운영자의 경우 -->
									<c:if test="${sessionScope.Id eq 'admin'}">
										<img src="images/level/${list.req_level }.jpg" style="width:22px; height:22px;"><span><b>${list.req_id}</b></span>
										<span id="status${list.idx}"></span>
									</c:if>
								</c:if>
								<!-- 회원간의 채팅방 -->
								<c:if test="${list.resp_level lt 6 }">
									<img src="images/level/${list.req_level }.jpg" style="width:22px; height:22px;"><span><b>${list.req_id}</b></span>
									
									<!-- 채팅방의 상태가 상담요청 상태 -->
									<c:if test="${list.status eq 2}">
										<span class="label label-danger" id="status${list.idx}">상담요청</span>
									</c:if>
									
									<!-- 채팅방의 상태가 상담중 상태 -->
									<c:if test="${list.status eq 1}">
										<span class="label label-success" id="status${list.idx}">상담 중</span>
									</c:if>		
									
									<!-- 채팅방의 상태가 상담종료 상태 -->
									<c:if test="${list.status eq 0}">
										<span class="label label-info" id="status${list.idx}">상담종료</span>
									</c:if>
									
									<!-- 상담자가 있는 채팅방 -->	
									<c:if test="${list.resp_id ne ''}">
									- <img src="images/level/${list.resp_level }.jpg" style="width:22px; height:22px;"><b><span id="resp${list.idx}">${list.resp_id}</span></b>
									</c:if>
									
									<!-- 저레벨들은 채팅방을 종료하거나 삭제할 수 있음 -->
									<c:if test="${sessionScope.Level < 4}">
										<c:if test="${list.status eq 1}">
											<span><a onclick="quit('${list.idx}');"><i class="material-icons">close</i></a></span>
										</c:if>
										<c:if test="${list.status eq 0}">
											<span><a onclick="deleteReq('${list.idx}');"><i class="material-icons">delete</i></a></span>
										</c:if>	
									</c:if>	
								</c:if>
							</td>
							<td class="reqtime" align=right>
								<fmt:formatDate value="${list.regdate}" type="both" dateStyle="default" timeStyle="default"/>
							</td>
						</tr>
						<tr>
							<td colspan=2 style="padding:10px;">
								${list.subject} 
								<!-- 안읽은 메세지를 표시해줌 -->
								<c:if test="${checkMsg_list[i.index] ne 0}">
									<span class="badge" style="background-color: red; float:right;">${checkMsg_list[i.index]}</span>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</c:if>
</body>
</html>