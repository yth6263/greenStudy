<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>adminLeft.jsp</title>
  <style>
    body {
      background-color: #eee;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <h4>관리자메뉴</h4>
  <hr/>
  <div><a href="${ctp}/" target="_top">홈으로</a></div>
  <hr/>
  <div>회원관리</div>
  <div><a href="memberList.ad" target="adminRight">회원리스트</a></div>
  <hr/>
  <div>게시판관리</div>
  <div><a href="boardList.ad" target="adminRight">게시판리스트</a></div>
  <hr/>  
  <div>명상관리</div>
  <div><a href="yogaInput.yo" target="adminRight">명상자료입력</a></div>
  <div><a href="yogaAdminList.yo" target="adminRight">명상자료리스트</a></div>
  <hr/>  
</div>
<p><br/></p>
</body>
</html>