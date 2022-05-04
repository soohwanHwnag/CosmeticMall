<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자담</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
   <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
   <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="/css/header.css">
</head>
<body>
    
<!-- header -->
<div id="header">
    <div class="toTopScroll">
        <img src="/img/premium-icon-back-to-top-4196777.png" onClick="javascript:window.scrollTo(0,0)">
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
          <span><a href="/join/Join">회원가입</a></span>
          <span><a href="/mypage/orderList">주문내역</a></span>
          <span><a href="/order/cart">장바구니</a></span>
        </div>
      </div>
        <div class="navbar">
           <div class="gnbBar container">
               <div class="barImg">
              <a class="jadamlogo" href="/main"><img src="/img/jadamLogo.png" alt="로고"></a>
            </div>
              <div id="dropdown" class="navbar2">
                 <ul>
                    <li><a href="/brand/brand">브랜드</a>
                    </li>
                    <li><a href="/product/productList">스킨케어</a>
                       <ul class="drop">
                          <li><a href="#">스킨</a></li>
                          <li><a href="#">로션</a></li>
                          <li><a href="#">에센스</a></li>
                          <li><a href="#">크림</a></li>
                          <li><a href="#">마스크팩</a></li>
                       </ul>
                    </li>
                    <li><a href="#">고객센터</a>
                       <ul class="drop">
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