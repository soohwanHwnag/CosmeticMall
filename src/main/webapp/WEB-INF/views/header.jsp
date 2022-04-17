<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자담</title>
<link rel="stylesheet" href="/css/header.css">
 

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <!-- Bootstarp JS -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</head>
<body>

<!-- header -->
<div id="header">
		<div class="toTopScroll">
			<img src="/icon-top.png" onClick="javascript:window.scrollTo(0,0)">
		 </div>
      <div class="tophover">
         <div class="top">
            <div class="topMenu">
            <c:if test="${empty member_idx}">
              <span><a href="/login/login">로그인</a></span>
              </c:if>
             <c:if test="${not empty member_idx}">
              <span><a href="/login/logout">로그아웃</a></span>
              </c:if>
              <span><a href="/join/join">회원가입</a></span>
              <span><a href="/order/order">주문내역</a></span>
              <span><a href="/order/cart">장바구니</a></span>
            </div>
          </div>
            <div class="navbar">
               <div class="container">
                  <a class="jadamlogo" href="/main"><img src="" alt="로고"></a>
                  <div id="dropdown" class="navbar2">
                     <ul>
                        <li><a href="/brand/brand">브랜드</a>
                        </li>
                        <li><a href="/product/productList">스킨케어</a>
                           <ul>
                              <li><a href="#">스킨</a></li>
                              <li><a href="#">로션</a></li>
                              <li><a href="#">에센스</a></li>
                              <li><a href="#">크림</a></li>
                              <li><a href="#">마스크팩</a></li>
                           </ul>
                        </li>
                        <li><a href="#">클렌징</a>
                           <ul>
                              <li><a href="#">비누</a></li>
                              <li><a href="#">오일</a></li>
                              <li><a href="#">폼</a></li>
                           </ul>
                        </li>
                        <li><a href="/customer/noticeList">고객센터</a>
                           <ul>
                              <li><a href="/customer/noticeList">공지사항</a></li>
                              <li><a href="/customer/faqList/total">자주하는 질문</a></li>
                              <li><a href="/customer/one2oneList">1:1문의</a></li>
                              <li><a href="/customer/eventList_Y">이벤트</a></li>
                           </ul>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>

      </div>
	</div>

