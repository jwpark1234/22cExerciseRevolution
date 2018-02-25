<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	function m_read(){
		location.href="buy_sread.do";
	}
	function read(a){
		location.href="buy_sread.do?name="+a;
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
					<div class="col-lg-10 col-md-10">
						<div class="card card-nav-tabs">
							<div class="card-header" data-background-color="orange">
								<div class="nav-tabs-navigation">
									<div class="nav-tabs-wrapper">
										<span class="nav-tabs-title">Food</span></a>
										<ul class="nav nav-tabs" data-tabs="tabs">
											<li class="active"><a href="#Food" data-toggle="tab">
													<i class="material-icons">bug_report</i>Food
													<div class="ripple-container"></div>
											</a></li>
											<li class=""><a href="#Exercise" data-toggle="tab">
													<i class="material-icons">code</i> Exercise
													<div class="ripple-container"></div>
											</a></li>
											
										</ul>
									</div>
								</div>
							</div>
							<div class="card-content">
								<div class="tab-content">
									<div class="tab-pane active" id="Food">
										<table class="table" style="border-bottom: 1px solid gray;" >
											<tbody>
												<tr>
													<td >
														회사
													</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" checked>
															</label>
														</div>
													</td><td>삼성</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>현대</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
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
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>탄수화물 차단제</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>다이어트 쉐이크</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>체지방 감소제</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
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
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>남자</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>여자</td>
													<td>
														<input type="button" value="검색">
													
													</td>
													<td>
														<input type="button" value="초기화">
													
													</td>
	
												</tr>
											</tbody>
										</table>
										
									</div>
									<div class="tab-pane" id="Exercise">
										<table class="table" style="border-bottom: 1px solid gray;" >
											<tbody>
												<tr>
													<td >
														회사
													</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" checked>
															</label>
														</div>
													</td><td>삼성</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>현대</td>
													<td width="35px">
														<div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
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
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>탄수화물 차단제</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>다이어트 쉐이크</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>체지방 감소제</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
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
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>남자</td>
													<td width="35px"><div class="checkbox">
															<label> <input type="checkbox"
																name="optionsCheckboxes" >
															</label>
														</div>
													</td><td>여자</td>
													<td>
														<input type="button" value="검색">
													
													</td>
													<td>
														<input type="button" value="초기화">
													
													</td>
	
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
					</div>
				</div><!-- 1 row end-->
				</div>
    		  <div class="row">
      	<c:forEach var="j" items="${v}" varStatus="status">	
        <c:if test="${status.count%3==1 }">
        <div class="row" >
        </c:if>
			<div class="col-lg-3" >
				<div class="card">
					<div class="card-header card-chart" data-background-color="orange">
						<div class="ct-chart" id="dailySalesChart">
							<a href="#" onclick="read('${j.name}')">
    	  					<img src="./upload/${j.img }" height="80px" width="120">
    	  					</a>
						</div>
					</div>
					<div class="card-content">
						<h4 class="title" align="center">${j.name}</h4>
						<p class="category">
						<span class="text-success"><i class="fa fa-long-arrow-up"></i> ${j.price } ￦  </span> <span>${j.sexpl }</span>	</p>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">access_time</i> ${j.sexpl }
						</div>
					</div>
				</div>
			</div>
		<c:if test="${status.count%3==0 }">
    	</div>
		</c:if>
		</c:forEach>	
				
			<c:forEach var="j" items="${v}" varStatus="status">
			<div class="row">
				<div class="col-xs-12"></div><!--div 카테고리설정  -->
			
			
				
    	  		<div class="col-md-4">
    	  			<a href="#" onclick="read('${j.name}')">
    	  			<img src="./upload/${j.img }" height="80px">
    	  			</a>
    	  		</div><!-- 그림 -->
    	  		
        		<div class="col-xs-5 col-md-3">
        			<span>이벤트</span><br>
        			<span>${j.price } </span>
        		</div><!--가격 이벤트 정보  -->
        		<div class="col-xs-7 col-md-5">
        			<span>${j.sexpl }</span><br>
        			<span>${j.lexpl }</span><br>
        		</div><!--설명 -->
        		
        	</div>
        	</c:forEach>	
       	
		
			
			<div class="col-lg-12 col-md-12">
			
			
			
			
			
			
			
			
			
			
			
			
				
				<div style="background-color: #FFFFFF; width:300px; height:350px">
					<div style="background-color: #FFFFFF; width:300px; height:280px">
					
					
						
						
					</div >
					<div style="background-color:gray;">
					
					
					</div>				
					
					<br>
					
				</div>
				</a>
			
				<div style="background-color: #FFFFFF; width:300px; height:350px">
				<div style="background-color: #FFFFFF; width:300px; height:280px">
					<img alt="" src="">
					<span>가격 </span>
				</div >
					<div style="background-color:gray;">
					<span>이벤트</span><br>
					<span>설명</span>
					</div>
					
				</div >
				<div class="col-lg-4 col-md-4">
      		<table class="table">
      			<tr>
      				<td>gd</td>
      				<td>gd</td>
      			</tr>
      			<tr>
      				<td colspan="2">
      					<button>검색</button>
      					<button>초기화</button>
      				</td>
      		</table>
      		
			</div>    
			
			</div>
			
      </div>
   </div>

<input type="button" onclick="m_read();">
</div>
</div>


</body>
</html>