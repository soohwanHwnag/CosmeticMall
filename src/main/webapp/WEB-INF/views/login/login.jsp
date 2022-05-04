<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<!-- CSS -->
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/login/login.css">
	<!-- js -->
<script src="/jquery/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->

	<!-- //header -->
	<!-- main -->
	<main>
		<div class="wrap">
			<h3>로그인</h3>
			<form class="loginForm" action="loginForm" method="post" onsubmit="return checkValue();">
				<ul class="Login_list">
					<li><input placeholder="이메일" name="id"/></li>
					<li><input placeholder="비밀번호" name="pw"/></li>
					<li><button type="submit">로그인</button></li>
				</ul>
			</form>
			<div class="loginMenu">
				<ul>
					<li><a href="/join/Join">회원가입</a></li>
					<li><a href="javascript:openModal('idFindModal');">아이디 찾기</a></li>
					<li><a href="javascript:openModal('pwFindModal');">비밀번호 찾기</a></li>
				</ul>
			</div>
			<div class="idFindModal">
				<div class="modalContent">
					<h3>아이디 찾기</h3>
					<form class="idFindForm modalForm">
						<ul>
							<li><input placeholder="이름" /></li>
							<li><input placeholder="휴대전화" /></li>
							<li><button type="submit">아이디찾기</button></li>
						</ul>
					</form>
				</div>
				<div class="modalBackground"></div>
			</div>
			<div class="pwFindModal">
				<div class="modalContent">
					<h3>비밀번호 찾기</h3>
					<form class="pwFindForm modalForm">
						<ul>
							<li><input placeholder="이름" /></li>
							<li><input placeholder="가입한 이메일" /></li>
							<li><button type="submit">임시 비밀번호 발송</button></li>
							<li>가입하신 이메일로 임시 비밀번호를 보내드립니다.</li>
						</ul>
					</form>
				</div>
				<div class="modalBackground"></div>
			</div>
		</div>
	</main>
	<!-- //main -->
	<!-- footer -->
	<!-- //footer -->
	<!-- 스크립트 -->
	<script>
		<!-- 모달 스크립트 -->
		function openModal(modalname){
			<!-- 모달 열기, modalname은 보여질 모달 class -->
			document.get
			$("."+modalname).fadeIn(300);
			
			<!-- 모달 닫기, 백그라운드 부분 클릭 시 닫힘 -->
			$(".modalBackground").on('click',function(){
				  $("."+modalname).fadeOut(300);
			});
		}		
	</script>
	