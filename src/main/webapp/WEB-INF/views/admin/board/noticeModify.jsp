<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <link rel="stylesheet" href="/css/admin/adminNoticeModify.css">
<<script>


       //   confirm
      function clickEvent(){
       
       if(confirm("취소 하시겠습니까?")){
        window.location.href='/admin/board/noticeModify';
       }else{
        return false;
       }
      };

      function clickEvent2(){
          
          if(!document.noticeModifyForm.notice_title.value){
           alert("제목을 입력해주세요")
           return false;
          }
          if(!document.noticeModifyForm.editor4.value){
           alert("내용을 입력해주세요")
           return false;
          }
          return true;
         };

    </script>

        <div class="noticeMain">
            <div class="pageName">
                게시판 관리 > 공지사항 리스트 > 공지사항 수정
            </div>
            <!-- 이벤트 등록 폼 시작 -->
            <div class="formWarp">
                <form action="noticeModifyForm" name="noticeModifyForm" method="post"  onsubmit="return clickEvent2();">
                    <div class="noticeTitle">
                    	<input type="hidden" name="notice_idx" value="${dto.notice_idx}"/>
                        <span>
                            <input type="checkbox" name="notice_important_YN" value="Y" <c:if test="${dto.notice_important_YN eq 'Y' }">checked</c:if>>
                            <label>중요</label>
                        </span>
                        <span>
                            <input type="text" name="notice_title" id="" placeholder="제목을 입력하세요" value="${dto.notice_title}">
                        </span>
                    </div>
                    <div class="noticeContent">
                        <textarea name="editor4" id=“editor4” placeholder="내용을 입력하세요">${dto.notice_content}</textarea>
                    </div>
                   
                    <div class="button">
                        <div>
                            <button type="button" onclick="window.location.href='/admin/board/noticeList'">목록</button>
                        </div>
                        <div>
                            <input type="submit" value="수정">
                            <button type="button" onclick="clickEvent();">취소</button>
                        </div>
                    </div>
                </form>
            </div>
            <!-- 이벤트 등록 폼 끝 -->
          </div>
          <!-- 이벤트 등록 끝 -->
        </div>
        <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
        <script>CKEDITOR.replace('editor4');</script>
</body>
</html>