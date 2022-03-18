<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin/faqPopup.css">
  
   <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>

   <SCRIPT language="javaScript">
      function checkValue() {
         if(!document.FaqWrite.faq_select.value) { //empty: null, 길이 0
			alert("질문 유형을 선택해주세요.");
			document.getElementById('faq_select').focus();
			return false; //submit전송이 안됨
		}
      if(!document.FaqWrite.minititle.value) {
			alert("제목을 입력해주세요.");
			document.getElementById('minititle').focus();
			return false; 
		}
      return true;
   }
     </SCRIPT>

     <script type="text/javascript">
      function button_event(){
      if (confirm("정말 취소하시겠습니까??") == true){    //확인
         window.close();
      }else{   //취소
          return;
      }
      }
      </script>
</head>
<body>
<div id="wrap">
      <div class=title>
      <h4>자주하는 질문/답변 등록</h4>
      </div>
   <form action="writeAction" method="post" name="FaqWrite" onsubmit="return checkValue();">
      <table>
         <tr>
            <td>
               <select name="faq_select" id="selec" class="faqSelect" style="width:200px;height:21px;">
                  <option value="" selected>질문 유형 선택</option>
                  <option value="Product">제품</option>
                  <option value="OrderShip">주문/배송</option>
                  <option value="ChangeRefund">교환/환불</option>
                  <option value="Event">이벤트</option>
               </select>
            </td>
            <td>
               <input name="minititle" class="noticeTitle" type="title" style="width:500px;" placeholder="제목을 입력해 주세요" >
            </td>
         </tr>
         <tr>
            <td colspan="2" height="20">
               <textarea id="editor4" name="editor4"></textarea>
               <script>CKEDITOR.replace('editor4');</script>
               <!-- <script>CKEDITOR.replace('editor4',{filebrowserUploadUrl:'/mine/imageUpload.do'});</script> -->
         </tr>
      </table>
      <input type="button" value="취소" class="btn1" onclick="button_event();" style=background-color:white>
      <input type="submit" value="완료" class="btn2" style=background-color:#e0e0e0>
   </form>
   
   </div>
</body>
</html>