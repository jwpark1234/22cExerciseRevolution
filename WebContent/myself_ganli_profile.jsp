<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!--  유저 간단한 리스트 -->
<body>
<div class="col-md-3 well">
 <div class="card well" style="width: 20rem; ">
  <img class="card-img-top" src="upload/${user1.member_pic }" alt="Card image cap">
  <div class="card-block">
    <p class="card-text">
${fn:replace(user1.address,'%',' ') }
</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">${user1.nickname }</li>
    <li class="list-group-item">${user1.height }</li>
    <li class="list-group-item">${user1.weight }</li>
  </ul>
  <div class="card-block">
    <a href="#" class="card-link">${user1.email }</a><br/>
    <a href="#" class="card-link">${user1.phonenum }</a>
  </div>
</div>
    </div>
</body>
</html>