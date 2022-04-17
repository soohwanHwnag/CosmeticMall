<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="/css/admin/admin_product.css">
<!-- js -->
<script src="/jquery/jquery-3.6.0.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/bootstrap/bootstrap-theme.min.css">
<script src="/bootstrap/bootstrap.min.js"></script>
	
		<div class="main">
			<!-- 사이드 바 -->
			<div class="side_bar"></div>
			<!-- // 사이드 바 -->
			<div class="main_right">
				<!-- 로케이션 -->
				<div class="location pt50">
					<ul>
						<li><a href="/admin/product/product_list2">상품 관리</a></li>
						<li><a href="/admin/product/product_list2">상품 리스트</a></li>
					</ul>		
				</div>
				<!-- // 로케이션 -->
				<!-- 상품 검색 -->
				<div class="search_bar mt40 mb40">
				 <form action="product_list" method="get">
					<div class="basic_search mb10">
						<input type="text" name="value" placeholder="상품명을 입력해 주세요."/>
						<button class="whiteBtn">검색</button> 
					</div>
					</form>
					<div class="search_open mb5">
						<span>상세 검색</span>
						<button class="ml10" id="openBtn" onclick="display()">열기</button>
					</div>			
					<div class="detail_search pt20">
						<div>
						<form action="product_list" method="get"> 
							<label>카테고리 선택</label>
							<select class="ml10" name="category">
								<!-- 기본 카테고리 선택은 0 -->
								<option value="">카테고리 선택</option>
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
						</div>
						<div>
							<label>진열 상태</label>
							<input type="radio" name="display_status" id="all" value="" checked>
							<label for="all">전체</label>
							<input type="radio" name="display_status" id="display" value="진열">
							<label for="display">진열</label>
							<input type="radio" name="display_status" id="out" value="품절">
							<label for="out">품절</label>
							<input type="radio" name="display_status" id="hidden" value="숨김">
							<label for="hidden">숨김</label>
						</div>
						<button class="grayBtn">상세 검색</button>
					</div>
					</form>
				</div>
				<!-- 상품 리스트 -->
				<div class="product_table mt40">
					<div class="table_top_txt">
						<span>총 등록 상품 : ${total_count }개&nbsp;/</span>
						<span>검색 결과 : ${count}개</span>
					</div>
					<table class="mt5 mb10">
						<colgroup>
							<col width="7%">
							<col width="7%">
							<col width="26%">
							<col width="25%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<tr class="table_head">
							<th><input type="checkbox" id="selectall"></th>
							<th>번호</th>
							<th>카테고리와 상품명</th><!-- 카테고리 : 2차 옵션명으로 -->
							<th>등록 일자</th>
							<th>판매 가격</th>
							<th>진열 상태</th>
							<th>조회수</th>
						</tr>
						<c:forEach items="${ list }" var="product_list" varStatus="status">
							<tr class="table_body">
								<td><input type="checkbox" name="product_chk" class="product_chk" data-prodNum="${ product_list.product_idx }"></td>
								<td>${ status.count}</td>
								<td>
									<ul>
										<c:choose>
											<c:when test="${ product_list.product_category eq '스킨' }">
												<li>스킨</li>
											</c:when>
											<c:when test="${ product_list.product_category eq '로션' }">
												<li>로션</li>
											</c:when>
											<c:when test="${ product_list.product_category eq '에센스' }">
												<li>에센스</li>
											</c:when>
											<c:when test="${ product_list.product_category eq '크림' }">
												<li>크림</li>
											</c:when>
											<c:when test="${ product_list.product_category eq '마스크팩' }">
												<li>마스크팩</li>
											</c:when>
											<c:when test="${ product_list.product_category eq '비누' }">
												<li>비누</li>
											</c:when>
											<c:when test="${ product_list.product_category eq '오일' }">
												<li>오일</li>
											</c:when>
											<c:when test="${ product_list.product_category eq '마스크팩' }">
												<li>마스크팩</li>
											</c:when>
										</c:choose>
										<li><a class="move" href="/admin/product/product_detail?product_idx=${ product_list.product_idx }">${ product_list.product_name }</a></li>
									</ul>
								</td>
								<td>
									<fmt:formatDate value="${ product_list.product_add_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td>${ product_list.product_price }</td>
								<c:choose>
									<c:when test="${ product_list.product_display eq '진열' }">
										<td>진열</td>
									</c:when>
									<c:when test="${ product_list.product_display eq '품절' }">
										<td>품절</td>
									</c:when>
									<c:when test="${ product_list.product_display eq '숨김' }">
										<td>숨김</td>
									</c:when>
								</c:choose>
								<td>${ product_list.product_hit }</td>
							</tr>
						</c:forEach>
					</table>
					<div class="table_bottom">
						<div class="btn_section">
							<div class="btn_display">
								<form method="post" name="dispbtn">
									<button class="whiteBtn" onclick="clickEvent_display();">선택 진열</button>
									<button class="whiteBtn" onclick="clickEvent_soldout();">선택 품절</button>
									<button class="whiteBtn" onclick="clickEvent_hidden();">선택 숨김</button>
								</form>	
							</div>					
							<div>
							<div class="btn_display">
								<button class="whiteBtn" onclick="location.href='/admin/product/product_add';">상품 등록</button>
							</div>
						</div>
					</div>
					<!-- 페이징 -->
					<c:if test="${empty category && empty value && empty display_status}">
			         <div class="page">
			            <c:if test="${nowpage != 1}">
			              <span ><a href="/admin/board/eventlist/continue?page=${nowpage -1}"><</a></span>
			              </c:if>
			              <c:forEach var="i" begin="${block_start}" end="${block_end}">
			               <span><a href="/admin/board/eventlist/continue?page=${i}">${i}</a></span>
			              </c:forEach>
			              <c:if test="${nowpage < block_total}">
			              <span><a href="/admin/board/eventlist/continue?page=${nowpage +1}}">></a></span>
			              </c:if>
			        </div>
			        </c:if>
				</div>
			</div>
		</div>

	<script>
		function display(){
			if($(".detail_search").css("display")=="none"){
				// $(".detail_search").css("display","flex");
				$(".detail_search").show(500).css("display","flex");
				$("#openBtn").css({'background':'url("/img/up-arrow.png") 30px 2px /16px 16px no-repeat'}).text("닫기");
			} else{
				$(".detail_search").hide(500);
				$("#openBtn").css({'background':'url("/img/down-arrow.png") 30px 2px /16px 16px no-repeat'}).text("열기");
			}
		}
		$("#selectall").click(function(){
			if($("#selectall").is(":checked")){
				$("input[name=product_chk]").prop("checked", true);
			} else {
				$("input[name=product_chk]").prop("checked", false);			
			}
		});
		$("input[name=product_chk]").click(function(){
			var total = $("input[name=product_chk]").length;
			var checked = $("input[name=product_chk]:checked").length;
			if( total != checked ) {
				$("#selectall").prop("checked", false);
			} else {
				$("#selectall").prop("checked", true);
			}
		});
		
		// 선택 진열
		function clickEvent_display(){
			var chk_array = [];
			$("input[name=product_chk]:checked").each(function(){
				var xx = $(this).attr('data-prodNum');
			    chk_array.push(xx);
			});
			if(confirm("진열 상태로 바꾸시겠습니까?")){
				var check_vals = document.createElement('input');
				check_vals.setAttribute('type','hidden');
				check_vals.setAttribute('name','checkvalues');
				check_vals.setAttribute('value',chk_array.toString());
				document.getElementsByName("dispbtn")[0].appendChild(check_vals);
				document.getElementsByName("dispbtn")[0].setAttribute('action','updateDisplay');
				document.getElementsByName("dispbtn")[0].submit();
			} else {
				return false;
			}
		}
		
		// 선택 숨김
		function clickEvent_hidden(){
			var chk_array = [];
			$("input[name=product_chk]:checked").each(function(){
				var xx = $(this).attr('data-prodNum');
			    chk_array.push(xx);
			});
			if(confirm("숨김 상태로 바꾸시겠습니까?")){
				var check_vals = document.createElement('input');
				check_vals.setAttribute('type','hidden');
				check_vals.setAttribute('name','checkvalues');
				check_vals.setAttribute('value',chk_array.toString());
				document.getElementsByName("dispbtn")[0].appendChild(check_vals);
				document.getElementsByName("dispbtn")[0].setAttribute('action','updateHidden');
				document.getElementsByName("dispbtn")[0].submit();
			} else {
				return false;
			}
		}
		
		// 선택 품절
		function clickEvent_soldout(){
			var chk_array = [];
			$("input[name=product_chk]:checked").each(function(){
				var xx = $(this).attr('data-prodNum');
			    chk_array.push(xx);
			});
			if(confirm("품절 상태로 바꾸시겠습니까?")){
				var check_vals = document.createElement('input');
				check_vals.setAttribute('type','hidden');
				check_vals.setAttribute('name','checkvalues');
				check_vals.setAttribute('value',chk_array.toString());
				document.getElementsByName("dispbtn")[0].appendChild(check_vals);
				document.getElementsByName("dispbtn")[0].setAttribute('action','updateSoldOut');
				document.getElementsByName("dispbtn")[0].submit();
			} else {
				return false;
			}
		}
	</script>
</body>
</html>