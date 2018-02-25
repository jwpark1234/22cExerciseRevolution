<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>

<style type="text/css">
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

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
var i;
var a;
var today;
var ix=0;
var ix2=[0,0,0];

function logck(log){
if(log=="null"){
	alert("로그인 후 이용해주세요");
	history.back();
	return;
		
}
else{
	check();
}
	}

function check(){
	
	var now = new Date();
	day = now.getDate();
	year = now.getFullYear();
	month = now.getMonth()+1;
	today = year +"-"+month+"-"+day;

	$.ajax({
		type : "POST",
		url : "event_dailyCheckAction.do",
		data : "today="+today+"&subject=daily",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: 'html',
		success:function(data){ // Action클래스에서 리턴하면 여기로 돌아옴!!!
			
			if(data == 0) {
				
				$("#eventmyModal_Content").html("<img src='event/daily/c5.png'  ><h3 style='float:left; padding-top:30px 30px; '>하루에 한 번 참여 가능합니다</h3>");
				$("#eventmyModal").modal('show');
				
				
			}
			else if(data == 1 ) {
				i=0;
				a = Math.floor(Math.random() * 10) + 10;
				enter();
			}
			else if(data == -1){
				
				$("#eventmyModal_Content").html("<img src='event/daily/c5.png'  ><h3 style='float:left; padding:30px 30px;'>잠시후 다시 이용해주세요.</h3>");
				$("#eventmyModal").modal('show');
				
				
			}
			else {
			  $(".test").empty();
			  $(".test").html(data);
			}
		 },
		  error:function(data){
			  alert("에러");
		  }
		})
}
	


function enter(){
// 	displayTimeControl($("#"+(i%6-1)),'./event/daily/'+(i%6-1)+'.jpg');
//	$("#"+(i%6-1)).attr('src', './event/daily/'+(i%6-1)+'.png');


		$("#"+(i%6-1)).css('background-color', '#F57D6A');

	if(i%6==0){
		
		$("#5").css('background-color', '#F57D6A');
		
//		$("#5").attr('src', './event/daily/5.png');
// 		displayTimeControl($("#5"),'./event/daily/5.jpg');
	}
	
	play();
	
	
}

function play(){

//	$("#"+i%6).attr('src', './event/daily/a'+i%6+'.jpg');
// 	displayTimeControl($("#"+i%6),'./event/daily/a'+i%6+'.jpg');
	
	$("#"+i%6).css('background-color', 'blue');
	if(i==a) stop();
	else{
	i++;
	setTimeout("enter()", 200);
	}
	
}
function stop(){
	var ppoint = a%6*3;
	var formData = $("#form1").serialize();
	formData+=ppoint;
	sessionStorage.setItem('ppoint', parseInt(sessionStorage.getItem('ppoint'))+ppoint);
$.ajax({
		type : "POST",
		url : "event_dailyAction.do",
		data : formData,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: 'html',
		success:function(){ // Action클래스에서 리턴하면 여기로 돌아옴!!!
			if(a%6==0){
				$("#eventmyModal_Content").html("<img src='event/daily/c4.png'  ><h3 style='float:left; padding:30px 120px;'>꽝</h3>");
				$("#eventmyModal").modal('show');
			
			}else {
				
				$("#eventmyModal_Content").html("<img src='event/daily/c6.png'  ><h3 style='float:left; padding:30px 90px;'>"+ a%6*3+"포인트 획득</h3>");
				$("#eventmyModal").modal('show');
				
			
			
			
			}
	  },
	  error:function(data){
		  alert("에러");
	  }

}); 
}


//made by vipul mirajkar thevipulm.appspot.com
var TxtType = function(el, toRotate, period) {
        this.toRotate = toRotate;
        this.el = el;
        this.loopNum = 0;
        this.period = parseInt(period, 10) || 2000;
        this.txt = '';
        this.tick();
        this.isDeleting = false;
    };

    TxtType.prototype.tick = function() {
        var i = this.loopNum % this.toRotate.length;
        var fullTxt = this.toRotate[i];

        if (this.isDeleting) {
        this.txt = fullTxt.substring(0, this.txt.length - 1);
        } else {
        this.txt = fullTxt.substring(0, this.txt.length + 1);
        }

        this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

        var that = this;
        var delta = 200 - Math.random() * 100;

        if (this.isDeleting) { delta /= 2; }

        if (!this.isDeleting && this.txt === fullTxt) {
        delta = this.period;
        this.isDeleting = true;
        } else if (this.isDeleting && this.txt === '') {
        this.isDeleting = false;
        this.loopNum++;
        delta = 500;
        }

        setTimeout(function() {
        that.tick();
        }, delta);
    };

    window.onload = function() {
        var elements = document.getElementsByClassName('typewrite');
        for (var i=0; i<elements.length; i++) {
            var toRotate = elements[i].getAttribute('data-type');
            var period = elements[i].getAttribute('data-period');
            if (toRotate) {
              new TxtType(elements[i], JSON.parse(toRotate), period);
            }
        }
        // INJECT CSS
        var css = document.createElement("style");
        css.type = "text/css";
        css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
        document.body.appendChild(css);
    };



    $(function(){
    	
    	$("#evendAdv button").click(function(){
    		var index=$("#evendAdv button").index(this);
    		
    		for(var k=0;k<ix2.length;k++){
    			if(index==k && ix2[k]==0){
	        		$("#adv .col-md-4 ").eq(k).find('div').slideDown();
	        		ix2[k]++;
	        		return
    			}
    			
    			else if(index==k && ix2[k]==1)
    			{
    				$("#adv .col-md-4").eq(k).find('div').slideUp();
    				ix2[k]=0;
    				return
        				
    			}
    			
	        	
    			
    		}

    		
    	});
    	
    	
    })
    
    
    //function 만들기
    //아이콘 누르면
    //버튼이 나옴

function clickIcon(){
    	if(ix==0){
    		$("#evendAdv").slideDown();
    		$("#adv").slideDown();
        			ix++;
    	}else{
    		ix=0;
    		$("#evendAdv").slideUp();
    		$("#adv").slideUp();
        
    	}
    	
    	
    }


</script>

<body>

	<jsp:include page="../side.jsp">
	<jsp:param value="daily" name="selectMenu"/>
	</jsp:include>
 <div class="main-panel">
  <jsp:include page="../top.jsp"></jsp:include>
          
          
          
          
          
          
          
            <div class="content">
	
			 
				  <div class="container-fluid">
				  		
			 	  
                         	<div class="row">
                         	
                         	<div class="card card-plain">
                         	    <div class="col-md-10 col-md-offset-1">
                         	    <div class="card-header" data-background-color="purple">
                                  
                                  <h3 style="text-align:center;" >
						 	 <a href="" class="typewrite" data-period="2000" data-type='[ "I Love ItWill", "매일 매일 이벤트", "확실하지 않으면 승부를 걸지 마라" ]'>
						    <span class="wrap"></span>
						 			 </a>
									</h3>
				  			 </div>
                                </div>
                                </div>
                                </div>
                                
                                
              
			
                                
                                
                                
                                
                                
                                
                                
                                
                                <div class="row">
                              
                              <div class="col-md-6"  >
                              	<div class="col-md-8 col-sm-8 col-ls-8 col-md-offset-2 col-sm-offset-2 col-ls-offset-2 " style="background-color:white;">
                              	<div class="alert alert-info" data-background-color="purple">
                                    <h4 class="title" style="font-size:1vw;">매일매일 이벤트 참여하기!</h4>
                                    <p class="category" style="font-size:1vw;">하루에 한번만 참여 가능합니다.</p>
                                </div>
                                
                              	 <div class="col-md-4 col-sm-4 col-ls-4" >
                                 <div  id="c0" class="card" style="background-color: #F1E96E">
                                
                                 <img id="0" src="./event/daily/0.png"  width="100%" alt="" style="background-color: #F57D6A"/>
                              
                                </div>
								</div>
								
								 <div class="col-md-4 col-sm-4 col-ls-4">
                                 <div id="c1" class="card" style="background-color: #F1E96E">
                                 
                                    <img id="1" src="./event/daily/1.png" alt="" width="100%" style="background-color: #F57D6A"/>
                                    </div>
                                    </div>
								
								
								
								 <div class="col-md-4 col-sm-4 col-ls-4">
                                 <div id="c2" class="card" style="background-color: #F1E96E">
                                 
                                    <img id="2" src="./event/daily/2.png" alt="" width="100%" style="background-color: #F57D6A"/>
                                    </div>
                                    </div>
								
								
								
								 <div class="col-md-4 col-sm-4 col-ls-4">
                                 <div id="c3" class="card" style="background-color: #F1E96E">
                                 
                                    <img id="3" src="./event/daily/3.png" alt="" width="100%" style="background-color: #F57D6A"/>
                                    </div>
                                    </div>
								
								
								
								 <div class="col-md-4 col-sm-4 col-ls-4">
                                 <div id="c4" class="card" style="background-color: #F1E96E">
                                 
                                    <img id="4" src="./event/daily/4.png" alt="" width="100%" style="background-color: #F57D6A"/>
                                    </div>
                                    </div>
								
								
								
								 <div class="col-md-4 col-sm-4 col-ls-4">
                                 <div id="c5" class="card" style="background-color: #F1E96E">
                                 
                                    <img id="5" src="./event/daily/5.png" alt="" width="100%" style="background-color: #F57D6A"/>
                                    </div>
                                    </div>
								
								<div class="row">
								<form id="form1">
									<input type="hidden" name="subject" value="daily"> <input
										type="hidden" name="id" value=<%=session.getAttribute("Id")%>>
									<input type="hidden" id="point" name="point"> 
									 <div class="alert alert-success col-md-2 col-md-offset-5" onclick="logck('<%=session.getAttribute("Id")%>')" >
                                        <span style="text-align:center;">
                                            <b style="font-weight:bold;font-size:0.9rem;"> 참여하기  </b></span>
                                    </div>
									
								</form>
								</div>
								
              
                              	</div>
                           	
                              <!--  -->
								
					
								
                                </div>
                                
                                
                                <div class="col-md-6">
                                <div class="col-md-8 col-sm-8 col-ls-8 col-md-offset-2 col-sm-offset-2 col-ls-offset-2 " style="background-color:white;">
                              	 	
                              	 	<div class="row">
                              	 	<div class="alert alert-info" >
                            		        <h3 class="title" style="font-size:1vw;">매일매일 이벤트!</h3>
                                   
                                   
                            		</div>
                              		</div>
                              		<div class="row">
                              		<div class="error-notice" >
          <div class="oaerror danger" style=" height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;"><strong>규칙</strong> -  하루에 한번 당신은 참여 할 수 있습니다.</div>
          </div>
          <div class="oaerror warning" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;"><strong>꽝</strong> - 0점 </div>
          </div>
          <div class="oaerror info" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;"><strong>3</strong> - 3점</div>
          </div>
          <div class="oaerror warning" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;"><strong>6</strong> - 6점</div>
          </div>
          <div class="oaerror info" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;"><strong>9</strong> -9점</div>
          </div>
          <div class="oaerror warning" style="height:40px;">
           <div style="margin-top:-2%; font-size:0.8vw;"> <strong>12</strong> - 12점 </div>
          </div>
          <div class="oaerror info" style="height:40px;">
           <div style="margin-top:-2%; font-size:0.8vw;"> <strong>15</strong> - 15점</div>
          </div>
    
    
         
        </div>
        
               </div>
                    
                    
        							<div class="row">
                              	 	<div class="alert alert-info" >
                              	 	<div onclick="clickIcon()" style="cursor:pointer;"><i class="material-icons"    style="" title="포인트 혜택 확인하기">content_copy</i>
                            		포인트 혜택 확인하기
                            		 </div></div>
                            		 </div>
        
                    
                         
				 <!--  혜택 확인 페이지 -->
                           <div class="row"  id="evendAdv" style="display:none;">
                          			<div class="col-md-4">
                                            <button class="btn btn-primary btn-block" style="font-size:0.7vw; text-align:center;" ><span >포인트 혜택</span></button>
                                        </div>
                                        <div class="col-md-4">
                                            <button class="btn btn-primary btn-block" style="font-size:0.7vw; text-align:center;"><span >포인트 적용 예시</span></button>
                                        </div>
                                        <div class="col-md-4">
                                            <button class="btn btn-primary btn-block"  style="font-size:0.7vw; text-align:center;"><span >물건 할인 예시</span></button>
                                        </div>
                           
                           </div>
                           <div class="row" style="display:none;"  id="adv">
                           <!--  혜택  -->
                           <div class="col-md-4" >
                           <div class="alert alert-info" style="display:none; font-size:0.5vw;">
			                	매일 매일 이벤트는 하루에 한번 이용하실 수 있습니다.
			                	하지만 바로 사용할 수 있는것이 아닙니다.           
							
                           	</div>
                           </div>
                           
                           <div class="col-md-4" >
                           <div class="alert alert-info" style="display:none; font-size:0.5vw;">
                         	원하는 물품에 포인트를 이용하려면
                         	물품에 5%의 포인트가 존재해야 합니다.
                         	만약 5%의 포인트가 없다면 
                         	물품을 할인하여 살순 없습니다.                         	
                           	</div>
                           </div>
                           <div class="col-md-4" >
                           <div class="alert alert-info" style="display:none; font-size:0.5vw;">
                           		예시: 훈제 닭가슴살 (47,500원) <br/>
                          		할인 가격:47500*0.05=2375원<br/>
                           	47500-2375=45125원에 구입. <br/>
                           	즉 2375원을 할인 받으실 수 있습니다. <br/>
                           	</div>
                           </div>
                           
                           
                           </div>
                           
                              	
                              	
                              	
                              	</div>
                                
                                
                                </div>
                                
                                
                                
                                </div>
                                <div class="row">
                                			      <div class="col-md-6"  >
                              	<div class="col-md-8 col-sm-8 col-ls-8 col-md-offset-2 col-sm-offset-2 col-ls-offset-2 " style="background-color:white;">
                              	          		 
								
								</div>
								
				                     </div>
                               
                              
                       
                    </div>
                </div>
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 <div class="modal fade" id="eventmyModal" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog ">
    
      <!-- Modal content-->
         <div class="modal-content "  >
                     
        		<div class="modal-header alert alert-info"">
                            <h4>매일 매일 이벤트</h4>
                                
                         </div>
                         
              <div class="modal-body" id="eventmyModal_Content">
              
              </div>
                     
                     
                     
                     
                     
                         </div>
			 	
     			 </div>
    		</div>
    
				 
				 
				 
				 
				 
			
			</div>
			
			
		</div>

</body>
</html>