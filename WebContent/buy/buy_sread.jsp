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
    
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
<style type="text/css">
#gradebutton, #star5, #star4, #star3, #star2, #star1 {
	padding: 0;
}
a {
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	/*star1 ,star2 */
	var grade = "star5";
	$(function() {
		$("#grade_selector>li>a").click(function() {
			grade = $(this).attr('id');
			$('#selected').attr('src', "./images/grade/" + grade + ".png");
			$('#grade_selector').hide();

		});
	});

	var pay = "";

	function datgle() {

		var name = $("#datglename").val();
		var content = $("#datglecontent").val();

		$("#datglecontent").val("");
		$.ajax({
			url : "buy_datgle.do?name=" + name + "&content=" + content
					+ "&grade=" + grade,
			dataType : 'text',
			type : 'post',
			success : function(data) {

				location.reload();
			},
			error : function(data) {
				alert("잘못없음");
			}

		});

	}

	function m_buy(name, price, pimg, bnum) {
		location.href = "buy_sbuy.do?name=" + name + "&price=" + price
				+ "&pimg=" + pimg + "&bnum=" + bnum;
	}
	function baguni(name, img, price) {
		$(function() {
			$.ajax({
				url : "buy_baguniInsert.do?name=" + name
						+ "&img=" + img + "&price=" + price,
				async : false,
				dataType : 'text',
				type : 'post',
				success : function(data) {
					if (data == "gogo") {
						$('#alertContent').html('장바구니에 추가했습니다.');
					} else if (data == "overlap") {
						$('#alertContent').html('장바구니에 이미 있습니다.');
					} else {
						$('#alertContent').html('잘못된 접근입니다.');
					}
					$('#myModal10').modal('show');
				},
				error : function(data) {
					alert("중복이 없습니다.err");
				}

			});

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

			<%-- <input type="button" onclick="m_buy('${bdto.name}','${bdto.price }','${bdto.img }','3');" value="바이">
      <input type="button" onclick="baguni('oct254k','${bdto.name }','${bdto.img }','${bdto.price }');" value="장바구니"> --%>
		</div>
	</div>
	<br>
	<br>
	<br>

	<div class="container-fluid col-lg-12 ">
		<!--칼럼  -->
		<div class="row">
			<div class="col-md-offset-2">
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-6">
							<img src="./upload/${bdto.img }" alt=""
								style="padding: 50px; width: 600px; height: 600px;">
						</div>
						<!-- 그림1 -->
						<div class="col-xs-6">
							<table class="table" width=100>
								<tbody>
									<tr>
										<th width=20>이름</th>
										<td width=80>${bdto.name }</td>

									</tr>
									<tr>
										<th width=20>짧은 설명</th>
										<td width=80>${bdto.sexpl }</td>

									</tr>
									<tr>
										<th width=20>긴 설명</th>

										<td width=80>${bdto.lexpl }</td>

									</tr>
									<tr>
										<th width=20>가격</th>

										<td width=80>${bdto.price }원</td>

									</tr>

									<tr>
										<th width=20>택배비</th>
										<td width=80>2500원</td>
									</tr>



								</tbody>
							</table>
							<div class="col-md-12">
								<span>첫 구매 시 ${buy_point_first }p 지급&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구매 시 구매금액의 ${buy_point }% 포인트로 지급</span>
							
							</div>
							<div class="col-md-12">
								<div class="col-md-6">
									<div class="alert alert-success">
										<div class="container-fluid">
											

											<a href="#"
												onclick="m_buy('${bdto.name}','${bdto.price }','${bdto.img }','1');"><b><h3>이
														품목 사러가기</h3></b> </a>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="alert alert-success">
										<div class="container-fluid">
											<div class="alert-icon"></div>

											<a href="#"
												onclick="m_buy('${bdto.name}','${bdto.price }','${bdto.img }','2');"><b><h3>장바구니와
														함께사기</h3></b></a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="col-md-6">
									<div class="alert alert-warning">
										<div class="container-fluid">
											<div class="alert-icon"></div>

											<a
												onclick="baguni('${bdto.name }','${bdto.img }','${bdto.price }');"><b><h3>바구니에
														담기</h3></b></a>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="alert alert-warning">
										<div class="container-fluid">
											<div class="alert-icon"></div>

											<a href="#"
												onclick="m_buy('${bdto.name}','${bdto.price }','${bdto.img }','4');"><b><h3>장바구니만
														사기</h3></b></a>
										</div>
									</div>
								</div>
							</div>
							<!-- 버튼 끝 -->

						</div>
					</div>
					<!-- 후기 -->
					<div class="row">
						<!--찬반  -->
						<div class="col-xs-12">
							<div class="col-md-4 col-xs-4">
								<div class="card card-stats">
									<div class="card-header" data-background-color="orange">
										<i class="material-icons">content_copy</i>
									</div>
									<div class="card-content">
										<p class="category">${ dv.get(0).id}</p>
										<h3 class="title">
											<!-- 49/50 -->
											<small>${dv.get(0).content }</small>
										</h3>
									</div>
									<div class="card-footer">
										<div class="stats">
											<img src="./images/grade/star${dv.get(0).grade }.png">
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-4 col-xs-4">
								<div class="card card-stats">
									<div class="card-header" data-background-color="orange">
										<i class="material-icons">content_copy</i>
									</div>
									<div class="card-content">
										<p class="category">${dv.get(1).id }</p>
										<h3 class="title">
											<!-- 4 -->
											<small>${dv.get(1).content }</small>
										</h3>
									</div>
									<div class="card-footer">
										<div class="stats">
											<img src="./images/grade/star${dv.get(1).grade }.png">

										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-xs-4">
								<form id="table_datgle" name="table_datgle">

									<div class="card card-stats">
										<div class="card-header" data-background-color="orange">
											<i class="material-icons">content_copy</i>
										</div>
										<div class="card-content">
											<p class="category">${sessionScope.Id }</p>
											<!-- 4 -->
											<div class="form-group">

												<br> <input type="text" id="datglecontent"
													name="datglecontent" value="" placeholder="후기를 작성하세요."
													class="form-control" />
											</div>



										</div>
										<div class="card-footer">
											<div class="stats">
												<input type="hidden" id="datglename" value="${bdto.name }">

												<input type="hidden" id="datgleid"
													value="${sessionScope.Id }">
												<div class="container-fluid">
													<div class="col-md-8" align="left">
														<ul class="nav">
															<li class="menu"><a id="gradebutton"> <img
																	src="./images/grade/star5.png" id="selected">
															</a>
																<ul class="nav submenu" id="grade_selector">
																	<li><a href="javascript:void(0);" id="star5">
																			<img src="./images/grade/star5.png">
																	</a></li>
																	<li><a href="javascript:void(0);" id="star4">
																			<img src="./images/grade/star4.png">
																	</a></li>
																	<li><a href="javascript:void(0);" id="star3">
																			<img src="./images/grade/star3.png">
																	</a></li>
																	<li><a href="javascript:void(0);" id="star2">
																			<img src="./images/grade/star2.png">
																	</a></li>
																	<li><a href="javascript:void(0);" id="star1">
																			<img src="./images/grade/star1.png">
																	</a></li>
																</ul></li>

														</ul>
													</div>
													<div class="col-md-4">
														<input type="button" class="btn btn-default btn-small"
															onclick="datgle();" value="댓글달기">
													</div>
												</div>




											</div>
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div>
								<img src="./upload/${bdto.fexpl}" alt="" style="width: 1250px">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<hr>
</body>
</html>