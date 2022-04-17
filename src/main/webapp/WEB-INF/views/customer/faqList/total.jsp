<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!-- CSS -->
<link rel="stylesheet" href="/css/faq_total.css">
  
   <script type="text/javascript">
  // 세부 검색 열고 닫기
  function display(){
	  var sub = $(this).next(".subcontent");
	if(sub.css("display")=="none"){
		$(sub).show();
		$(".subtitle td:nth-of-type(3)").css({'background':'url("/img/up-arrow.png")no-repeat'});
        $(".subtitle td:nth-of-type(3)").css({'background-position':'1px'});
	} else {
		$(sub).hide();
$(".subtitle td:nth-of-type(3)").css({'background':'url("/img/down-arrow.png")no-repeat'});
$(".subtitle td:nth-of-type(3)").css({'background-position':'1px'});
	}
}
</script>
  
   <div class="container faqMain">
        <h2>자주하는 질문</h2>
        <div class="mainCategory">
        <span><a href="">공지사항</a></span>
        <span><a href="">자주하는 질문</a></span>
        <span><a href="">1:1 문의</a></span>
        </div>
        <div class="faqSearch">
           <div>
            <form action="total" method="get">
            <c:if test="${empty value}">
               <input type="text"  name="faq_value"placeholder="검색어를 입력하세요">
               </c:if>
                <c:if test="${not empty value}">
               <input type="text"  name="faq_value" value="${value}" placeholder="검색어를 입력하세요">
               </c:if>
               <button>검색</button>
               </form>
           </div>
           <div>
               <p>찾으시는 질문이 없다면?</p>
               <button onclick="window.location.href='/customer/one2oneWrite'">1:1문의하기</button>
           </div>
        </div>
        <div class="faqCategory">
            <span><a href="/customer/faqList/total">전체</a></span>
            <span><a href="/customer/faqList/product">제품</a></span>
            <span><a href="/customer/faqList/orderShip">주문/배송</a></span>
            <span><a href="/customer/faqList/changeRefund">교환/환불</a></span>
            <span><a href="/customer/faqList/event">이벤트</a></span>
            </div>
        <table>
            <tr class="maintitle">
                <td>카테고리</td>
                <td>내용</td>
                <td></td>
            </tr>
            <c:forEach var="list" items="${faq_list}">
            <tr class="subtitle" onclick="display();">
                <td>${list.faq_category}</td>
                <td>${list.faq_title}</td>
                <td></td>
            </tr>
            <tr class="subcontent">
                <td  colspan="2">
                <p> ${list.faq_title}</p>
                <p>${list.faq_content}</p>
                </td>
            </tr>
            </c:forEach>
        </table>
            <c:if test="${ empty value}">
         <div class="page">
           <c:if test="${nowpage != 1}">
              <span><a href="/customer/faqList/total?page=${nowpage -1}">1</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
              <span><a href="/customer/faqList/total?page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/customer/faqList/total?page=${nowpage +1}">1</a></span>
              </c:if>
        </div>
        </c:if>
          <c:if test="${not empty value}">
         <div class="page">
           <c:if test="${nowpage != 1}">
              <span><a href="/customer/faqList/total?faq_value=${value}&page=${nowpage -1}">1</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
              <span><a href="/customer/faqList/total?faq_value=${value}page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/customer/faqList/total?faq_value=${value}page=${nowpage +1}">1</a></span>
              </c:if>
        </div>
        </c:if>
    </div>
  