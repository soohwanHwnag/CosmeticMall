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
	<!-- main -->
	<main>
		<!-- wrap -->
		<div class="wrap">
			<h3>주문완료</h3>
			<!-- 주문 단계 -->
			<div class="order_location">
				<ul>
					<li>장바구니</li>
					<li>&gt;</li>
					<li>주문/결제</li>
					<li>&gt;</li>
					<li class="current">주문완료</li>
				</ul>
			</div>
			<div class="order_finish">
				<h3>주문이 완료되었습니다.</h3>
				<p>자세한 내역은 <span>[마이페이지 > 주문내역]</span>에서 확인하실 수 있습니다.</p>
				<ul>
					<li>
						<span>주문번호</span>
						<span>${order_number}</span><!-- {주문번호} -->
					</li>
					<li>
						<span>결제금액</span>
						<span>${total_price}원</span><!-- {총 주문 금액}원 -->
					</li>
				</ul>
			</div>
			<div class="orderBtn orderFinishBtn">
				<button class="whiteBtn">주문내역 확인</button>
				<button class="grayBtn" onclick="window.location.href='/main'">메인</button>
			</div>		
		</div>
		<!-- //wrap -->
	</main>
	<!-- //main -->
</body>
</html>