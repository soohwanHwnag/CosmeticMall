<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <link rel="stylesheet" href="/css/admin/adminNoticeView.css">
    <script>
        //   confirm
      function clickEvent(){
       
       if(confirm("삭제하시겠습니까?")){
        return true;
       }else{
        return false;
       }
      };
    </script>
        <!-- 이벤트 상세보기 시작 -->
        <div class="noticeMain">
        <div class="pageName">
            게시판 관리 > 공지사항 리스트 > 공지사항 상세보기
        </div>
       <!-- 이벤트 슬로건 시작-->
       <div class="noticeTitle">
           <p>${dto.notice_title}</p>
       </div>
       <div class="noticeInfo">
           <span>${dto.member_name} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <fmt:formatDate value="${dto.notice_date}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
           <span>조회수 ${dto.notice_hit}</span>
        </div>
       <div class="noticeContent">
        <p>${dto.notice_content}</p>
       </div>
       <!-- 이벤트 슬로건 끝 -->
       <!-- 버튼 시작 -->
       <div class="button">
        <div>
            <a href="/admin/board/noticeList"><button>목록</button></a>
        </div>
        <form action="noticeDelete" id="noticeDelete" method="post" onsubmit="return clickEvent()";>
            <input type="hidden" name="notice_idx" value="${dto.notice_idx}">
         </form>
        <div>
            <button onclick="window.location.href='/admin/board/noticeModify?notice_idx=${dto.notice_idx}'">수정</button>
            <button type="submit" form="noticeDelete">삭제</button>
        </div>
         
       </div>
       <!-- 버튼 끝 -->
      </div>
      <!-- 이벤트 상세보기 끝 -->
    </div>
</body>
</html>