<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!-- CSS -->
<link rel="stylesheet" href="/css/eventView.css">
  
<!-- main -->

 <div class="container eventMain">
        <h2>EVENT</h2>
        <div class="eventView">
        <div class="eventDate">
            <span><fmt:formatDate value="${dto.event_start_date}" pattern="yyyy-MM-dd hh:mm"/></span>
            <span>~</span>
            <span><fmt:formatDate value="${dto.event_end_date}" pattern="yyyy-MM-dd hh:mm"/></span>
        </div>
        <div class="eventTitle">
            <h4>${dto.event_title}</h3>
        </div>
        <div class="eventSlogan">
            <p>${dto.event_slogan}</p>
        </div>
        <div class="eventImg">
            <img src="${dto.event_detail_filename}" alt="">
        </div>
        <div class="listBtn">
            <button onclick="history.back(-1)">목록</button>
        </div>
    </div>
 </div>
  
