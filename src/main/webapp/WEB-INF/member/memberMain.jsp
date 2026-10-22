<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs5.jsp" />
  <title>memberMain.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>${name} 회원님 전용방 입니다.(${strLevel})</h2>
  <div>마지막 접속정보 : ${sLastDate}</div>
  <hr/>
  <div><img src="${ctp}/images/data/member/${photo}" width="150px"/></div>
  <hr/>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>