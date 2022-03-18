<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/css/admin/adminNoticeList.css">
        <!-- 이벤트 시작 -->
        <div class="noticeMain">
        <div class="pageName">
            게시판 관리 > 공지사항 리스트
        </div>
        <!-- 검색창 시작 -->
        <div class="noticeSearch">
        <form action="noticeList">
            <span>
                <select name="noticeCategory">
                    <option value="total" <c:if test="${empty category || cotegory eq 'total'}">selected</c:if>>전체</option>
                    <option value="title" <c:if test="${cotegory eq 'title'}">selected</c:if>>제목</option>
                    <option value="content" <c:if test="${cotegory eq 'content'}">selected</c:if>>내용</option>
                </select>
            </span>
            <span>
            <c:if test="${empty value }">
              <input type="text" name="noticeValue" id="">
              </c:if>
               <c:if test="${not empty value }">
              <input type="text" name="noticeValue" value="${value}">
              </c:if>
            </span>
            <span>
                <input type="submit" value="검색">
            </span>
            </form>
        </div>
        <!-- 검색창 끝 -->
        <!-- 이벤트 리스트 시작-->
        <div class="noticeList">
            <table>
                <tr>
                    <td>번호</td>
                    <td>제목</td>
                    <td>날짜</td>
                </tr>
               <c:forEach var="list" items="${noticeList}" varStatus="status">
                <tr onclick="window.location.href='/admin/board/noticeView?notice_idx=${list.notice_idx}'" style="cursor:pointer;">
                    <td>
                    <c:if test="${list.notice_important_YN eq 'Y' }">
                        <span class="point">공지</span>
                        </c:if>
                        <c:if test="${list.notice_important_YN eq 'N' }">
                        <c:if test="${empty nowpage || nowpage == 1}">
                        ${status.count}
                        </c:if>
                        <c:if test="${nowpage > 1}">
                        ${status.count+(nowpage*10)}
                        </c:if>
                        </c:if>
                    </td>
                    <td>${list.notice_title}</td>
                    <td>
                   <fmt:formatDate value="${list.notice_date}" pattern="yyyy-MM-dd"/> 
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <!-- 이벤트 리스트 끝 -->
        <!-- 버튼 시작 -->
        <div class="button">
            <a href="/admin/board/noticeJoin"><button>등록</button></a>
        </div>
        <!-- 버튼 끝 -->
         <!-- 페이징 시작 -->
         <c:if test="${empty category && empty value}">
         <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/admin/board/noticeList?page=&page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/admin/board/noticeList?page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/admin/board/noticeList?page=&page=${nowpage +1}}">></a></span>
              </c:if>
        </div>
        </c:if>
         <c:if test="${not empty category && not empty value}">
         <div class="page">
           <c:if test="${nowpage != 1}">
              <span><a href="/admin/board/noticeList?eventSearchCategory=${category}&eventSearchValue=${value}&page=${nowpage -1}">1</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
              <span><a href="/admin/board/noticeList?eventSearchCategory=${category}&eventSearchValue=${value}&page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/admin/board/noticeList?eventSearchCategory=${category}&eventSearchValue=${value}&page=${nowpage +1}">1</a></span>
              </c:if>
        </div>
        </c:if>
        <!-- 페이징 끝 -->
      </div>
      <!-- 이벤트 끝 -->
    </div>
</body>
</html>