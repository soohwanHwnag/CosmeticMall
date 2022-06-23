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
					<form action="orderForm" name="orderForm" id="orderForm" method="post" onsubmit="return checkValue();">
					<c:forEach var="list" items="${cartList}">
					<input type="hidden" name="cart_idx" value="${list.cart_idx}"/>
					<input type="hidden" name="product_idx" value="${list.product_idx}"/>
					<tr class="table_body">
						<td class="product">
							<!-- 상품 이미지(img로 바꾸기) -->
						<div class="product_img"><img src="${list.product_filename}"></div>
							<p class="product_name">${list.product_name}</p>
						</td>
						<td><input type="text" name="cart_count" value="${list.cart_count}" class="borderN" readonly/></td><!-- 카트에서 넘어온 {수량} -->
						<td><input type="text" name="cart_total_price" value="${list.product_price}" class="borderN" readonly/></td><!-- {판매가}원 -->
						<td><input type="text" name="product_shipping_fee" value="${list.product_shipping_fee}" class="borderN" readonly/></td><!-- {배송비}원 -->
					</tr>
					</c:forEach>
					</table>
					<div class="infoSection">
						<div class="order_info">
							<h3>주문자 정보</h3>
							<div class="inputSection pdlr20">
								<input name="memberName" id="memberName" value="${dto.member_name}" placeholder="이름" readonly/>
								<input name="memberPhone" id="memberPhone"value="${dto.member_phone}" placeholder="연락처" readonly/>
								<input placeholder="이메일" value="${dto.member_email}" readonly/>
							</div>
						</div>
						<div class="shipping_info">
							<h3>배송 정보</h3>
							<input type="checkbox" id="same_order_info" /><!-- onclick="same();" -->
							<label for="same_order_info">주문자 정보와 동일</label>
							<div class="inputSection pdlr20">
								<input name="recipientName" id="recipientName" class="order_copy" placeholder="이름" />
								<input name="recipientPhone" id="recipientPhone" class="order_copy" placeholder="연락처" />
								<input type="text" id="sample6_postcode" value="${dto.member_addr1}" name="member_addr1" placeholder="우편번호를 입력하세요">
                   			 <input type="button" class="postBtn" onclick="sample6_execDaumPostcode()" value="우편번호">
								  <input type="text" id="sample6_address" value="${dto.member_addr2}" name="member_addr2" placeholder="주소를 입력하세요">
		                    <input type="text" id="sample6_detailAddress" value="${dto.member_addr3}" name="member_addr3" placeholder="상세주소를 입력하세요">
		                    <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
								<input name="delivery_m"placeholder="배송 메세지" />
							</div>
						</div>
						<div class="payment_info">
							<h3>결제 정보</h3>
							<ul class="pdlr20">
								<li>
									<span class="text-title">상품금액</span>
									<span><input type="text" name="select_price" value="${select_price}" class="borderN" readonly/></span><!-- {상품금액}원 -->
								</li>
								<li>
									<span class="text-title">배송비</span>
									<span><input type="text" name="total_shipping_fee" value="${total_shipping_fee}" class="borderN" readonly/></span><!-- {배송비}원 -->
								</li>
								<li>
									<span>총 주문 금액</span>
									<span><input type="text" name="total_price" value="${total_price}" class="borderN" readonly/></span><!-- {상품 금액+배송비}원 -->
								</li>							
							</ul>
						</div>
						<div class="payment_method">
							<h3>결제 방법</h3>
							<ul class="pdlr20">
								<li>
									<input type="radio" name="paymentMethod" id="card" value="신용카드"checked>
									<label for="card">신용카드</label>
								</li>
								<li>
									<input type="radio" name="paymentMethod" id="accountTransfer" value="계좌이체">
									<label for="accountTransfer">계좌이체</label>
								</li>
								<li>
									<input type="radio" name="paymentMethod" id="deposit" value="무통장입금">
									<label for="deposit">무통장입금</label>
								</li>
							</ul>
						</div>
						<div class="orderAgree">
							<input type="checkbox" name="paymentAgree" id="paymentAgree">
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

	<!-- script -->
	<script>
		function checkValue(){
			if(!document.orderForm.recipientName.value){
				alert("수령인을 적어주세요");
				return false;
			}
			if(!document.orderForm.recipientPhone.value){
				alert("수령인 전화번호를 적어주세요");
				return false;
			}
			if(!document.orderForm.member_addr1.value){
				alert("우편번호를 적어주세요");
				return false;
			}
			if(!document.orderForm.member_addr2.value){
				alert("주소를 적어주세요");
				return false;
			}
			if(!document.orderForm.member_addr3.value){
				alert("상세주소를 적어주세요");
				return false;
			}
			if(!document.orderForm.paymentAgree.checked){
				alert("결제 동의 해주세요");
				return false;
			}
		}
		
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
	  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
  
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
        </script>
	<!-- //script -->
</body>
</html>
