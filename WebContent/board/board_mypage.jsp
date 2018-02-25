<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="card card-nav-tabs">
		<div class="card-header" data-background-color="purple">
			<div class="nav-tabs-navigation">
				<div class="nav-tabs-wrapper">
					<span class="nav-tabs-title">내가 쓴 글:</span>
					<ul class="nav nav-tabs" data-tabs="tabs">
						<li class="active"><a href="#Tip" data-toggle="tab">
								 Tip게시판
						<div class="ripple-container"></div>
					 </a>
					</li>
						<li class=""><a href="#Free" data-toggle="tab"> 
						 Free게시판
					    <div class="ripple-container"></div>
					</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="card-content">
			<div class="tab-content">
				<div class="tab-pane active" id="Tip">
					<table class="table table-hover text-center" width=100%>
			                <thead>
			                	<tr class="danger">
				                    <td width=5%>Num</td>
				                    <td width=20%>Id</td>
				                    <td width=50%>Subject</td>
				                    <td width=20%>Date</td>
				                    <td width=5%>Readcount</td>
			                    </tr>
			                </thead>
			                <tbody>
			                
			                <c:forEach items="${Tipdto}" var="d"> 
			                    <tr>
			                        <td>${d.num }</td>
			                        <td>${d.id }</td>
			                        <td align=left>
			                        <c:if test="${d.depth > 0}"> 
 						              <c:forEach begin="1" end="${d.depth}"> 
  							             &nbsp;&nbsp;   
 						              </c:forEach> 
 						                
 					                 </c:if>
 					                <a href="tip_board_read.do?num=${d.num}">
			                        <c:if test="${d.re_step == 1 }"><b><font color="red"></c:if> 
			                           ${d.subject }
			                         <c:if test="${d.re_step == 1 }"></font></b></c:if></a></td> 
			                        <td>${d.date }</td>
			                        <td>${d.readcount }</td>
			                    </tr>
			                </c:forEach>
			                </tbody>
			            </table>
			           

				</div>
				<div class="tab-pane" id="Free">
					<table class="table table-inbox table-hover text-center" width=100%>
             <thead>
              <tr class="unread info">
               <td width=5% class="view-message dont-show">Num</td>
               <td width=20% class="view-message">Id</td>
               <td width=50% class="view-message">Subject</td>
               <td width=20% class="view-message">Date</td>
               <td width=5% class="view-message">Readcount</td>
              </tr>
             </thead>
             <tbody>
              <c:forEach items="${Freedto}" var="d">
               <tr>
                <td class="view-message  dont-show">${d.num }</td>
                <td class="view-message">${d.id }</td>
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
                <td class="view-message">${d.date }</td>
                <td class="view-message">${d.readcount }</td>
               </tr>
              </c:forEach>
             </tbody>
            </table>
            
		</div>
				</div>
			</div>
		</div>
</body>
</html>