<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/* 
  String mid = "hkd1234";
  Cookie cookieMid = new Cookie("cMid", mid);
  cookieMid.setMaxAge(60*60*24);		// 쿠키의 만료시간(초) : 1일
  response.addCookie(cookieMid);
  
  String pwd = "1234";
  Cookie cookiePwd = new Cookie("cPwd", pwd);
  cookieMid.setMaxAge(60*60*24);		// 쿠키의 만료시간(초) : 1일
  response.addCookie(cookiePwd);
*/
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>t2_CookiesSave.jsp</title>
  <script>
    alert("쿠키가 생성/저장 되었습니다.");
    location.href = "<%=request.getContextPath()%>/T2_Cookies";
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  
</div>
<p><br/></p>
</body>
</html>