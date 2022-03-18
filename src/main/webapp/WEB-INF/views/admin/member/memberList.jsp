<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <link rel="stylesheet" href="/css/admin/adminMemberList.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
        		// 세부 검색 열고 닫기
		function display(){
			if($(".detail_search").css("display")=="none"){
				// $(".detail_search").css("display","flex");
				$(".detail_search").show(500).css("display","flex");
				$("#openBtn").css({'background':'url("/img/up-arrow.png") 30px 2px /16px 16px no-repeat'});
			} else {
				$(".detail_search").hide(500);
        $("#openBtn").css({'background':'url("/img/down-arrow.png") 30px 2px /16px 16px no-repeat'});
			}
		}

    //   선택 항목 전체 선택
    function allChk(obj){
      var chkObj = document.getElementsByName("RowCheck");
      var rowCnt = chkObj.length;
      var check = obj.checked;
      if (check) {
          for (var i=0; i<=rowCnt; i++){
           if(chkObj[i].type == "checkbox")
               chkObj[i].checked = true;
          }
      } else {
          for (var i=0; i<=rowCnt; i++) {
           if(chkObj[i].type == "checkbox"){
               chkObj[i].checked = false;
           }
          }
      }
  } 
    </script>
    <!-- 회원리스트 시작-->
    <div class="main">
        <div class="main_right">
          <div class="location">
          <a href="#">회원 관리</a> > <a href="#">회원 리스트</a>
          </div>
          <!-- 상품 검색 -->
          <div class="search_bar mt40">
            <div class="basic_search mb10">
            <form action="memberList" method="get">
             <select class="memberSearchSelect" name="memberSearchSelect">
                  <option value="total" <c:if test="${empty category || category eq 'total'}">selected</c:if>>회원등급</option>
                  <option value="member_name" <c:if test="${category eq 'member_name'}">selected</c:if>>이름</option>
                  <option value="member_email" <c:if test="${category eq 'member_email'}">selected</c:if>>이메일</option>
                </select>
                <c:if test="${empty value}">
                 <input type="text" name="memberSearchValue"placeholder="검색어를 입력하세요."/>
                 </c:if>
                 <c:if test="${not empty value}">
                 <input type="text" name="memberSearchValue" value="${value}"/>
                 </c:if>
             
              <button class="whiteBtn">검색</button> 
            </div>
            </form>
            <div class="search_open mb5">
              <span>상세 검색</span>
              <button class="ml10" id="openBtn" onclick="display()">열기</button>
            </div>      
            <div class="detail_search pt20">
            <form action="memberList" method="get">
              <div>
                <label>가입일</label>
               <c:if test="${empty joindate_start && empty joindate_end}">
               <span class="ml10"><input type="date" name="member_joindate_start"></span>
               <span>~</span>
               <span><input type="date"  name="member_joindate_end"></span>
             </c:if>
             <c:if test="${not empty joindate_start && not empty joindate_end}">
               <span class="ml10"><input type="date" name="member_joindate_start" value="${joindate_start}"></span>
               <span>~</span>
               <span><input type="date"  name="member_joindate_end" value="${joindate_end}"></span>
             </c:if>
                <label class="ml10">구매금액</label>
                <c:if test="${empty amount_start && empty amount_end}">
        		<span class="ml10"><input type="text" name="member_amount_start"></span>
                <span>~</span>
                <span><input type="text" name="member_amount_end"></span>
             </c:if>
             <c:if test="${not empty amount_start && not empty amount_end}">
        		<span class="ml10"><input type="text" name="member_amount_start" value="${amount_start}"></span>
                <span>~</span>
                <span><input type="text" name="member_amount_end" value="${amount_end}"></span>
             </c:if>
                </div>
               <div>
                <label>회원등급</label>
                <select class="ml10" name="member_detail_select">
                  <option value="total" <c:if test="${empty detail_select || detail_select eq 'total'}">selected</c:if>>회원등급</option>
                  <!-- 스킨케어 카테고리 서브 카테 -->
                  <option value="member" <c:if test="${detail_select eq 'member'}">selected</c:if>>일반회원</option>
                  <option value="admin" <c:if test="${detail_select eq 'admin'}">selected</c:if>>관리자</option>
                </select>
                <label class="email_YN">매일 수신</label>
                <input type="radio" name="email_YN" value="Y" id="all" <c:if test="${empty email_yn || email_yn eq 'Y'}">checked</c:if>>
                <label for="">수신</label>
                <input type="radio" name="email_YN" value="N" id="display" <c:if test="${email_yn eq 'N'}">checked</c:if>>
                <label for="">거부</label>
              </div>
              <div class="search_bth">
              <button class="grayBtn">상세 검색</button>
            </div>
          </div>
           </form>
        </div>
        <div class="member_count mb40">
          <span>▶︎ 회원등급: 일반회원 : ${count_member}명 ,
          관리자 : ${count_admin}명</span>
        </div>
          <!-- 상품 리스트 -->
          <div class="product_table mt40">
           <c:if test="${empty memberList}">
           검색 결과가 없습니다
           </c:if>
         <c:if test="${not empty memberList}">
            <div class="table_top_txt">
            <form action="memberDelete" method="post">
              <span>${count_search}건의 검색 결과가 있습니다.</span> 
            </div>
            <table class="mt5 mb10">
              <colgroup>
                <col width="7%">
                <col width="7%">
                <col width="20%">
                <col width="25%">
                <col width="15%">
                <col width="10%">
                <col width="16%">
              </colgroup>
              <tr>
                <td><input type="checkbox" onclick="allChk(this)"></td>
                <td>번호</td>
                <td>이름</td><!-- 카테고리 : 2차 옵션명으로 -->
                <td>이메일</td>
                <td>회원 등급</td>
                <td>구매금액</td>
                <td>이메일 수신여부</td>
              </tr>
              <c:forEach var="list" items="${memberList }" varStatus="status">
              <tr>
                <td><input type="checkbox" name="RowCheck" value="${list.member_idx}"></td>
                <td onclick="window.location.href='/admin/member/memberView?member_idx=${list.member_idx}'">
                <c:if test="${not empty nowpage}">
                ${status.count+((nowpage-1)*10)}
                </c:if>
                 <c:if test="${ empty nowpage}">
                ${status.count}
                </c:if>
                </td>
                <td onclick="window.location.href='/admin/member/memberView?member_idx=${list.member_idx}'">
                ${list.member_name}
                </td>
                <td onclick="window.location.href='/admin/member/memberView?member_idx=${list.member_idx}'">
                ${list.member_email}
                </td><!-- 카테고리 : 2차 옵션명으로 -->
                <td onclick="window.location.href='/admin/member/memberView?member_idx=${list.member_idx}'">
                ${list.member_grade}
                </td>
                <td onclick="window.location.href='/admin/member/memberView?member_idx=${list.member_idx}'">
				<fmt:formatNumber value="${list.member_amount}"/>원
                </td>
                <td onclick="window.location.href='/admin/member/memberView?member_idx=${list.member_idx}'">${list.member_email_YN}
                </td>
              </tr>
              </c:forEach>
            </table>
            <div class="table_bottom">
              <div class="btn_section">
                <div class="btn_display">
                  <button class="whiteBtn" onclick="return clickEvent();">선택 탈퇴</button>
                </div>
                </form>
              </div>
                     <!-- 페이징 시작 -->
             <c:if test="${empty categgory && empty value && empty joindate_start && empty joindate_end && empty amount_start && empty amount_end && empty detail_select && empty email_yn}">
            <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/admin/member/memberList?page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/admin/member/memberList?page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/admin/member/memberList?page=${nowpage + 1}">></a></span>
              </c:if>
               </div>
              </c:if>
              
              <c:if test="${not empty value && not empty category && empty joindate_start && empty joindate_end && empty amount_start && empty amount_end && empty detail_select && empty email_yn}">
            <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/admin/member/memberList?memberSearchSelect=${category}&memberSearchValue=${value}&page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/admin/member/memberList?memberSearchSelect=${category}&memberSearchValue=${value}&page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/admin/member/memberList?memberSearchSelect=${category}&memberSearchValue=${value}&page=${nowpage + 1}">></a></span>
              </c:if>
              </div>
              </c:if>
              
              
              <c:if test="${empty value && empty category && not empty joindate_start && not empty joindate_end && empty amount_start && empty amount_end && not empty detail_select && not empty email_yn}">
            <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/admin/member/memberList?member_joindate_start=${joindate_start}&member_joindate_end=${joindate_end}&member_detail_select=${detail_select}&email_YN=${email_yn}&page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/admin/member/memberList?member_joindate_start=${joindate_start}&member_joindate_end=${joindate_end}&member_detail_select=${detail_select}&email_YN=${email_yn}&page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/admin/member/memberList?member_joindate_start=${joindate_start}&member_joindate_end=${joindate_end}&member_detail_select=${detail_select}&email_YN=${email_yn}&page=${nowpage + 1}">></a></span>
              </c:if>
               </div>
              </c:if>
              
              <c:if test="${empty value && empty category && empty joindate_start && empty joindate_end && not empty amount_start && not empty amount_end && not empty detail_select && not empty email_yn}">
            <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/admin/member/memberList?memberList?member_amount_start=${amount_start}&member_amount_end=${amount_end}&member_detail_select=${detail_select}&email_YN=${email_yn}&page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/admin/member/memberList?memberList?member_amount_start=${amount_start}&member_amount_end=${amount_end}&member_detail_select=${detail_select}&email_YN=${email_yn}&page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${block_end < block_total}">
              <span><a href="/admin/member/memberList?memberList?member_amount_start=${amount_start}&member_amount_end=${amount_end}&member_detail_select=${detail_select}&email_YN=${email_yn}&page=${nowpage + 1}">></a></span>
              </c:if>
               </div>
              </c:if>
              
              <c:if test="${empty value && empty category && not empty joindate_start && not empty joindate_end && not empty amount_start && not empty amount_end && not empty detail_select && not empty email_yn}">
            <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/admin/member/memberList?memberList?member_joindate_start=${joindate_start}&member_joindate_end=${joindate_end}&member_amount_start=${amount_start}&member_amount_end=${amount_end}&member_detail_select=${detail_select}&email_YN=${email_yn}&page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/admin/member/memberList?memberList?member_joindate_start=${joindate_start}&member_joindate_end=${joindate_end}&member_amount_start=${amount_start}&member_amount_end=${amount_end}&member_detail_select=${detail_select}&email_YN=${email_yn}&page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/admin/member/memberList?member_joindate_start=${joindate_start}&member_joindate_end=${joindate_end}&memberList?member_amount_start=${amount_start}&member_amount_end=${amount_end}&member_detail_select=${detail_select}&email_YN=${email_yn}&page=${nowpage + 1}">></a></span>
              </c:if>
               </div>
              </c:if>
              
               <c:if test="${empty value && empty category && empty joindate_start && empty joindate_end && empty amount_start && empty amount_end && not empty detail_select && not empty email_yn}">
            <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/admin/member/memberList?member_detail_select=${detail_select}&email_YN=${email_yn}&page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/admin/member/memberList?member_detail_select=${detail_select}&email_YN=${email_yn}&page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/admin/member/memberList?member_detail_select=${detail_select}&email_YN=${email_yn}&page=${nowpage + 1}">></a></span>
              </c:if>
               </div>
              </c:if>
              
             
              
     
          <!-- 페이징 끝 -->
          </c:if>
            </div>
          </div>
        </div>
</div>
<script>
//   confirm
function clickEvent(){
 
 if(confirm("선택 항목을 삭제시키겠습니까?")){
  window.submit();
 }else{
  return false;
 }
};</script>
</body>
</html>