<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/css/admin/adminEventListFinish.css">

        <!-- 이벤트 시작 -->
        <div class="eventMain">
        <div class="pageName">
            게시판 관리 > 이벤트 리스트
        </div>
        <!-- 검색창 시작 -->
        <div class="eventSearch">
        <form action="finish" method="get">
            <span>
                <select name="eventSearchCategory" id="">
                	<option value="total" <c:if test="${ empty category || category eq 'total'}">selected</c:if>>전체</option>
                    <option value="event_title" <c:if test="${category eq 'event_title'}">selected</c:if>>제목</option>
                    <option value="event_slogan" <c:if test="${ category eq 'event_slogan'}">selected</c:if>>슬로건</option>
                </select>
            </span>
            <span>
          		<c:if test="${empty value}">
                <input type="text" name="eventSearchValue" id="">
                </c:if>
                <c:if test="${not empty value}">
                <input type="text" name="eventSearchValue" value="${value}">
                </c:if>
            </span>
            <span>
                <input type="submit" name="" id="" value="검색">
            </span>
            </form>
        </div>
        <!-- 검색창 끝 -->
         <!-- 이벤트 카테고리 -->
         <div class="eventCategory">
            <table>
                <tr>
                    <td onclick="window.location.href='/admin/board/eventlist/continue'">진행중인 이벤트</td>
                    <td class="event_btn" onclick="window.location.href='/admin/board/eventlist/finish'">종료된 이벤트</td>
                </tr>
            </table>
        </div>
        <!-- 이벤트 카테고리 끝 -->
        <!-- 이벤트 리스트 시작-->
         <!-- 진행중인 이벤트 리스트 시작-->
        <div class="eventNumber">
           종료된 이벤트 ${count}건
           </div>
        <div class="eventList">
        <form action="eventListDelete" method="post">
            <table>
                <tr>
                    <td>
                        <input type="checkbox" name="" id="" onclick="allChk(this)">
                    </td>
                    <td>이벤트 기간</td>
                    <td>이벤트 제목</td>
                    <td>이벤트 슬로건</td>
                </tr>
                <c:forEach var="list" items="${eventList}">
                <tr>
                    <td>   
				        <input type="checkbox" name="RowCheck" value="${list.event_idx}" >      
                    </td>
                    <td onclick="window.location.href='/admin/board/adminEventView?event_idx=${list.event_idx}'">
                    <fmt:formatDate value="${list.event_start_date}" pattern="yyyy-MM-dd"/> 
                    ~ <fmt:formatDate value="${list.event_end_date}" pattern="yyyy-MM-dd"/>
                    </td>
                     <td onclick="window.location.href='/admin/board/adminEventView?event_idx=${list.event_idx}'">
                    ${list.event_title}
                    </td>
                     <td onclick="window.location.href='/admin/board/adminEventView?event_idx=${list.event_idx}'">
                    ${list.event_slogan}
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <!-- 이벤트 리스트 끝 -->
        <!-- 버튼 시작 -->
        <div class="button">
            <button onclick="clickEvent(); return false;">선택 항목 삭제</button>
             </form>
            <a href="/admin/board/adminEventJoin"><button>등록</button></a>
        </div>
        <!-- 버튼 끝 -->
             <!-- 진행중인 이벤트 리스트 끝-->
   <!-- 페이징 시작 -->
         <c:if test="${empty category && empty value}">
         <div class="page">
            <c:if test="${nowpage != 1}">
              <span ><a href="/admin/board/eventlist/finish?page=&page=${nowpage -1}"><</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
               <span><a href="/admin/board/eventlist/finish?page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/admin/board/eventlist/finish?page=&page=${nowpage +1}}">></a></span>
              </c:if>
        </div>
        </c:if>
         <c:if test="${not empty category && not empty value}">
         <div class="page">
           <c:if test="${nowpage != 1}">
              <span><a href="/admin/board/eventlist/finish?eventSearchCategory=${category}&eventSearchValue=${value}&page=${nowpage -1}">1</a></span>
              </c:if>
              <c:forEach var="i" begin="${block_start}" end="${block_end}">
              <span><a href="/admin/board/eventlist/finish?eventSearchCategory=${category}&eventSearchValue=${value}&page=${i}">${i}</a></span>
              </c:forEach>
              <c:if test="${nowpage < block_total}">
              <span><a href="/admin/board/eventlist/finish?eventSearchCategory=${category}&eventSearchValue=${value}&page=${nowpage +1}">1</a></span>
              </c:if>
        </div>
        </c:if>
        <!-- 페이징 끝 -->
      </div>
      <!-- 이벤트 끝 -->
    </div>
    
    <script>
  

      /*    //    카테고리 배경
      $(function(){
          $('.event_btn').click(function(){
              $('.event_btn').removeClass('on');
              $(this).addClass('on');
          });
      }); 
 */
      //   confirm
      function clickEvent(){
       
       if(confirm("선택 항목을 삭제시키겠습니까?")){
        window.submit();
       }else{
        return false;
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