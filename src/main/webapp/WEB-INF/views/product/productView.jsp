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
	<link rel="stylesheet" href="/css/product/productView.css">
	<!-- 별점용 아이콘 라이브러리 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- js -->
	<script src="/jquery/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<!-- main -->
	<main>
		<div class="wrap">
			<div class="productView_wrap">
				<div class="productView_top">
					<div class="productView_image">
						<!-- 이미지 태그 넣기(썸네일 사진 그대로) -->
						<img src="${dto.product_filename}">
					</div>
					<div class="productView_right">
						<div class="productView_text">
							<h3>${dto.product_name }</h3>
							<form action="cart_add" method="post" onsubmit="return check();" name="cart_add">
							<ul>
								<li>
									<span class="text_title">판매가</span>
									<span><input type="text" value="${dto.product_price}" class="price"></span>
								</li>
								<li>
									<span class="text_title">용량</span>
									<span><input type="text" value="${dto.product_volume}"></span>
								</li>
								<li>
									<span class="text_title">배송비</span>
									<span><input type="text" value="${dto.product_shipping_fee}" class="shipping_fee"></span>
								</li>
								<li>
									<span class="text_title">수량</span>
									<div class="stock_count">
										<input type="button" class="count_btn" onclick="count('m',this)" value="-">
										<!-- count_num이 주문할 때 주문 수량 -->
										<input class="count_num" value="1">
										<input type="button" class="count_btn" onclick="count('p',this)" value="+">
									</div>
								</li>
								<li>
									<span class="text_title">총 상품 금액</span>
									<span><input type="text" value="" class="total_price"></span>
								</li>
							</ul>
						</div>
						<div class="productView_btn">
							<button class="whiteBtn">장바구니</button>
							<button class="grayBtn">바로구매</button>
						</div>
					</div>
					</form>
				</div>
				<div class="productView_location">
					<ul>
						<li><a href="#productView_detail" class="current scroll">상세정보</a></li>
						<li><a href="#productView_review" class="scroll">리뷰</a></li>
						<li><a href="#productView_notice" class="scroll">배송/교환/환불</a></li>
					</ul>
				</div>
				<div class="productView_detail">
				<img src="${dto.product_filename_detail}">
				</div>
				<div class="productView_location">
					<ul>
						<li><a href="#productView_detail" class="scroll">상세정보</a></li>
						<li><a href="#productView_review" class="current scroll">리뷰</a></li>
						<li><a href="#productView_notice" class="scroll">배송/교환/환불</a></li>
					</ul>
				</div>
				<div class="productView_review" id="productView_review">
					<h3>상품리뷰</h3>
					<div class="review_section">
						<!-- review c:forEach 사용 -->
						<div class="review">
							<div class="review_left">
								<div class="star_rating">
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								</div>
								<span class="review_date">2022-01-01</span>
								<span>홍**</span>
							</div>
							<div class="review_center">
								<p>향도 좋고 자기 전에 바르면 다음날 피부 엄청 촉촉해요! 배송도 넘넘 빠르구 꼭 재구매할게요!!! 그리고 이거 쓰시는 분들 마스크팩도 같이 쓰세요!!</p>
							</div>
							<div class="review_right">
								<!-- 안에 이미지 태그 써주기 -->
								<div class="review_image">
									<div>이미지</div>
								</div>
							</div>
							<!-- 관리자 리스트 검색 열기,닫기 -->
							<button class="openBtn">더보기</button>
						</div>
						<div class="review review_open">
							<div class="review_left">
								<div class="star_rating">
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								</div>
								<span class="review_date">2022-01-01</span>
								<span>홍**</span>
							</div>
							<div class="review_center">
								<p>향도 좋고 자기 전에 바르면 다음날 피부 엄청 촉촉해요! 배송도 넘넘 빠르구 꼭 재구매할게요!!! 그리고 이거 쓰시는 분들 마스크팩도 같이 쓰세요!!</p>
							</div>
							<div class="review_right">
								<!-- 안에 이미지 태그 써주기(예시용이라 다 div 처리) -->
								<div class="review_image">
									<div>이미지</div>
									<div>이미지</div>
								</div>
							</div>
							<!-- 관리자 리스트 검색 열기,닫기 -->
							<button class="openBtn">접기</button>
						</div>
					</div>
					<div class="review_pagination">
						<ul class="pagination">
							<!-- href 수정 필수 -->
							<!-- <li class="page-item <c:if test="${ page == 1 }">disabled</c:if>"> -->
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<!-- <li class="page-item <c:if test="${ page == 1 }">active</c:if>"> -->
							<li class="page-item">
								<a class="page-link" href="/list?page=1">1</a>
							</li>
							<!-- <li class="page-item <c:if test="${ page == 2 }">active</c:if>"> -->
							<li class="page-item">
								<a class="page-link" href="/list?page=2">2</a>
							</li>
							<!-- <li class="page-item <c:if test="${ page == 3 }">active</c:if>"> -->
							<li class="page-item">
								<a class="page-link" href="/list?page=3">3</a>
							</li>
							<!-- <li class="page-item <c:if test="${ page == 4 }">active</c:if>"> -->
							<li class="page-item">
								<a class="page-link" href="/list?page=4">4</a>
							</li>
							<!-- <li class="page-item <c:if test="${ page == 5 }">active</c:if>"> -->
							<li class="page-item">
								<a class="page-link" href="/list?page=5">5</a>
							</li>
							<!-- <li class="page-item <c:if test="${ page == 5 }">disabled</c:if>"> -->
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="productView_location" id="productView_location">
					<ul>
						<li><a href="#productView_detail" class="scroll">상세정보</a></li>
						<li><a href="#productView_review" class="scroll">리뷰</a></li>
						<li><a href="#productView_notice" class="current scroll">배송/교환/환불</a></li>
					</ul>
				</div>
				<div class="productView_notice">
					<h3>배송/교환/환불</h3>
					<ul>
						<li>기본 배송료 : 3,000원</li>
						<li>택배사 : XX택배</li>
						<li>배송 지역 : 전국</li>
						<li>배송 기간
							<ul>
								<li>배송은 지역 택배 기사님들의 일정과 기상상황에 따라 변동이 있을 수 있습니다.<br> 
									기본 배송 준비일은 입금 확인 후 2~5일 정도가 소요됩니다.
								</li>
							</ul>
						</li>
						<li>교환 및 반품은 배송 완료 후 7일 이내, 제품 미훼손 및 미사용 시 가능합니다.
							<ul>
								<li>단, 제품이 표시광고 내용과 다르거나 불량 등 계약과 다르게 이행된 경우는 제품을 받은 날로부터 
     3개월이내나 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내 교환/반품이 가능</li>
								<li>제품 품질 이상, 오배송의 경우 교환 및 반품 비용은 회사에서 부담합니다.</li>
								<li>고객님의 단순 변심의 경우 교환 및 반품 비용은 본인 부담입니다.</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</main>
	<!-- //main -->
	<!-- 스크립트 -->
	<script>
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
			var price = Number($(".price").val());
			var  shipping_fee =  Number($(".shipping_fee").val());
			if(type=="p"){
				num = Number(num)+1;
				$(".count_num").val(num);
				var total_price = (price*num)+shipping_fee;
			$(".total_price").attr("value",total_price);
			} else {
				if(num <= 1){
					return false;
				}else{
					num = Number(num)-1;
				$(".count_num").val(num);
				var total_price = (price*num)+shipping_fee;
			$(".total_price").attr("value",total_price);
				}
			}
			$(".count_num").attr("value",num);
		}
		<!-- 리뷰창 열고 닫기 -->
		$(".openBtn").click(function(){
			var parent = $(this).parent(".review_section > div");
			var parentAttr = $(this).parent(".review_section > div").attr("class");
			if(parentAttr == "review"){
				parent.addClass("review_open");
				parent.find(".review_image > div").not(":first").css("display","block");
				$(this).text("접기");
			} else if(parentAttr == "review review_open"){
				parent.removeClass("review_open");
				parent.find(".review_image > div").not(":first").css("display","none");
				$(this).text("더보기");				
			}
		});
		<!-- 메뉴에서 선택한 섹션으로 이동 -->
		$(".scroll").click(function(e){
			var offset = $(this).offset();
			console.log(offset);
			$('html,body').animate({scrollTop:$(this.hash).offset.top}, 500);
			
		});
		$(function(){
			var price = Number($(".price").val());
			var  shipping_fee =  Number($(".shipping_fee").val());
			var amount =  Number($(".count_num").val());

			var total_price = (price*amount)+shipping_fee ;
			$(".total_price").attr("value",total_price);
		});
		
		function check(){
		<%-- 	var uid = <%=(String)session.getAttribute("member_idx")%>; --%>
	         if(confirm("장바구니에 추가시키겠습니까?")){
	          if(uid !=null){
	        	  return true;
	          }else{
	        	  alert("로그인 해주세요");
	        	  location.href='/login/login';
	        	  return false;
	          }
	         }else{
	          return false;
		}
		}
	</script>
	<!-- //스크립트 -->
</body>
</html>