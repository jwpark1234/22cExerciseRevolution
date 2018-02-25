<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"></script>

  
  
<script type="text/javascript">
var a=0;
var b=0;
 $(document).ready(function() { 
    
   
   $("#tr1").hide();
   $("#tr2").hide();
   $("#tr3").hide();
   $("#tr4").hide();
   
/*    */
}); 
 var couponflag=false;
 var pointflag=false;
 

   
    var data= ${baguni2};
   var process=1;
   var buying=0;
   function add(id,index){
      var selector="#"+id+"checkbox";
      var total=parseInt($("#total").text());
      
      
      var selector1="#"+id+"price";
      var selector3="#"+id+"count";
      var price=$(selector1).val();
   
      var count=$(selector3).val();
      
       var a=$(selector).is(":checked");
      
      if(a){
      /*     alert("+");
           alert(price+"//"+count+"//"+total); 
          alert(selector1);  */ 
         total=total+2500+((price*count));
         $(selector3).attr('disalbed',true);
         if(id!="buy"){
      /*       alert("바이문안"); */
            data[index].stat ="배송시작";
            
            data[index].count = count;   
         }
         
      }else {
      /*    alert("-");
         alert(price+"//"+count+"//"+total); */
         $(selector3).removeAttr("disalbed");
         total=total-2500-((price*count));
         if(id!="buy"){
         data[index].stat = "장바구니";
         /* alert(selector1); */
         data[index].count = 1;
         }
      }  
       
   /*    alert(" 바뀐값::"+price+"//"+count+"//"+total); */
      
       $("#total").text(total);
       
       var point=$("#pointprice").text();
       var coupon=$("#couponprice").text();
       
       
       /* if(!couponflag&&!pointflag){//둘다 사용중 이었으면 다시 구해야함
          var cval=parseInt($("#buycoupon").val());
          coupon= total*(100-cval)*100;
       }else if(!couponflag&&pointflag){//쿠폰만 사용중
          var cval=parseInt($("#buycoupon").val());
          coupon= total*(100-cval)*100;
       }else{//둘다 사용하지 않음
          
       } */
        couponuse();
        pointuse();

      
      
   }
   

   var gofinal=$("#gofinal").val();
   
   $(document).ready(function(){
      $('#con1').trigger('click');
   });
   function m_read(){
      location.href="buy_smain.do"
   }
   function btn1(){
      
      var total=$("#totalprice").text();
      if(total<=1000){
         alert("total <1000::: 하나는 골라주세요");         
      }else{
         
         process=2;
         $("#tr1").show();
//          if( $("#couponuse").is(":checked")){
            
//             var num=$("#totalprice").text();
            /* alert(num); */
            $("#tv1").text(total);
            
//          }else{
//       /*       alert($("#total").text()); */
//             var num=$("#total").text();
//             $("#tv1").text(num);
            
//          }

         $("#tv5").text("계산완료");
         /* alert("process::"+process); */
         $('#con1').prop("href","#dest active");
         if($("#confirm").hasClass("active")){
            
            $("#confirm").removeClass("active");
            /* $("#des").addClass("active"); */
            $("#dest").addClass("active"); 
         }
         $('#des1').trigger('click');   
      }
      
      
   }
   function isNull(elm)
   { 
           //Null 체크 함수
           var elm;
           return (elm == null || elm == "" || elm == "undefined" || elm == ""||elm == " ") ? true : false
   }
   function btn2(){
      /* alert($('#con1').find('href')); */
      
      var firstcheck=$("#receiver").val();
      var secondcheck=$("#destination").val();
      var thirdcheck=$("#order").val();
/*       alert(firstcheck.length+"//"+secondcheck.length+"//"+thirdcheck.length+"//"); */
      
   
      if(firstcheck.length>0&&secondcheck.length>0&&thirdcheck.length>0){
         process=3;
         $("#tr2").show();
         $("#tr3").show();
         /* alert("여기서 안되너"); */
         $("#tv2").text($("#destination").val());
         $("#tv3").text($("#receiver").val());
         $("#tv5").text("주소,수령인 입력 완료");
      /*    alert("process::"+process); */
      /*    if(!($("#totalprice").text()>10)){
            $("#totalprice").text($("#total").text());
         } */
         $('#des1').prop("href","#buy active");
         
         if($("#dest").hasClass("active")){
            /*  $("#con1").removeAttr("active"); */
            
            $("#dest").removeClass("active");
            /* $("#des").addClass("active"); */
            
            $("#buy").addClass("active"); 
            
         }
      
         $('#buy1').trigger('click');
         
         
         
      }else{
         alert("내용입력하세요");
      }
      
      
   }
   /* var couponname=""; */
   function btn3(){
      if(buying==1){
         process=4;
         $("#tr4").show();
         $("#tv4").text("카드결제 완료");
         $("#tv5").text("결제완료");
         
      /*    alert("process::"+process); */
         
         var bagunisize=$(bagunisize).val();
         var totalprice=$("#totalprice").text();
         var coupon_id = $("#buycoupon option:selected").text();
         var name=$("#buyname").val();
         var price=$("#buyprice").val();
         var count=$("#buycount").val();
         var pointprice=$("#pointprice").text();
         // 배송지, 수령자
         var destination=$("#destination").val();
         var receiver=$("#receiver").val();
         var img=$("#img").val();
         if($("#buycheckbox").is(":checked")){
            var check="true";
         }else{
            var check="false";
         }
          $.ajax({
                       url:"buy_bf.do",
                        dataType:'html',
                        data:{
                          data : JSON.stringify(data),
                          coupon_id : coupon_id,
                          destination : destination,
                          receiver : receiver,
                          name:name,
                          price:price,
                          count:count,
                          check:check,
                          img:img,
                          pointprice:pointprice,
                          totalprice:totalprice
                          
                        },
                        type:'post',
                        success:function(data){
                           
                          $('#buy1').prop("href","#fin active");
                         if($("#buy").hasClass("active")){
                            /*  $("#con1").removeAttr("active"); */
                            
                            $("#buy").removeClass("active");
                            /* $("#des").addClass("active"); */
                            $("#final").addClass("active"); 
                         }
                         $('#fin1').trigger('click');
                           
                        },
                        error:function(data){
                           alert("에러");
                        }
                       
                    
                  });
                $("#playy").prop("src","https://www.youtube.com/embed/vqj-gPUz4yg?amp;autoplay=1");/* 구매 축하영상 */
                //<iframe width="560" height="315" src="https://www.youtube.com/embed/vqj-gPUz4yg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
         // 쿠폰id   
      }else{
         alert("조건을 맞추세요");
      }
         
      
   
   }
   function btn_3(){
      
      
      location.href="./buy_smain.do";
      
   }
   function btn_2(){
      $('#buy1').prop("href","#buy active");
      $("#buy").removeClass("active");
      /* $("#des").addClass("active"); */
      $("#dest").addClass("active");
      $('#des1').trigger('click');
   }
   function btn_1(){
      $('#des1').prop("href","#confirm active");
      $("#dest").removeClass("active");
      /* $("#des").addClass("active"); */
      $("#confirm").addClass("active"); 
      $('#con1').trigger('click');
   }
   function buypop(){
      buying=1;
      var popUrl="./buy/buy.jsp";
      var popOption="width=900, height=600, top=300,left=400,resizable=no , scrollbars=no, status=no;";
      window.open(popUrl,"",popOption);
      
   }
   function f_go(){
      buying=1;
      
      
      
   }   
   
   function couponuse(){
      var total=parseInt($("#total").text());
   /*    if(total=="0"){
         return ;
      } */
      var sum=parseInt($("#buycoupon").val());
      var totalprice=$("#totalprice").text();
      var point=$("#pointprice").text();
      
      var a=$("#couponuse").is(":checked");
      couponflag=a;
      if(a){
         sum=total*(sum)/100;
      }else{
         sum=0;
      }
      $("#couponprice").text(sum);
      totalprice=total-sum-point;
      if(total=="0"){
         $("#couponprice").text(0);
         totalprice=0;
      }
      $("#totalprice").text(totalprice);
      
      
   }
   function pointuse(){
      
      var total=$("#total").text();
      /* if(total=="0"){
         return ;
      } */
      var point=${sessionScope.Point};
      var point_dis=${buy_point_discount};
      var totalprice=$("#totalprice").text();
      var sum=0;
      var coupon=$("#couponprice").text();
      
      var a=$("#pointuse").is(":checked");
      var pointflag=a;
      if(a){
      
         sum=total*(point_dis)/100; //최대할인받는금액
         if(sum>point){//최대할인받는 금액이 포인트보다 많으면
            sum=point;//포인트만 사용하겠다.
            
         }
         
      }else{
         sum=0;
      }
      $("#pointprice").text(sum);
      totalprice=total-sum-coupon;
      if(total=="0"){
         $("#pointprice").text(0);
         totalprice=0;
      }
      $("#totalprice").text(totalprice);
      
      
   }
</script>
<script type="text/javascript">
   function inputg(ID){
       
      var id="#"+ID;
      var hid="#"+ID+"1";
      var hidv=$(hid).val();
      /* alert($(hid).val()); */
      
      
      $(id).val(hidv);  
      
   }

</script>
</head>
<body>
<input type="hidden" id="destination1" value="${uv.address }">
<input type="hidden" id="receiver1" value="${uv.name }">
<jsp:include page="../side.jsp">
      <jsp:param value="buy_ex2" name="selectMenu" />
   </jsp:include>
   <div class="main-panel">
      <jsp:include page="../top.jsp"></jsp:include>
      
      <div class="content">
         <div class="col-lg-12 col-md-12">
            <div class="row">
               <div class="col-lg-8 col-md-8">
                  <div class="card card-nav-tabs">
                     <div class="card-header" data-background-color="orange">
                        <div class="nav-tabs-navigation">
                           <div class="nav-tabs-wrapper">
                              <span class="nav-tabs-title">구매</span>
                              <ul class="nav nav-tabs" data-tabs="tabs">
                                 <li class=""><a data-toggle="tab" id="con1">
                                       <i class="material-icons">code</i> 제품확인
                                       <div class="ripple-container"></div>
                                 </a></li>
                                 <li class=""><a data-toggle="tab" id="des1"> 
                                       <i class="material-icons">code</i> 수령인 입력
                                       <div class="ripple-container"></div>
                                 </a></li>

                                 <li class=""><a data-toggle="tab" id="buy1"> <i
                                       class="material-icons">cloud</i>결제
                                       <div class="ripple-container"></div>
                                 </a></li>
                                 <li class=""><a data-toggle="tab" id="fin1"> <i
                                       class="material-icons">cloud</i> 주문완료
                                       <div class="ripple-container"></div>
                                 </a></li>
                              </ul>
                           </div>
                        </div>
                     </div>
                     <div class="card-content">
                        <div class="tab-content">
                           
                           <div class="tab-pane active" id="confirm">
                              <div class="container-fluid ">
                              
                              
                              
                              
                              
                              
                              <table class="table" id="table1"><!--가격입력  -->
                                 <tbody>
                                 <c:if test="${bnum!=1 }" >
                                    <tr id="table1_tr1" style="background-color: yellow;">
                                       <td>목차</td>
                                       <td>상품 그림 </td>
                                       <td>상품 이름</td>
                                       <!-- <td>제품이미지</td> -->
                                       <td>상품 갯수</td>
                                    
                                       <td>금액</td>
                                       <td>배송비</td>
                                       <td>구매여부</td>
                                       
                                    </tr>
                                       <form action="#" id="buy_bf">
                                       
                                       
                                       <input type="hidden" id="bagunisize" value="${fn:length(baguni) }">
                                       
                                    
                                    <c:forEach var="v" items="${baguni}" varStatus="status"><!-- 장바구니목록 -->                                       <%-- <c:if test="${status.index %2 eq 0}"><tr></c:if> --%>
                                    <!--    
                                       <tr style="background-color: #D7DF01;">
                                       <td>v.img</td>
                                       <td>상품 이름</td>
                                       <td>제품이미지</td>
                                       <td>상품정보</td>
                                    
                                       <td>판매자</td>
                                       <td>배송비</td>
                                       <td>수량</td>
                                       <td>할인</td>
                                       <td>주문금액</td>
                                       
                                       </tr> -->
                                       
                                       <tr class="table1_tr2">
                                       
                                       <td><h4>${status.count}</h4></td>
                                       <td><img alt="" src="./upload/${v.pimg }" style="height:50px; width:70px;"> </td>
                                       <td><h4>${v.pname }</h4></td>
                                       <td>
                                       <select class="form-control" id="${v.pname }count"><!-- buydto.sell로 넘길거야 -->
                                             <option value="1">1</option>
                                             <option value="2">2</option>
                                             <option value="3">3</option>
                                             <option value="4">4</option>
                                             <option value="5">5</option>
                                       </select>
                                       </td>
                                       <td><input type="hidden" id="${v.pname }price" value="${v.price }" disabled="disabled" class="form-control"><h4>￦${v.price }</h4></td>
                                       <td><h4>￦2500</h4></td>
                                       <td>
                                       
                                       
                                        <div class="checkbox">
                                                      <label for="${v.pname }checkbox">
                                                         <input type="checkbox" id="${v.pname }checkbox" onchange="add('${v.pname}','${status.index }');">
                                                      </label>
                                                      </div> 
                                        <%-- <input type="checkbox" id="${v.pname }checkbox" onchange="add('${v.pname}','${status.index }');" > --%></td> 
                                        
                                       
                                       
                                       </c:forEach>
                                       
                                       
                                       
                                    </tr>
                                    </form>
                                 </c:if>
                                    <tr height="30px">
                                       <td colspan="7"> <font color="white">sorry</font></td>
                                    </tr>
                                 <%--    <c:forEach var="v" items="${v}" varStatus="status">
                                       <tr>
                                          <td>${ }</td>
                                          
                                       </tr>
                                    </c:forEach> --%>
                                    <c:if test="${bnum!=4 }">
                                    <tr id="table1_tr3" style="background-color: orange;">
                                       <td> <h4>목차</h4> </td>
                                       <td><h4>상품그림</h4> </td>
                                       <td><h4>상품이름</h4></td>
                                       <!-- <td>제품이미지</td> -->
                                       <td><h4>상품갯수</h4></td>
                                    
                                       <td><h4>금액</h4></td>
                                       <td><h4>배송비</h4></td>
                                       <td><h4>구매여부</h4></td>
                                    
                                       
                                    </tr>
                                       
                                    <tr id="table1_tr4" >
                                       <td><h4>구매상품</h4></td>
                                       <td><img alt="" src="./upload/${img }" style="width:70px; height=60px;" >
                                          <input type="hidden" id="img" value="${img }">
                                         </td>
                                       <td><h4>${name}</h4></td>
                                       <td> <select class="form-control" id="buycount">
                                             <option value="1">1</option>
                                             <option value="2">2</option>
                                             <option value="3">3</option>
                                             <option value="4">4</option>
                                             <option value="5">5</option>
                                             
                                             <!--  div class="form-group">
                                          <label for="sel1">Select list (select one):</label>
                                             <select class="form-control" id="sel1">
                                               <option>1</option>
                                              <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                             </select>-->
                                       </select></td>
                                       <td><h4>￦${price }</h4></td>
                                       <td>
                                       <h4>￦2500</h4>
                                       <input type="hidden" id="buyname" value="${name }">
                                       <input type="hidden" id="buyprice" value="${price }">
                                       
                                       
                                       </td>
                                       <td>
                                        <!-- <td><img src=""></td> -->
                                       
                                                 <div class="checkbox">
                                                      <label for="buycheckbox">
                                                         <input type="checkbox" id="buycheckbox" onchange="add('buy','1');">
                                                      </label>
                                                   </div>
                                                  
                                       
                                       <!-- <input id="buycheckbox" class="btn btn-primary" type="checkbox" onchange="add('buy','1');"> --></td>
                                       </tr>
                                       </c:if>
                                    <tr>
                                       <td colspan="3"> 
                                       
                                       </td>
                                       <td>
                                       <h4>상품 총액</h4> 
                                       <!-- <h2><input type="text" class="form-control" value="0" id="total" disabled="disabled"></h2> -->
                                       
                                       </td>
                                       
                                       <td colspan="2" align="center"><h3 id="total">0</h3>
                                       </td>
                                       <td></td>
                                    </tr>
                                    
                                    <tr>
                                       <td >
                                       <h4>쿠폰</h4>
                                       </td>
                                       <td>
                                       <select id="buycoupon" class="form-control">
                                       <option value="100">-------</option>
                                       <c:forEach var="cp" items="${cp }" varStatus="status">
                                             <option id="${cp.coupon }" value="${cp.discount }">${cp.coupon } </option>
                                        </c:forEach>
                                           </select>
                                       </td>
                                       <td>
                                       
                                     
                                         <div class="checkbox">
                                                      <label for="couponuse">
                                                         <input type="checkbox" id="couponuse" onchange="couponuse();">
                                                      </label>
                                                      </div>  
                                        <!-- <input type="checkbox" id="couponuse" onchange="couponuse();" > -->
                                        
                                        </td>
                                        
                                        <td><p class="category"><h4>쿠폰 할인가</h4> <!-- <input class="form-control" type="hidden" id="totalprice" value="0" disabled> --> </td>
                                       <td colspan="2" align="center"><h3 id="couponprice">0</h3></td>
                                       <!-- <td colspan="2" align="center"><h3 id="totalprice">0</h3></td> -->
                                       <td></td>
                                    </tr>
                                    <tr>
                                       <td >
                                       <h4>포인트</h4>
                                       </td>
                                       <td>
                                        현재 보유 포인트 ${sessionScope.Point}P<br><br>
                                        구매금액의 ${buy_point_discount}% 사용가능
                                       </td>
                                       <td>
                                       
                                     
                                         <div class="checkbox">
                                                      <label for="pointuse">
                                                         <input type="checkbox" id="pointuse" onchange="pointuse();">
                                                      </label>
                                                      </div>  
                                        <!-- <input type="checkbox" id="couponuse" onchange="couponuse();" > -->
                                        
                                        </td>
                                        
                                        <td><p class="category"><h4>포인트 할인가</h4> <!-- <input class="form-control" type="hidden" id="totalprice" value="0" disabled> --> </td>
                                       <td colspan="2" align="center"><h3 id="pointprice">0</h3></td>
                                       <!-- <td colspan="2" align="center"><h3 id="totalprice">0</h3></td> -->
                                       <td></td>
                                    </tr>
                                    <tr>
                                       <td colspan="3"> 
                                       
                                       </td>
                                       <td>
                                       <h4>결제하실 금액</h4> 
                                       <!-- <h2><input type="text" class="form-control" value="0" id="total" disabled="disabled"></h2> -->
                                       
                                       </td>
                                       
                                       <td colspan="2" align="center"><h3 id="totalprice">0</h3>
                                       </td>
                                       <td></td>
                                    </tr>
                                    
                                    <tr>
                                       <td colspan="7"><input type="button" class="btn btn-default" value="다음페이지" onclick="btn1();">
                                       </td>
                                       
                                    </tr>
                                    
                                 </tbody>
                              </table>
                              </div>
                           </div>
                           
                           
                        <div class="tab-pane" id="dest">
                           <div class="container-fluid">
                              <div class="row">
                              <div class="col-md-4">
                              
                                 <div class="form-group">
                                 <p class="category"><h4>구매자</h4> </p>
                                     <br><input class="form-control" type="text" id ="order" value="${uv.ID }" placeholder="Input Your Name"  class="form-control" />
                                 </div>

                              </div>
                              <div class="col-md-4">
                                 <div class="form-group">
                                 <p class="category">누가 이 물건을 받나요?</p>
                                  <br><input type="text" id="receiver" value="" placeholder="Input receiver" class="form-control" />
                                     
                                     <button class="btn btn-default"  onclick="inputg('receiver');">내이름 넣기</button>
                                 </div>
                                 

                              </div>
                              <div class="col-md-4">
                              
                                 <div class="form-group">
                                 <p class="category">어디로 이 물건을  받을래요?</p>
                                  <br><input type="text" id="destination" value="" placeholder="Input your Address" class="form-control" />
                                 </div>
                                 
                                 <button class="btn btn-default" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
                                 <br>
                                 <button class="btn btn-default" onclick="inputg('destination');">우리집주소 넣기</button>
                              </div>
                              
                              </div>
                              <div class="row">
                                 <div class="col-md-12">
                                    <!-- <input type="text" id="sample6_postcode" placeholder="우편번호"> -->



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!-- 지도 api -->
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
                fullAddr=data.zonecode+" "+fullAddr;
                 //5자리 새우편번호 사용
                document.getElementById('destination').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('destination').focus();
            }
        }).open();
    }
</script>
                                 </div>
                                 
                              </div>
                           </div>
                           
                              <table class="table"><!--위치 주소  -->
                                 <%-- <tr>
                                    <td >주문자</td>
                                    <td><input type="text" id="order1" value="${uv[0].ID }" width="150" disabled>
                                       
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>수령주소</td>
                                    <td><input type="text" id="destination2" width="150" ><a href="#" onclick="inputg('destination');"> 우리집넣기.</a>
                                     
                                    <input type="hidden" id="destination1" value="${uv[0].Address}">
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>수령인</td>
                                    <td><input type="text" id="receiver2" width="150" ><a href="#" onclick="inputg('receiver');"> 내이름넣기.</a>
                                    <input type="hidden" id="receiver1" value="${uv[0].Name }" > </td>
                                    
                                 </tr> --%>
                                 <tr>
                                       
                                    <td colspan="2">
                                    <input type="button" class="btn btn-default" value="이전페이지" onclick="btn_1();">
                                    <input type="button" class="btn btn-default" value="다음페이지" onclick="btn2();">
                                    </td>
                                 </tr>



                              </table>

                           </div>
                           
<div class="tab-pane" id="buy">
                              <table class="table"><!--결제  -->
                                 <tbody>
                                    <tr>
                                       <td>
                                       <div class="alert alert-info">
<div class="container-fluid">
  <div class="alert-icon">
   <i class="material-icons">info_outline</i>
  </div>
  <button type="button" class="close btn btn-default"" data-dismiss="alert" aria-label="Close">
   <span aria-hidden="true"></span>
  </button>
  <b>페이 준비중:</b> 카드 외 다른 구매방법을 준비중입니다.   
</div>
</div>
                                       <!-- <input type="button" class="btn btn-default" value="결제 넘어가기 " onclick="f_go();">-->
                                       </td> 
                                    </tr>
                                    <tr>
                                       <td colspan="2">
                                       <div class="alert alert-success">
<div class="container-fluid">
  <div class="alert-icon">
   <i class="material-icons">check</i>
  </div>
  <button type="button" class="close" data-dismiss="alert" >
   <span aria-hidden="true"></span>
  </button>
  <b>카드결제 가능:</b> 카드 결제 시스템이 준비되었습니다
</div>
</div>
                                          <input type="button" class="btn btn-default" value="사러가기" onclick="buypop();">
                                          <input type="hidden" value="none" id="gofinal">
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">
                                       <input type="button" class="btn btn-default" value="이전페이지" onclick="btn_2();">
                                       <input type="button"  class="btn btn-default" value="다음페이지" onclick="btn3();">
                                       </td>
                                    </tr>

                                 </tbody>
                              </table>
                           </div>
                           <div class="tab-pane" id="final">
                              <div class="container-fluid">
                                 <div class="row">
                                    <div class="col-md-offset-4 col-md-4"">
                                 
   <div class="card">
      <div class="card-header card-chart" data-background-color="orange">
         <div class="ct-chart" id="dailySalesChart">
         <img src="upload/complete.jpg">


         
         </div>
      </div>
      <div class="card-content" align="center">
         <h4 class="title">구매해주셔서 감사합니다</h4>
         <p class="category"><span class="text-success"><i class="fa fa-long-arrow-up"></i> </span> 구매해주셔서 감사합니다</p>
      </div>
   </div>

                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                 </div>
                              </div>
                           
                              <table class="table"><!--고고고!!!  -->
                                 <tbody>
                                    
                                    <tr>

                                       <td colspan="2">
                                       <input type="button" class="btn btn-default" value="메인으로 돌아가기" onclick="btn_3();">
                                       </td>
                                    </tr>

                                 </tbody>
                              </table>
                           </div>

                        </div>
                     </div>
                  </div>

               </div>
               
               <div class="col-md-4">
                  <div class="card">
   <div class="card-header" data-background-color="orange">
      <h4 class="title">결제 진행 상태</h4>
      <p class="category">내 몸에 투자하세요!</p>
   </div>
   <div class="card-content table-responsive table-full-width">
      <table class="table" id="table1" width="100%">
         
         <tbody>
            <tr id="tr1">
               <td width="30%"><h4>가격</h4></td>
               <td width="70%"><h4 id="tv1">wait</h4></td>   
            </tr>
            <tr id="tr2">
               <td><h4>주소</h4></td>
               <td><h4 id="tv2">wait</h4></td>   
            </tr>
            <tr id="tr3">
               <td><h4>수령자</h4></td>
               <td><h4 id="tv3">wait</h4></td>   
            </tr>
            <tr id="tr4">
               <td><h4>결제진행상태</h4></td>
               <td><h4 id="tv4">완료</h4></td>   
            </tr>
            <tr id="tr5">
               <td><h4>상태</h4></td>
               <td><h4 id="tv5">바구니</h4></td>   
            </tr>
         </tbody>
         </table>
         </div>
         </div>
               </div>
               
            </div>
         </div>



         
      </div>
   </div>   
   
   

</body>
</html>