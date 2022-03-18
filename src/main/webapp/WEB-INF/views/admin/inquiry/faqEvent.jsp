<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

     <script language="javascript">
   function showPopup() { window.open("/admin/inquiry/faqWritePopup", "FAQ등록", "width=750, height=600, left=100, top=50"); }
   function showPopup2() { window.open("/admin/inquiry/faqEditPopup", "FAQ수정", "width=750, height=600, left=100, top=50"); }
   </script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- CSS -->
    <link href="/css/admin/faq.css" rel="stylesheet" type="text/css" />


    <!-- 이벤트 -->
    <div id="wrap">
      <div id="FAQ">
         <div id="FAQ_Contents">
            <div>
               <h4>자주하는 질문</h4>
            </div>
               <div class="search_Box">
               <form action="faqEvent" method="get">
               	<c:if test="${empty value}">
                  <input class="search_sq"id="search_contgent" type="text" name="faq_value" placeholder="검색어를 입력하세요">
                  </c:if>
                  <c:if test="${not empty value}">
                  <input class="search_sq"id="search_contgent" type="text" name="faq_value" placeholder="검색어를 입력하세요" value="${value}">
                  </c:if>
                     <!-- onclick java DB 연결해줘야함 -->
                     <button class="search_btn search_button">검색</button>
                  </form>
               </div>
               <div class="answerNav">
                <ul>
                  <li><a class="faqNav" href="/admin/inquiry/faqProduct">제품</a></li>
                  <li><a class="faqNav" href="/admin/inquiry/faqOrderShip">주문/배송</a></li>
                  <li><a class="faqNav" href="/admin/inquiry/faqChangeRefund">교환/환불</a></li>
                  <li><a class="faqNav" href="/admin/inquiry/faqEvent">이벤트</a></li>
                </ul>
             </div>
            <div class="wrap2">     
                    <c:forEach var="list" items="${faq_list}">
                    <div class="accordion">
                    <input type="checkbox" id="Panswer${list.faq_idx}">
                    <label for="Panswer${list.faq_idx}">${list.faq_title}<em></em></label>
                    <div class="label1"><p>${list.faq_content}</p>
                     <div class="btn1">
                         <input type="button" value="삭제" class="btn2" style=background-color:white>
                         <input type="button" value="수정" onclick="showPopup2();"  class="btn3" style=background-color:#e0e0e0>
                     </div>
                    </div>   
                 </div>
                 </c:forEach>
                 <div>
                     <input type="button" value="등록" class="btn4" onclick="showPopup();"/>
                  </div>
            </div>
         </div>
      </div>
           <%-- <c:if test="${ empty value}">
         <div class="page">
           <c:if test="${nowpage != 1}">
              <span><a href="/admin/board/noticeList?eventSearchCategory=${category}&eventSearchValue=${value}&page=${nowpage -1}">1</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
              <span><a href="/admin/board/noticeList?eventSearchCategory=${category}&eventSearchValue=${value}&page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/admin/board/noticeList?eventSearchCategory=${category}&eventSearchValue=${value}&page=${nowpage +1}">1</a></span>
              </c:if>
        </div>
        </c:if>  --%>
   </div>
   
</body>
</html>