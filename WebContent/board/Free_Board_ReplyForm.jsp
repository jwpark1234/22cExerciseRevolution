<%@page import="java.util.ArrayList"%>
<%@page import="bean.BoardDto_Tip"%>
<%@page import="dao.BoardDao_Tip"%>
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
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
		  <style type="text/css">
	  
	  	.grad1{
	 border: 2px solid; 
	 border-image: linear-gradient(to left, #89F4FE, #5E67F7);
	 border-image-slice: 1;
	}    
    
	  </style>
	   		
	
	
	
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="./assets/js/summernote.js"></script>
	<script src="./assets/js/summernote-ko-KR.js"></script>
<style type="text/css">
 .note-editing-area,.note-toolbar {/* width:1500px; */
    max-width: 100%;
     }
</style>
</head>
<body>
<jsp:include page="../side.jsp">
<jsp:param value="board_Free" name="selectMenu"/>
</jsp:include>
 <div class="main-panel">
  <jsp:include page="../top.jsp"></jsp:include>
   <div class="content">
   
   <!-- summernote-->
	<script type="text/javascript">
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
	           success : function( savefile ) { // 업로드 성공하면 파일명을 받아온다.
	        	   
	        	   var savefile = JSON.parse(savefile).savefile;
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

	</script> 
	<script type="text/javascript">
		function write_click() {//댓글 쓰기 

			// form태그에 사용자가 입력한 모든 값을 직렬화 하여 저장
			// input태그 name값=입력한값&input태그 name값=입력한값& ... 형식의 문자열로 저장됨
			
			 if($("input[name=Password]").val()==""||$("input[name=Password]").val()==null){
				alert("비밀번호를 입력하시오");
				return false;
			}else if($("input[name=Subject]").val()==""||$("input[name=Subject]").val()==null){
				alert("제목을 입력하시오");
				return false;
			}
			
			
			
			
			var write = $('#Free_REwriteForm').serialize();

			// 직렬화한 데이터를 회원가입,수정 서블릿으로 전달한다.
		       $.ajax({
		         url:"free_board_Reply_Action.do?num=${dto.num}",
		         dataType:'html',
		         data:write,
		         type:'post',
		         success:function(data){
		        	 location.href="board_Free.do?pageNum=1";
		         },
		         error:function(data){
			      alert("에러");
		  
						
		         }
		       });
		}
		
	</script>
	<div class="container-fluid">
	<div class="row">
	<div class="col-md-12">
<form id="Free_REwriteForm" action="free_board_Reply_Action.do" method="post" style="width:100%; ">
 
 
 
	<div class="card">
		 <div class="card-header" style="background: linear-gradient(60deg, #89F4FE, #5E67F7);">
 					<h4 class="title">자유게시판 댓글 쓰기</h4>
 		</div>	
	
	
	
		<div class="card-content">
		
		
		<div class="row">
		<div class="col-md-3">
		 <div class="form-group label-floating">
         		<label class="control-label">번호</label>
 		   	<input type="text" class="form-control" name="num"  readonly="readonly" style="max-width:50%;"  maxlength="50" value="${dto.num }" >
       			</div>
		</div>
		
		
		<div class="col-md-3">
				 <div class="form-group label-floating">
         		<label class="control-label">작성자</label>
 		   	<input type="text" class="form-control"  placeholder="id" name="Id"  readonly="readonly" style="max-width:50%;"  maxlength="50" value="${sessionScope.Id }" >
       			</div>
		</div>
		
		
		<div class="col-md-3">
		<div class="form-group label-floating">
         		<label class="control-label">비밀번호</label>
 		   	<input type="password" class="form-control"    name="Password"  style="max-width:50%;"  maxlength="50">
       			</div>
		</div>
		
		</div>
		<div class="row">
		<div class="col-md-10">
			<div class="form-group label-floating">
         		<label class="control-label">제목</label>
 		   	<input type="text" class="form-control"    name="Subject"  style="text-align: left;"  maxlength="50" value="${dto.subject }" >
       			</div>
		
		</div>
		</div>
		
		<div class="row">
		<div class="col-md-12">
		 <textarea class="summernote" id="writeMemo_content" name="Content" rows=20 cols=50 class="form-control" style=" text-align: left;">${dto.content }
		 </textarea>
	</div>
		
		</div>		
		</div> 
		
	</div>
	</div>
	
	<script> 
  
	   // 에디터 설정
	   // 사용할 툴바와 언어, 높이 등                         
	   $('.summernote').summernote({
	      toolbar: [
	             // [groupName, [list of button]]
	               ['style', ['bold', 'italic', 'underline', 'clear']],
	               ['font', ['strikethrough', 'superscript', 'subscript']],
	               ['fontsize', ['fontsize']],
	               ['color', ['color']],
	               ['para', ['ul', 'ol', 'paragraph']],
	               ['height', ['height']]
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
     </script>

    <button class="btn btn-info " type="button" onclick="write_click();" style="margin: 0px 779px;">완성</button>
  </form> 
    </div>
	</div></div>
 </div>

</body>
</html>