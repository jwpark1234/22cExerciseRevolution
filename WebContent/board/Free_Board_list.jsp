<%@page import="java.util.ArrayList"%>
<%@page import="bean.BoardDto_Free"%>
<%@page import="dao.BoardDao_Free"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>22세기 운동혁명</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
<meta name="viewport" content="width=device-width" />
<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<!--  Material Dashboard CSS    -->
<link href="assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
<!--     Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="grid.css">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
 function Write_btn(){
   location.href="free_board_write.do";
	}
</script>
  
</head>
<body>
<jsp:include page="../side.jsp">
<jsp:param value="board_Free" name="selectMenu"/>
</jsp:include>
<div class="main-panel">
 <jsp:include page="../top.jsp"></jsp:include>
  <div class="content">
    <div class="col-md-6">
	 <div class="card" style="min-height:0px">
	  <div class="card-header card-chart" data-background-color="blue" style="min-height: 80px; background: linear-gradient(60deg, #1f05f5, #1dfff8); text-align: center">
	   <h3>어서오세요!!</h3>
	  </div>
<div class="container-fluid col-md-12" style="padding-bottom: 15px;">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
     <div class="item active">
       <div class="col-xs-6">
      <img src="board_img/f1.jpg" alt="12" style="width:350px; height:300px; border-radius:30px;">
       <div class="carousel-caption">
<!--         <h3>식단</h3> -->
<!--          <p>실생활에 유용한 식단 정보를 보실 수 있습니다</p> -->
         </div>
        </div>
          <div class="col-xs-6">
        <img src="board_img/free3.jpg" alt="Flower" style="width:350px; height:300px; border-radius:30px;">
        <div class="carousel-caption">
<!--           <h3>자기관리</h3> -->
<!--           <p>작심삼일을 넘어서는 자기관리란 무엇일까요?</p> -->
        </div>
        </div>
      </div>
      <div class="item">
      <div class="col-xs-6">
	      <a href="">
	      <img src="board_img/JJangu.jpg" alt="Chania" style="width:350px; height:300px; border-radius:30px;"></a>
	       <div class="carousel-caption">
<!-- 	          <h3>운동Item</h3> -->
<!-- 	          <p>유용한 Item들을 보실 수있습니다</p> -->
	        </div>
      </div>
      <div class="col-xs-6">  
        <img src="board_img/free1.jpg" alt="Flower" style="width:350px; height:300px; border-radius:30px;"/>
        <div class="carousel-caption">
<!--           <h3>운동</h3> -->
<!--           <p>가볍게 하실 수 있는 동작들을 확인 해 보실 수 있습니다</p> -->
        </div>
      </div>
      </div>
    </div>
  </div>
   </div>
  </div>
 </div>
   <div class="col-md-3" style="height: 15px;"></div>
	<div class="col-md-6" style="height: 377px; background-image:url(board_img/32.jpg); background-repeat: no-repeat; background-size: 100%; border-radius: 10px;"> 
</div>
    <!-- 게시판 메인 사진 -->
 <div class="col-md-2" style="height:3px"></div>
  <div class="col-sm-12" style="text-align: center;">
   <div class="col-md-3"></div>
 	<div class="col-md-6">
	 <div>
	  <div class="form-group" style="margin-top:0px">
	   <div class="col-md-2"></div>
	    <div class="col-md-2">
	     <button class="btn btn-warning" style="background-color: #1f05f5; margin: 0;" onclick="Write_btn();">글쓰기</button>
		</div>
		<div class="col-md-7">
         <form class="form-inline" action="board_Free_search.do?page=1"  method="post">
          <select class="form-control" name="keyField" size="1" style="height: 40px;">
           <option value="Id"> 아이디
           <option value="subject"> 제목
           <option value="content"> 내용
          </select>
          <div class="input-group">
           <input class="form-control" type="text" name="keyWord" style="height: 44px; padding: 15px 0;">
            <span class="input-group-btn">
             <input class="btn btn-warning" type="submit" style="background-color: #1f05f5;" value="찾기">
            </span>
           </div>
           <input type="hidden" name="page" value= "0">
          </form>
         </div>
	    </div>
	   </div>
	  </div>
     </div>
    <!-- 검색기능  -->
    </div>
    <div class="container-fluid text-center bg-grey">
     <div class="col-md-12">
      <div class="card">
	   <div class="card-header" style="background: linear-gradient(60deg, #1f05f5, #1dfff8);">
		<h4 class="title">자유게시판</h4>
		 <p class="category">즐거움을 나누어 주세요!</p>
	   </div>
	   <div class="card-content table-responsive">
<!-- 	    <div class="mail-box"> -->
<!--          <aside class="lg-side"> -->
<!--           <div class="inbox-body"> -->
<!--            <div class="mail-option"> -->
            <table class="table table-hover" width=100%>
             <thead>
              <tr class="info" class="unread" >
               <td width=5% class="view-message dont-show">Num</td>
               <td width=20% class="view-message" colspan="3">Id</td>
               <td width=50% >Subject</td>
               <td width=20% class="view-message">Date</td>
               <td width=5% class="view-message">Readcount</td>
              </tr>
             </thead>
             <tbody>
              <c:forEach items="${dto}" var="d">
               <tr>
                <td align="center" class="view-message  dont-show">${d.num }</td>
                <td align="center" colspan="3" class="view-message">${d.id }</td>
                <td align="left">
                  <c:if test="${d.depth > 0}">  
                   <c:forEach begin="1" end="${d.depth}"> 
  				    &nbsp;&nbsp;   
                   </c:forEach> 
                  </c:if>
                 <a href="free_board_read.do?num=${d.num}">
			     <c:if test="${d.re_step == 1 }"><b><font color="blue"></c:if> 
			                 ${d.subject }
			     <c:if test="${d.re_step == 1 }"></font></b></c:if></a></td> 
                <td align="center" class="view-message">${d.date }</td>
                <td align="center" class="view-message">${d.readcount }</td>
               </tr>
              </c:forEach>
             </tbody>
            </table>
<!--            </div> -->
<!--           </aside> -->
<!--          </div> -->
<!-- 	    </div> -->
	    <!-- 게시판 -->
	    
       <div class="col-md-12" style="text-align: center;">
	    <ul class="pagination pagination-info">
	    ${sb }
        </ul>	
	  </div>
     </div>
    </div>	    
   </div>
  </div>
 </div>	
 <!-- 페이징 -->
 
 <!--   Core JS Files   -->
 <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
 <script src="assets/js/material.min.js" type="text/javascript"></script> 
 <!--  Charts Plugin -->
 <script src="assets/js/chartist.min.js"></script>
 <!--  Dynamic Elements plugin --> 
 <script src="assets/js/arrive.min.js"></script>
 <!--  PerfectScrollbar Library -->
 <script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
 <!--  Notifications Plugin    -->
 <script src="assets/js/bootstrap-notify.js"></script>
 <!-- Material Dashboard javascript methods -->
 <script src="assets/js/material-dashboard.js?v=1.2.0"></script>
</body>
</html>