<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/css/adminEventModify.css">

        <!-- 이벤트 등록 시작 -->
        <div class="eventMain">
        <div class="pageName">
            게시판 관리 > 이벤트 리스트 > 이벤트 수정
        </div>
        <!-- 이벤트 등록 폼 시작 -->
        <div class="formWarp">
            <form action="eventModifyAction" name="eventModifyForm" method="post" enctype="multipart/form-data" onsubmit="return clickEvent2();">
                <div class="eventDate">
                <input type="hidden" name="event_idx" value="${dto.event_idx}"/>
                    <span>이벤트 기간</span>
                    <span>
                        <input type="date" name="event_start_date" value="${event_start_date}">
                    </span>
                    <span>~</span>
                    <span>
                        <input type="date" name="event_end_date" value="${event_end_date}">
                    </span>
                </div>
                <div class="eventTitle">
                    <span>이벤트 제목</span>
                    <span>
                        <input type="text" name="event_title" id="" value="${dto.event_title}">
                    </span>
                </div>
                <div class="eventSlogan">
                    <span>이벤트 슬로건</span>
                    <span>
                        <input type="text" name="event_slogan" id="" value="${dto.event_slogan}">
                    </span>
                </div>
                <div class="eventFile">
                    <span>배너이미지</span> 
                        <input class="fileName" value="${dto.event_banner_filename}" disabled>
                        <label for="uploadfile"> 찾아보기</label>
                        <input type="file" name="event_banner_filename" class="uploadfile" id="uploadfile" value="${dto.event_banner_filename}">
                </div>
                <div class="eventFile">
                    <span>상세이미지</span> 
                        <input class="fileName2" value="${dto.event_detail_filename}" disabled>
                        <label for="uploadfile2"> 찾아보기</label>
                        <input type="file" name="event_detail_filename" class="uploadfile2" id="uploadfile2" value="${dto.event_detail_filename}">
                </div>
                <div class="button">
                    <div>
                        <button type="button" onclick="window.location.href='/event/list/continue'">목록</button>
                    </div>
                    <div>
                        <input type="submit" value="수정">
                        <button type="button" onclick="clickEvent(); return false;">취소</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- 이벤트 등록 폼 끝 -->
      </div>
      <!-- 이벤트 등록 끝 -->
    </div>
        <script>
     
       //   confirm
       function clickEvent(){
        
        if(confirm("취소 하시겠습니까?")){
         window.location.href='/event/list/continue';
        }else{
         return false;
        }
       };

       function clickEvent2(){
        
        if(!document.eventJoinForm.event_start_date.value){
         alert("이벤트 시작기간을 입력해주세요")
         return false;
        }
        if(!document.eventJoinForm.event_end_date.value){
         alert("이벤트 종료기간을 입력해주세요")
         return false;
        }
        if(!document.eventJoinForm.event_title.value){
         alert("이벤트 제목을 입력해주세요")
         return false;
        }
        return true;
       };

        $(function(){ 
            var fileTarget = $('#uploadfile'); 
            fileTarget.on('change', function(){ 
                if(window.FileReader){
                 var filename = $(this)[0].files[0].name; }
                  else { 
                    var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
                  } 
                   $(this).siblings('.fileName').val(filename);
                    }); 
                });
        
        $(function(){ 
            var fileTarget = $('#uploadfile2'); 
            fileTarget.on('change', function(){ 
                if(window.FileReader){
                 var filename = $(this)[0].files[0].name; }
                  else { 
                    var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
                  } 
                   $(this).siblings('.fileName2').val(filename);
                    }); 
                });
    </script>
</body>
</html>