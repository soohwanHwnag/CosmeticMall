<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!-- CSS -->
<link rel="stylesheet" href="/css/noticeView.css">
  
<!-- main -->

 <div class="container eventMain">
        <h2>공지사항</h2>
        <div class="noticeCategory">
        <span><a href="">공지사항</a></span>
        <span><a href="">자주하는 질문</a></span>
        <span><a href="">1:1 문의</a></span>
        </div>
        <div class="delivery">
            <h3>${dto.notice_title}</h3>
            <div class="deliverysub">
                <span>운영자</span>
                <span class="date"> <fmt:formatDate value="${dto.notice_date}" pattern="yyyy-MM-dd"/> </span>
                <span class="hite">조회수 ${dto.notice_hit}</span>
            </div>
            <p>
              ${dto.notice_content}
            </p>
            <hr>
        </div>
        <div class="noticeBtn">
            <button onclick="history.back(-1)">목록</button>
        </div>
       
    </div>
  
