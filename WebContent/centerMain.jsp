<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html lang="en">
  <head>
  <script type="text/javascript">
  $(document).ready(function(){
	     var url = "user/Modal_LogIn.jsp";
	     
	     $('.modal-content').load(url,function(result){
	            
	     $('#myModal').modal({show:true});
	     
	     });
	     
	     });
  
  </script>

</head>
<body>
 <div class="main-panel">
            <jsp:include page="top.jsp"></jsp:include>
            <div class="content">
	</div>
	</div>
</body>
</html>