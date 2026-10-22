<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <title>t3_SessionCheck.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>세션값 출력(t3_SessionCheck)</h2>
  <div>아이디 : ${sMid}</div>
  <div>닉네임 : ${sNickName}</div>
  <div>성명 : ${sName}</div>
  <hr/>
	<h2>세션 정보 확인</h2>
  <hr/>
  <% String sessionName = (String) request.getAttribute("sessionName"); %>
	<div>세션정보 : <%=sessionName%></div>
	<div>세션ID : <%=session.getId()%></div>
  <div><a href="<%=request.getContextPath()%>/T3_Session" class="btn btn-success">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>