<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>test03Res.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>서버로부터 전송받은 값?</h2>
  <%
  	int su = Integer.parseInt(request.getParameter("su"));
  	String str = request.getParameter("str");
  %>
  <div>
    <div>수는 ? <%=su %></div>
    <div>결과는 ?<%=str %></div>
  </div>
  <hr/>
  <div><a href="/greenStudy" class="btn btn-success">홈으로</a></div>
  <hr/>
</div>
<p><br/></p>
</body>
</html>