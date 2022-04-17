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
					<li><a href="/mypage/orderView">주문내역</a></li>
					<li><a href="#">장바구니</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="/mypage/memberModify">개인정보 수정</a></li>
					<li>&gt;<a href="/mypage/passwordModify">비밀번호 변경</a></li>
					<li><a href="/mypage/memberDelete">회원탈퇴</a></li>
				</ul>				
			</div>
			<!-- //마이페이지 사이드바 -->
			<!-- 메인 내용 -->
			<div class="password main_section">
				<h3 class="main_title">비밀번호 변경</h3>
				<!-- 비밀번호 변경 -->
				<div class="passwordModify">
					<!-- 수정 폼 -->
					<form>
						<div class="current">
							<label for="currentPw">현재의 비밀번호 입력 : </label>
							<input type="password" id="currentPw" name="currentPw" maxlength="20">
						</div>
						<div class="change">
							<ul>
								<li>
									<label for="changePw">새로운 비밀번호 입력 : </label>
									<input type="password" id="changePw" name="changePw" maxlength="20">
								</li>
								<li>
									<label for="changePwChk">새로운 비밀번호 확인 : </label>
									<input type="password" id="changePwChk" name="changePwChk" maxlength="20">
								</li>
							</ul>
							<p>※ 영문, 숫자, 특수문자를 조합하여 8~20자 이내로 입력</p>
						</div>
						<div class="btnSection">
							<button class="grayBtn">변경</button>
							<button class="lightgrayBtn">취소</button>
						</div>
					</form>
					<!-- //수정 폼 -->
				</div>
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
</body>
</html>