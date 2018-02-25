<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 
 <!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>마이페이지 자기관리</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
     <meta http-equiv="Content-Type" content="text/html;charset=utf-8;" />
    Bootstrap core CSS    
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
     Material Dashboard CSS   
    <link href="assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
        Fonts and icons    
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
      <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/modernizr/modernizr-2.8.3.js"></script>
       -->
     <!-- Custom Css -->
<!--     <link href="assets/mytab_boot/css/style.css" rel="stylesheet">

    AdminBSB Themes. You can choose a theme from css/themes instead of get all themes
    <link href="assets/mytab_boot/css/themes/all-themes.css" rel="stylesheet" />
   -->
  

  <!-- 
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="assets/jqplot/jquery.jqplot.js"></script>
<script type="text/javascript" src="assets/jqplot/plugins/jqplot.pieRenderer.js"></script>
<link rel="stylesheet" type="text/css" href="assets/jqplot/jquery.jqplot.css" />
 -->


















  <style type="text/css">
  @media only screen and (max-width: 320px) {

   body { 
      font-size: 2em; 
   }

}
  
 .error-notice {
  margin: 5px 5px; /* Making sure to keep some distance from all side */
}

.oaerror {
  width: 90%; /* Configure it fit in your design  */
  margin: 0 auto; /* Centering Stuff */
  background-color: #FFFFFF; /* Default background */
  padding: 20px;
  border: 1px solid #eee;
  border-left-width: 5px;
  border-radius: 3px;
  margin: 0 auto;
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
}

.danger {
  border-left-color: #d9534f; /* Left side border color */
  background-color: rgba(217, 83, 79, 0.1); /* Same color as the left border with reduced alpha to 0.1 */
}

.danger strong {
  color:  #d9534f;
}

.warning {
  border-left-color: #f0ad4e;
  background-color: rgba(240, 173, 78, 0.1);
}

.warning strong {
  color: #f0ad4e;
}

.info {
  border-left-color: #5bc0de;
  background-color: rgba(91, 192, 222, 0.1);
}

.info strong {
  color: #5bc0de;
}

.success {
  border-left-color: #2b542c;
  background-color: rgba(43, 84, 44, 0.1);
}

.success strong {
  color: #2b542c;
}
  
  
</style>

  
  
  </head>
  
<body>
<script type="text/javascript"  charset='utf-8'>

 
 $(function(){
	 var real=null;
	 var myself=null;
	 
	 
 })
 
 
function myPage_JagiGanli( x){
	//alert(x);

	$(function(){
	
		// 좌측 상단 파이 차트  구현 (1주일간 운동 계획 ), 해당 날짜 버튼 클릭시 그날짜에 운동한 리스트 구현
		// 우측 하단 요약정보는 평균 소모 칼로리 , 평균 운동 시간 구현
	$.ajax({
		url:'myPage_Jagi_Ganli.do',
		type:'post',
		data:{userId:x},
		dataType:'text',
		success:function(data){
			var x=data.toString().split('&');
			myself=JSON.parse(x[1]);//getList4 데이터로 이동  데이터를 못찾음
			var ganli=JSON.parse(x[0]); //getList2 테이터
			real=JSON.parse(x[0]);
			var renewGanli=new Array();
			if(ganli.length==0){
				$("#getList1").empty();
				$("#getList1").html("<img src='images/x.png'>");
				
			}
			
			$("#avgcal").html("	평균 소모 칼로리:"+myself.avgcal.toString().substr(0, 5)+"kg");
			$("#avgcnt").html("	평균 운동시간:"+myself.avgcnt.toString().substr(0, 2)+"시간");
			
		
			
			
			for(var i=0; i<ganli.length;i++){
				//ex_count , ex_cte , ex_reg ex_name 을 담은 json
				
				
				if(i<ganli.length-1){
					if(ganli[i].ex_reg.toString()!=ganli[i+1].ex_reg.toString())
						renewGanli.push(ganli[i]);
					
				}else{
						renewGanli.push(ganli[i]);
					
				}
			}//end for i
			//중복 제거함 이걸 데이터 넣을거임
			
			var data1=new Array();
			for(var i=0; i<renewGanli.length;i++){
				var tmp=new Array();
				tmp.push(renewGanli[i].ex_reg,parseInt(renewGanli[i].ex_cte));
				data1.push(tmp);
				
			}
			//piechart dataset
			jQuery.jqplot.config.enablePlugins = true;
			  plot7 = jQuery.jqplot('chart7', 
			    [data1], 
			    {
			      title: '1주일간 운동 계획표', 
			      seriesDefaults: {shadow: true, renderer: jQuery.jqplot.PieRenderer, rendererOptions: { showDataLabels: true } }, 
			      legend: { show:true }
			    }
			  );
			  
			  $("#getList2").append("<img src='images/curton.jpg' style=' width:100%; height:300px; max-width:100%; max-height:100%;' >");
			  //이미지 커튼 이 열림
			
			
			  
			},
		error:function(status){
			alert("실패");
		}
		
	});

	
})

	} //버튼 클릭 끝
	

	$(function(){

		$('#chart7').bind('jqplotDataClick',
			    function (ev, seriesIndex, pointIndex, data) {                
				var regByClick=$('#chart7 a').eq(pointIndex).html();        
					//선택된 클릭
					//json 만들어진 real data
			        //커튼이 있다면 슬라이업 후에 글생성 이후에 그냥
			        if($('#getList2 img').attr('src')!=null){
			        	$("#getList2 img").slideUp(1200, function() {
				        	$("#getList2").empty();
				        	getBoard(regByClick);
				        	getList(regByClick,real);
				        	
			        	});
			        	
			        }else{
						getBoard(regByClick);
			        	getList(regByClick,real);
			        	
			        }
			    } //end jqplot function
			);//end bind

	
		
	
	})
	
	//커튼 후에 만들기  기본 판넬 만들기
function getBoard(regByClick){
		$("#getList2").html(
	        	"<div class='container-fluid' id='getList2' style=''>"
	        	+"<div class='panel panel-default' style=''>"
	        	+"<div class='alert alert-info' >"+regByClick+" 운동리스트</div>"
	        	+"<div class=' panel-body'>"
	        	+"<table class='table table-dark' id='getList2_table'>"
	        	+" <thead>"
	        	+" <tr>"
	        	 +"<th scope='col'>운동명</th>"
	            +"<th scope='col'>운동시간</th>"
	            +"<th scope='col'>운동날짜</th>"
	            +"</tr></thead><tbody>"
	        	+"</tbody></table>"
	        	);
	}
	
	//그후 값 넣기
function getList(regByClick,real){
		var x="";
		for(var i=0; i<real.length;i++){
		//날짜 , 운동시간 ,운동 메뉴가 필요함
			x+="<tr>";
		if(regByClick==real[i].ex_reg){
			//$("#getList2").html(JSON.stringify(real));
			x+="<td >"+real[i].ex_name+"</td>";
			x+="<td >"+real[i].ex_count+"시</td>";
			x+="<td >"+real[i].ex_reg	+"</td>";
			x+"</tr>";
		}
	}

		$("#getList2_table tbody").append(x);
		
	
}

	//오른쪽커튼은 안에 이용법  소개
	
	
	function getList3(id){
		var error_notice="<div class='error-notice' >";
		var oaerror_danger="<div class='oaerror danger' >";
		var oaerror_warning="<div class='oaerror warning' >";
		var oaerror_info="<div class='oaerror info' >";
		var oaerror_success="<div class='oaerror success' >";
		
	
		
		var result=	"<div class='row'>"
  		+error_notice
  		+oaerror_danger
  		+"<strong>규칙</strong> -  ${sessionScope.Id}님의 운동 현황"
  		+"</div>"
  		+oaerror_warning
  		+"<strong>원차트</strong> - 원하는 영역을 선택합니다. "
  		+"</div>"
  		+oaerror_info
  		+"<strong>클릭후</strong> - 해당 영역은 해당 날짜에 대한 운동리스트를 표시"
  		+"</div>"
  		+oaerror_success
  		+"<strong>현재 정보</strong> - 현재 정보를 알려줍니다."
  		+"</div>"
  		+"</div></div>";
  		
  		
  		return result;
		
		
	}
	

	
</script>



<div id="getList" align="center" >
<div id="getList1" class="card" style="width:45%; margin-left:3%;  height: 300px; float:left;">
<div id="chart7" style=" height:300px;" >
</div>
</div>
<div id="getList3" class="card"  style="width:45%; height:300px;  margin-left:3%;  vertical-align:middle; float:left;">
<img src='images/curton.jpg' style=' width:100%; height:300px;' >
</div>
<!--  클릭시  차트 내용 -->
<div style="clear: both;"></div>
<div id="getList2" class="card" style="width:45%;  margin-left:3%; background-color:#BFF2F3; float:left;" >
</div> 
<div id="getList4" class=" card" style="width:45%;  margin-left:3%;  height:300px; float:left; background-color: #F7B69E;">
                
                
                <div class="alert alert-info">
                ${sessionScope.Id } 요약정보
                </div>
                
                
                <div class="container-fluid">
                <div class="card">
                <div class="row">
                
                <div class="col-md-10 col-md-offset-1 " style="border-bottom: 1px solid #7A7A79">
                 		닉네임:${sessionScope.Nickname }
                             <span class="pull-right">
                                        <i class="material-icons">trending_up</i>
                                    </span>
                                    
                </div>
                </div>
                <div class="row">
                
                <div class="col-md-10 col-md-offset-1" style="border-bottom: 1px solid #7A7A79">
               
                 	  Level:${sessionScope.Level } 
						<span class="pull-right">
                                        <i class="material-icons">trending_up</i>
                                    </span>
                </div>
                </div>
                <div class="row">
                
                <div class="col-md-10 col-md-offset-1" style="border-bottom: 1px solid #7A7A79">
               
                 		 키:${sessionScope.Height }cm
                             <span class="pull-right">
                                        <i class="material-icons">trending_up</i>
                                    </span>
                </div>
                </div>
                <div class="row">
                
                <div class="col-md-10 col-md-offset-1" style="border-bottom: 1px solid #7A7A79">
               
                 		몸무게:${sessionScope.Weight }Kg
                             <span class="pull-right">
                                        <i class="material-icons">trending_up</i>
                                    </span>
                </div>
                </div>
                <div class="row">
                
                <div  class="col-md-10 col-md-offset-1" style="border-bottom: 1px solid #7A7A79">
                		평균 칼로리:
                             <span class="pull-right">
                                        <i class="material-icons">trending_up</i>
                                    </span>
                </div>
               </div>
               <div class="row">
                
                <div   class="col-md-10 col-md-offset-1" >
               
                 			평균운동시간:
                             <span class="pull-right">
                                        <i class="material-icons">trending_up</i>
                                    </span>
                
                </div>
               </div>
                
                
                
                
                
                
                
                
                
                
                </div>
                
                
                </div>
               
                    </div>
</div>

<!--  하고싶은말 쓰면 좋은데 이미지가 같이 들어갈 확률이 높음. -->
<div class="container-fluid">
<div class="content">


</div>


</div>



</body>
</html> 