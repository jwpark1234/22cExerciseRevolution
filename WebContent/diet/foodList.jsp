<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	// 검색창에 검색어를 적을때마다 이 페이지는 갱신되는데 이미 disabled상태였던 <li>태그를 갱신된 후에도 disabled 상태로 맞춰주는 작업
	for(var i = 0; i < menu.length; i++) {

		var text = menu[i];
		
		for(var j = 0; j < $('#List li').length; j++) {

			if(text == $('#List li').eq(j).text()) {
				$('#List li').eq(j).addClass('disabled');
			}
		}
	}
});

</script>
</head>
<body>
	<ul id="List" class="list-group" style="overflow-y:scroll; height:290px;">
	    <c:forEach items="${list}" var="l">
	     <li value="${l.calorie}" class="list-group-item">${l.name}  ${l.quantity}g &nbsp; &nbsp; ${l.calorie} Kcal</li>
	    </c:forEach>
	</ul>
</body>
</html>