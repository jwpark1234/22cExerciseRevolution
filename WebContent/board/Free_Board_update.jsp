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
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
		  <style type="text/css">
	  
	  	.grad1{
	 border: 2px solid; 
	 border-image: linear-gradient(to left, #1EF5E1, #1E45F5);
	 border-image-slice: 1;
	}    
    
	  </style>
	   		
	
	
	
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="./assets/js/summernote.js"></script>
	<script src="./assets/js/summernote-ko-KR.js"></script>
	
	<script type="text/javascript">
	

	 function update(){
		
		

		if($("input[name=Free_update_subject]").val()==""||$("input[name=Free_update_content]").val()==null){
			alert("제목을 입력하시오");
			return false;
		}
	var htt=$('.summernote').summernote('code');
		
		$("input[name=Free_update_content]").val(htt);
		
		
		
		 var  read_Free = $('#read_Free').serialize();
			// 직렬화한 데이터를 회원가입,수정 서블릿으로 전달한다.
		       $.ajax({
		         url:"free_board_update.do",
		         dataType:'html',
		         data:read_Free,
		         type:'post',
		         success:function(data){
		        	 location.href="board_Free.do?pageNum=1";
		         },
		         error:function(data){
			      alert("error");
		  
						
		         }
		       });
		}
	 
	 
	 
	 function uploadFile(file,el) {
	      // 전달할 객체 생성
	      var form_data = new FormData();
	      // 파일 객체 추가
	       form_data.append('file', file);
	      $.ajax({
	           type : 'post',
	           url : 'fileUploadAction.do',
	           data : form_data,
	           processData : false,
	           contentType : false,
	           success : function( data ) { // 업로드 성공하면 파일명을 받아온다.
	        	   var savefile = JSON.parse(data).savefile;
		           	
	        	   /* var data2 = JSON.parse(data);
	           		var savefile = data2.savefile;
	           		 */
	              var ext = savefile.split('.').pop().toLowerCase();
				
	              // 이미지 파일이면 editor영역에 <img>태그로 뿌려준다.
	               if($.inArray(ext, ['gif','png','jpg','jpeg']) != -1) {
	                  if(ext == 'gif') {
	                     alert("gif파일은 썸네일을 제공하지 않습니다.");
	                  }
	                  $(el).summernote('editor.insertImage', "upload/"+savefile,function ($image) {
	                	  $image.css('width', $image.width('50%') );
	                	  $image.css('height', $image.height($image.width()*0.25) );
	                  });
	               }
	               else { // 일반 파일이면 다운로드 링크를 만들어 준다.
	                  $('.summernote').summernote('pasteHTML', 
	                        "<a href='download.jsp?path=upload&savefile=" + savefile 
	                           + "&originfile=" + file.name + "' onclick='event.cancelBubble=true;'>"
	                           + file.name + "</a>" );         // 메모는 div태그에 onclick 콜백함수가 설정되어있다.
	                                                   // 이 div태그 내부에 a태그를 누를경우 onclick과 a태그가 호출됨
	                                                   // => a태그를 누를 경우 div태그의 onclick이 동작하지 않도록 설정함.
	               }
	           },
	           error : function(error) { // 실패할 경우 에러메세지 출력
	               console.log(error);
	               console.log(error.status);
	               alert(error + ", " +error.status);
	           }
	       });   
	   }

	 $(function(){
	 
	 
	 $('.summernote').summernote({
	      toolbar: [
	             // [groupName, [list of button]]
	               ['style', ['bold', 'italic', 'underline', 'clear']],
	               ['font', ['strikethrough', 'superscript', 'subscript']],
	               ['fontsize', ['fontsize']],
	               ['color', ['color']],
	               ['para', ['ul', 'ol', 'paragraph']],
	               ['height', ['height']],
	               
	      ],
	      placeholder:"내용을 작성하세요. 텍스트나 10Mb 이하의 그림, 파일을 이곳에 넣어주세요.",
	       lang: 'ko-KR',
	       height:380,
	         callbacks: {
	            // 드래그 앤 드롭하면 호출됨
	            onImageUpload: function(file) {
	               if(file[0].size >= 10 * 1024 * 1024) {
	                  alert("10Mb이상은 업로드할 수 없습니다.");
	                  return;
	               }
	               uploadFile(file[0],this);
	            },
	      },
	     });
	 
	 })
	</script>
</head>
<body>
	<jsp:include page="../side.jsp">
	<jsp:param value="board_Free" name="selectMenu"/>
	</jsp:include>
	<div class="main-panel">
		<jsp:include page="../top.jsp"></jsp:include>
		
		<div class="content">
			<div class="card">
			 <div class="card-header" style="background: linear-gradient(60deg, #00bcd4, #eee);">
 					<h4 class="title">자유게시판 수정하기</h4>
 				</div>	
 				<div class="card-content">
				<form action="free_board_update.do" id="read_Free" method="post" >
 				 
<!-- 				<div class="card grad1" style="margin-left:2%;max-width:25%;"> -->
 				 <div class="form-group label-floating">
         		<label class="control-label">번호</label>
 		   	<input type="text" class="form-control"  id="Free_update_num" name="Free_update_num" readonly="readonly"  style="max-width:50%;"  maxlength="50" value="${num }" >
       			</div>
<!-- 				</div> -->
				
<!-- 				<div class="card grad1" style="margin-left:2%;max-width:25%;"> -->
				 <div class="form-group label-floating">
         		<label class="control-label">작성자</label>
 		   	<input type="text" class="form-control"  style="max-width:50%;"  maxlength="50" value="${sessionScope.Id }" readonly="readonly">
       			</div>
<!-- 				</div> -->
				
				
<!-- 					<div class="card grad1" style="margin-left:2%;max-width:50%; "> -->
 				    <div class="form-group label-floating">
         	<label class="control-label">제목</label>
 		   <input type="text" class="form-control" name="Free_update_subject" id="Free_update_subject"  style="max-width:50%;"  maxlength="50" value="${subject }" >
       				</div>
<!--             		</div> -->
 			
				
				
<!-- 				<div class="card grad1" style="margin-left:0%;max-width:90%;"> -->
   				내용
   				<!-- name="Free_update_content" id="Free_update_content" -->
   				<div class="summernote"  id="getImg" maxlength="2048" style="height: 350px;">${content }</div>
				<input type="hidden"   name="Free_update_content"  value="">
				
<!-- 				</div> -->
				
				<div align="center">
				<input type="button" onclick="update()" class="btn btn-info " value="수정완료"/>
    			<a  class="btn btn-primary " href="board_Free.do?pageNum=1">글목록</a>
    			</div>
				
				<%-- <div class="card-header" style="background: linear-gradient(60deg, #00bcd4, #eee);">
 					<h4 class="title">즐거움을 나누어 주세요</h4>
 				</div>
 				<form action="free_board_update.do" method="post">
 				<input type="hidden" class="form-control" name="Free_update_num" id="Free_update_num" value="${num }">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
 						<tr>
  							<td><input type="text" class="form-control" name="Free_update_subject" id="Free_update_subject" maxlength="50" value="${subject }"></td>
						</tr>
						<tr>
 							<td><textarea class="form-control" name="Free_update_content" id="Free_update_content" maxlength="2048" style="height: 350px;">${content }</textarea></td>
     					</tr>
    				</tbody>
   				</table>
    			<input type="submit" class="btn btn-info" value="수정완료"/>
    			<a class="btn btn-primary pull-right" href="board_Free.do?pageNum=1">글목록</a>
    			 --%>
    			</form>
    			</div>
 			</div>
		</div>
	</div>

</body>
</html>