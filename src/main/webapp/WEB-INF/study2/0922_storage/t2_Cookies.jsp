<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>t2_Cookies.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>쿠키 연습 메인 메뉴</h2>
  <hr/>
  <div class="row">
    <div class="col"><a href="<%=request.getContextPath()%>/T2_CookiesSave" class="btn btn-success">쿠키저장</a></div>
    <div class="col"><a href="<%=request.getContextPath()%>/T2_CookiesCheck" class="btn btn-primary">쿠키확인</a></div>
    <div class="col"><a href="<%=request.getContextPath()%>/T2_CookiesAllDelete" class="btn btn-danger">쿠키전체삭제</a></div>
    <div class="col"><a href="<%=request.getContextPath()%>/T2_CookiesPwdDelete" class="btn btn-info">쿠키비밀번호삭제</a></div>
    <div class="col"><a href="<%=request.getContextPath()%>/" class="btn btn-secondary">홈으로</a></div>
  </div>
</div>
<p><br/></p>
</body>
</html>