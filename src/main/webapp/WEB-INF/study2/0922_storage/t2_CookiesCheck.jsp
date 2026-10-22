<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>t2_CookiesCheck.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>저장된 쿠키 확인하기</h2>
  <hr/>
<%
  Cookie[] cookies =request.getCookies();

	out.println("저장된 쿠키는?<br/>");
	for(int i=0; i<cookies.length; i++) {
		out.println("쿠키명 : " + cookies[i].getName() + " , ");
		out.println("쿠키값 : " + cookies[i].getValue() + "<br/>");
	}
%>
  <hr/>
  <div><a href="<%=request.getContextPath()%>/T2_Cookies" class="btn btn-success">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>