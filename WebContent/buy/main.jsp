<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
  <script type="text/javascript">
    
   	function checkS(num){

   		
   		var id="#form"+num;
   		var fdata=$(id).serialize();
   		var adnum=1;

   		location.href="./buy_slist.do?"+fdata+'&adnum='+adnum;
   	}
     
     function Keysearch(){

                 var Keyword=$("#Keyword").val();
                 location.href="buy_slist.do?Keyword="+Keyword;
       }


   </script>
  
  
<script type="text/javascript">
	function move(){
		
		location.href="buy_slist.do";
	}
	function read(name){
		
		location.href="buy_sread.do?name="+name;
	}
	function m_insert(){
		
		
		location.href="./buy/buy_sinsert.jsp";
	}
	function master(){
		location.href="./buy/buy_master.jsp";
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

			<div class="container-fluid">
				<div class="row"><!--1 row  -->
					<div class="col-lg-10 col-md-10">
						<div class="card card-nav-tabs">
							<div class="card-header" data-background-color="orange">
								<div class="nav-tabs-navigation">
									<div class="nav-tabs-wrapper">
										<span class="nav-tabs-title">목차</span>
										<ul class="nav nav-tabs" data-tabs="tabs">
											<li class="active"><a href="#Food" data-toggle="tab">
													<i class="material-icons">restaurant</i>Food
													<div class="ripple-container"></div>
											</a></li>
											<li class=""><a href="#Exercise" data-toggle="tab">
													<i class="material-icons">transfer_within_a_station</i>Exercise
													<div class="ripple-container"></div>
											</a></li>
												<li>
												<a class="btn btn-danger" onclick="move();">LIST 전체보기 </a>
												</li>
												<c:if test="${sessionScope.Level eq 6 }">
													<li>
														<a class="btn btn-default" onclick="m_insert();">이동 insert</a>
													</li>
												</c:if>
												<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</li>
												<li>
												<input type="text" class="form-control" id="Keyword" value="" placeholder="검색어를 입력하세요."> 
												</li>
												<li>
												<a class="btn btn-default" onclick="Keysearch();">검색</a>
												</li>
											</ul>
									</div>
								</div>
							</div>
							<div class="card-content">
								<div class="tab-content">
									<div class="tab-pane active" id="Food">
									<form action="" name="form1" id="form1">
									<input type="hidden" name ="bigtype" id="bigtype" value="food">
										<table class="table" style="border-bottom: 1px solid gray;" >
											<tbody>
												<tr>
													<td >
														회사
													</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox" id="company"
																name="company" value="SS">
															</label>
														</div>
													</td><td>삼성</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox"
																name="company" value="HD">
															</label>
														</div>
													</td><td>현대</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox"
																name="company" value="LG">
															</label>
														</div>
													</td><td>lg</td>
													
												</tr>
												
											</tbody>
										</table>
										
										<table class="table" style="border-bottom: 1px solid gray;">
											<tbody>
												<tr>
													<td>종류</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="type" value="tan" >
															</label>
														</div>
													</td><td>탄수화물 차단제</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="type" value="shake" >
															</label>
														</div>
													</td><td>다이어트 쉐이크</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="type" value="che" >
															</label>
														</div>
													</td><td>체지방 감소제</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="type" value="fect" >
															</label>
														</div>
													</td><td>기타 다이어트</td>
													
												</tr>
											</tbody>
										</table>
										
										<table class="table" style="border-bottom: 1px solid gray;">
											<tbody>
												<tr>
													<td>남녀</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="sex" value="MA" >
															</label>
														</div>
													</td><td>남자</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="sex" value="FE" >
															</label>
														</div>
													</td><td>여자</td>
													<td>
														<input type="button"  class="btn btn-default" value="검색" onclick="checkS(1);">
													
													</td>
													
	
												</tr>
											</tbody>
										</table>
										</form>
										
									</div>
									<div class="tab-pane" id="Exercise">
									<form action="" name="form2" id="form2">
									<input type="hidden" name ="bigtype" id="bigtype" value="exercise">
										<table class="table" style="border-bottom: 1px solid gray;" >
											<tbody>
												<tr>
													<td >
														회사
													</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox"
																name="company" value="SS">
															</label>
														</div>
													</td><td>삼성</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox"
																name="company" value="HD">
															</label>
														</div>
													</td><td>현대</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox"
																name="company" value="LG">
															</label>
														</div>
													</td><td>lg</td>
													
												</tr>
												
											</tbody>
										</table>
										
										<table class="table" style="border-bottom: 1px solid gray;">
											<tbody>
												<tr>
													<td>종류</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="type" value="health" >
															</label>
														</div>
													</td><td>헬스</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="type" value="spo" >
															</label>
														</div>
													</td><td>스포츠</td>
													
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="type" value="eect" >
															</label>
														</div>
													</td><td>기타 다이어트</td>
													
												</tr>
											</tbody>
										</table>
										
										<table class="table" style="border-bottom: 1px solid gray;">
											<tbody>
												<tr>
													<td>남녀</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="sex" value="MA" >
															</label>
														</div>
													</td><td>남자</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="sex" value="FE" >
															</label>
														</div>
													</td><td>여자</td>
													<td>
														<input type="button" class="btn btn-default" value="검색" onclick="checkS(2);">
													
													</td>
												
	
												</tr>
											</tbody>
										</table>
										</form>
										
										
									</div>
									
										
																			
									</div>
								</div>
							</div>
					</div>
					<div class="col-md-2">
					
														
														<!-- <input type="button" class="btn btn-default" onclick="master();" id="master1" value="masterPage"> -->
														
													
					</div>
				</div><!-- 1 row end-->
				<div class="col-lg-2 col-md-2">
					
				</div>
				<div class="row">
				</div>
				<div class="row"><!--2 row start  -->
					<div class="col-lg-5 col-md-10">
						<div class="card card-nav-tabs">
							<div class="card-header" data-background-color="orange">
								<div class="nav-tabs-navigation">
									<div class="nav-tabs-wrapper">
										<span class="nav-tabs-title">Food</span>
										<ul class="nav nav-tabs" data-tabs="tabs">
											<li class="active"><a href="#fEvent" data-toggle="tab">
													<i class="material-icons">lightbulb_outline</i>평점 순
													<div class="ripple-container"></div>
											</a></li>
											<li class=""><a href="#fHot" data-toggle="tab">
													<i class="material-icons">trending_up</i>판매 순
													<div class="ripple-container"></div>
											</a></li>
											
										</ul>
									</div>
								</div>
							</div>
							<div class="card-content">
								<div class="tab-content active">
									<div class="tab-pane active" id="fEvent">
                                            
                                            
                                            
                                            
        <c:forEach var="j" items="${v}" varStatus="status">	
        <c:if test="${status.count%3==1 }">
        <div class="row" >
        </c:if>
			<div class="col-lg-4" >
				<div class="card">
					<div class="card-header card-chart" data-background-color="orange">
						<div class="ct-chart" id="dailySalesChart">
							<a href="#" onclick="read('${j.name}')">
    	  					<img src="./upload/${j.img }"  style="height:160px;">
    	  					</a>
						</div>
					</div>
					<div class="card-content">
						<h4 class="title" align="center">${j.name}</h4>
						<p class="category text-center">
						<span class="text-success"> ￦${j.price } </span></p>
					</div>
					<div class="card-footer">
						<div class="stats">
							${j.sexpl }
						</div>
					</div>
				</div>
			</div>
		<c:if test="${status.count%3==0||status.last }">
    	</div>
		</c:if>
		</c:forEach>
		
                                            
                                            
                                          
                                        </div>
	<div class="tab-pane" id="fHot">
										                                  
        <c:forEach var="j" items="${v1}" varStatus="status">	
        <c:if test="${status.count%3==1 }">
        <div class="row" >
        </c:if>
			<div class="col-lg-4" >
				<div class="card">
					<div class="card-header card-chart" data-background-color="orange">
						<div class="ct-chart" id="dailySalesChart">
							<a href="#" onclick="read('${j.name}')">
    	  					<img src="./upload/${j.img }" style="height:160px;">
    	  					</a>
						</div>
					</div>
					<div class="card-content">
						<h4 class="title" align="center">${j.name}</h4>
						<p class="category text-center">
						<span class="text-success"> ￦${j.price }   </span></p>
					</div>
					<div class="card-footer">
						<div class="stats">
							${j.sexpl }
						</div>
					</div>
				</div>
			</div>
		<c:if test="${status.count%3==0||status.last }">
    	</div>
		</c:if>
		</c:forEach>
	</div>
	
								</div>
							</div>
						</div>
					
						
					</div><!--col lg 6 //food end  -->
					<div class="col-lg-5 col-md-10"><!--col lg 6 // excercise start  -->
                            <div class="card card-nav-tabs">
                                <div class="card-header" data-background-color="orange">
                                    <div class="nav-tabs-navigation">
                                        <div class="nav-tabs-wrapper">
                                            <span class="nav-tabs-title">Exercise</span>
                                            <ul class="nav nav-tabs" data-tabs="tabs">
                                                <li class="active">
                                                    <a href="#eEvent" data-toggle="tab">
                                                        <i class="material-icons">lightbulb_outline</i> 평점 순
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="#eHot" data-toggle="tab">
                                                        <i class="material-icons">trending_up</i> 판매 순
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                                
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="eEvent">
                                                                              
        <c:forEach var="j" items="${v2}" varStatus="status">	
        <c:if test="${status.count%3==1 }">
        <div class="row" >
        </c:if>
			<div class="col-lg-4" >
				<div class="card">
					<div class="card-header card-chart" data-background-color="orange">
						<div class="ct-chart" id="dailySalesChart">
							<a href="#" onclick="read('${j.name}')">
    	  					<img src="./upload/${j.img }" style="height:160px;">
    	  					</a>
						</div>
					</div>
					<div class="card-content">
						<h4 class="title" align="center">${j.name}</h4>
						<p class="category text-center">
						<span class="text-success"> ￦${j.price }  </span></p>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">access_time</i> ${j.sexpl }
						</div>
					</div>
				</div>
			</div>
		<c:if test="${status.count%3==0||status.last }">
    	</div>
		</c:if>
		</c:forEach>
                                        </div>
                                        <div class="tab-pane" id="eHot">
                                                                           
        <c:forEach var="j" items="${v3}" varStatus="status">	
        <c:if test="${status.count%3==1 }">
        <div class="row" >
        </c:if>
			<div class="col-lg-4" >
				<div class="card">
					<div class="card-header card-chart" data-background-color="orange">
						<div class="ct-chart" id="dailySalesChart">
							<a href="#" onclick="read('${j.name}')">
    	  					<img src="./upload/${j.img }" style="height:160px;">
    	  					</a>
						</div>
					</div>
					<div class="card-content">
						<h4 class="title" align="center">${j.name}</h4>
						<p class="category text-center">
						<span class="text-success">￦${j.price }  </span></p>
					</div>
					<div class="card-footer">
						<div class="stats">
							${j.sexpl }
						</div>
					</div>
				</div>
			</div>
		<c:if test="${status.count%3==0||status.last }">
    	</div>
		</c:if>
		</c:forEach>
													
										</table>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div><!--col-excersize end  -->
						
						<div class="col-lg-2 col-md-4">
							 <div class="card card-nav-tabs">
                                <div class="card-header" data-background-color="purple">
                                    <div class="nav-tabs-wrapper">
                                    	오늘 본 품목
                            		</div>
                            	</div>
                            	 <div class="card-content">
                                    <div class="tab-content">
   										<div><!-- 오늘본 품목1 -->
   										<table class="table">
   											<c:if test="${fn:length(sessionScope.vlist) >= 3 }">
										<c:forEach var="v" items="${ sessionScope.vlist}"
											begin="${fn:length(sessionScope.vlist)-3}" end="${fn:length(sessionScope.vlist)-1}">
											<tr>
											<td><a href="#" onclick="read('${v.name}');"><img
													src="./upload/${v.img }"></a></td></tr>
												<tr>
											<td><a href="#" onclick="read('${v.name}');">${v.name }</a></td>
												</tr>
										</c:forEach>
										</c:if>
										<c:if test="${fn:length(sessionScope.vlist) < 3 }">
										<c:forEach var="v" items="${ sessionScope.vlist}">
											
											<tr>
											<td><a href="#" onclick="read('${v.name}');"><img
													src="./upload/${v.img }"></a></td></tr>
												<tr>
											<td><a href="#" onclick="read('${v.name}');">${v.name }</a></td>
												</tr>
										</c:forEach>
										</c:if>
   										</table>
   										</div>
                                    </div>
                                 </div>
                           	</div>
                                                
						</div>
				<!-- 	
				<input type="button" class="btn btn-default" onclick="move();"  value="이동 list">  -->
					
				</div><!--row end  -->
				
				</div>
			</div><!-- container end -->
		</div><!--content end  -->
	</div>
		
		


</body>
</html>
