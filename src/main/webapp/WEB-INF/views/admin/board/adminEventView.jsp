<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/css/admin/adminEventView.css">

        <!-- 이벤트 상세보기 시작 -->
        <div class="eventMain">
        <div class="pageName">
            게시판 관리 > 이벤트 리스트 > 이벤트 상세보기
        </div>
       <!-- 이벤트 슬로건 시작-->
       <div class="eventDate">
           <fmt:formatDate value="${dto.event_start_date}" pattern="yyyy-MM-dd hh:mm:ss" /> ~ <fmt:formatDate value="${dto.event_end_date}" pattern="yyyy-MM-dd hh:mm:ss" />
       </div>
       <div class="eventTitle">
           <p>${dto.event_title}</p>
           <p>${dto.event_slogan}</p>
        </div>
       <div class="eventImg">
        <div><img src="${dto.event_banner_filename}" alt=""></div>
       </div>
       <!-- 이벤트 슬로건 끝 -->
       <!-- 버튼 시작 -->
       <div class="button">
        <div>
            <a href="/admin/board/eventlist/continue"><button>목록</button></a>
        </div>
        <div>
        <form action="eventDeleteAction" method="post" id="eventDeleteAction">
        <input type="hidden" name="event_idx" value="${dto.event_idx}">
            <button type="button" onclick="window.location.href='/admin/board/adminEventModify?event_idx=${dto.event_idx}'">수정</button>
            <button onclick="return clickEvent();">삭제</button>
           	</form>
        </div>
       </div>
       <!-- 버튼 끝 -->
      </div>
      <!-- 이벤트 상세보기 끝 -->
    </div>
    <script>

        //   confirm
      function clickEvent(){
       
       if(confirm("삭제하시겠습니까?")){
        
         window.submit();
       }else{
        return false;
       }
      };
    </script>
</body>
</html>