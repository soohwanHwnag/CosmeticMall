<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!-- CSS -->
<link rel="stylesheet" href="/css/event_Y.css">
  
<!-- main -->

    <div class="container eventMain">
        <h2>EVENT</h2>
        <div class="eventCategory">
        <span><a href="/customer/eventList_Y">진행중인 이벤트</a></span>
        <span><a href="/customer/eventList_N">종료된 이벤트</a></span>
        </div>
        <div class="eventList">
        	<c:forEach var="list" items="${eventList}">
            <div class="eventSection">
                <img src="${list.event_banner_filename}" onclick="window.location.href='/customer/eventView?event_idx=${list.event_idx}'">
                <h3>${list.event_title}</h3>
                <h4>${list.event_slogan}</h4>
                <h5>
                <fmt:formatDate value="${list.event_start_date}" pattern="yyyy-MM-dd hh:mm"/> 
                    ~ <fmt:formatDate value="${list.event_end_date}" pattern="yyyy-MM-dd hh:mm"/>
                </h5>
            </div>
            </c:forEach>
        </div>
          <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/customer/eventList_Y?page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/customer/eventList_Y?page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/customer/eventList_Y?page=${nowpage +1}}">></a></span>
              </c:if>
        </div>
    </div>
  
