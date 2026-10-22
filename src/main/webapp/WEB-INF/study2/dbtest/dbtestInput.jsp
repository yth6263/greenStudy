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
  <title>dbtestInput.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>자료 입력 연습(dbtestInput.jsp)</h2>
  <form name="myform" method="post" action="dbtestInputOk.st">
	  <div class="input-group mb-2">
	    <div class="input-group-text">아이디</div>
	    <input type="text" name="mid" id="mid" value="admin" class="form-control" autofocus required />
	  </div>
	  <div class="input-group mb-2">
	    <div class="input-group-text">비밀번호</div>
	    <input type="password" name="pwd" id="pwd" value="1234" required class="form-control" />
	  </div>
	  <div class="input-group mb-2">
	    <div class="input-group-text">성명</div>
	    <input type="text" name="name" id="name" value="관리자" class="form-control" required />
	  </div>
	  <div class="input-group mb-2">
	    <div class="input-group-text">성별</div>
	    <input type="radio" name="gender" id="gender1" value="남자" />남자
	    <input type="radio" name="gender" id="gender2" value="여자" checked />여자
	  </div>
	  <div class="input-group mb-2">
	    <div class="input-group-text">나이</div>
	    <input type="number" name="age" id="age" value="20" class="form-control" required />
	  </div>
    <div class="text-center">
      <input type="submit" value="회원가입" class="btn btn-success" />
      <input type="reset" value="다시입력" class="btn btn-primary" />
      <input type="button" value="돌아가기" onclick="location.href='dbtestForm.st'" class="btn btn-warning" />
    </div>
  </form>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>