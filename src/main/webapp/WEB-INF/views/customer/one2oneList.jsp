<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!-- CSS -->
<link rel="stylesheet" href="/css/one2one.css">
  
<!-- main -->

<div class="container one2oneMain">
        <h2>1:1 문의</h2>
        <div class="one2oneCategory">
        <span><a href="/customer/noticeList">공지사항</a></span>
        <span><a href="/customer/faqList/total">자주하는 질문</a></span>
        <span><a href="/custmoer/one2oneList">1:1 문의</a></span>
        </div>
        <table>
            <tr class="maintitle">
                <td>번호</td>
                <td>질문유형</td>
                <td>제목</td>
                <td>답변여부</td>
                <td>작성일</td>
            </tr>
            <c:forEach var="list" items="${one2oneList}" varStatus="status">
            <tr class="subtitle" onclick="window.location.href='/customer/one2oneView?one2one_idx=${list.one2one_idx}'" style="cursor:pointer;">
                <td class="noticesub"> 
                <c:if test="${empty nowpage || nowpage == 1}">
                        ${status.count}
                        </c:if>
                        <c:if test="${nowpage > 1}">
                        ${status.count+(nowpage*10)}
                        </c:if>
                        </td>
                <td>${list.one2one_category}</td>
                <td>${list.one2one_title}</td>
                <td>${list.one2one_reply_YN}</td>
                <td>
               <fmt:formatDate value="${list.one2one_date}" pattern="yyyy-MM-dd"/>
                </td>
            </tr>
            </c:forEach>
        </table>
        <div class="listBtn">
            <button onclick="window.location.href='/customer/one2oneWrite'">1:1 문의하기</button>
        </div>
        <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/customer/one2oneList?page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/customer/one2oneList?page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/customer/one2oneList?page=${nowpage +1}}">></a></span>
              </c:if>
        </div>
    </div>
