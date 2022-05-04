<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 목록</title>
	<!-- CSS -->
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/mypage/order.css">
	<!-- js -->
	<script src="/jquery/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- main -->
	<main>
		<!-- wrap -->
		<div class="wrap">
			<!-- 마이페이지 사이드바 -->
			<div class="side_bar">
				<h3>마이 페이지</h3>
				<ul>
					<li>&gt;<a href="/mypage/orderList">주문내역</a></li>
					<li><a href="/order/cart">장바구니</a></li>
					<li><a href="/mypage/memberModify">개인정보 수정</a></li>
					<li><a href="/mypage/passwordModify">비밀번호 변경</a></li>
					<li><a href="/mypage/memberDelete">회원탈퇴</a></li>
				</ul>				
			</div>
			<!-- //마이페이지 사이드바 -->
			<!-- 메인 내용 -->
			<div class="main_section">
				<h3 class="main_title">주문/배송조회</h3>
				<!-- 검색 -->
				<form class="search_form">
					<h3>조회기간</h3>
					<div class="search">
						<ul>
							<li>
								<button>당일</button>
							</li>
							<li>
								<button>1주일</button>
							</li>
							<li>
								<button>1개월</button>
							</li>
							<li>
								<button>3개월</button>
							</li>
						</ul>
						<div class="term">
							<input type="date">
							<span>~</span>
							<input type="date">						
						</div>
						<div class="search_txt">
							<input>
							<button class="grayBtn">조회하기</button>
						</div>
					</div>
				</form>
				<!-- //검색 -->
				<!-- 주문 내역 -->
				<div class="order_list">
					<h3>주문내역</h3>
					<table>
						<colgroup>
							<col width="10%">
							<col width="32%">
							<col width="20%">
							<col width="10%">
							<col width="15%">
							<col width="13%">
						</colgroup>
						<tr class="table_head">
							<th>주문일자</th>
							<th>주문 상품</th>
							<th>상품금액(수량)</th>
							<th>배송비</th>
							<th>진행상태</th>
							<th>취소/교환/환불</th>
						</tr>
						<!-- c:forEach로 반복되는 부분 -->
						<tr class="table_body">
							<td>{주문일자}</td>
							<td>
								<!-- div 대신 이미지로 -->
								<div class="product_img">이미지</div>
								<p class="product_name"><a href="/mypage/orderView">{상품명}</a></p>
							</td>
							<td>
								<span>60,000원</span><!-- {총 상품금액}원 -->
								<span>(3개)</span><!-- ({수량})개 -->
							</td>
							<td>무료</td>
							<td>결제완료</td>
							<td>
								<button class="grayBtn">주문취소</button>
								<button class="lightgrayBtn" id="review_modal_open">리뷰작성</button>
							</td>
						</tr>
						<tr class="table_body">
							<td>2022-01-28</td><!-- fmt로 -->
							<td>
								<!-- div 대신 이미지로 -->
								<div class="product_img">이미지</div>
								<p class="product_name">자담 미세먼지 청소 비누</p>
							</td>
							<td>
								<span>18,000원</span><!-- {총 상품금액}원 -->
								<span>(1개)</span><!-- ({수량})개 -->
							</td>
							<td>2500원</td>
							<td><!-- 진행상태가 배송 중, 배송 완료일 때 -->
								<p>배송완료</p>
								<button class="lightgrayBtn" id="shipping_modal_open">배송조회</button>
							</td>
							<td><!-- 진행상태가 배송 준비 중, 배송 중, 배송 완료일 때 -->
								<button class="grayBtn">교환/환불</button>
								<button class="lightgrayBtn" id="review_modal_open">리뷰작성</button>
							</td>
						</tr>
					</table>
				</div>
				<!-- //주문 내역 -->
				<!-- 페이징 -->
				<div class="page">
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
				<!-- //페이징 -->
				<!-- 배송조회 -->
				<div class="shippingModal">
					<div class="modalContent">
						<h3>배송 조회</h3>
						<table class="shippingForm modalForm">
							<tr>
								<th>택배사</th>
								<td>{택배사}</td>
							</tr>
							<tr>
								<th>송장 번호</th>
								<td>{송장 번호}</td>
							</tr>
							<tr>
								<th>상품명</th>
								<td>{상품명}</td>
							</tr>
							<tr>
								<th>보내는 분</th>
								<td>{보내는 분}</td>
							</tr>
							<tr>
								<th>받는 분</th>
								<td>{받는 분}</td>
							</tr>
						</table>
						<button class="closeBtn" id="shipping_modal_close"><img src="/img/mypage/close.png" alt="닫기"></button>
					</div>
					<div class="modalBackground"></div>
				</div>
				<!-- //배송조회 -->
				<!-- 리뷰 작성 -->
				<div class="reviewModal">
					<div class="modalContent">
						<form class="reviewForm modalForm">
							<div class="reviewProduct">
								<h3>리뷰 작성</h3>
								<!-- 이미지로 바꿔주기 -->
								<div class="reviewProductImg">이미지</div>
								<span>자담 진정 수분크림</span>
							</div>
							<div class="starRatingSection">
								<h4>상품 만족도</h4>
								<div class="starRating">
									<p class="quest_txt">{사용자}님, 상품은 어떠셨나요?</p>
									<div class="inputStarRating">
										<input type="radio" id="5-stars" name="rating" value="5" />
										<label for="5-stars" class="star">&#9733;</label>
										<input type="radio" id="4-stars" name="rating" value="4" />
										<label for="4-stars" class="star">&#9733;</label>
										<input type="radio" id="3-stars" name="rating" value="3" />
										<label for="3-stars" class="star">&#9733;</label>
										<input type="radio" id="2-stars" name="rating" value="2" />
										<label for="2-stars" class="star">&#9733;</label>
										<input type="radio" id="1-star" name="rating" value="1" />
										<label for="1-star" class="star">&#9733;</label>
									</div>
								</div>
							</div>
							<div class="reviewSection">
								<h4>리뷰 작성</h4>
								<div class="reviewWrite">
									<p class="quest_txt">상품에 대해 자세히 알려주세요!</p>
									<textarea placeholder="최소 10자 이상 작성해주세요"></textarea>
								</div>
							</div>
							<div class="reviewImgSection">
								<h4>사진 첨부</h4>
								<div class="reviewImgUpload">
									<p class="quest_txt">도움이 되는 사진을 첨부해 주세요!</p>
									<div class="filebox">
										<input class="upload-name" id="fileName" value="리뷰 이미지">
										<label for="file">
											<img src="/img/mypage/camera.png">
											<span>첨부하기</span>
										</label> 
										<input type="file" id="file" name="file" onchange="javascript:document.getElementById('fileName').value = this.value">
									</div>
								</div>
							</div>
							<button class="grayBtn">등록</button>
						</form>
						<button class="closeBtn" id="review_modal_close"><img src="/img/mypage/close.png" alt="닫기"></button>
					</div>
					<div class="modalBackground"></div>
				</div>
				<!-- //리뷰 작성 -->
			</div>
			<!-- //메인 내용 -->
		</div>
		<!-- //wrap -->
	</main>
	<!-- //main -->
	<!-- script -->
	<script>
		<!-- 모달 스크립트 - 배송 -->
		$("#shipping_modal_open").click(function(){
			$(".shippingModal").fadeIn();			
		});
		$("#shipping_modal_close").click(function(){
			$(".shippingModal").fadeOut();
		});
		<!-- 모달 스크립트 - 리뷰 -->
		$("#review_modal_open").click(function(){
			$(".reviewModal").fadeIn();			
		});
		$("#review_modal_close").click(function(){
			$(".reviewModal").fadeOut();
		});		
		<!-- 모달 닫기, 백그라운드 부분 클릭 시 닫힘 -->
		$(".modalBackground").on('click',function(){
			  $(".shippingModal").fadeOut(300);
			  $(".reviewModal").fadeOut(300);
		});
	</script>
	<!-- //script -->
</body>
</html>
