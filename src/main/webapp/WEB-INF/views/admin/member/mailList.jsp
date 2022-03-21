<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%-- <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!-- Bootstarp JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script type="text/javascript" src='<c:out value="${contextPath}"/>/res/smarteditor/js/HuskyEZCreator.js'></script> --%>

<!-- ckeditor4 -->
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="/css/admin/mailList.css" type="text/css">
  
<!-- main -->

   <div id="wrap">
         <div id="content">
            <div id="content2">
               <div>
                  <a href="">회원 관리</a>
                  <!-- 카테고리 상위 메인(기본 회원리스트)페이지로 이동 -->
                  <span>></span>
                  <a href=""> 메일 관리</a>
                  <!-- 누르면 메일 관리 페이지로 이동 -->
         
               </div>
               <br>
               <div class="mailTitle">
                    <span class="mailTitle_sapn"><h3>메일관리</h3></span>
               </div>
               <form action="mail" method="post">
                  <!-- 수정완료시 전송될 주소위치 -->
                  <table>
                     <tr>
                        <td style = "font-size:14px" width="20%" height="35">
                           메일 종류 선택
                        </td>
                     </tr>
                      <tr>
                        <td colspan="2" height="40">
                           <input name="address" type="text" placeholder="이메일 주소">
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" height="40">
                           <input name="title" type="text" placeholder="제목">
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" height="20">
                           <textarea id="editor4" name="message"></textarea>
                           <script>CKEDITOR.replace('editor4');</script>
                           <!-- <script>CKEDITOR.replace('editor4',{filebrowserUploadUrl:'/mine/imageUpload.do'});</script> -->
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" class="modifyButton" height="100">
                           <input class="button" type="submit" value="메일 보내기" onclick="alert('메일이 발송되었습니다.')">
                        </td>
                     </tr>
                  </table>
               </form>
            </div>
         </div>
      </div>
   </div>
   
</body>
</html>