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
  <title>mapping.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>mapping.jsp(매핑연습)</h2>
  <hr/>
  <div>
    <a href="admin.do" class="btn btn-success">관리자</a> |
    <a href="member.do" class="btn btn-primary">회원관리</a> |
    <a href="guest.do" class="btn btn-secondary">방명록</a> |
    <a href="board.do" class="btn btn-info">게시판</a> |
    <a href="pds.do" class="btn btn-warning">자료실</a> |
  </div>
  <hr/>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>