<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript">
	
	 function del(num){
		 
		 if(confirm("정말로 삭제하시겠습니까?") == true){
			 
			 $.ajax({
		         url:"tip_board_delete.do",
		         dataType:'html',
		         data:{num:num},
		         type:'post',
		         success:function(data){
		        	 location.href="board_Tip.do?pageNum=1";
		         },
		         error:function(data){
			      alert("에러");
		  
						
		         }
		       });
		 }else{
			 return;
		 }
		 
	 }
	 
	 
	 function check(num, Re_Step) {
			if(Re_Step == 1){
				$('#alertContent').html('이미 채택된 글입니다');
				$('#myModal10').modal('show');
				alert('들어가긴 들어갔음');
				return;
			}
			$.ajax({
		         url:"tip_board_check.do",
		         dataType:'html',
		         data:{num:num},
		         type:'post',
		         success:function(data){
		        	 alert('들어가긴 들어감');
		        	 location.href="board_Tip.do?pageNum=1";
		         },
		         error:function(data){
			      alert("에러");
		  
						
		         }
		       });
		}
	</script>
	
</head>
	
<body>
	<jsp:include page="../side.jsp">
	<jsp:param value="board_Tip" name="selectMenu"/>
	</jsp:include>
	<div class="main-panel">
		<jsp:include page="../top.jsp"></jsp:include>
		<div class="content">
			<div class="card">
				<div class="card-header" style="background: linear-gradient(60deg, #9703b1, #eee);">
 					<h4 class="title">운동과 식단에 관한 정보를 나누어 주세요</h4>
 				</div>
 				<div class="card-content"> 
 				<form action="tip_board_UpdateForm.do" method="post">
 				<input type="hidden" value="${dto.num }" id="read_num" name="read_num">
<%--  				<input type="hidden" value="${dto.content }" id="read_content" name="read_content"> --%>
					
	 							    				
	    				<div class="form-group label-floating">
				         		<label class="control-label">번호</label>
				 		   <input type="text" class="form-control"  id="read_num" name="read_num"  style="max-width:50%;"  maxlength="50" value="${dto.num }" readonly="readonly">
				       			</div>
				 				
				 		
				       		 <div class="form-group label-floating">
				         		<label class="control-label">작성자</label>
				 		   <input type="text" class="form-control" name="read_id" id="read_id"  style="max-width:50%;"  maxlength="50" value="${dto.id }" readonly="readonly">
				       			</div>
				 				
				 				    <div class="form-group label-floating">
				         	<label class="control-label">제목</label>
				 		   <input type="text" class="form-control" name="read_subject" id="read_subject"  style="max-width:50%;"  maxlength="50" value="${dto.subject }" readonly="readonly">
				       				</div>
				 				
				 			<input type="hidden" value='${dto.content }' id="read_content" name="read_content" />
 				
 				
 						<div style="padding:10px 10px; border:1px black soild;">
 						<label >내용</label>
 						${dto.content }
 						
 						</div>
	    				
	    				
	    				
	    		
	   			  <c:if test="${dto.id eq sessionScope.Id}">
   				   <input type="submit" class="btn btn-primary" value="글수정">
   				   <input type="button" class="btn btn-primary" onclick="del(${dto.num })" value="글삭제">
   				  </c:if>
   				  <c:if test="${6 eq sessionScope.Level}">
   				   <input type="button" class="btn btn-primary" onclick="check(${dto.num } , ${dto.re_step })" value="채택하기">
   				  </c:if>
    			   <a class="btn btn-primary pull-right" href="board_Tip.do?pageNum=1">글목록</a>
    			   <a class="btn btn-primary pull-right" href="tip_board_ReplyForm.do?num=${dto.num }">댓글</a>
   				   </form>
   				   </div>
 			</div>
		</div>
	</div>
</div>
</body>
</html>