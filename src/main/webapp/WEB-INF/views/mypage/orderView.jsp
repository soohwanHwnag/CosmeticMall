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
	<!-- header -->
	<header>
		<h1>헤더 임시</h1>
	</header>
	<!-- //header -->
	<!-- main -->
	<main>
		<div class="wrap">
			<!-- 마이페이지 사이드바 -->
			<div class="side_bar">
				<h3>마이 페이지</h3>
				<ul>
					<li>&gt;<a href="/mypage/orderView">주문내역</a></li>
					<li><a href="#">장바구니</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="/mypage/memberModify">개인정보 수정</a></li>
					<li><a href="/mypage/passwordModify">비밀번호 변경</a></li>
					<li><a href="/mypage/memberDelete">회원탈퇴</a></li>
				</ul>				
			</div>
			<!-- //마이페이지 사이드바 -->
			<!-- 메인 내용 -->
			<div class="orderView main_section">
				<h3 class="main_title">주문/배송 상세</h3>
				<div class="orderInfo">
					<span>주문일자 2022-02-08</span>
					<span>주문번호 202202113717</span>
				</div>
				<!-- 상품 정보 -->
				<div class="orderProductInfo">
					<h3>주문 상품 정보</h3>
					<table class="productInfo">
						<colgroup>
							<col width="5%">
							<col width="37%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="13%">
						</colgroup>
						<tr class="table_head">
							<th></th>
							<th>상품명</th>
							<th>수량</th>
							<th>상품금액</th>
							<th>배송비</th>
							<th>진행상태</th>
						</tr>					
						<!-- c:forEach로 반복되는 부분 -->
						<tr class="table_body">
							<td>1</td>
							<td>
								<!-- 이미지 태그로 바꿔주기 -->
								<!-- <img src="" alt=""> -->
								<div class="product_img">이미지</div>
								<p class="product_name">자담 수분 진정크림</p>
							</td>
							<td>3</td>
							<td>60,000원</td>
							<td>무료</td>
							<td>
								<span>배송완료</span>
								<button class="lightgrayBtn" id="shipping_modal_open">배송조회</button>
							</td>
						</tr>	
					</table>
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
				</div>
				<!-- //상품 정보 -->
				<!-- 결제 정보 -->
				<div class="paymentInfo">
					<h3>결제 정보</h3>
					<table>
						<tr>
							<th>결제 방법</th>
							<td>{결제 방법}</td>
						</tr>
						<tr>
							<th>결제 금액</th>
							<td>60,000원</td>
						</tr>
					</table>
				</div>
				<!-- //결제 정보 -->
				<!-- 배송 정보 -->
				<div class="shippingInfo">
					<h3>결제 정보</h3>
					<table>
						<tr>
							<th>수령인</th>
							<td>{이름}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>{연락처}</td>
						</tr>
						<tr>
							<th>배송지</th>
							<td>{주소}</td>
						</tr>
						<tr>
							<th>배송 메세지</th>
							<td>{배송 메세지}</td>
						</tr>
					</table>
				</div>
				<!-- //배송 정보 -->
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
				<!-- 버튼 -->
				<div class="btnSection">
					<button class="whiteBtn">목록</button>
					<button class="lightgrayBtn">리뷰작성</button>
					<button class="grayBtn">주문취소</button>
				</div>
				<!-- //버튼 -->
			</div>
			<!-- //메인 내용 -->
		</div>
	</main>
	<!-- //main -->
	<!-- footer -->
	<footer>
		<h1>푸터 임시</h1>
	</footer>
	<!-- //footer -->
	<!-- script -->
	<script>
		<!-- 모달 스크립트 - 배송 -->
		$("#shipping_modal_open").click(function(){
			$(".shippingModal").fadeIn();			
		});
		$("#shipping_modal_close").click(function(){
			$(".shippingModal").fadeOut();
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
