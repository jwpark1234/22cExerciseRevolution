<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="Myprofile.css"/>
<script type="text/javascript">
function getCookie(cName) {
    cName = cName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if(start != -1){
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);

}

	$(function(){
		$(document).ready(function() {
			$('.material-button-toggle').on("click", function() {
				$(this).toggleClass('open');
				$('.option').toggleClass('scale-on');
			});
		});

		$("[data-toggle=popover]").each(function(i, obj) {
			$(this).popover({
				html : true,
				content : function() {
					$('#levelImg').attr('src','images/level/${sessionScope.Level }.jpg');
					$('#level').html('${sessionScope.Level}레벨');
					$('#exp').html('( ${sessionScope.Exp} / ${sessionScope.nextLevel} )');
					$('#point').html('내 포인트 : ${sessionScope.Point} P');
					
					if(sessionStorage.getItem('ppoint') != null)
						$('#point').html('내 포인트 : '+sessionStorage.getItem('ppoint')+' P');
					if(getCookie("Level")!=""){
						$('#levelImg').attr('src','images/level/${sessionScope.Level }.jpg');
						$('#level').html(getCookie("${sessionScope.Id}&Level")+"레벨");
						$('#exp').html( "( "+getCookie("${sessionScope.Id}&Exp")+" / "+ getCookie('${sessionScope.Id}&nextLevel') + " )");
						$('#point').html('내 포인트 : '+getCookie('${sessionScope.Id}&Point') +' P');
						}
					
					
					return $('#popover-content-login').html();
				}
			});
		});

		// 채팅방 버튼을 누르면
		$("#chat").click(function() {

			var Id = '${sessionScope.Id }';
			if (Id == null || Id == "") {
				$('#alertContent').html('로그인 먼저 해주세요.');
				$('#myModal10').modal('show');
				return;
			}
			
			// 이미 켜져있으면 끈다.
			if ($('#chatFrame').hasClass('popup-on')) {
				$('#chatFrame').empty();
				$('#chatFrame').removeClass('popup-on');
				onClose();
			} else {
				// 새로켠다
				
				$('#chatFrame').load('chat.do');
				$('#chatFrame').addClass('popup-on');
			}
		});

		$("#modify").click(function() {

			location.href = "modify.do";

		});//end click
		
	});

	//즐겨찾기 함수
	function bookmarksite() {
		var title = "22세기 운동혁명";
		var url = "www.naver.com"; // 일단 네이버로 설정

		// Internet Explorer
		if (document.all) {
			window.external.AddFavorite(url, title);
		}
		// Google Chrome
		else if (window.chrome) {
			$('#alertContent').html('크롬은 ctrl + D로 북마크해주세요.');
			$('#myModal10').modal('show');
		}
		// Firefox
		else if (window.sidebar) // firefox 
		{
			window.sidebar.addPanel(title, url, "");
		}
		// Opera
		else if (window.opera && window.print) { // opera 
			var elem = document.createElement('a');
			elem.setAttribute('href', url);
			elem.setAttribute('title', title);
			elem.setAttribute('rel', 'sidebar');
			elem.click();
		}
	}

	function namecard_myinfo() {
		location.href = "modify.do";
	}
	function namecard_logout() {
		location.href = "logout.do";
	}
</script>
</head>
<body>
<nav class="navbar navbar-transparent navbar-absolute">
<div class="container-fluid">
               <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button> 
                  <div class="card-avatar">
                     <div class="material-button-anim">
                        <div id="popover-content-login" class="hide">
							<div class="card-avatar" align="center"
								style="height: 150px; background-image: url('user/background.jpg'); border-radius: 20px;">
								<img class="img" src="upload/${sessionScope.Member_pic}"
									style="width: auto; height: 150px; margin: auto; border-radius: 10px;">
							</div>
							<div class="card-avatar" align="center">
								<font size="25px">${sessionScope.Nickname }</font><br /> <font
									color="gray" style="font-size: 25px;">${sessionScope.Id }</font>
							</div>
							<div class="card-avatar" align="center">
								<img id="levelImg" src=""
									style="width: 22px; height: 22px;" /> <a class="category text-gray" id="level"></a>
								<font id="exp"></font><br />
								<br /> <font id="point" class="tpoint"></font>
					
							</div>
							<div class="card-avatar" align="center">
								<button class="btn btn-info" onclick="namecard_myinfo()">내
									정보 보기</button>
								<button class="btn btn-danger" onclick="namecard_logout()">로그아웃</button>
							</div>
						</div>
                      </div>
                        </div>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                           <c:if test="${sessionScope.Id ne null}">
							   <li>
							      <a data-toggle="popover" data-container="body" data-placement="left" type="button" data-html="true" id="myPopBtn" href="javascript:void(0);">
							         <i class="material-icons">person</i>
							         <p class="hidden-lg hidden-md">내 정보</p>
							      </a>
							   </li>
							                            
							</c:if>
							<c:if test="${sessionScope.Id  eq null}">
							   <li>
							      <a href="" type="button" onclick="namecard_beforelogin()">
							         <i class="material-icons">person</i>
							         <p class="hidden-lg hidden-md">로그인</p>
							      </a>                     
							   </li>
							</c:if>
                            <li>
                                <a href="javascript:void(0);" onclick="bookmarksite();">
                                    <i class="material-icons">star</i>
                                    <p class="hidden-lg hidden-md">즐겨찾기</p>
                                  </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" id="chat" >
                                    <i class="material-icons">question_answer</i>
                                    <p class="hidden-lg hidden-md">1:1 상담</p>
                                    <c:if test="${chatSum > 0}">
                                       <span class="notification">${chatSum}</span>
                                    </c:if>
                                </a>
                            </li>
                        </ul>
<!--                         <form class="navbar-form navbar-right" role="search" method="post" action="totalSearch.do"> -->
<!--                             <div class="form-group  is-empty"> -->
<!--                                 <input type="text" class="form-control" name="total_keyword" id="total_keyword" placeholder="상품, 게시물 검색"> -->
<!--                                 <span class="material-input"></span> -->
<!--                             </div> -->
<!--                             <button type="submit" class="btn btn-white btn-round btn-just-icon"> -->
<!--                                 <i class="material-icons">search</i> -->
<!--                                 <div class="ripple-container"></div> -->
<!--                             </button> -->
<!--                         </form> -->
                    </div>
                </div>
            </nav>
            
               <!--   Core JS Files   -->
   <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="assets/js/material.min.js" type="text/javascript"></script>
   <!--  Charts Plugin -->
   <script src="assets/js/chartist.min.js"></script>
   <!--  Dynamic Elements plugin -->
   <script src="assets/js/arrive.min.js"></script>
   <!--  PerfectScrollbar Library -->
<!--    <script src="assets/js/perfect-scrollbar.jquery.min.js"></script> -->
   <!--  Notifications Plugin    -->
   <script src="assets/js/bootstrap-notify.js"></script>
   <!-- Material Dashboard javascript methods -->
   <script src="assets/js/material-dashboard.js?v=1.2.0"></script>
</body>
</html>