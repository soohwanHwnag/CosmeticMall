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
	<link rel="stylesheet" href="/css/mypage/member.css">
	<!-- js -->
	<script src="/jquery/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- main -->
	<main>
		<div class="wrap">
			<!-- 마이페이지 사이드바 -->
			<div class="side_bar">
				<h3>마이 페이지</h3>
				<ul>
					<li><a href="/mypage/orderView">주문내역</a></li>
					<li><a href="#">장바구니</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="/mypage/memberModify">개인정보 수정</a></li>
					<li><a href="/mypage/passwordModify">비밀번호 변경</a></li>
					<li>&gt;<a href="/mypage/memberDelete">회원탈퇴</a></li>
				</ul>				
			</div>
			<!-- //마이페이지 사이드바 -->
			<!-- 메인 내용 -->
			<div class="main_section">
				<h3 class="main_title">회원탈퇴</h3>
				<!-- 회원탈퇴 -->
				<div class="memberDelete">
					<!-- 탈퇴 폼 -->
					<div>
						<h3>회원 탈퇴 안내</h3>
						<p>{고객명} 고객님! 지금까지 저희 쇼핑몰을 이용해 주셔서 감사합니다.</p>
						<p>저희 쇼핑몰에 부족한 점이 있었다면 너그러운 양해 바라며,</p>
						<p>아래의 사항을 확인하시고 개선해야 할 점이 있다면 남겨 주세요.</p>
						<p>고객님의 의견을 적극 반영하여 이용에 불편함이 없도록 개선하겠습니다.</p>
					</div>
					<div>
						<h3>회원 탈퇴 시 꼭 확인해 주세요!</h3>
						<span>탈퇴 이후 등록한 게시물 등 이용 기록이 모두 삭제 됩니다.</span>
					</div>
					<form>
						<div>
							<h3>탈퇴 사유를 선택해 주세요!</h3>
							<input type="checkbox" id="reductUse" name="withdraw">
							<label for="reductUse">이용률 감소</label>
							<input type="checkbox" id="lowqualityProd" name="withdraw">
							<label for="lowqualityProd">상품 저품질</label>
							<input type="checkbox" id="prodPriceComplaint" name="withdraw">
							<label for="prodPriceComplaint">상품 가격 불만</label>
							<input type="checkbox" id="prodFunctionComplaint" name="withdraw">
							<label for="prodFunctionComplaint">상품 기능 불만</label>
							<input type="checkbox" id="etc" name="withdraw">
							<label for="etc">기타</label>
						</div>
						<div>
							<h3>쇼핑몰 이용에 개선 사항이 있다면 의견을 남겨 주세요!</h3>
							<textarea></textarea>
						</div>
						<div>
							<h3>비밀번호 입력</h3>
							<input type="password">
						</div>
						<div class="btnSection">
							<button class="grayBtn">확인</button>
							<button class="lightgrayBtn">취소</button>
						</div>
					</form>
					<!-- //탈퇴 폼 -->
				</div>
			</div>
			<!-- //메인 내용 -->
		</div>
	</main>
	<!-- //main -->

</body>
</html>