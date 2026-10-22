<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  int aCount = application.getAttribute("aCount")==null ? 0 : (int) application.getAttribute("aCount");
  int sCount = session.getAttribute("sCount")==null ? 0 : (int) session.getAttribute("sCount");
  
  aCount++;
  sCount++;
  
  //pageContext.setAttribute("aCount", aCount);
  //pageContext.setAttribute("sCount", sCount);
  
  application.setAttribute("aCount", aCount);
  session.setAttribute("sCount", sCount);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>t5_storageTest.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>방문카운트 비교하기</h2>
  <hr/>
  <div>어플리케이션 카운트 : ${aCount}</div>
  <hr/>
  <div>세션 카운트 : ${sCount}</div>
  <hr/>
  <div>
    <a href="<%=request.getContextPath()%>/" class="btn btn-success">어플리케이션 카운트 초기화</a>
    <a href="<%=request.getContextPath()%>/" class="btn btn-primary">세션 카운트 초기화</a>
    <a href="<%=request.getContextPath()%>/" class="btn btn-warning">방문자수 증가</a>
    <a href="<%=request.getContextPath()%>/" class="btn btn-warning">홈으로</a>
  </div>
</div>
<p><br/></p>
</body>
</html>