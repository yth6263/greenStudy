<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>memberList.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2 class="text-center mb-3">회 원 리 스 트</h2>
  <table class="table table-hover">
    <tr class="table-secondary">
      <th>번호</th>
      <th>아이디</th>
      <th>닉네임</th>
      <th>성명</th>
      <th>이메일</th>
      <th>생일</th>
      <th>직업</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
	    <tr>
	      <td>${vo.idx}</td>
	      <td><a href="memberContent.mem?mid=${vo.mid}">${vo.mid}</a></td>
	      <td>${vo.nickName}</td>
	      <td>${vo.name}</td>
	      <td>${vo.email}</td>
	      <td>${fn:substring(vo.birthday, 0, 10)}</td>
	      <td>${vo.job}</td>
	    </tr>
    </c:forEach>
  </table>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>