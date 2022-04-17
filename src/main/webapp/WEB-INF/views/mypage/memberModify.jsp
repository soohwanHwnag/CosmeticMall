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
					<li>&gt;<a href="/mypage/memberModify">개인정보 수정</a></li>
					<li><a href="/mypage/passwordModify">비밀번호 변경</a></li>
					<li><a href="/mypage/memberDelete">회원탈퇴</a></li>
				</ul>				
			</div>
			<!-- //마이페이지 사이드바 -->
			<!-- 메인 내용 -->
			<div class="member main_section">
				<h3 class="main_title">개인정보 수정</h3>
				<!-- 개인정보 수정 -->
				<div class="memberModify">
					<!-- 수정 폼 -->
					<form>
						<table>
							<tr>
								<th>이름</th>
								<td>{가입 이름}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>{가입 이메일}</td>
							</tr>
							<tr>
								<th>광고 메일 수신 여부</th>
								<td>
									<div class="mail_agree">
										<input type="radio" id="agree" name="mail_agree" checked>
										<label for="agree">수신함</label>
										<input type="radio" id="disagree" name="mail_agree">
										<label for="disagree">수신하지 않음</label>
									</div>
									<span>(이벤트, 신상품 등 고객님께 혜택이 되는 소식을 알려드립니다.)</span>
								</td>
							</tr>
							<tr class="phone">
								<th>연락처</th>
								<td>
									<input maxlength="3" />&nbsp;-&nbsp;
									<input maxlength="4" />&nbsp;-&nbsp;
									<input maxlength="4">
								</td>
							</tr>
							<tr class="address">
								<th>주소</th>
								<td>
									<input>
									<button class="lightgrayBtn">우편번호 검색</button>
									<input>
								</td>
							</tr>
						</table>
						<div class="marketingAgree">
							<h3>마케팅 정보 제공 동의</h3>
							<textarea readonly></textarea>
							<input type="checkbox" id="marketing_agree" name="marketing_agree">
							<label for="marketing_agree">동의함</label>
						</div>
						<div class="btnSection">
							<button class="grayBtn">수정</button>
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