<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String aMid = (String) application.getAttribute("aMid");
  String aNickName = (String) application.getAttribute("aNickName");
  String aName = (String) application.getAttribute("aName");
  
  pageContext.setAttribute("aMid", aMid);
  pageContext.setAttribute("aNickName", aNickName);
  pageContext.setAttribute("aName", aName);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>t4_ApplicationCheck.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <div>아이디 : <%=aMid%> / ${aMid}</div>
  <div>닉네임 : <%=aNickName%> / ${aNickName}</div>
  <div>성 명 : <%=aName%> / ${aName}</div>
</div>
<hr/>
<div><a href="<%=request.getContextPath()%>/T4_Application" class="btn btn-success">돌아가기</a></div>
<p><br/></p>
</body>
</html>