<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String name = request.getParameter("name");
  int age = Integer.parseInt(request.getParameter("age"));
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>test05Ok.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 test05Ok.jsp 입니다.</h2>
  <div>전송되어 온 값은?</div>
  <div>성명 : <%=name%></div>
  <div>나이 : <%=age%></div>
	<hr/>
  <div><a href="/greenStudy" class="btn btn-success">홈으로</a></div>
  <hr/>
</div>
<p><br/></p>
</body>
</html>