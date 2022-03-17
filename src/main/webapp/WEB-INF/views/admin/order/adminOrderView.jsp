<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/css/adminOrderView.css">
    <!-- 상세보기 시작 -->
    <div class="orderViewDetail">
        <!-- 페이지 이름 시작 -->
        <div class="pageName">
            주문내역 상세보기
        </div>
        <!-- 페이지 이름 끝 -->
        <!-- 주문 정보 시작 -->
        <div class="orderInfo">
            <div>
            <span>
                주문일자 <fmt:formatDate value="${orderListDto.order_date}" pattern="yyyy-MM-dd hh:mm:ss"/>
				
            </span>
            <span>
                주문번호 ${orderListDto.order_number}
            </span>
        </div>
        <div>
        <form action="orderCancel" method="post" name="orderCancel" id="orderCancel" onsubmit="return clickEvent1();">
        <input type="hidden" name="order_idx" value="${orderListDto.order_idx}"/>
        </form>
            <span>
                <button type="submit" form="orderCancel">주문취소</button>
            </span>
        
            <span>
                <button>교환/환불</button>
            </span>
        </div>
    </div>
    <!-- 주문 정보 끝 -->
    <!-- 배송 조회 시작-->
        <div class="deliver">
            <form action="deliverLookUp">
            <span>
            <select name="deliver" id="">
                <option value="" selected disableds>택배사</option>
                <option value="우체국">우체국</option>
                <option value="대한통운">대한통운</option>
                <option value="로젠">로젠</option>
                <option value="한진">한진</option>
            </select>
             </span>
             <span>
                 <input type="text" name="deliverNumber" id="" placeholder="송장 번호를 입력하세요">
             </span>
             <span>
                <input type="submit" value="배송조회">
            </span>
            </form>
        </div>
        <!-- 배송 조회 끝 -->
        <!-- 주문 상품 정보 시작 -->
        <div class="productInfo">
            <div class="infoName">
                주문 상품 정보
            </div>
            <div class="productInfoTable">
                <table>
                    <tr>
                        <td></td>
                        <td>상품명</td>
                        <td>수량</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                    <c:forEach var="list" items="${itemList}" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>
                            <span>
                                <%-- <img src="${list.image_filename}" alt=""> --%>
                            </span>
                            <span>
                                ${list.product_name}
                            </span>
                        </td>
                        <td> ${list.item_count}</td>
                        <td> ${list.item_price}</td>
                        <td> ${list.item_shipping_fee}</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
            <form action="orderListMove" method="post" id="orderListMove" onsubmit="return clickEvent2();">
            <input type="hidden" name="order_idx" value="${orderListDto.order_idx}"/>
             <div class="orderMoveSelect">
                  <select name="orderMoveSelect" id="orderMoveSelect">
                                <option value="입금대기">입금대기</option>
                                <option value="결제완료">결제완료</option>
                                <option value="배송준비중">배송준비중</option>
                                <option value="배송중">배송중</option>
                                <option value="배송완료">배송완료</option>
                            </select>
                 </div>
        </div>
        <!-- 주문 상품 정보 끝 -->
        <!-- 주문자 정보 시작 -->
        <div class="memberInfo">
            <div class="infoName">
                주문자 정보
            </div>
            <div class="memberInfoTable">
                <table>
                    <tr>
                        <td>주문자</td>
                        <td>${memberDto.member_name}</td>
                    </tr>
                    <tr>
                        <td>연락처</td>
                        <td>${memberDto.member_phone}</td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>${memberDto.member_email}</td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- 주문자 정보 끝 -->
        <!-- 결제 정보 시작 -->
        <div class="payMentInfo">
            <div class="infoName">
                결제 정보
            </div>
            <div class="payMentInfoTable">
                <table>
                    <tr>
                        <td>결제방법</td>
                        <td>${orderListDto.order_payment_method}</td>
                    </tr>
                    <tr>
                        <td>결제금액</td>
                        <td>${orderListDto.order_payment_amount}</td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- 결제 정보 끝 -->
        <!-- 배송 정보 시작 -->
        <div class="deliveryInfo">
            <div class="infoName">
                배송 정보
            </div>
            <div class="deliveryInfoTable">
                <table>
                    <tr>
                        <td>수령인</td>
                        <td>${orderListDto.order_recipient}</td>
                    </tr>
                    <tr>
                        <td>연락처</td>
                        <td>${orderListDto.order_phone}</td>
                    </tr>
                    <tr>
                        <td>배송지</td>
                        <td>${orderListDto.order_addr1}</td>
                    </tr>
                    <tr>
                        <td>배송메세지</td>
                        <td>${orderListDto.order_message}</td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- 배송 정보 끝 -->
        <!-- 버튼 시작-->
        <div class="button">
            <div>
                <button type="button" onclick="window.location.href='/order/list/total'">목록</button>
            </div>
            <div>
                <span>
                   <input type="submit" value="저장" >
                </span>
                </form>
                <span>
                    <button type="button" onclick="history.back(-1);">취소</button>
                </span>
            </div>
        </div>
        <!-- 버튼 끝-->
    </div>
    <!-- 상세정보 끝 -->
</div>

    <script>

         //   confirm
      function clickEvent1(){
       
       if(confirm("주문 취소하시겠습니까?")){
        return true;
       }else{
        return false;
       }
      };

         //   confirm2
         function clickEvent2(){
       
       if(confirm("저장하시겠습니까?")){
        window.submit();
       }else{
        return false;
       }
      };

    </script>
</body>
</html>