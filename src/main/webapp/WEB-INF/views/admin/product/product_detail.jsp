<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css//admin/admin_product.css">
<link rel="stylesheet" href="/css/admin/adminCommon2.css">
<!-- js -->
<script src="/jquery/jquery-3.6.0.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/bootstrap/bootstrap-theme.min.css">
<script src="/bootstrap/bootstrap.min.js"></script>
<!-- 에디터 -->
<script src="/js/ckeditor/ckeditor.js"></script>

    <div class="main">
      <div class="side_bar"></div>
      <div class="main_right">
        <div class="location pt50">
          <ul>
            <li><a href="/admin/product/product_list2">상품 관리</a></li>
            <li class="second_arrow"><a href="/admin/product/product_list2">상품 리스트</a></li>
            <li>상품 상세 정보</li>
          </ul>
        </div>
        <div class="product_form modify_form">
          <form id="detail_form" method="post" action="/admin/product/product_modify_action">
            <div class="top">
              <h3>상품 정보 수정</h3>
              <!-- 상품 번호/조회수-->
              <input type="hidden" id="product_idx" name="product_idx" value="${ dto.product_idx }" />
              <input type="hidden" name="product_hit" value="${ dto.product_hit }" />
              <!-- // 상품 번호/조회수 -->
              <div class="display_section">
                <select id="product_category" name="product_category">
                  <option value="0">카테고리 선택</option>
                  <!-- 스킨케어 카테고리 서브 카테 -->
                  <option value="1" <c:if test="${ dto.product_category eq '스킨'}">selected</c:if>>스킨</option>
                  <option value="2" <c:if test="${ dto.product_category eq '로션'}">selected</c:if>>로션</option>
                  <option value="3" <c:if test="${ dto.product_category eq '에센스'}">selected</c:if>>에센스</option>
                  <option value="4" <c:if test="${ dto.product_category eq '크림'}">selected</c:if>>크림</option>
                  <option value="5" <c:if test="${ dto.product_category eq '마스크팩'}">selected</c:if>>마스크팩</option>
                  <!-- 클렌징 카테고리 서브 카테 -->
                  <option value="6" <c:if test="${ dto.product_category eq '비누'}">selected</c:if>>비누</option>
                  <option value="7" <c:if test="${ dto.product_category eq '오일'}">selected</c:if>>오일</option>
                  <option value="8" <c:if test="${ dto.product_category eq '폼'}">selected</c:if>>폼</option>
                </select>
                <div class="display_section ml20">
                  <div>진열 상태</div>
                  <div>
                    <input type="radio" id="display" name="product_display" value="display" <c:if test="${ dto.product_display eq '진열'}">checked</c:if> />
                    <label for="display">진열</label>	
                  </div>
                  <div>
                    <input type="radio" id="out" name="product_display" value="out" <c:if test="${ dto.product_display eq '품절'}">checked</c:if> />
                    <label for="out">품절</label>	
                  </div>
                  <div>
                    <input type="radio" id="hidden" name="product_display" value="hidden" <c:if test="${ dto.product_display eq '숨김'}">checked</c:if> />
                    <label for="hidden">숨김</label>	
                  </div>
                </div>
              </div>
              <input class="prod_name mt10 mb10" id="product_name" name="product_name" value="${ dto.product_name }"/>
              <div class="table">
                <div class="tr">
                  <div class="th">추가 상품명</div>
                  <div class="td"><input class="ml10 pl10" placeholder="추가 상품명을 입력해 주세요." name="product_comment" value="${ dto.product_comment }"/></div>
                </div>
                <div class="tr">
                  <div class="th"><span>*</span>판매 가격</div>
                  <div class="td"><input class="text-sec" name="product_price" value="${ dto.product_price }"/>&nbsp;원</div>
                  <div class="th"><span>*</span>용량</div>
                  <div class="td"><input class="text-sec" name="product_volume" value="${ dto.product_volume }"/></div>
                  <div class="th"><span>*</span>재고</div>
                  <div class="td"><input class="text-sec" name="product_stock" value="${ dto.product_stock }"/>&nbsp;개</div>
                </div>
                <div class="tr">
                  <div class="th">배송비</div>
                  <div class="td pr30">
                    <input type="radio" id="basic" name="product_shipping_fee" value="3000" <c:if test="${ dto.product_shipping_fee eq '3000'}">checked</c:if> />
                    <label for="3000">기본 배송비 적용</label>
                  </div>
                  <div class="td">
                    <input type="radio" id="individual" name="product_shipping_fee" value="2000" <c:if test ='${ dto.product_shipping_fee ne "3000" and productDto.product_shipping_fee ne "0" }'>checked</c:if>/>
                    <label for="individual">별도 배송비 적용 : </label>
                    <input type="number" name="product_shipping_fee" id="individual_text" value="<c:if test ='${ dto.product_shipping_fee ne "3000" and productDto.product_shipping_fee ne "0" }'>${ productDto.product_shipping_fee }</c:if>" />
                  </div>
                  <div class="td">
                    <input type="radio" id="free" name="product_shipping_fee" value="0" <c:if test="${ dto.product_shipping_fee eq '0'}">checked</c:if> />
                    <label>무료 배송</label>
                  </div>
                </div>
                <div class="tr">
                  <div class="th"><span>*</span>상품 대표 이미지</div>
                  <div class="td filebox">
                    <input class="upload-name" value="${dto.product_filename}">
                    <label for="file">찾아보기</label> 
                    <input type="file" id="file">
                    <button class="label_btn">파일삭제</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="bottom">
              <h3>상품 상세 정보</h3>
              <div class="table">
                <div class="tr">
                  <div class="th">상품 상세 정보</div>
                  <div class="td filebox">
                    <input class="upload-name" value="${dto.product_filename_detail}">
                    <label for="file">찾아보기</label> 
                    <input type="file" id="file">
                    <button class="label_btn">파일삭제</button>
                  </div>
                </div>
                <div class="tr">
                  <label for="detail_txt"></label>
                  <textarea name="product_content" id="detail_txt">${ dto.product_content }</textarea>
                  <script>CKEDITOR.replace("detail_txt");</script>
                </div>
              </div>
            </div>
            <div class="btn_section">
              <div>
                <button id="modify_btn" class="grayBtn" type="submit" >수정</button>
                <button class="whiteBtn" type="button" onclick="location.href='/admin/product/product_list2';">취소</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>


  <script>
		// 헤더, 사이드 바 로드
		$(function(){
			$('.header').load('../adminHeader.html');	
	    	$('.side_bar').load('../adminSidebar.html');
		});
		// gnb 토글
		$(function(){
	      $('.gnb').click(function(){
	          $(this).siblings('.sub').stop().toggle();
	      });
	    });
		
		var oldVal = 0;
		$("#individual_text").on("propertychange change keyup paste input", function() {
		    var currentVal = $(this).val();
		    if(currentVal == oldVal) {
		        return;
		    }
		 
		    oldVal = currentVal;
		    document.getElementById("individual").setAttribute("value",oldVal);
		});
	</script>	
</body>
</html>