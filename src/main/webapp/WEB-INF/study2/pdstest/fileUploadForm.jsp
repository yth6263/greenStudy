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
  <title>fileUploadForm.jsp</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>파일 업로드 연습</h2>
  <hr/>
  <h4>COS라이브러리를 이용한 파일 업로드</h4>
  <div>https://www.servlets.com/cos/</div>
  <hr/>
  <div class="row text-center">
    <div class="col"><a href="fileUpload1.st" class="btn btn-success">1.싱그파일업로드(cos)</a></div>
    <div class="col"><a href="fileUpload2.st" class="btn btn-primary">2.멀티파일업로드(cos)</a></div>
    <div class="col"><a href="fileUpload3.st" class="btn btn-secondary">3.싱글파일업로드(request)</a></div>
    <div class="col"><a href="fileUpload4.st" class="btn btn-info">4.멀티파일업로드(request)</a></div>
  </div>
  <hr/>
  <div class="text-center"><a href="fileDownload.st" class="btn btn-warning">다운로드폴더이동</a></div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>