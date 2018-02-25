<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--	회원 로그인 정보
		 "Id"   
         
         
         "Level"
        "Nickname"
         "Height"
         "Weight"
       -->
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
  
  
    <style type="text/css">
   #jagi_ganli_plan_table img{
   border: 1px solid black;
   }
   #jagi_ganli_plan_table ul{
   
   list-style: none;
   text-decoration: none;
   }
   #jagi_ganli_plan_table td{
   text-align: center;
   vertical-align: middle;
   }
   
   
    </style>
  
  </head>
  
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<body>


<div class="content">
                <div class="container-fluid">
			<div class="card">
             <div class="card-header" data-background-color="purple">
                 <h5>${theme }</h5>
            
     		</div>
                  <div class="card-content">
                       
				        <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">            
				<div id="jagi_ganli_plan_fieldset2"  >
					
					<c:forEach items="${list }" var="re" varStatus="status">
				
					<div class="col-md-3" style=" height:400px;">
                            <div class="card" >
                                <div class="card-header " data-background-color="green" 
                                style="height: 300px; background-size:100% 100%; 
                                 background-image: url('image_jagi/${folder }${re.category_filename }');  "
                                
                                 onclick="jagi_ganli_iframe('${fn:replace(re.url,'watch?v=','embed/') }','${re.id }')" >
                                    
								 </div>
								 
                                <div class="card-content" style=" font-size:0.7vw;" >
                                    <h5 class="title">${re.category_name }</h5>
                                    <p class="category" style=" font-size:0.7vw;">
                                       <span class="text-success" style=" font-size:0.7vw;"><i class="fa fa-long-arrow-up"></i> ${re.time } Time 
                                        ${re.count } Views</span> ${re.count } Views</p>
                                </div>
                               
                            </div>
                        </div>
               
                   </c:forEach>
				
				
				</div>
				</div>
				                    


  
                       
                   </div>
                              
          
             </div>               
                                
		</div>
</div>













</body>
</html>