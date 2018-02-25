<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	
	
	function asd(ck){ // 이미지 눌렀을 때
		
		if(ck=="o") { 
			$('#alertContent').html("이벤트에 당첨되었습니다.");
			$('#myModal10 img').attr("src","event/daily/c6.png");
			$('#myModal10').modal('show');
			$('#myModal10').on('hide.bs.modal', function () { 
			$('#myModal10 img').attr("src","images/sorry.png");
			});

		}
		else if(ck=="-"){
			$('#alertContent').html("아직 진행중인 이벤트입니다.");
			$('#myModal10 img').attr("src","images/thank.png");
			$('#myModal10').modal('show');
			$('#myModal10').on('hide.bs.modal', function () { 
			$('#myModal10 img').attr("src","images/sorry.png");
			});
		}
		else if(ck=="x"){
			$('#alertContent').html("이벤트에 당첨되지 않으셨습니다.");
			$('#myModal10 img').attr("src","event/daily/c4.png");
			$('#myModal10').modal('show');
			$('#myModal10').on('hide.bs.modal', function () { 
			$('#myModal10 img').attr("src","images/sorry.png");
			});
		}
		
	}

</script>

<body>

<script type="text/javascript">
</script>
<c:if test="${empty requestScope.eventMypage}">
<div class="card-content text-center">
	<b>참여한 이벤트가 없습니다.</b>
</div>
</c:if>
<c:forEach items="${requestScope.eventMypage}" var="list" >
            <div  class="col-md-6">
               <div class="card col-md-6">
                  <div class="col-md-offset-9 col-md-3 ">
                  </div>
                  <div class="card-content">
                     <a href='javascript:void(0)' onclick="asd('${list.ck }');">               
                        <img src="upload/${list.img }" class="gray_img" style=" width:100%; height:200px;"/>
                     </a>
                  </div>
               </div>
                
            </div>
           </c:forEach>

<div class="modal fade" id="eventmyModal" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog ">
    
			 	
     			 </div>
    		</div>


</body>