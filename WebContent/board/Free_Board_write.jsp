<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>22세기 운동혁명</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
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
	 border-image: linear-gradient(to left, #E7CCF7, #F84919);
	 border-image-slice: 1;
	}    
    
    </style>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

</head>
<body>
<jsp:include page="../side.jsp">
<jsp:param value="board_Free" name="selectMenu"/>
</jsp:include>
<div class="main-panel">
<jsp:include page="../top.jsp"></jsp:include>

<div class="content">
<script src="./assets/js/summernote.js"></script>
<script src="./assets/js/summernote-ko-KR.js"></script>

<!--  <div class="col-md-12"> -->
<!--  <div class="card"> -->
<!--   <div class="card-header" style="background: linear-gradient(60deg, #00bcd4, #eee);";> -->
<!--    <h4 class="title">자유로운 정보를 나누어 주세요</h4> -->
<!-- </div>  -->

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
	        	  
	        	/*    var data2 = JSON.parse(data);
	           		var savefile = data2.savefile;
	           	  */
	           	  
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
		function write_click() {
			// form태그에 사용자가 입력한 모든 값을 직렬화 하여 저장
			// input태그 name값=입력한값&input태그 name값=입력한값& ... 형식의 문자열로 저장됨
			var htt=$('.summernote').summernote('code');
			
			$("input[name=Content]").val(""+htt);
		
			if($("input[name=Subject]").val()==""||$("input[name=Subject]").val()==null){
				alert("제목을 입력하시오");
				return false;
			}else if($("input[name='Password']").val()=="" || $("input[name='Password']").val()==null){
				alert("비밀번호를 입력하시오");
				return false;
			}
			
			
			
			var write = $('#Free_writeForm').serialize();
			// 직렬화한 데이터를 회원가입,수정 서블릿으로 전달한다.
		       $.ajax({
		         url:"free_board_write_Action.do",
		         dataType:'html',
		         data:write,
		         type:'post',
		         success:function(data){
		        	 location.href="board_Free.do?pageNum=1";
		         },
		         error:function(data){
			      alert("error");
		  
						
		         }
		       }); 
		 }
		
		
			$(function(){
				
				$("#Free_writeForm table tbody tr td input").css('text-align','center');
			})
		
		
		
	</script>
	<div class="container-fluid">
	<div class="row">
	<div class="col-lg-12">
   <form id="Free_writeForm" method="post">
   <div class="card">
   <div class="card-header" data-background-color="purple">
   <h3>자유 게시판 글쓰기</h3>
   </div>
   
   <div class="card-content">
<!--    <div class="card grad1"   style="margin-left:2%;width:50%;"  > -->
          <div class="form-group label-floating">
         <label class="control-label">제목을 쓰세요</label>
       <input type="text" class="form-control"   placeholder="" name="Subject" maxlength="50"   autocomplete=off>
       </div>
                                        
<!--    </div> -->
   
<!--    <div class="card grad1"  style="margin-left:2%;width:50%;" > -->
      <div class="form-group label-floating">
        <label >유저 아이디:${sessionScope.Id }</label>
        <input type="hidden" class="form-control" name="Id" maxlength="10">
                                                
         </div>
<!--    </div> -->
<!--    <div class="card grad1"  style="margin-left:2%;width:50%;" > -->
      <div class="form-group label-floating">
         <label class="control-label">비밀번호 입력</label>
        
    <input type="password" class="form-control" placeholder="" name="Password" maxlength="10"   autocomplete=off>
<!--     </div> -->
    
   </div>
   
   
   
<!--    <div class="card grad1 " style="margin-left:2%;width:90%;"> -->
   <div class="summernote " id="Content"></div>
   <input type="hidden" class="form-control" name="Content" maxlength="1000">
        
  
<!--    </div> -->
     <button class="btn btn-info pull-right" type="button" onclick="write_click();" style= "margin-right:10px;">완성</button>
   <a style="display:inline;" class="btn btn-primary pull-right" href="board_Free.do?pageNum=1">글목록</a>
   
   
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
	               ['height', 380],
	               
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
   
  </form> 
 </div>
</div>
</div></div></div>
	

</body>

</html>