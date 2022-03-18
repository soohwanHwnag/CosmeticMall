<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/css/admin/adminMemberView.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script 
        src="https://code.jquery.com/jquery-3.5.1.js" 
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
        crossorigin="anonymous">
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
        //   confirm
        function clickEvent(){
         
         if(confirm("선택 항목을 탈퇴시키겠습니까?")){
          return true;
         }else{
          return false;
         }
        };
        
        function checkValue(){
        	if(!document.memberModify.member_password.value){
        		alert("비밀번호를 입력하세요")
        		return false;
        	}
        	if(!document.memberModify.member_password_check.value){
        		alert("비밀번호확인을 입력하세요")
        		return false;
        	}
        	if(document.memberModify.member_password_check.value != document.memberModify.member_password.value){
        		alert("비밀번호가 동일하지 않습니다")
        		return false;
        	}
        }
        $(function(){
        	$('#display').click(function(){
        		if($('#display').is(':checked')==true){
            		$('#member_password').attr('readonly',false);
            		$('#member_password_check').attr('readonly',false);
            	}else{
            		$('#member_password').attr('readonly',true);
            		$('#member_password_check').attr('readonly',true);
            	}
        	});
        });
        
        $(function(){
        	$('#all').click(function(){
        		if($('#all').is(':checked')==true){
            		$('#member_password').attr('type','text');
            		$('#member_password_check').attr('type','text');
            	}else{
            		$('#member_password').attr('type','password');
            		$('#member_password_check').attr('type','password');
            	}
        	});
        });
    </script>
	<!-- 회원 상세보기 -->
    <div class="memberMain">
        <div class="pageName">
          <a href="#">회원 관리</a> > <a href="#">회원 리스트</a> > <a href="#">회원 상세보기</a>
          </div>
          	<form action="memberDelete" method="post" id="memberDelete" onsubmit="return clickEvent();">
              	<input type="hidden" name="RowCheck" value="${dto.member_idx}"/>
              	</form>
          <div class="memberInfo">
          <form action="memberModify" name="memberModify"method="post" onsubmit="return checkValue();">
          <input type="hidden" name="member_idx" value="${dto.member_idx}"/>
            <div>가입정보</div>
            <div class="memberTable">
              <table>
                <tr>
                  <td>이름</td>
                  <td>${dto.member_name}</td>
                </tr>
                <tr>
                  <td>이메일</td>
                  <td>
                    <span>${dto.member_email}</span>
                    <span class="email_YN">
                      <label>매일 수신 여부:</label>
                      <input type="radio" name="email_YN" value="Y" <c:if test="${dto.member_email_YN eq 'Y' }">checked</c:if>>
                      <label for="">수신</label>
                      <input type="radio" name="email_YN" value="N" <c:if test="${dto.member_email_YN eq 'N' }">checked</c:if>>
                      <label for="">거부</label>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td>비밀번호</td>
                  <td>
                    <span>
                      <input type="checkbox"  id="all">
                      <label for="">암호화 되어 있음</label>
                      <input type="checkbox"  id="display">
                      <label for="">변경</label>
                    </span>
                    <span class="pw">
                      <input type="password" placeholder="비밀번호 입력" value="${dto.member_password}" name="member_password" id="member_password" readonly >
                    </span>
                    <span class="pw">
                      <input type="password" placeholder="비밀번호 확인" value="${dto.member_password}" name="member_password_check" id="member_password_check" readonly>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td>연락처</td>
                  <td>
                    <span>
                      <input type="tel" name="tel1" value="${tel1}">
                    </span>
                    -
                    <span>
                      <input type="tel" name="tel2" value="${tel2}">
                    </span>
   					-
                    <span>
                      <input type="tel" name="tel3" value="${tel3}">
                    </span>
                  </td>
                </tr>
                <tr>
                  <td>주소</td>
                  <td> 
                    <div>
                    <input type="text" id="sample6_postcode" value="${dto.member_addr1}" name="member_addr1">
                    <input type="button" class="add_bth" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                  </div>
                  <div>
                    <input type="text" id="sample6_address" value="${dto.member_addr2}" name="member_addr2">
                    <input type="text" id="sample6_detailAddress" value="${dto.member_addr3}" name="member_addr3">
                    <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
                  </div>
                   </td>
                </tr>
              </table>
            </div>
            <div class="joinInfo">
              <div>가입정보</div>
              <div class="joinInfoTable">
              <table>
                <tr>
                  <td>가입일</td>
                  <td>
                  <fmt:formatDate value="${dto.member_joindate}" pattern="yyyy-MM-dd hh:mm:ss"/>
                  </td>
                  <td>구매금액</td>
                  <td>
                  <fmt:formatNumber value="${dto.member_amount}"/>원
                 </td>
                </tr>
              </table>
            </div>
            </div>
            <div class="button">
              <span>
                <button type="submit" form="memberDelete">회원탈퇴</button>
              </span>
              <span>
                <button>수정</button>
                <button type="button" onclick="window.location.href='/admin/member/memberList'">취소</button>
              </span>
              <span>
                <button type="button" onclick="window.location.href='/admin/member/memberList'">회원 목록</button>
              </span>
            </div>
          </div>
          </form>
        </div>        
</div>
</body>
</html>