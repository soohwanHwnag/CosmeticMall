<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>������������</title>
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
            <div class="logo"><a href="">�ڴ�</a></div>
            <div class="admin"><a href="">admin</a></div>
            <div class="btn">
                <span><a href="/main">����� ������ ����</a></span>
                <span><a href="/admin/logout">�α׾ƿ�</a></span>
            </div>
        </div>
        <div class="nav">
            <div class="member">
               <h3 class="gnb">ȸ�� ����</h3>
               <div class="sub">
                   <div><a href="/admin/member/memberList">> ȸ������</a></div>
                   <div><a href="/admin/member/mailList">> ���ϰ���</a></div>
               </div>
            </div>
            <div class="product">
                <h3 class="gnb">��ǰ ����</h3>
                <div class="sub">
                    <div><a href="/admin/product/product_list">> ��ǰ����Ʈ</a></div>
                    <div><a href="/admin/product/product_add">> ��ǰ���</a></div>
                </div>
            </div>
            <div class="order"> 
                <h3 class="gnb">�ֹ� ����</h3>
                <div class="sub">
                    <div><a href="/admin/order/list/total">> �ֹ� ����Ʈ</a></div>
                    <div><a href="/admin/order/cancel/before">> �ֹ� ��� ����Ʈ</a></div>
                    <div><a href="">> ��ȯ/ȯ�� ��û</a></div>
                </div>
            </div>
            <div class="review">
                <h3 class="gnb">���� ����</h3>
                <div class="sub">
                    <div><a href="">> ���丮��Ʈ</a></div>
                </div>
            </div>
            <div class="one2one">
                <h3 class="gnb">���� ����</h3>
                <div class="sub">
                    <div><a href="/admin/inquiry/faqEvent">> �����ϴ� ����</a></div>
                    <div><a href="">> 1:1 ���� ����Ʈ</a></div>
                </div>
            </div>
            <div class="board">
                <h3 class="gnb">�Խ��� ����</h3>
                <div class="sub">
                    <div><a href="/admin/board/noticeList">> �������� ����Ʈ</a></div>
                    <div><a href="/admin/board/noticeJoin">> �������� ���</a></div>
                    <div><a href="/admin/board/eventlist/continue">> �̺�Ʈ ����Ʈ</a></div>
                    <div><a href="">> ���</a></div>
                </div>
            </div>
    </div>
    
