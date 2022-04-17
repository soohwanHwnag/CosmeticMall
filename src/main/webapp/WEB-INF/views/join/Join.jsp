<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<!-- CSS -->
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/join/join.css">
	<!-- js -->
	<script src="/jquery/jquery-3.6.0.min.js"></script>
	<!-- 유효성 검사(스크립트 추가) -->
	<script>
		<!-- 우리 폼에 맞춰서 수정 -->
		function checkValue() {		
			if(!document.memberJoin.member_name.value) { 
				alert("이름을 입력해주세요");
				return false; 
			}
			if(!document.memberJoin.member_email.value) {
				alert("이메일을 입력해주세요");
				return false; 
			}
			if(!document.memberJoin.member_password.value) { 
				alert("비밀번호를 입력해주세요");
				return false; 
			}
			if(!document.memberJoin.member_password_check.value || document.memberJoin.member_password.value != document.memberJoin.member_password_check.value) { 
				alert("비밀번호를 확인해주세요");
				return false; 
			}
			if(!document.memberJoin.member_phone.value) { 
				alert("폰번호를 입력해주세요");
				return false; 
			}
			if(!document.memberJoin.agree1.checked) { 
				alert("동의 해주세요");
				return false; 
			}
			if(!document.memberJoin.agree2.checked) { 
				alert("동의 해주세요");
				return false; 
			}
			return true;
		}
	</script>
</head>
<body>

	<!-- main -->
	<main>
		<div class="wrap">
			<h3>회원가입</h3>
			<form action="memberJoin" name="memberJoin" method="post" onsubmit="return checkValue();">
				<!-- 체크 표시, 오류 메세지는 유효성 검사로 처리 -->
				<input placeholder="이름(2자 이상)" name="member_name">
				<input placeholder="이메일(example@email.com)" name="member_email">
				<input type="password" placeholder="비밀번호(영문,숫자,특수문자 포함 8-20자)" name="member_password">
				<input type="password" placeholder="비밀번호 확인" name="member_password_check">
				<input placeholder="휴대전화" name="member_phone">
				<ul class="checkboxSection">
					<li><input type="checkbox" id="selectAll">전체 약관에 동의합니다.</li>
					<li><input type="checkbox" name="agree1" class="agree"><a>서비스 이용약관</a>에 동의합니다.(필수)</li>
					<li><input type="checkbox" name="agree2" class="agree"><a>개인정보 수집 및 이용에 대한 안내</a>에 동의합니다.(필수)</li>
					<li><input type="checkbox" name="member_email_YN" class="agree" value="Y">이벤트 정보 수신에 동의합니다.(선택)</li>
				</ul>
				<button type="submit">가입하기</button>
			</form>
		</div>
	</main>
	<!-- //main -->
	<!-- 스크립트 -->
	<script>
		<!-- 약관 동의 선택 -->
		<!-- 전체 동의 시 모두 체크 -->
		$("#selectAll").click(function(){
			if($("#selectAll").is(":checked")){
				$("input[class=agree]").prop("checked", true);
			} else {
				$("input[class=agree]").prop("checked", false);			
			}
		});
		<!-- 모두 체크된 상태에서 체크가 하나 이상 빠지면 모두 체크 해제 -->
		$("input[name=agree]").click(function(){
			var total = $("input[class=agree]").length;
			var checked = $("input[class=agree]:checked").length;
			if( total != checked ) {
				$("#selectAll").prop("checked", false);
			} else {
				$("#selectAll").prop("checked", true);
			}
		});
	</script>
	<!-- //스크립트 -->
