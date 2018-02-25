<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
                            <div class="card">
                                <div class="card-header" data-background-color="purple">
                                    <h4 class="title">장바구니</h4>
                                    <p class="category">장바구니를 나타내는 페이지 입니다</p>
                                </div>
                                <div class="card-content table-responsive">
                                    <table class="table">
                                        <thead class="text-primary">
                                            <th>인덱스</th><th>주문번호</th><th>주문자ID</th><th>상품이미지</th><th>상품이름</th><th>개당가격</th><th>장바구니 등록날짜</th>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="v" items="${bv1}" varStatus="status"><!-- 장바구니목록 -->													<%-- <c:if test="${status.index %2 eq 0}"><tr></c:if> --%>
											
											<tr>	
											<td><br>${status.count}//${bvn1}<!-- 인덱스 --></td><td><br>${v.num }<!-- 주문번호 --></td><td><br>${v.id }<!-- 주문자ID --></td><td ><br>&nbsp;&nbsp;&nbsp;&nbsp;<img src="./upload/${v.pimg }" alt="" style="width:25px;height:40px"><!-- 상품이미지 --></td><td><br>${v.pname }<!-- 상품이름 --></td><td><br>${v.price}원<!-- 개당가격< --></td><td><br>${v.date}<!-- 장바구니 등록날짜 --></td>
											<tr>		
											</c:forEach>
													
                                            <tr>
                                              


												
                                             </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
		</div>
	</div>
</body>
</html>