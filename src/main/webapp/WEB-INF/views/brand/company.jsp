<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" type="text/css" href="company.css"/>
   <title>자담 회사소개</title>
   
    <script type="text/javascript">
        var imgArray = new Array();
        imgArray[0] = "01.jpg";
        imgArray[1] = "02.jpg";
        imgArray[2] = "03.jpg";
        imgArray[3] = "04.jpg";
 
        function showImage() {
            var imgNum = Math.round(Math.random() * 3);
            var objImg = document.getElementById("introImg");
            objImg.src = imgArray[imgNum];
 
            setTimeout("showImage()", 3000);
        }        
    </script>
</head>
<body onload="showImage()">
   <div id="wrap">
      <div class="topimg">
         <img id="introImg" border="0">
      </div>
      <section class="sectionhome">
         <div class="text">
            <p class="p1"><b>피부를 위한 더 나은 생각</b></p>
            <p class="p2"><strong>자담</strong></p>
         </div>
         <div class="introbox">
            <h3 class="introtit">
               <span>Best</span>
               NATURE COSMETIC
            </h3>
            <p class="introtext">
               자담은 친환경 용기사용을 시작으로 천연재료 사용 및 성분 추출 그리고 최소한의 화약적 성분을 사용하고있습니다.
               피부와 환경을 생각하는 자담은 더 나은 삶, 함께하는 삶을 위해 노력하겠습니다.
            </p>
            <!-- 가운데 사진 및 글 -->
            <ul class="introlist">
               <li>
                  <strong>Sustainability</strong>
                  <p>자담의 화장품 용기는 토양에서 분해가능한 용기이며, 유기농법으로 재배한 식물성 원료를 사용해 환경에 무해하게 분해되도록 연구했습니다.</p>
                  <div class="imgbox">
                     <img src="img_nature1.jpg" alt="">
                 </div>
               </li>
               <li>
                  <strong>Win-Win Partnership</strong>
                  <p>자담만의 다양한 보상제와 구매 고객이 함께 하는 사회공헌 프로그램으로 적립된 포인트는 사회적 가치를 창출, 함께 하는 더 나은 삶을 만듭니다.</p>
                  <div class="imgbox">
                      <img src="img_harvest1.jpg" alt="">
                  </div>
              </li>
              <li>
                  <strong> Non Animal Experiment</strong>
                  <p>자담은 최소한의 화학약품 사용과함께 동물복지를 위해 동물시험을 하지않는 비건 화장품입니다.</p>
                  <div class="imgbox">
                      <img src="img_test1.jpg" alt="우리가 만드는 희망 11번가">
                  </div>
   
            </ul>
         </div>
      </section>
      <!-- 브랜드 철학 -->
      <section class="sectionbrand">
         <div class="inner">
            <h3 class="brandphilo">브랜드 철학</h3>
            <div class="aboutbrand">
               <a class="brandintro" href="#">
                  <div class="brandimg">
                     <img src="/intropic.jpg" alt="자담 브랜드 소개사진">
                  </div>
                  <strong class="brandtit">자연과 함께 시작하는 화장품</strong>
                  <p class="brandtext">
                     Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla cumque quaerat quo, dolorem officiis doloremque illum est consectetur quos eos, dicta id possimus accusamus praesentium facere quas ratione in non.
                     Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vero saepe cumque nulla temporibus nemo ex totam rem, beatae necessitatibus neque laboriosam dignissimos labore eius dolorum optio veritatis sunt possimus ratione!
                  </p>
               </a>
            </div>
         </div>

      </section>
      
      
   </div>
        
</body>
</html>
