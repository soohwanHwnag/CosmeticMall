<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/css/adminOrderCancelBefore.css">

        <!-- 주문메인 -->
        <div class="orderCancelMain">
           <div class="pageName">
            주문 관리 > 주문 취소 리스트
        </div>

            <!-- 주문 검색 -->
            <form action="after" method="get">
                <div class="search">
                    <div class="searchDiv1">
                    <span>
                    <c:if test="${empty orderDateStart}">
                <input type="date" name="orderDateStart" class="orderDateStart">
                </c:if>
                <c:if test="${not empty orderDateStart}">
                <input type="date" name="orderDateStart" class="orderDateStart" value="${orderDateStart}">
                </c:if>
                    </span>
                    <span>~
                    </span>
                    <span>
                     <c:if test="${empty orderDateEnd}">
                <input type="date" name="orderDateEnd" class="orderDateEnd">
                </c:if>
                <c:if test="${not empty orderDateEnd}">
                 <input type="date" name="orderDateEnd" class="orderDateEnd" value="${orderDateEnd}">
                </c:if>
                    </span>
                    <span>
                    <button type="button" id="today">당일</button>
                    <button type="button" id="week">1주일</button>
                    <button type="button" id="1month">1개월</button>
                    <button type="button" id="3month">3개월</button>
                    </span>
                </div>
                <div class="searchDiv2">
                    <span>
                    <select name="orderListCategory" id="orderSelect">
                    	<option value="total" <c:if test="${ empty category || category eq 'total'}">selected</c:if>>전체</option>
                        <option value="order_number" <c:if test="${category eq 'order_number'}">selected</c:if>>주문번호</option>
                        <option value="product_name" <c:if test="${category eq 'product_name'}">selected</c:if>>주문상품</option>
                        <option value="member_name" <c:if test="${category eq 'member_name'}">selected</c:if>>주문자</option>
                    </select>
                </span>
                <span>
                	<c:if test="${empty value}">
                <input type="text" name="orderValue" id="">
                </c:if>
                <c:if test="${not empty value}">
                <input type="text" name="orderValue" value="${value}">
                </c:if>
                </span>
                <span>
                    <input type="submit" value="조회하기">
                </span>
                </div>
                </div>
            </form>
            <!-- 주문 검색 끝 -->
            <!-- 주문 카테고리 -->
            <div class="orderCategory">
                <table>
                    <tr>
                        <td  onclick="window.location.href='/order/cancel/before'">결제 취소 전</td>
                        <td class="order_btn on" onclick="window.location.href='/order/cancel/after'">결제 취소 완료</td>
                    </tr>
                </table>
            </div>
            <!-- 주문 카테고리 끝 -->
            <!-- 주문 리스트 -->
            <div class="orderList">
                <table>
                    <tr>
                        <td>
                            <input type="checkbox" onclick="allChk(this)">
                        </td>
                        <td>주문일자</td>
                        <td>주문취소일</td>
                        <td>주문번호</td>
                        <td>주문상품</td>
                        <td>주문자</td>
                        <td>결제방법</td>
                        <td>결제금액</td>
                        
                    </tr>
                    <c:forEach var="list" items="${orderCancelList}">
                    <tr>
                        <td>
                            <input type="checkbox" name="RowCheck" value="${list.cancel_order_idx}">
                        </td>
                        <td>
                         <fmt:formatDate value="${list.order_date}" pattern="yyyy-MM-dd"/> <br><fmt:formatDate value="${list.order_date}" pattern="hh:mm:ss"/>
                        </td>
                        <td onclick="window.location.href='/order/adminOrderCancelView?order_idx=${list.order_idx}'">
                        <fmt:formatDate value="${list.cancel_date}" pattern="yyyy-MM-dd"/> <br><fmt:formatDate value="${list.cancel_date}" pattern="hh:mm:ss"/>
                        </td>
                        <td onclick="window.location.href='/order/adminOrderCancelView?order_idx=${list.order_idx}&order_member_idx=${list.order_member_idx}'">
                        ${list.order_number}
                        </td>
                        <td onclick="window.location.href='/order/adminOrderCancelView?order_idx=${list.order_idx}&order_member_idx=${list.order_member_idx}'">
                        ${list.product_name}
                        </td>
                        <td onclick="window.location.href='/order/adminOrderCancelView?order_idx=${list.order_idx}&order_member_idx=${list.order_member_idx}'">
                        ${list.member_name}
                        </td>
                        <td onclick="window.location.href='/order/adminOrderCancelView?order_idx=${list.order_idx}&order_member_idx=${list.order_member_idx}'">
                        ${list.order_payment_method}
                        </td>
                        <td onclick="window.location.href='/order/adminOrderCancelView?order_idx=${list.order_idx}&order_member_idx=${list.order_member_idx}'">
                        ${list.order_payment_amount}
                        </td>
                    </tr>
                    </c:forEach> 
                </table>
            </div>
            <!-- 주문리스트 끝 -->
            <!-- 선택 항목 이동 시작 -->
     
            <!-- 선택 항목 이동끝 -->
             <!-- 페이징 시작 -->
         <c:if test="${empty category && empty value && empty orderDateEnd && empty orderDateStart}">
        <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/order/cancel/after?page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/order/cancel/after?page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/order/cancel/after?page=${nowpage +1}">></a></span>
              </c:if>
        </div>
        </c:if>
         <c:if test="${not empty category && empty value && not empty orderDateEnd && not empty orderDateStart}">
         <div class="page">
           <c:if test="${nowpage != 1}">
              <span><a href="/order/cancel/after?orderDateStart=${orderDateStart}&orderDateEnd=${orderDateEnd}&orderListCategory=${category}&page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
              <span><a href="/order/cancel/after?orderDateStart=${orderDateStart}&orderDateEnd=${orderDateEnd}&orderListCategory=${category}&page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/order/cancel/after?orderDateStart=${orderDateStart}&orderDateEnd=${orderDateEnd}&orderListCategory=${category}&page=${nowpage +1}">></a></span>
              </c:if>
        </div>
        </c:if>
        <c:if test="${not empty category && not empty value && empty orderDateEnd && empty orderDateStart}">
         <div class="page">
           <c:if test="${nowpage != 1}">
              <span><a href="/order/cancel/after?&orderListCategory=${category}&orderValue=${value}&page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
              <span><a href="/order/cancel/after?&orderListCategory=${category}&orderValue=${value}&page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/order/cancel/after?&orderListCategory=${category}&orderValue=${value}&page=${nowpage +1}">></a></span>
              </c:if>
        </div>
        </c:if>
         <c:if test="${not empty category && not empty value && not empty orderDateEnd && not empty orderDateStart}">
         <div class="page">
           <c:if test="${nowpage != 1}">
              <span><a href="/order/cancel/after?orderDateStart=${orderDateStart}&orderDateEnd=${orderDateEnd}&orderListCategory=${category}&orderValue=${value}&page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
              <span><a href="/order/cancel/after?orderDateStart=${orderDateStart}&orderDateEnd=${orderDateEnd}&orderListCategory=${category}&orderValue=${value}&page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/order/cancel/after?orderDateStart=${orderDateStart}&orderDateEnd=${orderDateEnd}&orderListCategory=${category}&orderValue=${value}&page=${nowpage +1}">></a></span>
              </c:if>
        </div>
        </c:if>
        <!-- 페이징 끝 -->
        </div>
    </div>
     <script>
        // 날짜 버튼
       function addzero(n){
           return n<10 ? "0"+n : n;
       }

       function dateinput(n,m){
           $('.orderDateStart').val("");
           $('.orderDateEnd').val("");


           var date =new Date();
           var start = new Date(Date.parse(date)-n*1000*60*60*24);
           var today = new Date(Date.parse(date)-m*1000*60*60*24);
           
           
           var yyyy = start.getFullYear();
           var mm = start.getMonth()+1;
           var dd = start.getDate();

           var t_yyyy = today.getFullYear();
           var t_mm = today.getMonth()+1;
           var t_dd = today.getDate();

           $('.orderDateStart').val(yyyy+'-'+addzero(mm)+'-'+addzero(dd));
           $('.orderDateEnd').val(t_yyyy+'-'+addzero(t_mm)+'-'+addzero(t_dd));

       }

       $(function(){

           $('#today').click(function(){
               dateinput(0,0);
           });

           $('#week').click(function(){
               dateinput(7,0);
           });

           $('#1month').click(function(){
               dateinput(30,0);
           });

           $('#3month').click(function(){
               dateinput(90,0);
           });
       });

   /*  //    카테고리 배경
      $(function(){
          $('.order_btn').click(function(){
              $('.order_btn').removeClass('on');
              $(this).addClass('on');
          });
      }); */
     
      //   confirm
      function clickEvent(){
       var count = 0;
   	   var obj = document.getElementsByName("RowCheck");
   	   for (var i=0 ; i < obj.length ; i++) {
   	    if( obj[i].checked == true ){
   	    	count++;
   	    }
   	   }
   	   if(count ==0){
   		   alert("선택 항목을 선택하세요");
   		   return false;
   	   }else{
   		 if(confirm("선택항목을 취소 완료시키겠습니까?")){
   	         window.submit();
   	         }
   	       else{
   	        return false;
   	       }
   	   }
      };

    //   선택 항목 전체 선택
      function allChk(obj){
      var chkObj = document.getElementsByName("RowCheck");
      var rowCnt = chkObj.length;
      var check = obj.checked;
      if (check) {
          for (var i=0; i<=rowCnt; i++){
           if(chkObj[i].type == "checkbox")
               chkObj[i].checked = true;
          }
      } else {
          for (var i=0; i<=rowCnt; i++) {
           if(chkObj[i].type == "checkbox"){
               chkObj[i].checked = false;
           }
          }
      }
  } 
    </script>
</body>
</html>