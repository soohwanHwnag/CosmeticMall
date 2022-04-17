<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!-- CSS -->
<link rel="stylesheet" href="/css/one2oneView.css">
  <script>
  //   confirm
  function clickEvent(){
   
   if(confirm("삭제 하시겠습니까?")){
   return true;
   }else{
    return false;
   }
  };

  </script>
  
<!-- main -->

 <div class="container one2oneMain">
        <h2>1:1 문의</h2>
        <div class="one2oneCategory">
        <span><a href="">공지사항</a></span>
        <span><a href="">자주하는 질문</a></span>
        <span><a href="">1:1 문의</a></span>
        </div>
        <div class="one2oneView">
            <div class="costomerQ">
            <div>
                <h6>${dto.one2one_title }</h6>
            </div>
            <div>
                <span>${dto.member_name}</span>
                <span>
                <fmt:formatDate value="${dto.one2one_date}" pattern="yyyy-MM-dd hh:mm:ss"/>
                </span>
            </div>
        </div>
        <div class="costomerQv">
            <p>${dto.one2one_content}</p>
            <form action="one2oneDelete" method="post" onsubmit="return clickEvent();">
            <input type="hidden" name="one2one_idx" value="${dto.one2one_idx}"/>
            <div>
                <button type="button"  onclick="window.location.href='/customer/one2oneModify?one2one_idx=${dto.one2one_idx}'">수정</button>
                <button>삭제</button>
            </div>
            </form>
        </div>
        <div class="adminA">
            <div>
                <h6>${reply_dto.reply_title}</h6>
            </div>
            <div>
                <span>${reply_dto.member_name}</span>
                <span>
               <fmt:formatDate value="${reply_dto.reply_date}" pattern="yyyy-MM-dd hh:mm:ss"/>
                </span>
            </div>
        </div>
        <div class="adminAv">
            <p>${reply_dto.reply_content}</p>
        </div>
    </div>
    <div class="listBtn">
        <button onclick="history.back(-1);">목록</button>
    </div>
</div>
  
