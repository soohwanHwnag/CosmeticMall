<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지</title>
    <link rel="stylesheet" href="/css/admin/adminCommon.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
        $(function(){
            $('.gnb').click(function(){
                $(this).siblings('.sub').stop().toggle();
            });
        });
    </script>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div class="logo"><a href="">자담</a></div>
            <div class="admin"><a href="">admin</a></div>
            <div class="btn">
                <span><a href="/main">사용자 페이지 가기</a></span>
                <span><a href="/admin/logout">로그아웃</a></span>
            </div>
        </div>
        <div class="nav">
            <div class="member">
               <h3 class="gnb">회원 관리</h3>
               <div class="sub">
                   <div><a href="/admin/member/memberList">> 회원관리</a></div>
                   <div><a href="/admin/member/mailList">> 메일관리</a></div>
               </div>
            </div>
            <div class="product">
                <h3 class="gnb">상품 관리</h3>
                <div class="sub">
                    <div><a href="/admin/product/product_list">> 상품리스트</a></div>
                    <div><a href="/admin/product/product_add">> 상품등록</a></div>
                </div>
            </div>
            <div class="order"> 
                <h3 class="gnb">주문 관리</h3>
                <div class="sub">
                    <div><a href="/admin/order/list/total">> 주문 리스트</a></div>
                    <div><a href="/admin/order/cancel/before">> 주문 취소 리스트</a></div>
                    <div><a href="">> 교환/환불 신청</a></div>
                </div>
            </div>
            <div class="review">
                <h3 class="gnb">리뷰 관리</h3>
                <div class="sub">
                    <div><a href="">> 리뷰리스트</a></div>
                </div>
            </div>
            <div class="one2one">
                <h3 class="gnb">문의 관리</h3>
                <div class="sub">
                    <div><a href="/admin/inquiry/faqEvent">> 자주하는 질문</a></div>
                    <div><a href="">> 1:1 문의 리스트</a></div>
                </div>
            </div>
            <div class="board">
                <h3 class="gnb">게시판 관리</h3>
                <div class="sub">
                    <div><a href="/admin/board/noticeList">> 공지사항 리스트</a></div>
                    <div><a href="/admin/board/noticeJoin">> 공지사항 등록</a></div>
                    <div><a href="/admin/board/eventlist/continue">> 이벤트 리스트</a></div>
                    <div><a href="">> 통계</a></div>
                </div>
            </div>
    </div>
    
