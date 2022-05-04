<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 목록</title>
	<!-- CSS -->
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/product/productList.css">
	<!-- js -->
	<script src="/jquery/jquery-3.6.0.min.js"></script>
</head>
<body>
	
	<!-- main -->
	<main>
		<div class="wrap">
			<div class="banner">배너</div>
			<div class="product_wrap">
				<div class="category">
					<ul class="tabnav">
						<!-- 스킨케어 카테고리 -->
						<li class="tab_link current" data-tab="tab-0">전체</li>
						<li class="tab_link" data-tab="tab-1">스킨</li>
						<li class="tab_link" data-tab="tab-2">로션</li>
						<li class="tab_link" data-tab="tab-3">에센스</li>
						<li class="tab_link" data-tab="tab-4">크림</li>
						<li class="tab_link" data-tab="tab-5">마스크팩</li>					
					</ul>
				</div>
				<div class="product_list">
					<div class="tab_content">
						<div id="tab-0" class="product_box current">
							<!-- 각각의 상품(c:forEach로 반복되는 부분) -->
							<c:forEach var="list" items="${product_list}">
							<div class="product">
								<div class="product_thumbnail">
									<!-- 썸네일 '상품 이미지' 텍스트 빼고 img 태그 -->
									<a href="/product/productView?product_idx=${list.product_idx}">
									<img src="${list.product_filename}">
								</div>
								<div class="product_text">
									<a href="/product/productView" class="product_name">${list.product_name}</a>
									<p class="product_price">${list.product_price }</p>
								</div>
							</div>
							</c:forEach>
				<!-- 페이징 -->
				<div class="page">
					<ul class="pagination">
						<!-- href 수정 필수 -->
						<!-- <li class="page-item <c:if test="${ page == 1 }">disabled</c:if>"> -->
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<!-- <li class="page-item <c:if test="${ page == 1 }">active</c:if>"> -->
						<li class="page-item">
							<a class="page-link" href="/list?page=1">1</a>
						</li>
						<!-- <li class="page-item <c:if test="${ page == 2 }">active</c:if>"> -->
						<li class="page-item">
							<a class="page-link" href="/list?page=2">2</a>
						</li>
						<!-- <li class="page-item <c:if test="${ page == 3 }">active</c:if>"> -->
						<li class="page-item">
							<a class="page-link" href="/list?page=3">3</a>
						</li>
						<!-- <li class="page-item <c:if test="${ page == 4 }">active</c:if>"> -->
						<li class="page-item">
							<a class="page-link" href="/list?page=4">4</a>
						</li>
						<!-- <li class="page-item <c:if test="${ page == 5 }">active</c:if>"> -->
						<li class="page-item">
							<a class="page-link" href="/list?page=5">5</a>
						</li>
						<!-- <li class="page-item <c:if test="${ page == 5 }">disabled</c:if>"> -->
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</main>
	<!-- //main -->
	<!-- 스크립트 -->
	<script>
		<!-- (임시)탭 메뉴 -->
		$('ul.tabnav li').click(function(){
			var tab_id = $(this).attr('data-tab');
			$('ul.tabnav li').removeClass('current');
			$('.tab_content > .product_box').removeClass('current');
			$(this).addClass('current');
			$('#'+tab_id).addClass('current');
		});
	</script>
	<!-- //스크립트 -->
</body>
</html>