<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>index.jsp</title>
  <script>
    // 이곳은 자바스크립트 한줄 주석입니다.
    /* 이곳은 자바스크립트 여러줄 주석입니다. */
  </script>
  <style>
    /* 이곳은 css 주석입니다. */
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>길동이네 집에 오신것을 환영합니다!!!!!!!!!</h2>
  <hr/>
  <div class="mb-3">
    <a href="./study/0918/test01.jsp" class="btn btn-success">test01.jsp</a>
    <a href="./study/0918/test02.jsp" class="btn btn-primary">test02.jsp</a>
    <a href="./study/0918/test03.jsp" class="btn btn-secondary">test03.jsp</a>
    <a href="./study/0918/test04.jsp" class="btn btn-info">test04.jsp</a>
  </div>
  <div class="mb-3">
    <a href="./study/0918/test05.jsp" class="btn btn-outline-success">test05.jsp</a>
    <a href="./study/0918/test06.jsp" class="btn btn-outline-primary">test06.jsp</a>
  </div>
  <div class="mb-3">
    <a href="<%=request.getContextPath()%>/T2_Cookies" class="btn btn-outline-success">쿠키연습</a>
    <a href="<%=request.getContextPath()%>/T3_Session" class="btn btn-outline-primary">세션연습</a>
    <a href="<%=request.getContextPath()%>/T4_Application" class="btn btn-outline-info">어플리케이션연습</a>
    <a href="<%=request.getContextPath()%>/T5_storageTest" class="btn btn-outline-warning">스토리지연습</a>
  </div>
  <hr/>
</div>
<p><br/></p>
</body>
</html>