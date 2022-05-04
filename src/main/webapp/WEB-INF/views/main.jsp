<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

   <link rel="stylesheet" type="text/css" href="/css/main.css"/>

   <!-- 캐러셀 - 메인배너 -->
 <div id="jadam" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="/img/banner1.png" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="/img/banner2.png" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="/img/banner3.png" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="/img/banner4.png" class="d-block w-100" alt="...">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#jadam" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#jadam" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  <!-- 캐러셀 - 제품 라인업 -->
  <div class="lineUP">
    <div class="autoplay">
      <div><a href=""><img src="product01.jpg" alt=""></a></div>
      <div><a href=""><img src="product02.jpg" alt=""></a></div>
      <div><a href=""><img src="product03.jpg" alt=""></a></div>
      <div><a href=""><img src="product04.jpg" alt=""></a></div>
      <div><a href=""><img src="product05.jpg" alt=""></a></div>
      <div><a href=""><img src="product06.jpg" alt=""></a></div>
    </div>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
  
    <script type="text/javascript">
      $(document).ready(function(){
        $('.autoplay').slick({
          slidesToShow: 2,
          slidesToScroll: 2,
          autoplay: true,
          autoplaySpeed: 2000,
        });
      });
    </script>
  </div>

  <!-- 베스트 상품소개 -->
  <div class="bestProduct">
  <div class="container">
    <div class="row">
    <div class="bestProduct col-6">
      <a class="bestPicture" href=""><img src="./이미지/새 폴더/best2.jpg" alt=""></a>
    </div>
    <div class="bestSentence col-6">
      <a href="브랜드 페이지로 이동"><h4>BEST</h4></a>
      <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic ea iste tenetur est nulla, harum consectetur quos consequatur provident, corrupti magnam ex autem dolores! Quis magnam officia recusandae molestiae nobis?
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor officiis obcaecati omnis esse nulla officia optio vel ipsa pariatur. Maxime modi dolore a alias iste obcaecati suscipit quas eius aliquid.
      </p>
      <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam voluptates cum eligendi, sunt corrupti deleniti temporibus fugit sequi, qui impedit quas consequuntur dolores nemo tempora labore quibusdam. Dolores, ipsam optio.
      </p>
    </div>
  </div>
  </div>
</div>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>