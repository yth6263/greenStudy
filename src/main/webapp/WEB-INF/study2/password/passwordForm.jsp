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
  <title>passwordForm.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>passwordForm.jsp(비밀번호 연습)</h2>
  <div>SHA(256) : Secure Hash Algorithm</div>
  <div>단방향 암호화 방식. 256Bit로 표현(16진수 64자리)</div>
  <form name="myfrom" method="post" action="passwordOk.st">
  	<div class="input-group">
  		<div class="input-group-text bg-secondary-subtle">비밀번호</div>
  		<input type="password" name="pwd" id="pwd" value="1234" required class="form-control"/>
  		<input type="submit" value="비밀번호확인" class="btn btn-success"/>
  	</div>
  </form>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>