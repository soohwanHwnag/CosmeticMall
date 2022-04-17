<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!-- CSS -->
<link rel="stylesheet" href="/css/notice.css">
  
<!-- main -->

<div class="container eventMain">
        <h2>공지사항</h2>
        <div class="noticeCategory">
        <span><a href="/customer/noticeList">공지사항</a></span>
        <span><a href="/customer/faqList/total">자주하는 질문</a></span>
        <span><a href="/customer/one2oneList">1:1 문의</a></span>
        </div>
        <table>
            <tr class="maintitle">
                <th style="width: 10%">번호</th>
                <th>제목</th>
                <th style="width: 20%">날짜</th>
            </tr>
           <c:forEach var="list" items="${noticeList}" varStatus="status">
                <tr onclick="window.location.href='/customer/noticeView?notice_idx=${list.notice_idx}'" style="cursor:pointer;">
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
         <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/customer/noticeList?page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/customer/noticeList?page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/customer/noticeList?page=${nowpage +1}}">></a></span>
              </c:if>
        </div>
    </div>
