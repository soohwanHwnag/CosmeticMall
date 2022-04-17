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
			<h3>장바구니</h3>
			<!-- 주문 단계 -->
			<div class="order_location">
				<ul>
					<li class="current">장바구니</li>
					<li>&gt;</li>
					<li>주문/결제</li>
					<li>&gt;</li>
					<li>주문완료</li>
				</ul>
			</div>
			<!-- //주문 단계 -->
			<!-- 장바구니 목록 -->
			<div class="cartList">
				<table>
					<colgroup>
						<col width="5%">
						<col width="40%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<tr class="table_head">
						<th><input type="checkbox" id="selectall"></th>
						<th>상품명</th>
						<th>수량</th>
						<th>판매가</th>
						<th>배송비</th>
						<th>선택</th>
					</tr>
					<!-- c:forEach로 반복되는 부분 -->
					<tr class="table_body">
						<td><input type="checkbox" name="product_chk" class="product_chk" /></td>
						<td class="product">
							<!-- div 대신 이미지로 -->
							<div class="product_img">이미지</div>
							<p class="product_name">{상품명}</p>
						</td>
						<td>
							<!-- producvView와 동일 방식(변경 버튼 없어도 됨) -->
							<div class="stock_count">
								<input type="button" class="count_btn" onclick="count('m',this)" value="-">
								<!-- count_num이 주문할 때 주문 수량 -->
								<input class="count_num" value="1">
								<input type="button" class="count_btn" onclick="count('p',this)" value="+">
							</div>
						</td>
						<td>12,800원</td><!-- {판매가}원 -->
						<td>3,000원</td><!-- {배송비}원 -->
						<td><button>삭제</button></td>
					</tr>
				</table>
				<!-- 총 금액 + 삭제 버튼 -->
				<div class="cartList_bottom">
					<ul>
						<li>
							<span class="text_title">선택 상품 금액</span>
							<span class="cart_price">12,800원</span><!-- 선택한 상품 판매가 다 더한 값 + 원 -->
						</li>
						<li>
							<span class="text_title">총 배송비</span>
							<span class="cart_price">3,000원</span><!-- {배송비}원 -->
						</li>
						<li>
							<span class="text_title">총 주문금액</span>
							<span class="cart_price">15,800원</span><!-- 선택 상품 + 배송비 -->
						</li>
					</ul>	
				</div>
				<button class="deleteBtn">선택 삭제</button>
				<!-- //총 금액 + 삭제 버튼 -->
				<!-- 이동 버튼 -->
				<div class="orderBtn">					
					<button class="whiteBtn">쇼핑 계속하기</button>
					<button class="grayBtn">주문하기</button>
				</div>
			</div>
			<!-- //장바구니 목록 -->			
		</div>
		<!-- //wrap -->
	</main>
	<!-- //main -->
	<!-- 스크립트 -->
	<script>
		<!-- 전체 선택/해제 -->
		$("#selectall").click(function(){
			if($("#selectall").is(":checked")){
				$("input[name=product_chk]").prop("checked", true);
			} else {
				$("input[name=product_chk]").prop("checked", false);			
			}
		});
		$("input[name=product_chk]").click(function(){
			var total = $("input[name=product_chk]").length;
			var checked = $("input[name=product_chk]:checked").length;
			if( total != checked ) {
				$("#selectall").prop("checked", false);
			} else {
				$("#selectall").prop("checked", true);
			}
		});
		<!-- 수량 입력 칸 실시간 감지 -->
		var oldVal = 0;
		$(".count_num").on("propertychange change keyup paste input", function() {
		    var currentVal = $(this).val();
		    if(currentVal == oldVal) {
		        return;
		    }
		 
		    oldVal = currentVal;
		    $(".count_num").attr("value",oldVal);
		}); 
		<!-- 수량 증가, 감소 -->
		function count(type, ths){
			var num = $(".count_num").val();
			if(type=="p"){
				num = Number(num)+1;
				$(".count_num").val(num);
			} else {
				num = Number(num)-1;
				$(".count_num").val(num);
			}
			$(".count_num").attr("value",num);
		}
	</script>
	<!-- //스크립트 -->
</body>
</html>
