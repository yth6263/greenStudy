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
  <title>yoga11.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>생활요가</h2>
  <table class="table table-bordered text-center">
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>이미지</th>
      <th>비고</th>
    </tr>
    <tr>
      <td>1</td>
      <td><a href="https://www.youtube.com/shorts/lrm1ZCAMKX8" target="_blank">생활요가1</a></td>
      <td><img src="${ctp}/images/116.jpg" width="100px" /></td>
      <td>참고</td>
    </tr>
    <tr>
      <td>2</td>
      <td><a href="https://www.youtube.com/shorts/oFgjFAA09qc" target="_blank">명상요가2</a></td>
      <td><img src="${ctp}/images/117.jpg" width="100px" /></td>
      <td>참고</td>
    </tr>
  </table>
</div>
<p><br/></p>
</body>
</html>