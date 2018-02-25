<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
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
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
  

 <script type="application/ld+json">
   {
   "@context" : "http://schema.org",
   "@type" : "SoftwareApplication",
   "name" : "Aperitif",
   "image" : "https://aperitif.io/img/aperitif-logo.svg",
   "url" : "https://aperitif.io/",
   "author" : {
     "@type" : "Person",
     "name" : "Octavector"
   },
   "datePublished" : "2017-MM-DD",
   "applicationCategory" : "HTML"
   }
   </script><!--기본틀  -->
   <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
   <script type="text/javascript">
     
   
     
     function read(a){
               
//                   var a = $(this).attr('id');
             /*  alert(a); */
                 
                 $.ajax({
                    url:"buy_ex2_read.do",
                     dataType:'html',
                     data:{
                       name:a
                       
                     },
                     type:'post',
                     success:function(data){
                         $(".test").empty();
                        $(".test").html(data);
                     },
                     error:function(data){
                        alert("에러");
                     }
                    
          
                 
               });//end click
               }
     
     function check(){
    	 /* var id=$("#name").val();
    	 var img=$("#img").val();
    	 var company=$("#comapny").val();
    	 var product=$("#product").val();
    	 var price=$("#price").val();
    	 var sexpl=$("#sexpl").val();
    	 var lexpl=$("#lexpl").val();
    	 var fexpl=$("#fexpl").val();
    	 var name=$("#name").val();
    	 var stock=$("#stock").val();
    	 var body=$("#body").val(); */
     	 /*$("input[name='jagi_ganli_selected_cancel']"): name값으로 받기  */
     	 /*var form=$("#ganli_form").serialize();: form으로 받기 예제  */
     	  var name=$("#name").val();
     	 var adnum=$("#adnum").val();
     	 var price=$("#price").val();
     	 var hidden1=$("#hidden1").val();
     	var hidden2=$("#hidden2").val();
     	var lexpl=$("lexpl").val();
     	var sexpl=$("sexpl").val();
     	var stock=$("#stock").val();
     	var fexpl=$("#fexpl").val();
     	 alert(stock);
     	
     /* 	 var form=$("#form1").serialize(); */
     	var adnum2=$("#adnum").val();
     	
    	  $.ajax({
    		 url:"../buy_ex2_insert1.do",
    		 datatype:'html',
    		 data:{
    			 
    			 name:name,
    			 adnum:adnum,
    			 price:price,
    			 hidden1:hidden1,
    			 hidden2:hidden2,
    			 stock:stock,
    			 fexpl:fexpl,
    			 adnum2:adnum2
    		 },
    		 type:'post',
    		 success:function (data){
    			 alert("insert 성공");
    			 location.href="../buy_smain.do";
    		 },
    		 error:function (data){
    			 alert("error");
    		 }
    		 
    	 }) 
    	 
   
    	 
     }


     $(function(){
    		$("#fexpl").change(function(){ /*id입력  */
    			if($(this).val() != "") {//이미지파일 판단. 필요없을시 삭제하면 모든형식 업로드 가능
    				var ext = $(this).val().split(".").pop().toLowerCase(); 
    				if($.inArray(ext, ["gif","jpg","jpeg","png"]) == -1) {
    					alert("gif, jpg, jpeg, png 파일만 업로드 해주세요.");
    					$(this).val("");
    					return;
    				}
    			}
    			var fileSize = this.files[0].size;
    			var maxSize = 10 * 1024 * 1024; /*  파일 사이즈*/
    			if(fileSize > maxSize) {
    				alert("파일용량은 10MB까지 업로드 됩니다.");
    				$(this).val("");
    				return;
    			}
    			
    			var form = $('form1')[0]; /*임시로 폼태그 받음  */
    	        var formData = new FormData(form);
    	        formData.append('file', this.files[0]);
    			$.ajax({
    	            type : 'post',
    	            url : '../fileUploadAction.do',/* 이미지업로드 */
    	            data : formData,
    	            processData : false,
    	            contentType : false,
    	            success : function( data ) { // 업로드 성공하면 파일명을 받아온다.
    	                  var data2 = JSON.parse(data);
    	                   var savefile = data2.savefile;
    	                   
    	            	$('#pic').attr("src","../upload/"+savefile);
    	            	$('#hidden1').val(savefile);/* hidden */

    	            },
    	            error : function(error) { // 실패할 경우 에러메세지 출력
    	                console.log(error);
    	                console.log(error.status);
    	                alert(error + ", " +error.status);
    	            }
    	        });	
    			
    		});
    	});
     $(function(){
 		$("#img").change(function(){ /*id입력  */
 			if($(this).val() != "") {//이미지파일 판단. 필요없을시 삭제하면 모든형식 업로드 가능
 				var ext = $(this).val().split(".").pop().toLowerCase(); 
 				if($.inArray(ext, ["gif","jpg","jpeg","png"]) == -1) {
 					alert("gif, jpg, jpeg, png 파일만 업로드 해주세요.");
 					$(this).val("");
 					return;
 				}
 			}
 			var fileSize = this.files[0].size;
 			var maxSize = 10 * 1024 * 1024; /*  파일 사이즈*/
 			if(fileSize > maxSize) {
 				alert("파일용량은 10MB까지 업로드 됩니다.");
 				$(this).val("");
 				return;
 			}
 			
 			var form = $('form1')[0]; /*임시로 폼태그 받음  */
 	        var formData = new FormData(form);
 	        formData.append('file', this.files[0]);
 			$.ajax({
 	            type : 'post',
 	            url : '../fileUploadAction.do',/* 이미지업로드 */
 	            data : formData,
 	            processData : false,
 	            contentType : false,
 	           success : function( data ) { // 업로드 성공하면 파일명을 받아온다.
                   var data2 = JSON.parse(data);
                    var savefile = data2.savefile;
                    
 	            	$('#pic2').attr("src","../upload/"+savefile);
 	            	$('#hidden2').val(savefile);/* hidden */

 	            },
 	            error : function(error) { // 실패할 경우 에러메세지 출력
 	                console.log(error);
 	                console.log(error.status);
 	                alert(error + ", " +error.status);
 	            }
 	        });	
 			
 		});
 	});

    	</script>
    	<script type="text/javascript">/*마스터 업데이트  */
    	function updateALL(){
    		
			 alert("마스터 업데이트 시작");
    		
    		 $.ajax({
        		 url:"../buy_masterUpdate.do",
        		 datatype:'html',
        		/*  data:{
        			 
        			 
        		 }, */
        		 type:'post',
        		 success:function (data){
        			 alert("insert 성공"+data);
        		/* 	 location.href="../buy_smain.do"; */
        		 },
        		 error:function (data){
        			 alert("error");
        		 }
        		 
        	 }) 
    		
    	}
    	</script>
</head>
<body>
<jsp:include page="../side.jsp">
		<jsp:param value="buy_ex2" name="selectMenu" />
	</jsp:include>
	<div class="main-panel">
		<jsp:include page="../top.jsp"></jsp:include>
		
		<div class="content">
			
		
			<br>
			<div class="container-fluid">
				<div class="row"><!--1 row  -->

	<button class="btn btn-default"  onclick="updateALL();">마스터 버튼 </button>
	<form action="#" id="form1" method="post">
	<input type="hidden" id="hidden1" name="hidden1">
	<input type="hidden" id="hidden2" name="hidden2">
	<table class="table" >
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name"></td>
		</tr>
		<tr>
			<td>관리번호</td>
			<td><input type="text" id="adnum" name="adnum"></td>
		</tr>
		<tr>
			<td>섬네일 이미지</td>
			<td><input type="file" id="img" name="img"> </td>
		</tr>
		<tr>
			<td>관리번호 입력기</td>
			<td>
				<select id="company" name="company">
					<option value="1">삼성</option>
					<option value="2">현대</option>
					<option value="3">쿠팡</option>
					<option value="4">옥션</option>
				</select>
				<select id="product" name="product">
				
					<option value="1">다이어트식품</option>
					<option value="2">운동기구</option>
				</select>
				
				<select id="body" name="body">
					<option value="1">얼굴</option>
					<option value="2">가슴</option>
					<option value="3">배</option>
					<option value="4">팔</option>
					<option value="5">다리</option>					
				</select>
				
			
			</td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" id="price" name="price"></td>
		</tr>
		<tr>
			<td>간단설명</td>
			<td><textarea rows="5" cols="30" id="sexpl" name="sexpl"></textarea></td>
		</tr>
	
		<tr>
			<td>긴설명</td>
			<td><textarea rows="10" cols="30" id="lexpl" name="lexpl"></textarea></td>
		</tr>
		
		
		<tr>
			<td>재고</td>
			<td><input type="text" id="stock" name="stock"></td>
		</tr>
		<tr>
			<td>file설명</td>
			<td><input type="file" id="fexpl" name="fexpl"></td>
		</tr>
		<tr><td colspan="2"><img src="" style='width:280px; height:300px' id='pic'/>
		<img src="" style='width:280px; height:300px' id='pic2'/></td></tr>
		<tr>
			<td colspan="2">
				<input type="button" onclick="check()"> 
			</td>
		</tr>
	</table>
	</form>
	</div>
	</div>
	</div>
	</div>
	
</body>
</html>