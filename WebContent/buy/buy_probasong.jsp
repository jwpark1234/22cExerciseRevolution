<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
</head>
<body>
	<div class="container-fluid">
		<!-- <table class="table">
			<tr>
				<td>인덱스</td><td>주문번호</td><td>주문자ID</td><td>상품이미지</td><td>상품이름</td><td>개당가격</td><td>장바구니 등록날짜</td>
			</tr>
			
			<tr>
				<td>인덱스</td><td>주문번호</td><td>주문자ID</td><td>상품이미지</td><td>상품이름</td><td>개당가격</td><td>장바구니 등록날짜</td>
			</tr>
		</table> -->
		<div class="col-md-12">
                            <div class="card">
                                <div class="card-header" data-background-color="purple">
                                    <h4 class="title">배송</h4>
                                    <p class="category">배송상태를 나타내는 페이지입니다</p>
                                </div>
                                <div class="card-content table-responsive">
                                    <table class="table">
                                        <thead class="text-primary">
                                            <th>인덱스</th><th>주문번호</th><th>배송상태</th><th>주문자ID</th><th>상품이미지</th><th>상품이름</th><th>수량</th><th>개당가격</th><th>구매날짜</th>
                                        </thead>
                                        <tbody>
                                           <c:forEach var="v" items="${bv2}" varStatus="status"><!-- 장바구니목록 -->													<%-- <c:if test="${status.index %2 eq 0}"><tr></c:if> --%>
											
											<tr>	
											<td><br>${status.count}//${bvn2}<!-- 인덱스 --></td><td><br>${v.num }<!-- 주문번호 --></td><td><br>${v.stat}<!--배송상태  --></td><td><br>${v.id }<!-- 주문자ID --></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<img src="./upload/${v.pimg }" alt="" style="width:25px;height:40px"> <!-- 상품이미지 --></td><td><br>${v.pname }<!-- 상품이름 --></td><td><br>${v.count }</td><td><br>${v.price}<!-- 개당가격< --></td><td><br>${v.date}<!-- 장바구니 등록날짜 --></td>
											<tr>		
											</c:forEach>
													
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
	</div>
	
</body>
</html>