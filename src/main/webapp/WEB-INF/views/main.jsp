<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

   <link rel="stylesheet" type="text/css" href="/css/main.css"/>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
   <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
   <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>


   <!-- 캐러셀 - 메인배너 -->
   <div id="jadam" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="/이미지/새 폴더/cust3.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="/이미지/새 폴더/cust6.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="/이미지/새 폴더/cust8_1.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
         <img src="/이미지/새 폴더/cust11.jpg" class="d-block w-100" alt="...">
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
    <div id="bestCentents">
      <div class="bestProduct">
        <a class="bestPicture" href=""><img src="./이미지/새 폴더/best2.jpg" alt=""></a>
      </div>
      <div class="bestSentence">
        <a href="브랜드 페이지로 이동"><h1>BEST</h1></a>
        
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic ea iste tenetur est nulla, harum consectetur quos consequatur provident, corrupti magnam ex autem dolores! Quis magnam officia recusandae molestiae nobis?
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor officiis obcaecati omnis esse nulla officia optio vel ipsa pariatur. Maxime modi dolore a alias iste obcaecati suscipit quas eius aliquid.
        </p>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam voluptates cum eligendi, sunt corrupti deleniti temporibus fugit sequi, qui impedit quas consequuntur dolores nemo tempora labore quibusdam. Dolores, ipsam optio.

        </p>

      </div>

    </div>

<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>
</body>
</html>