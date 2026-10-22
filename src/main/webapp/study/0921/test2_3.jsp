<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  int su1 = request.getParameter("su1") == null ? 0 : Integer.parseInt(request.getParameter("su1")) ;
  int su2 = request.getParameter("su2") == null ? 0 : Integer.parseInt(request.getParameter("su2")) ;
  int res = su1 + su2;
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>test2_3.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>test2.jsp</h2>
  <hr/>
  <p>su1 : <%=su1 %></p>
  <p>su2 : <%=su2 %></p>
  <p>su1 + su2 : <%=res %></p>
  <hr/>
  <p><a href="test1.jsp" class="btn btn-success">test1.jsp</a></p>
</div>
<p><br/></p>
</body>
</html>