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
  <title>dbtestList.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2 class="text-center mb-3">전체 자료 검색</h2>
  <table class="table table-hover">
    <tr class="text-center table-secondary">
      <th>번호</th>
      <th>아이디</th>
      <th>비밀번호</th>
      <th>성명</th>
      <th>성별</th>
      <th>나이</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr class="text-center">
        <td>${vo.idx}</td>
        <td>${vo.mid}</td>
        <td>${vo.pwd}</td>
        <td>${vo.name}</td>
        <td>${vo.gender}</td>
        <td>${vo.age}</td>
      </tr>
    </c:forEach>
  </table>
  <div class="text-center"><a href="dbtestForm.st" class="btn btn-success">돌아가기</a></div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>