<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!-- CSS -->
<link rel="stylesheet" href="/css/one2oneJoin.css">
  
  <script>
  
  function checkValue(){
	  if(!document.one2oneJoin.one2one_category.value){
		  alert('질문 유형을 선택하세요');
		  return false;
	  }
	  if(!document.one2oneJoin.one2one_title.value){
		  alert('제목을 입력하세요');
		  return false;
	  }
	  if(!document.one2oneJoin.editor4.value){
		  alert('내용을 입력하세요');
		  return false;
	  }
  }
  
  </script>
  
<!-- main -->

  <div class="container one2oneMain">
        <h2>1:1 문의</h2>
        <div class="one2oneCategory">
        <span><a href="">공지사항</a></span>
        <span><a href="">자주하는 질문</a></span>
        <span><a href="">1:1 문의</a></span>
        </div>
        <div class="one2oneJoin">
            <div class="joinTitle">
                1:1 문의하기
            </div>
            <form action="one2oneModifyForm" method="post" name="one2oneJoin" onsubmit="return checkValue();">
              <input type="hidden" name="one2one_idx" value="${dto.one2one_idx}"/>
            <div class="joinSection1">
                <span>
                    <select name="one2one_category" id="">
                        <option value="" disabled>질문 유형 선택</option>
                        <option value="제품" <c:if test="${dto.one2one_category eq '제품'}">selected</c:if>>제품</option>
                        <option value="주문" <c:if test="${dto.one2one_category eq '주문'}">selected</c:if>>주문</option>
                        <option value="배송" <c:if test="${dto.one2one_category eq '배송'}">selected</c:if>>배송</option>
                        <option value="교환" <c:if test="${dto.one2one_category eq '교환'}">selected</c:if>>교환</option>
                        <option value="기타" <c:if test="${dto.one2one_category eq '기타'}">selected</c:if>>기타</option>
                    </select>
                </span>
                <span>
                    <input type="text" placeholder="제목을 입력하세요" name="one2one_title" value="${dto.one2one_title}">
                </span>
            </div>
            <div class="joinSection2">
                <textarea name="editor4" id=“editor4”>${dto.one2one_content}</textarea>
            </div>
            <div class="joinBtn">
                <button>작성</button>
                </form>
                <button onclick="history.back(-1);">취소</button>
            </div>
        </div>
</div>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<script>CKEDITOR.replace('editor4');</script>
