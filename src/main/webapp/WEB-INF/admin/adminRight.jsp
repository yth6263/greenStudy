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
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>관리자 대시보드</h2>
  <hr/>
  <div><iframe src="https://www.imbc.com" width="500px" height="450px"></iframe></div>
  <hr/>
  <div><img src="${ctp}/images/14.png" width="300px"/></div>
  <hr/>  
</div>
<p><br/></p>
</body>
</html>