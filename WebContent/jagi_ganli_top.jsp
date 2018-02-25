<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
  Material Design Lite
  Copyright 2015 Google Inc. All rights reserved.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License
-->

<!doctype html>

<html lang="en">
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
     <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/modernizr/modernizr-2.8.3.js"></script>
  
  </head>
  
  
  
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<body>

<script type="text/javascript">
$(function(){
	
	
	//운동 카테고리 클릭시  운동 리스트 구현
	$("#jagi_ganli_top_bar_div ul li").click(function(){
		
		var index=$("#jagi_ganli_top_bar_div ul li").index(this);
		index+=1;
		
		if(index==0){
			return false;
		}
		//인덱스=0;운동계획쪽이므로 효과가나타나면 안됨
	
		//여기서 클릭시 원하는 그림 리스트가 떠야함
		location.href="jagi_ganli_plan.do?index="+index+"#jagi";
		
		
		});
	
})
</script>



<!--  자기 관리 탑 이부분: 버튼 메뉴랑 show image 하나 넣을것.. -->

<div  id="jagi_ganli_top_bar_div" style="text-align: center;">
<div class="row">
  <ul class="nav nav-tabs nav-justified">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#panel1" role="tab">어깨 메뉴</a>
    </li>
    
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#panel2" role="tab">가슴 메뉴</a>
    </li>
    
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#panel1" role="tab">등 메뉴</a>
    </li>
    
    
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#panel3" role="tab">이삼두 메뉴</a>
    </li>
     <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#panel1" role="tab">복근 메뉴</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#panel2" role="tab">허리 메뉴</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#panel3" role="tab">하체 메뉴</a>
    </li>
    
   
    
</ul>
  
  </div>
  <br/>
  
  
  <div class="row">
  
 <div class="col-md-10 col-md-offset-1">

  <div class="col-sm-5 my-auto align-self-center">


									 <div class="alert alert-info" style="font-size:0.6vw;">
                                              1. 땀은 지방이 흘리는 눈물일 뿐이다
								    </div>
                                    <div class="alert alert-info" style="font-size:0.6vw;">
                                        	2. 그만두고 싶어질 때면 처음 왜 운동을 시작했는지를 떠올려라
								    </div>
                                    <div class="alert alert-info" style="font-size:0.6vw;">
                                        	3. 운동은 결코 쉬워지지 않을 것이다, 당신이 강해지는 것일뿐
									 </div>
                                    <div class="alert alert-info" style="font-size:0.6vw;">
                                	4. 운동으로 전혀 다른 사람이 되겠다는 생각을 하지 말라, 당신은 예전의 당신보다 나은 사람이 되는 것이다<br/>
								    </div>
                                     <div class="alert alert-info" style="font-size:0.6vw;">
                                   5. 모든 긴 여정은 첫 한 걸음을 떼는 것에서 시작한다<br/>
 </div>
                                    
                                    
</div>
 
                                     
  <div class="col-sm-7" >
  
    <div  style=" width:40vw; ">
  <iframe class="embed-responsive-item" id="jagi_ganli_plan_iframe"
 src="https://www.youtube.com/embed/KKAfkrOOjrY"  style="text-align: center;height:400px;"  width="100%" ></iframe>
</div>
</div>
  </div>
  
  </div>
  
  
  </div>
  <!-- Nav tabs -->

  
</body>
</html>