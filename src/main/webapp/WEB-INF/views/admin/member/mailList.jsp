<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!-- Bootstarp JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script type="text/javascript" src='<c:out value="${contextPath}"/>/res/smarteditor/js/HuskyEZCreator.js'></script>

<!-- ckeditor4 -->
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="/css/admin/mailList.css" type="text/css">
  
<!-- main -->
<!-- <!DOCTYPE html>
<html lang="ko">
<head> -->
   <title>메일관리</title>
<!-- </head> -->
   <!-- 헤더 -->
    <div id="header">    </div>
<body>
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
               <form action="">
                  <!-- 수정완료시 전송될 주소위치 -->
                  <table>
                     <tr>
                        <td style = "font-size:14px"; width="20%" height="35">
                           메일 종류 선택
                        </td>
                        <td >
                           <select name="mail_select" id="selec" class="mailSelect">
                              <option value="join">회원가입 완료</option>
                              <option value="finish">주문완료</option>
                              <option value="cancle">주문쥐소</option>
                              <option value="withdraw">회원탈퇴</option>
                           </select>
                        </td>
                     </tr>
                     <tr>
                        <td style = "font-size:14px"; height="35">
                           자동 발송 여부 
                        </td>
                        <td>
                           <input type="radio" name="sendMail" value="yes" id="radioYes" class="radio"> 예
                           <input type="radio" name="sendMail" value="no" id="radioNo" class="radio"> 아니오
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" height="40">
                           <input class="noticeTitle" type="title" placeholder="제목">
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" height="20">
                           <textarea id="editor4" name="editor4"></textarea>
                           <script>CKEDITOR.replace('editor4');</script>
                           <!-- <script>CKEDITOR.replace('editor4',{filebrowserUploadUrl:'/mine/imageUpload.do'});</script> -->
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" class="modifyButton" height="100">
                           <input class="button" type="submit" value="수정 완료" onclick="alert('수정이 완료 되었습니다.')">
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