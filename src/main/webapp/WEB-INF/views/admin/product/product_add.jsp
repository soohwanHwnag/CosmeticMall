<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/admin/admin_product.css">
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
						<li><a href="/admin/product/product_list">상품 관리</a></li>
						<li><a href="/admin/product/product_add">상품 등록</a></li>
					</ul>	
				</div>
				<div class="product_form">
					<form method="post" action="productAdd" enctype="multipart/form-data">
						<div class="top">
						  	<h3>상품 정보 입력</h3>
				            <div>
				              <select id="product_category" name="product_category">
				                <option value="0">카테고리 선택</option>
				                <!-- 스킨케어 카테고리 서브 카테 -->
				                <option value="스킨">스킨</option>
				                <option value="로션">로션</option>
				                <option value="에센스">에센스</option>
				                <option value="크림">크림</option>
				                <option value="마스크팩">마스크팩</option>
				                <!-- 클렌징 카테고리 서브 카테 -->
				                <option value="비누">비누</option>
				                <option value="오일">오일</option>
				                <option value="폼">폼</option>
				              </select>
				              <input class="prod_name ml10" id="product_name" name="product_name" placeholder="상품명을 입력해 주세요."/>
							</div>
							<div class="table mt10">
								<div class="tr">
									<div class="th">상품 한줄평</div>
									<div class="td">
										<input class="ml10 pl10" id="product_comment" name="product_comment" placeholder="상품 한줄평을 입력해 주세요."/>
									</div>
								</div>
								<div class="tr">
									<div class="th"><span>*</span>판매 가격</div>
									<div class="td"><input class="text-sec" id="product_price" name="product_price" />&nbsp;원</div>
									<div class="th"><span>*</span>용량</div>
									<div class="td"><input class="text-sec" id="product_volume" name="product_volume" /></div>
									<div class="th"><span>*</span>재고</div>
									<div class="td"><input class="text-sec" id="product_stock" name="product_stock" />&nbsp;개</div>
								</div>
								<div class="tr">
									<div class="th">배송비</div>
									<div class="td">
										<input type="radio" id="basic" name="product_shipping_fee" value="3000" checked/>
										<label for="3000">기본 배송비 적용</label>
									</div>
									<div class="td">
										<input type="radio" id="individual" name="product_shipping_fee" value="0"/>
										<label for="individual">별도 배송비 적용 : </label>
										<!-- <input id="individual" name="product_shipping_fee"> -->
										<input name="product_shipping_fee2" id="individual">
									</div>
									<div class="td">
										<input type="radio" id="free" name="product_shipping_fee" value="0" />
										<label for="0">무료 배송</label>
									</div>
								</div>
								<div class="tr">
									<div class="th"><span>*</span>상품 대표 이미지</div>
									<div class="td filebox">
										<input class="upload-name" id="fileName" value="대표 이미지" readonly>
										<label for="file">찾아보기</label> 
										<input type="file" id="file" name="product_fliename" onchange="javascript:document.getElementById('fileName').value = this.value">
										
										<!-- <input type="text" id="fileName" name="fileName"> 파일명
										<label for="upFile">찾아보기</label> 
										<input type="file" id="upFile" name="upFile" onchange="javascript:document.getElementById('fileName').value = this.value"> -->
									</div>
								</div>
							</div>
						</div>
						<div class="bottom">
							<h4>상품 상세 정보</h4>
							<div class="table">
								<div class="tr">
									<div class="th">상품 상세 정보</div>
									<div class="td filebox">
										<input class="upload-name" id="detailFileName" name="image_category" value="상세 정보 이미지" readonly>
										<label for="detail_file">찾아보기</label> 
										<input type="file" id="detail_file" name="product_fliename_detail" onchange="javascript:document.getElementById('detailFileName').value = this.value">
										
										<!-- <input type="text" id="detailFileName" name="fileName"> 파일명
										<label for="upDetailFile">찾아보기</label> 
										<input type="file" id="upDetailFile" name="upDetailFile" onchange="javascript:document.getElementById('fileName').value = this.value"> -->
									</div>	
								</div>
								<div class="tr">
									<label for="detail_txt"></label>
									<textarea name="product_content" id="detail_txt"></textarea>
									<script>CKEDITOR.replace("detail_txt");</script>
								</div>
							</div>
						</div>
						<div class="btn_section">
							<div>
								<button class="grayBtn" type="submit">등록</button>
		               			<button class="whiteBtn" type="button" onclick="location.href='/admin/product/product_list2';">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>					
		</div>
	</div>
	
	<script>
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	</script>
</body>
</html>