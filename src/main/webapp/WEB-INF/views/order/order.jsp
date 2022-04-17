<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 목록</title>
	<!-- CSS -->
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/order/order.css">
	<!-- js -->
	<script src="/jquery/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<header>
		<h1>헤더 임시</h1>
	</header>
	<!-- //header -->
	<!-- main -->
	<main>
		<!-- wrap -->
		<div class="wrap">
			<h3>주문/결제</h3>
			<!-- 주문 단계 -->
			<div class="order_location">
				<ul>
					<li>장바구니</li>
					<li>&gt;</li>
					<li class="current">주문/결제</li>
					<li>&gt;</li>
					<li>주문완료</li>
				</ul>
			</div>
			<div class="order">
				<form>
					<table>
						<colgroup>
						<col width="45%">
						<col width="15%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<tr class="table_head">
						<th>상품명</th>
						<th>수량</th>
						<th>판매가</th>
						<th>배송비</th>
					</tr>
					<!-- c:forEach로 반복되는 부분 -->
					<tr class="table_body">
						<td class="product">
							<!-- 상품 이미지(img로 바꾸기) -->
							<div class="product_img">이미지</div>
							<p class="product_name">{상품명}</p>
						</td>
						<td>1</td><!-- 카트에서 넘어온 {수량} -->
						<td>12,800원</td><!-- {판매가}원 -->
						<td>3,000원</td><!-- {배송비}원 -->
					</tr>
					</table>
					<div class="infoSection">
						<div class="order_info">
							<h3>주문자 정보</h3>
							<div class="inputSection pdlr20">
								<input name="memberName" id="memberName" placeholder="이름" />
								<input name="memberPhone" id="memberPhone" placeholder="연락처" />
								<input placeholder="이메일" />
							</div>
						</div>
						<div class="shipping_info">
							<h3>배송 정보</h3>
							<input type="checkbox" id="same_order_info" /><!-- onclick="same();" -->
							<label for="same_order_info">주문자 정보와 동일</label>
							<div class="inputSection pdlr20">
								<input name="recipientName" id="recipientName" class="order_copy" placeholder="이름" />
								<input name="recipientPhone" id="recipientPhone" class="order_copy" placeholder="연락처" />
								<input placeholder="우편번호" />
								<button class="postBtn">우편번호</button>
								<input placeholder="주소" />
								<input placeholder="나머지 주소" />
								<input placeholder="배송 메세지" />
							</div>
						</div>
						<div class="payment_info">
							<h3>결제 정보</h3>
							<ul class="pdlr20">
								<li>
									<span class="text-title">상품금액</span>
									<span>12,800원</span><!-- {상품금액}원 -->
								</li>
								<li>
									<span class="text-title">배송비</span>
									<span>3,000원</span><!-- {배송비}원 -->
								</li>
								<li>
									<span>총 주문 금액</span>
									<span>15,800원</span><!-- {상품 금액+배송비}원 -->
								</li>							
							</ul>
						</div>
						<div class="payment_method">
							<h3>결제 방법</h3>
							<ul class="pdlr20">
								<li>
									<input type="radio" name="paymentMethod" id="card" checked>
									<label for="card">신용카드</label>
								</li>
								<li>
									<input type="radio" name="paymentMethod" id="accountTransfer">
									<label for="accountTransfer">계좌이체</label>
								</li>
								<li>
									<input type="radio" name="paymentMethod" id="deposit">
									<label for="deposit">무통장입금</label>
								</li>
							</ul>
						</div>
						<div class="orderAgree">
							<input type="checkbox" id="paymentAgree">
							<label for="paymentAgree">결제정보를 확인하였으며, 구매 진행에 동의합니다.</label>				
							<button class="grayBtn">결제하기</button>
						</div>
					</div>					
				</form>
			</div>	
		</div>
		<!-- //wrap -->
	</main>
	<!-- //main -->
	<!-- footer -->
	<footer>
		<h1>푸터 임시</h1>
	</footer>
	<!-- //footer -->
	<!-- script -->
	<script>
		/* 주문자 정보와 동일 */
		$(function(){
			$("#same_order_info").click(function(){
				var same = this.checked;
				$("#recipientName").val(same ? $('#memberName').val():'');
				$("#recipientPhone").val(same ? $("#memberPhone").val():'');
				if(same==true){
					$(".order_copy").attr("readonly", true).css("opacity", 0.5);
				} else {
					$(".order_copy").attr("readonly", false).css("opacity", 1);
				}
			});			
		});
	</script>
	<!-- //script -->
</body>
</html>
